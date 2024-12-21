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

// This file is part of www.nand2tetris.org
// Implements screen fill/unfill based on keyboard input
// When any key is pressed, the screen should become black
// When no key is pressed, the screen should become white

(INFINITE_LOOP)
    // Initialize screen fill color to white (0)
    @color
    M=0

    // Check if any key is pressed
    @KBD
    D=M
    @FILL_SCREEN
    D;JEQ        // If no key pressed, jump to fill (will fill with white)

    // If key is pressed, set color to black (-1)
    @color
    M=-1

(FILL_SCREEN)
    // Initialize pixel counter to 8192 (number of 16-bit words in the screen)
    @8192
    D=A
    @counter
    M=D

    // Set base screen address
    @SCREEN
    D=A
    @address
    M=D

(FILL_LOOP)
    // Load the color to fill with
    @color
    D=M

    // Fill current word with color
    @address
    A=M
    M=D

    // Increment address
    @address
    M=M+1

    // Decrement counter
    @counter
    M=M-1
    D=M

    // If counter > 0, continue filling
    @FILL_LOOP
    D;JGT

    // Return to infinite loop to check keyboard again
    @INFINITE_LOOP
    0;JMP