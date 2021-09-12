// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

//EITHER loop through each one, adding it to the next
//OR for each digit in R1, take an AND of R0, appending i 0's to the right-hand side. Sum these numbers, discarding the negative signifier. 

//In a more detailed instruction set, the second idea would be better, but as it stands, bitwise work may be tricky. 

// Put your code here.

@R2
M=0

(MULT_LOOP)
@R1
D=M
@EXIT
D;JEQ

@R0
D=M

@R2
M=M+D

@R1
M=M-1

@MULT_LOOP
0;JMP

(EXIT)
