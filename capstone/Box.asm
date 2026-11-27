
 // Box Program - Nand2Tetris Capstone
// Student K = 86
// Starting row = 86
// Height = 20 rows
// Width = 48 pixels

(START)
    // Check keyboard input
    @KBD
    D=M
    @CLEAR
    D;JEQ

    // Key pressed: set color to black
    @R3
    M=-1
    @DRAW
    0;JMP

(CLEAR)
    // Key released: set color to white
    @R3
    M=0

(DRAW)
    // Screen starting address: 16384 + (32 * 86) = 19136
    @19136
    D=A
    @R0
    M=D

    // Set rectangle height
    @20
    D=A
    @R1
    M=D

(ROW)
    // Set row width: 3 words = 48 pixels
    @3
    D=A
    @R2
    M=D

(WORD)
    // Write color to screen memory
    @R3
    D=M
    @R0
    A=M
    M=D

    // Move to next screen word
    @R0
    M=M+1

    // Decrease word counter
    @R2
    MD=M-1
    @WORD
    D;JGT

    // Move to next screen row
    // 32 words per row - 3 written words = 29
    @29
    D=A
    @R0
    M=D+M

    // Decrease row counter
    @R1
    MD=M-1
    @ROW
    D;JGT

    // Repeat and check keyboard again
    @START
    0;JMP
