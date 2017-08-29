# Microfluidic Chip Documentation

## Overview
The goal of this part of the project is to create an Electrochemical Aptamer based biosensor (EAB) inside a microfluidic chip. We thought that an aptamer sensor was the most suitable for continuous measurement due to its ability to it not requiring additional reagents and also the reversible nature of aptamer ligand binding. The microfluidic chip would be needed to minimise the sample volume needed which would add up especially if continuous measurements were required. However, given the limited resources and lab space we had to think of DIY methods of creating such a device. There are 3 stages to the creation of the chip

1. Printing of gold electrodes onto a surface
2. Immobilising aptamers onto the surface
3. Combining the layers and ensuring electronic and fluid interfaces can be connected to external devices/pipes

## Printing of gold electrodes
We chose one of the most widely used methods for immobilising aptamers on an electrode surface, via a gold-thiol bond. Thus, we needed to have a printed gold electrode. We considered Dropsens but due to the shape of the printed electrode we were unsure we could transform it into a channel which was our intended design. As such we came up with the method described below.

### Materials
Description | Part Number | Supplier | Quantity
----------- | ----------- | -------- | --------
Glass Microscope Slides | 13192131 | Fischer Scientific | 2
Lefranc & Bourgeois Oil Gold Size |  | Artfriend | A small amount
Edible Gold Leaf |  |  | 3.7 x 3.7 cm sheet should be more than enough
Overhead Projector Plastic Sheet (optional) |  |  | 1 A4 sheet

### Equipment
Description | Part Number | Supplier | Quantity
----------- | ----------- | -------- | --------
Precision Tweezers |  |  | 1
Brush (as fine as you can get) |  |  | 1
Popsicle Stick (or another flat surface to press the leaf) |  |  | 1
Scissors |  |  | 1
[Stencil Design](electrode-template-v1.odt) |  |  | 1
Soft Brush |  |  | 1
Wire cutter (optional) |  |  | 1
Clothes pegs (optional) |  |  |  5 to 10

### Method
There are 2 methods which can be used to print the electrodes. One involves using the stencil design as a guide, and one using it as a stencil. Ultimately using the stencil method would enable marginally finer prints but is much more difficult to replicate due to seepage of the gold size. It is much easier to find a very fine brush to paint the gold size on instead. Furthermore, the actual surface area of the electrode may not be essential as extra parts can be covered by subsequent layers when putting the components together.

1. Print the stencil design on paper or an Overhead Projector Plastic sheet
2. If you intend to use the stencil as a stencil then you need to use a wire cutter to carve out the markings. If you do not have a wire cutter, a needle and lighter should suffice where you repeatedly heat the needle and use it to melt the plastic sheet.
3. Wipe the surface of the microscope slide if it is dirty
4. Place the stencil on top of the slide if intending to use as a stencil and anchor with the clothes pegs. Place the stencil below if using as a guide.
5. Paint the gold size onto microscope slide. Try to use less gold size so that the print will be finer.
6. Wait for 1-2 hours for the size to set.
7. Cut the gold leaf sheet into thin strips and carefully lay the strips onto the painted areas. It would be best to turn off any fans, air conditioners, and any source of drafts/wind including your own breathing.
8. Once all parts of the gold size have been covered, press firmly with the popsicle stick/flat surface to secure the gold leaf.
9. Brush off excess gold leaf and scrape of excess flakes which may have stuck onto other areas.

![](/printed-gold-electrodes.jpeg?raw=true)

## Aptamer Immobilisation Protocol(incomplete)
The aptamer protocol is adapted from the one used [here](https://www.nature.com/nprot/journal/v2/n11/full/nprot.2007.413.html). We are unsure if this will work as it is designed for industrial grade gold electrodes and we do not have the resources to copy this protocol completely. Furthermore, we do not think we can polish our electrodes given they are quite fragile as they are printed rather than being a solid gold rod. As such we skipped the polishing step completely.

### Materials
Description | Part Number | Supplier | Quantity
----------- | ----------- | -------- | --------
Tobramycin Aptamers (Or any other 3' Methylene Blue Modified and 5' 6 Carbon linker thiol modified aptamers) |  | Integrated DNA Technologies | 20nmol
6-Mercaptohexanol | 451088 | Sigma Aldrich | 
NaCl | S7653 | Sigma Aldrich | 
Tris-EDTA Buffer pH 8.0 | 93283 | Sigma Aldrich | 
Phosphate Buffered Saline pH 7.2 | 806544 | Sigma Aldrich | 
Magnesium Chloride Solution 1M | M1028 | Sigma Aldrich | 
Tris-(2-carboxyethyl)phosphine hydrochloride solution | 646547 | Sigma Aldrich | 
Deionised Water |  |  | 

### Equipment
Description | Part Number | Supplier | Quantity
----------- | ----------- | -------- | --------
Micropipette |  |  | 1
Fume cupboard |  |  | 1

### Method
Placeholder

## Combining the Layers

### Materials
Description | Part Number | Supplier | Quantity
----------- | ----------- | -------- | --------
Overhead Projector Plastic Sheets |  |  | 2 sheets
Wires |  |  | A few cm of wire
Epoxy |  |  | A little
Popsicle stick and disposable palte |  |  | 1 plate several popsicle sticks
28 gauge syringe needle |  |  | 2
Prepared Glass Slides from previous sections |  |  | 1 set
Red Food Coloring |  |  | a few drops
Phosphate Buffered Saline |  |  | a few ml

### Equipment
Description | Part Number | Supplier | Quantity
----------- | ----------- | -------- | --------
Scissors |  |  | 1
Precision Tweezers |  |  | 1
Multimeter |  |  | 1

### Method
1. Using the glass slides prepared from the previous sections, cut out a slightly larger outline of the slide on the Overhead Projector sheets. You will need between 4-6 sheets.
2. Mix a small amount of epoxy and glue the plastic cut outs in layers of 2 or 3 depending on the thickness of your needle gauge. You should end up with 2 sheets of thicker plastic. Try and lay the epoxy as thoroughly as possible and squeeze out air bubbles. Compress lightly.
3. If your wire is thin enough, cut out 3 short pieces and lay them on the stems of the printed electrodes. If your wire is too thick, strip the insulation and pluck out individual wires.
3. Cut each sheet of thick plastic into half lengthwise.
4. Mix a small amount of epoxy and layer one edge of each piece of thick plastic (you should have 4 now).
5. Gently lay the plastic sheets onto the 2 glass sides(the sides with the printed electrodes), ensuring the wires you placed previously still remain ont he electrode stems. Remember to leave a gap in between the plastic sheets on each slide (do not cover the gold electrodes meant for the channel)
6. Using the 28 gauge syringe needle as a limit, push the two plastic sheets towards each other, ensuring epoxy does not cover the electrode
7. Press the plastic sheets down firmly and try to squeeze out air pockets. Press extra hard on the areas where the wires are.
8. When dry, use a multimeter to check for electrical connection between the external part of the wire and the electrode surface.
9. Mix another amount of epoxy and lightly cover the external surface of the 28 gauge needles, making sure not to cover the bore.
10. Place the needles into the gap between the plastic sheets.
11. Seal the two glass slides together with epoxy to form the channel, ensuring the areas around the needles are sealed to prevent leakage.
12. After drying, test if the channel is sealed properly by flushing Phosphate Buffered Saline with red food coloring through the channel.

![](microfluidicprototype.jpeg)
