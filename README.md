Here are some loose guidlines meant to give you an idea of what information we expect to find in each repository. Feel free to present your documentation in the most accessible/suitable order and style but you **must** include project data relating to the headings below, if relevant to your project. Also, include your final proposal in the top directory.

[**A very good example**](https://github.com/Biological-Microsystems-Laboratory/micropipette)

Consider using [GitHub for desktop](https://desktop.github.com/), the user interface and experience is so much better than the web version of Github, in my opinion.

Lastly, follow [these](https://pages.github.com/) instructions if you want to style your github repository into a webpage like [so](https://biomakers.github.io/Example-repo/).

## Synopsis
![](/Images/banner.png?raw=true)

Our goal is to put together a sensor-pump system which would be able to adjust drug output of aminoglycosides based on real time sensing of drug in plasma. This would involve several stages, the first being the development of a functional sensor over the appropriate therapeutic range of concentrations. Similarly, a device will be designed which can attach to current hospital drip bags to control output and have configurable parameters for information such as normal drug clearance, volume of distribution, concentration of drug being delivered, and so on. The software to calculate the appropriate output will also be written.

### Contributors

Palaniappan Ganesh Nagappan ![Palani](/Images/Palani-headshot.JPG?raw=true)
David Chong Tian Wei ![David](/Images/David-headshot.png?raw=true)

## Software

Explain functionality of software components (if any) as concisely as possible, developers should be able to figure out how your project solves their problem by looking at the code example. Ideally, this should be pseudo code or an abstract graphical representation of your code e.g entity relationship diagram. Consider adding a screenshot of your User Interface.

* **potentiostat-pump-controller.ino (under development)** : Arduino sketch to control potentiostat and pump
* **simulationinfusion.html** : Javascript based simulation of infusion under one compartment model
* **simulationinfusiondevice.html (under development)** : Similar to simulationinfusion.html but additionally the sensor-pump is simulated and options to add noise to sensor readings and delay between infusion and plasma concentration change to be added

## Hardware

Explain how the hardware components (if any) of your project function as concisely as possible, including a short description of fabrication and assembly. Component suppliers and part numbers should be provided separately in a bill of materials, in a 'Hardware Folder'.

* **electrode-template-v1.svg** : Template for creating stencils to make the gild-on electrodes.
* **electrode-template-v1.odt** : Document formatted with stencil image to print actual size.

## Installation, Maintenance and Testing Guide

Provide instructions on usage, describe a test scheme and show how to run the tests with code and hardware configuration examples with some representative results.

## License

A short snippet describing the license (MIT, Apache, etc.) you have chosen to use
