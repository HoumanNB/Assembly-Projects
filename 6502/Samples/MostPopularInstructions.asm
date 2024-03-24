; Load and store instructions
    LDA ; load A register
    LDX ; load X register
    LDY ; load Y register

    STA ; store to A register 
    STX ; store to X register 
    STY ; store to Y register 

; Accumulator instructions
    ADC ; add to accumulator(with carry)
    SBC ; subtract to accumulator(with carry)

; Flag instructions
    CLC ; clears the carry flag(usually before addition)
    SEC ; sets the carry flag(usually before subtraction)

; Incrementig and decrementing (equavelant to ++ and -- in C++)
    INC ; increment memory by one 
    INX ; increment X register by one
    INY ; increment Y register by one

    DEC ; decrement memory by one
    DEX ; decrement X register by one
    DEY ; decrement Y register by one

; Jump instruction
    JMP ; jump to another location

; Branch instructions
; If the last instruction returns a specific result,
; then the branch happens
    BCC ; branch on carry clear       (C == 0)
    BCS ; branch on carry set         (C == 1)
    BEQ ; branch on equal to zero     (Z == 1)
    BNE ; branch on not equal to zero (Z == 0)
    BMI ; branch on negative          (N == 1)
    BPL ; branch on ppositive         (N == 0)
    BVC ; branch on overflow clear    (V == 0)
    BVS ; branch on overflow set      (V == 1)