// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2] respectively.)
// The algorithm uses repeated addition: R2 = R0 * R1

// Initialize R2 to 0
@R2
M=0

// Initialize i (R3) to R0 (number of times to add)
@R0
D=M
@R3
M=D

// If R0 is 0, skip to end
@END
D;JEQ

// Main loop
(LOOP)
    // Load R1 into D
    @R1
    D=M

    // Add R1 to R2
    @R2
    M=M+D

    // Decrement counter (R3)
    @R3
    M=M-1
    D=M

    // If counter > 0, continue loop
    @LOOP
    D;JGT

(END)
    @END
    0;JMP