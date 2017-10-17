![](/Images/banner.png?raw=true)

## Synopsis

Our goal is to put together a sensor-pump system which would be able to adjust drug output of aminoglycosides based on real time sensing of drug in plasma. This would involve several stages, the first being the development of a functional sensor over the appropriate therapeutic range of concentrations. Similarly, a device will be designed which can attach to current hospital drip bags to control output and have configurable parameters for information such as normal drug clearance, volume of distribution, concentration of drug being delivered, and so on. The software to calculate the appropriate output will also be written.

Contributer | Headshot
------------|-----------
Palaniappan Ganesh Nagappan | ![Palani](/Images/Palani-headshot.JPG?raw=true)
David Chong Tian Wei | ![David](/Images/David-headshot.png?raw=true)

## Software
Software will be needed to control the arduino uno unit that is controlling the potentiostat circuit and the feedback circuit to control the pump. Several supporting software such as a desktop GUI to display data from the potentiostat and simulations will also be written
<table>
<tr><th>Software</th><th>Example</th></tr>
<tr><td><a href="/Software/potentiostat-pump-controller/potentiostat-pump-controller.ino">Arduino Controller Software</a></td><td></td></tr>
<tr><td><a href="/Software/potentiostat-gui.py">Desktop App to control and view the arduino</a></td><td><img src="/Software/DesktopPotentiostatGuiPrototype.png" width=300></td></tr>
<tr><td><a href="/Software/infusionsimulation.R">Simulation of infusion pump sensor feedback loop using single compartment model</a></td><td><img src="/Software/Simulation.png" width="300"></td></tr>
</table>

## Hardware
### Electronics
The electronics part of this project includes the potentiostat and the DC Stepper Motor-Proximity Sensor component of the infusion pump.

<table>
<tr><th>Component</th><th>Schematic</th><th>Implementation</th></tr>
<tr><td><a href="/Hardware/Electronics/README.md">Potentiostat Circuit</a> (<a href='http://2014.igem.org/Team:UC_Davis/Potentiostat_Design'>adapted from UC Davis iGEM team 2014 OliView 2.0 Schematic</a>)</td><td><img src="/Hardware/Electronics/potentiostat-circuit-schematics.png" width=300></td><td><img src="/Hardware/Electronics/potentiostat-circuit-implementation.jpeg" width=300></td></tr>
</table>

### Infusion Pump
The structure to hold the syringe and apply pressure on the handle

<table>
<tr><th>Component</th><th>Schematic</th><th>Implementation</th></tr>
<tr><td>Infusion Pump</td><td><img src="/Hardware/Infusion Pump/pump-design.png" width=300></td><td><img src="Hardware/Infusion Pump/pump-prototype.jpeg" width=300></td></tr>
</table>

### Microfluidic Chip
The microfluidic chip houses the aptamers immobilised on gold electrodes to sense drug levels. Currently we have only printed the electrodes onto glass slides. The next step will be to seal the two slides to form a channel for fluid to flow through. The stencil design can be found [here](/Hardware/Microfluidic%20Chip/electrode-template-v1.odt). Detailed instructions to be found [here](/Hardware/Microfluidic%20Chip/README.md).
<table>
<tr><th>Component</th><th>Image</th></tr>
<tr><td>Printed Electrodes</td><td><img src="/Hardware/Microfluidic Chip/printed-gold-electrodes.jpeg" width="300"></td></tr>
<tr><td>Combined Chip using OHP sheets </td><td><img src="/Hardware/Microfluidic Chip/microfluidicprototype1.jpeg" width="300"></td></tr>
<tr><td>Combined Chip using Glass Slides</td><td><img src="/Hardware/Microfluidic Chip/microfluidicprototype2.jpeg" width="300"></td></tr>
</table>

## Integrated Parts
<table>
<tr><th>Description</th><th>Image</th></tr>
<tr><td>Potentiostat attached to microfluidic chip</td><td><img src="/Images/Potentiostat_Microfluidic_Chip_Setup.jpeg" width="300"></td></tr>
<tr><td>Potentiostat sweep using microfluidic chip with printed plain gold electrodes and Phosphate Buffered Saline</td><td><img src="/Images/PotentiostatPBSAuElectrodeCycle.png" width="300"></td></tr>
<tr><td>Potentiostat dry cell test with 10kOhm resistor</td><td><img src="/Images/Potentiostat_Resistor_Test.jpeg" width="300"></td></tr>
</table>

## Installation, Maintenance and Testing Guide

### Potentiostat Interface Software
The interface uses the following software: python2, Tkinter, serial, io

### Potentiostat Dry Cell Test
1. Once you constructed the potentiostat circuit and connected it to the arduino according to the schematics, upload the potentiostat-controller sketch onto the arduino. 
2. Connect the Counter and Reference electrodes to one side of a 10kOhm resistor and the working electrode to the other side to complete the circuit.
3. Run the potentiostat interface software and connect to the appropriate device and run a sweep with default settings. The result should be something similar to the Potentiostat dry cell test with 10kOhm resistor shown above.

### Potentiostat Microfluidic Chip test with Phosphate Buffered Saline and Tobramycin solutions
The microfluidic chip and potentiostat probably do not work well together. Connect the device and software similar to the dry cell, but instead to the leads on the microfluidic chip.

<table>
<tr><th>Description</th><th>Image</th></tr>
<tr><td>PBS Plain Gold Electrodes</td><td><img src='/Images/PBS-Au.png' width='300'></td></tr>
<tr><td>PBS Gold Electrode after aptamer attachment</td><td><img src='/Images/PBS-Au-Aptamer.png' width='300'></td></tr>
<tr><td>5uM Tobramycin Gold Electrode after aptamer attachment</td><td><img src='/Images/5-Au-Aptamer.png' width='300'></td></tr>
</table>

## License

Copyright 2017 David Chong and Palani Ganesh Nagappan

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
