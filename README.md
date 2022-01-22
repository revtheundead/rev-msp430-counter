# MSP430 2-Digit Hexadecimal Counter
Assembly code for a simple 2-digit hex counter written in Code Composer Studio to run on the MSP430
microcontroller. You only need to copy the code in the assembly file to run it. The dependencies were 
added as a measure.

## Before running the code
Please take a look at the MSP430 documentation before trying to run the code. Also note that when 
setting up the 7-segment displays you need to connect them according to the code.

Also note that this code is written for cathode 7-segment displays. In case you have anode displays 
you need to invert the bits in 'DISP' array before using them.
