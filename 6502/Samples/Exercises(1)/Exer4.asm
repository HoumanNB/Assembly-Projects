;This exercise is about adding and subtracting values. Adding and subtracting are math
;operations that are done by the processor ALU (arithmetic-logic-unit). Since the ALU 
;can only manipulate values from the (A)ccumulator, all these additions and subtractions 
;must be performed with the values in the A register.

 processor 6502
 seg Code ; Define a new segment named "Code"
 org $F000 ; Define the origin of the ROM code at memory address $F000
 
Start:
; TODO:
    LDA #100            ; Load the A register with the literal decimal value 100
    ADC #5              ; Add the decimal value 5 to the accumulator
    SBC #10             ; Subtract the decimal value 10 from the accumulator
                        ; Register A should now contain the decimal 95 (or $5F in hexadecimal)

 org $FFFC ; End the ROM by adding required values to memory position $FFFC
 .word Start ; Put 2 bytes with the reset address at memory position $FFFC
 .word Start ; Put 2 bytes with the break address at memory position $FFFE
