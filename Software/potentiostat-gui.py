#!/usr/bin/python
import serial
import serial.tools.list_ports as stools
import io
import Tkinter as Tk
import tkMessageBox

def getConnectedDevices():
    portlb.delete(0, Tk.END)
    devlist = stools.comports()
    for dev in devlist:
        portlb.insert(Tk.END,dev.device)

def connectToDevice():
    try:
        global current_connection
        selected = portlb.get(portlb.curselection())
        current_connection = serial.Serial(selected)
        statusl["text"] = "Connection Status: " + selected
    except serial.SerialException as e:
        tkMessageBox.showinfo("Connection Error", e.strerror)
    except Tk.TclError as e:
        tkMessageBox.showinfo("Selection Error", "No device selected")

def runSweep():
    global current_connection
    maxbit = chr(int(round(maxv.get() / 3300.0 * 255)))
    minbit = chr(int(round(minv.get() / 3300.0 * 255)))
    dirbit = chr(sweep_dir.get())
    delaybit = b'\x0A'
    command = chr(1) + maxbit + minbit + dirbit + delaybit
    current_connection.write(bytes(command))

def runCycle():
    a = 0

def updateDisplay():
    Display.delete(Tk.ALL)
    Display.create_rectangle(0,0,DISPLAY_WIDTH,DISPLAY_HEIGHT,fill="#FFFFFF")
    Display.create_line(0.075 * DISPLAY_WIDTH, 0.05 * DISPLAY_HEIGHT,
                        0.075 * DISPLAY_WIDTH, 0.975 * DISPLAY_HEIGHT, width=0)
    Display.create_line(0.025 * DISPLAY_WIDTH, 0.95 * DISPLAY_HEIGHT,
                        0.975 * DISPLAY_WIDTH, 0.95 * DISPLAY_HEIGHT, width=0)
    Display.create_text(0.05 * DISPLAY_WIDTH, 0.025 * DISPLAY_HEIGHT,
                        text="Current(uA)")
    Display.create_text(0.95 * DISPLAY_WIDTH, 0.99 * DISPLAY_HEIGHT,
                        text="Voltage(V)")
    for i in range(0,18):
        Display.create_line((0.05 * (i+1)  + 0.05) * DISPLAY_WIDTH, 0.94 * DISPLAY_HEIGHT,
                            (0.05 * (i+1) + 0.05) * DISPLAY_WIDTH, 0.96 * DISPLAY_HEIGHT,
                            width=0)
        Display.create_text((0.05 * (i+1) + 0.05) * DISPLAY_WIDTH,0.975 * DISPLAY_HEIGHT,
                            text=str(round(2.048 / 17 * i,3)))

    if len(datapoints) > 1:
        maxcur = None
        mincur = None
        for i in datapoints:
            if maxcur == None:
                maxcur = i[1]
            elif maxcur < i[1]:
                maxcur = i[1]
            if mincur == None:
                mincur = i[1]
            elif mincur > i[1]:
                mincur == i[1]
        maxcur = maxcur * 1.2 + 0.000001
        mincur = mincur * 1.2 - 0.000001
        currange = maxcur - mincur
        for i in range(0,18):
            Display.create_line(0.065 * DISPLAY_WIDTH, (0.05 * (18-i) + 0.025) * DISPLAY_HEIGHT,
                                0.085 * DISPLAY_WIDTH, (0.05 * (18-i) + 0.025) * DISPLAY_HEIGHT,
                                width=0)
            Display.create_text(0.04 * DISPLAY_WIDTH, (0.05 * (18-i) + 0.025) * DISPLAY_HEIGHT,
                                text=str(round(mincur + currange / 17.0 * i,6)))
        for i in range(1,len(datapoints)):
            Display.create_line(((datapoints[i-1][0] / 2.048) * 0.85 + 0.1) * DISPLAY_WIDTH,
                            ((currange - datapoints[i-1][1] + mincur) / currange + 0.025) * DISPLAY_HEIGHT,
                            ((datapoints[i][0] / 2.048) * 0.85 + 0.1) * DISPLAY_WIDTH,
                            ((currange - datapoints[i][1] + mincur) / currange + 0.025) * DISPLAY_HEIGHT,
                                width=0)



#Set top level characteristics
app = Tk.Tk()
app.title("Potentiostat")

#Global vars
RUNNING = True
DISPLAY_WIDTH = 800
DISPLAY_HEIGHT = 600
current_connection = None
sweep_dir = Tk.IntVar()
datapoints = []

#Set up widgets
maxvl = Tk.Label(app, text="Max Voltage (mV)")
minvl = Tk.Label(app, text="Min Voltage (mV)")
vratel = Tk.Label(app, text="Voltage Change Rate (mV/s)")
maxv = Tk.Scale(app, from_=0, to=2048, orient=Tk.HORIZONTAL)
maxv.set(2048)
minv = Tk.Scale(app, from_=0, to=2048, orient=Tk.HORIZONTAL)
vrate = Tk.Scale(app, from_=1, to=255, orient=Tk.HORIZONTAL)
dirl = Tk.Label(app, text="Sweep Direction")
dirinc = Tk.Radiobutton(app, text="Increasing", variable=sweep_dir, value=0)
dirdec = Tk.Radiobutton(app, text="Decreasing", variable=sweep_dir, value=1)
runsweepb = Tk.Button(app, text="Run Sweep", command=runSweep)
runcycleb = Tk.Button(app, text="Run Cycle", command=runCycle)
sweep_dir.set(0)
statusl = Tk.Label(app, text="Connection Status: Not Connected")
portl = Tk.Label(app, text="Available Devices")
portb = Tk.Button(app, text="Connect", command=connectToDevice)
refreshb = Tk.Button(app, text="Refresh", command=getConnectedDevices)
refreshb.bind()
portlb = Tk.Listbox(app, selectmode=Tk.SINGLE)
#portscrollbar = Scrollbar(app,orient=VERTICAL)
#portlb = Listbox(app,selectmode=SINGLE,yscrollcommand=portscrollbar.set)
#portscrollbar.config(command=portlb.yview)
#portscrollbar.pack(side=RIGHT)
getConnectedDevices() #Populate listbox

Display = Tk.Canvas(app, width=DISPLAY_WIDTH, height=DISPLAY_HEIGHT)

maxvl.grid(column=0, row=0)
minvl.grid(column=0, row=1)
vratel.grid(column=0, row=2)
dirl.grid(column=0, row=3, rowspan=2)
runsweepb.grid(column=0, row=5)
portl.grid(column=0, row=6)
refreshb.grid(column=0, row=7)
statusl.grid(row=8)

maxv.grid(column=1, row=0)
minv.grid(column=1, row=1)
vrate.grid(column=1, row=2)
dirinc.grid(column=1, row=3)
dirdec.grid(column=1, row=4)
runcycleb.grid(column=1, row=5)
portlb.grid(column=1, row=6)
portb.grid(column=1, row=7)

Display.grid(row=0, column=2, rowspan=9)
Display.create_rectangle(0, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT, fill="#FFFFFF")

while RUNNING:
    #check if data is available and update
    if current_connection != None:
        while current_connection.in_waiting:
            dp = current_connection.readline()
            dp = dp.strip()
            datapoints.append(dp.split(" "))
            datapoints[len(datapoints)-1][0] = float(datapoints[len(datapoints)-1][0])
            datapoints[len(datapoints)-1][1] = float(datapoints[len(datapoints)-1][1])
            print(dp.split())

    #draw
    updateDisplay()

    app.update_idletasks()
    app.update()