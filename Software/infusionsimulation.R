
infconclist <- c(10,30,100,300,1000,3000,10000)
maxinflist <- c(0.1,0.3,1,3,10,30,100)
tceillist <- c(4.5,4.75,5,5.25,5.5,5.75,6,6.25,6.5)
tfloorlist <-c(3.5,3.25,3,2.75,2.5,2.25,2,1.75,1.5)

TheoreticalVdList <- c(0.11,0.22,0.33,0.5,0.66,1,2)

simdata <- c()
for(k in 1:7) {
  simrun <- c()
  for(j in seq(1:100)) {
    tceil <-  5# uM
    tfloor <- 3 # uM
    trange <- tceil-tfloor
    maxinf <- 10 #ml / interval (s)

    TheoreticalVdperKg <- TheoreticalVdList[k] #L/Kg
    VdperKg <- 0.33 # L/Kg
    thalf <- 2.2 # hr
    InfusionConc <- 1000 # uM

    PatientMass <- 70 # kg
    PatientClearance <- 125 # ml/min

    inter <- 300 #s
    clearances <- c()

    perturb <- function(input) {
      return(input + rnorm(1,mean=0,sd=0.5))
    }

    loadingdose <- function() {
      totalmol <- (tceil + tfloor) / 2 * PatientMass * TheoreticalVdperKg
      infrate <- totalmol / InfusionConc * inter / 3600 * 1000 #ml / interval (s)
      return(infrate)
    }

    chiou <- function(inf,Vd,c1,c2,t1,t2) {
      calculatedclearance <- 2*(inf / 1000 / 3600 * InfusionConc)/(c1+c2) + ((2*Vd*(c1-c2))/((c1+c2)*(t2-t1)))
      return(calculatedclearance)
    }

    iter <- function(data,clearances) {
      time <- data[nrow(data),1]
      drugmol <- data[nrow(data),2]
      drugconc <- data[nrow(data),3]
      senseddrugconc <- data[nrow(data),4]
      infrate <- data[nrow(data),5]
  
      time2 <- time + inter
      drugmol2 <- drugmol + ((infrate / 1000) * InfusionConc) # ml/hr s mol/L
      maxdrugconc <- drugmol2 / (VdperKg * PatientMass)
      avgdrugconc <- (drugconc + maxdrugconc) / 2
      drugmol2 <- drugmol2 - ((PatientClearance / 1000) * (inter / 60) * avgdrugconc) # ml/min s mol/L
      drugconc2 <- drugmol2 / (VdperKg * PatientMass)
      senseddrugconc2 <- perturb(drugconc2)
  
      calculatedclearance <- chiou(infrate,VdperKg * PatientMass,senseddrugconc,senseddrugconc2,time,time2)
      if(length(clearances) < 3600 / inter) {
        if((tceil + tfloor)/2 - senseddrugconc2 < -trange/4)  {
          infrate2 <- infrate * ((tceil + tfloor) / 2) / (senseddrugconc2*2)
        }
        else {
          infrate2 <- infrate
        }
        #infrate2 <- (tceil + tfloor) / 2 * calculatedclearance / InfusionConc * inter / 3600 * 1000
        if(infrate2 < 0) infrate2 <- infrate
        return(c(time2,drugmol2,drugconc2,senseddrugconc2,infrate2, calculatedclearance / InfusionConc * 3600 * 1000))  
      }
      else {
        if(abs((tceil + tfloor)/2 - senseddrugconc2) > trange/4) {
          infrate2 <- infrate * ((tceil + tfloor) / 2) / senseddrugconc2
          calculatedclearance <- infrate2 * 2 / (tceil + tfloor) * InfusionConc * 3600 / 1000 / inter
        }
        else {
          infrate2 <- infrate
       }
        if(infrate2 < 0) infrate2 <- infrate
        if(infrate2 > maxinf) infrate2 <- maxinf
        if(mean(data[(nrow(data)-6):nrow(data),5]) == maxinf) print("Warning: Insufficient max infusion rate to achieve steady state")
        return(c(time2,drugmol2,drugconc2,senseddrugconc2,infrate2, calculatedclearance / InfusionConc * 3600 * 1000))  
      }
    }

    data <- data.frame(matrix(c(0,0,0,0,loadingdose(),0),1,6))
    names(data) <- c("time","drugmol","drugconc","senseddrugconc","infrate","calculatedclearance")
    for (i in seq(1,500)) {
      data <- rbind(data, unlist(iter(data,clearances)))
      if(i > 1) clearances <- c(clearances,data[i,6] * InfusionConc /3600 / 1000)
    }
    png(paste0("/home/david/Desktop/14_Self-regulating-Drug-Delivery/Software/SimulationImages/",sub("[.]","_",TheoreticalVdperKg),"Vd-","Simulation","-",j,".png"))
    plot(x=data$time/3600,y=data$drugconc, main="Simulation of plasma drug level control using \nnegative feedback", ylab="Drug Concentration (uM)", xlab="Time (hr)")
    lines(x=data$time/3600,y=data$drugconc)
    points(x=data$time/3600,y=data$senseddrugconc,col="red")
    lines(x=data$time/3600,y=data$senseddrugconc,col="red")
    abline(h=tceil)
    abline(h=tfloor)
    legend(x=10,y=1,col=c("black","red"),legend=c("Actual Drug Conc", "Sensed Drug Conc"), pch=c(1,1))
    dev.off()
    print(paste("Percentage of time within window: ", sum((data$drugconc <= tceil) & (data$drugconc >= tfloor)) / nrow(data)))
    print(range(data$infrate))
    simrun <- c(simrun,sum((data$drugconc <= tceil) & (data$drugconc >= tfloor)) / nrow(data))
  }
  simdata <- c(simdata, simrun)
}
simdata <- matrix(simdata,nrow=100)
simdatasdev <- apply(simdata,2,sd)
simdatamean <- apply(simdata,2,mean)
#png("/home/david/Desktop/14_Self-regulating-Drug-Delivery/Software/WindowSizeSignalNoiseRelationship.png")
plot((tceillist-tfloorlist)/0.5,simdatamean,main="Simulation of relationship between Time within\nTherapeutic Window and Ratio of\nTherapeutic Window Range over Signal Noise",ylab="Percentage of Time within Therapeutic Window",xlab="Ratio of Therapeutic Window Range over Signal Noise", ylim=c(0.6,1))
arrows(x0=(tceillist-tfloorlist)/0.5,y0=simdatamean-simdatasdev,x1=(tceillist-tfloorlist)/0.5,y1=simdatamean+simdatasdev, length=0.25, angle=90, code=3)
#dev.off()
