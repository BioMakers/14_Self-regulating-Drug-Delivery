## Synopsis
![](/Images/banner.png?raw=true)

Our goal is to put together a sensor-pump system which would be able to adjust drug output of aminoglycosides based on real time sensing of drug in plasma. This would involve several stages, the first being the development of a functional sensor over the appropriate therapeutic range of concentrations. Similarly, a device will be designed which can attach to current hospital drip bags to control output and have configurable parameters for information such as normal drug clearance, volume of distribution, concentration of drug being delivered, and so on. The software to calculate the appropriate output will also be written.

Contributer | Headshot
------------|-----------
Palaniappan Ganesh Nagappan | ![Palani](/Images/Palani-headshot.JPG?raw=true)
David Chong Tian Wei | ![David](/Images/David-headshot.png?raw=true)

## Software
* **potentiostat-pump-controller.ino (under development)** : Arduino sketch to control potentiostat and pump
* **simulationinfusion.html** : Javascript based simulation of infusion under one compartment model
* **simulationinfusiondevice.html (under development)** : Similar to simulationinfusion.html but additionally the sensor-pump is simulated and options to add noise to sensor readings and delay between infusion and plasma concentration change to be added

## Hardware
###Electronics
The electronics part of this project includes the potentiostat and the DC Stepper Motor-Proximity Sensor component of the infusion pump.
Component | Schematic | Implementation
----------|-----------|----------------
Potentiostat Circuit|![](/Hardware/Electronics/potentiostat-circuit-schematics.png)|![](/Hardware/Electronics/potentiostat-circuit-implementation.jpeg)
###Infusion Pump
The structure to hold the syringe and apply pressure on the handle
Component | Schematic | Implementation
----------|-----------|----------------
Infusion Pump|![](/Hardware/Infusion Pump/pump-design.png)|![](/Hardware/Infusion Pump/pump-prototype.jpeg)
###Microfluidic Chip
The microfluidic chip houses the aptamers immobilised on gold electrodes to sense drug levels. Currently we have only printed the electrodes onto glass slides. The next step will be to seal the two slides to form a channel for fluid to flow through. The stencil design can be found [here](/Hardware/Microfluidic Chip/electrode-template-v1.odt).
![](/Hardware/Microfluidic Chip/printed-gold-electrodes.jpeg)
## Installation, Maintenance and Testing Guide

Provide instructions on usage, describe a test scheme and show how to run the tests with code and hardware configuration examples with some representative results.

## License

A short snippet describing the license (MIT, Apache, etc.) you have chosen to use

