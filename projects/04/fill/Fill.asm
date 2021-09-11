// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes 
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

//NOTE: screen memory starts at @SCREEN (address 16384), and ends at address 24575

//max screen address
@24575
D=A
@R1
M=D

@R2 //screen colour bit - if this matches intended, goto loop 

(LOOP)	
	//Poll keyboard for input
	@KBD
	D=M
	//if keyboard register outputs anything that's not zero, jump to fill screen black
	@FILL_SCREEN_BLACK
	D;JGT
	//write 0 to every address in the screen register 
	@SCREEN
	D=A
	@0
	M=D
	(WHT_FILL)
		@R0
		D=M
		A=D
		M=0
		D=D+1
		@R0
		M=D
		@R1
		D=D-M
		@WHT_FILL
		D;JLE
	
	//jump to top
	@LOOP
	0;JMP

(FILL_SCREEN_BLACK)
	//write -1 to every address in the screen register
	@SCREEN
	D=A
	@0
	M=D
	(BLK_FILL)
		@R0
		D=M
		A=D
		M=-1
		D=D+1
		@R0
		M=D
		
		@R1
		D=D-M
		@BLK_FILL
		D;JLE
		
	//jump to top 
	@LOOP
	0;JMP
	
// This project brings home how decoupling is really important - the 
// fact that screen drawing is directly relatd to keyboard refresh
// rate is _killing_ me. 
