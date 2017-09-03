tceil <- 5 # uM
tfloor <- 1 # uM

VdperKg <- 0.33 # L/Kg
thalf <- 2.2 # hr
InfusionConc <- 10 # uM

PatientMass <- 70 # kg
PatientClearance <- 125 # ml/min

inter <- 300 #s
clearances <- c()

perturb <- function(input) {
  return(input + rnorm(1,mean=0,sd=0.5))
}

loadingdose <- function() {
  totalmol <- (tceil + tfloor) / 2 * PatientMass * VdperKg
  infrate <- totalmol / InfusionConc / inter * 1000 * 3600
  return(infrate)
}

chiou <- function(inf,Vd,c1,c2,t1,t2) {
  calculatedclearance <- 2*(inf / 1000 / 3600 * InfusionConc)/(c1+c2) + ((2*Vd*(c1-c2))/((c1+c2)*(t2-t1)))
  return(calculatedclearance)
}

iter <- function(data,clearances) {
  time <- data[1]
  drugmol <- data[2]
  drugconc <- data[3]
  senseddrugconc <- data[4]
  infrate <- data[5]
  
  time2 <- time + inter
  drugmol2 <- drugmol + ((infrate / 1000) * (inter / 3600) * InfusionConc) # ml/hr s mol/L
  maxdrugconc <- drugmol2 / (VdperKg * PatientMass)
  avgdrugconc <- (drugconc + maxdrugconc) / 2
  drugmol2 <- drugmol2 - ((PatientClearance / 1000) * (inter / 60) * avgdrugconc) # ml/min s mol/L
  drugconc2 <- drugmol2 / (VdperKg * PatientMass)
  senseddrugconc2 <- perturb(drugconc2)
  
  calculatedclearance <- chiou(infrate,VdperKg * PatientMass,senseddrugconc,senseddrugconc2,time,time2)
  if(length(clearances) < 24) {
    infrate2 <- (tceil + tfloor) / 2 * calculatedclearance / InfusionConc * 3600 * 1000
    return(c(time2,drugmol2,drugconc2,senseddrugconc2,infrate2, calculatedclearance / InfusionConc * 3600 * 1000))  
  }
  else {
    infrate2 <- (tceil + tfloor) / 2 * mean(clearances) / InfusionConc * 3600 * 1000
    return(c(time2,drugmol2,drugconc2,senseddrugconc2,infrate2, mean(clearances) / InfusionConc * 3600 * 1000))  
  }
}

data <- data.frame(matrix(c(0,0,0,0,loadingdose(),0),1,6))
names(data) <- c("time","drugmol","drugconc","senseddrugconc","infrate","calculatedclearance")
for (i in seq(1,500)) {
  data <- rbind(data, unlist(iter(data[i,],clearances)))
  if(i > 1) clearances <- c(clearances,data[i,6] * InfusionConc /3600 / 1000)
}
plot(x=data$time,y=data$drugconc)
lines(x=data$time,y=data$drugconc)
abline(h=tceil)
abline(h=tfloor)