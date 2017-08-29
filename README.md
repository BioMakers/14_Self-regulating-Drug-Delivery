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
<tr><td><a href="/Software/simulationinfusiondevice.html">Simulation of infusion pump sensor feedback loop using single compartment model</a></td><td></td></tr>
</table>

## Hardware
### Electronics
The electronics part of this project includes the potentiostat and the DC Stepper Motor-Proximity Sensor component of the infusion pump.

<table>
<tr><th>Component</th><th>Schematic</th><th>Implementation</th></tr>
<tr><td>Potentiostat Circuit (<a href='http://2014.igem.org/Team:UC_Davis/Potentiostat_Design'>adapted from UC Davis iGEM team 2014 OliView 2.0 Schematic</a>)</td><td><img src="/Hardware/Electronics/potentiostat-circuit-schematics.png" width=300></td><td><img src="/Hardware/Electronics/potentiostat-circuit-implementation.jpeg" width=300></td></tr>
</table>

### Infusion Pump
The structure to hold the syringe and apply pressure on the handle

<table>
<tr><th>Component</th><th>Schematic</th><th>Implementation</th></tr>
<tr><td>Infusion Pump</td><td><img src="/Hardware/Infusion Pump/pump-design.png" width=300></td><td><img src="Hardware/Infusion Pump/pump-prototype.jpeg" width=300></td></tr>
</table>

### Microfluidic Chip
The microfluidic chip houses the aptamers immobilised on gold electrodes to sense drug levels. Currently we have only printed the electrodes onto glass slides. The next step will be to seal the two slides to form a channel for fluid to flow through. The stencil design can be found [here](/Hardware/Microfluidic%20Chip/electrode-template-v1.odt).
<table>
<tr><th>Component</th><th>Image</th></tr>
<tr><td>Printed Electrodes</td><td><img src="/Hardware/Microfluidic Chip/printed-gold-electrodes.jpeg" width="300"></td></tr>
<tr><td>Combined Chip </td><td><img src="/Hardware/Microfluidic Chip/microfluidicprototype1.jpeg" width="300"></td></tr>
</table>

## Installation, Maintenance and Testing Guide

Provide instructions on usage, describe a test scheme and show how to run the tests with code and hardware configuration examples with some representative results.

## License

A short snippet describing the license (MIT, Apache, etc.) you have chosen to use

