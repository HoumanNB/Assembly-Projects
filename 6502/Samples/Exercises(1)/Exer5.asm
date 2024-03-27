;The ADC and SBC instructions can also be used with different addressing modes. The 
;above exercise used ADC with immediate mode (adding a literal value directly into the 
;accumulator), but we can also ask ADC to add a value from a (zero page) memory 
;position into the accumulator.
 
 processor 6502
 seg Code ; Define a new segment named "Code"
 org $F000 ; Define the origin of the ROM code at memory address $F000
 
Start:
; TODO:
    LDA #$A     ; Load the A register with the hexadecimal value $A
    LDX %1010   ; Load the X register with the binary value %1010

    STA $80     ; Store the value in the A register into (zero page) memory address $80
    STX $81     ; Store the value in the X register into (zero page) memory address $81

    LDA #10     ; Load A with the decimal value 10
    ADC $80     ; Add to A the value inside RAM address $80
    ADC $81     ; Add to A the value inside RAM address $81
                ; A should contain (#10 + $A + %1010) = #30 (or $1E in hexadecimal)
 
; Store the value of A into RAM position $82
 org $FFFC ; End the ROM by adding required values to memory position $FFFC
 .word Start ; Put 2 bytes with the reset address at memory position $FFFC
 .word Start ; Put 2 bytes with the break address at memory position $FFFE