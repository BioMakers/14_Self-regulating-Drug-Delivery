# Potentiostat Circuit Documentation

## Overview and Disclaimer

This potentiostat circuit was adapted from the [UC Davis 2014 iGEM team's design](http://2014.igem.org/Team:UC_Davis/Potentiostat_Design). This component is used to read set the voltage for the aptamer sensor in the microfluidic chip and to read in the current from the sensor. As both of us working on this project do not have any electronics background, there are likely errors int his adaptation. However, an adaptation was necessary in order to utilise the materials available to us such as the arduino uno. Furthermore, this meant we could not print out the PCB design and instead built it manually through **surface mount soldering**. This adaptation has several components

1. Unity gain op-amp for reference electrode
2. Transimpedance amplifier for working electrode
3. Control amp maintaining voltage at counter electrode
4. Gain Switch
5. Sallen-Key Low Pass Filter

Currently the first three components seem to work, but the low pass filter does not seem to be functioning properly. Additionally, the 2.048 shunt voltage reference has not been added yet.

## Materials

Description | Part No. | Supplier | Quantity
----------- | -------- | -------- | --------
Quad Op-amp AD8609 | 496-8528 | RS Components | 1
Precision Op-amp MAX4238ASA | 732-8419 | RS Components | 1
Murata 2pF Multilayer Cerarmic Capacitor | 723-5389 | RS Components | 1
Murata 4.7pF Multilayer Ceramic Capacitor | 723-5436 | RS Components | 1
Murata 18pF Multilayer Ceramic Capacitor | 723-5382 | RS Components | 1
Murata 62pF Multilayer Ceramic Capacitor | 815-1490 | RS Components | 1
AVX 10nF Multilayer Ceramic Capacitor | 464-6357 | RS Components | 3
100nF Single Layer Capacitor |  |  | 1
Thick Film Resistor 1kOhm | 125-1190 | RS Components | 2
Thick Film Resistor 10kOhm | 125-1192 | RS Components | 3
Thick Film Resistor 100kOhm | 223-2524 | RS Components | 1
Thick Film Resistor 1MOhm | 223-2653 | RS Components | 1
Thick Film Resistor 10MOhm | 678-7160 | RS Components | 1
1.024V Voltage Reference LM4140ACM | 651-3417 | RS Components | 1
2.048V Shunt Voltage Reference ADR5040BKSZ | 802-3913 | RS Components | 1
Single Side Matrix Board RE013-LF | 897-1395 | RS Components | 1
8-bit Serial DAC TC1320EOA | 669-6307 | RS Components | 1
Crocodile Clips | 483-843 | RS Components | 1
Wires (Must fit through 0.45mm hole on matrix board) |  |  |  ~ 1 meter

## Equipment

Description | Part No. | Supplier | Quantity
----------- | -------- | -------- | ---------
Lead Free Solder 0.5mm Diam 100g | 555-282 | RS Components | 1
Soldering Iron 25W |  |  | 1
Precision Tweezers |  |  | 1
Multicore Pen 9g Solder Flux | 425-9379 | RS Components | 1
Arduino Uno | DEV-0231 | SgBotic | 1
1.8m USB A to B cable | CAB-00307 | SgBotic | 1

## Methods
As mentioned above, the circuit was implemented through surface mount soldering which we learnt from watching this [video](https://www.youtube.com/watch?v=3NN7UGWYmBY). We had no prior soldering experience. Additionally, due to the connections required, it was impossible to achieve without crisscrossing the wires so there was a mixture of connections made from laying solder along adjacent squares on the matrix board to form connections on the board as well as soldering thin wires into the matrix board holes to provide connections across the ones on the board. Here are some strategies we found useful when soldering.
* Use as little solder as possible
* Keep wires and overarching components as short as possible
* Solder complicated parts first e.g the gain switch
### Schematic
![](potentiostat-circuit-schematics.png?raw=true)
### Implementation
![](potentiostat-circuit-implementation.jpeg?raw=true)

## Related Material
1. [Software to control the arduino](../../Software/potentiostat-pump-controller/potentiostat-pump-controller.ino)
2. [Desktop software to view output](../../Software/potentiostat-gui.py)
