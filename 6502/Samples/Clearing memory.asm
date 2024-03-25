    PROCESSOR 6502

    SEG code 
    ORG $f000       ; define the core origin at $f000

start:
    ; "housekeeping" (enabling and disabling things
    ;  in the proccesor to set it to right values)

    SEI             ; diasble intrupt
    CLD             ; disable the BCD decimal math mode
    LDX #$ff        ; load the x register with #$ff
    TXS             ; transfer the x register to the stack pointer
                    ; loading the x with #$ff and transfering it to the stack pointer
                    ;so to make it the start of the stack (forcing the stack pointer 
                    ;to have that value)
;------------------------------------------------------------------------------------
; clear the page zero region ($00 to $ff)
; the entire RAM and TIA registers
;------------------------------------------------------------------------------------
    LDA #0          ; a == 0
    LDX #$ff        ; x == $ff

memloop:
    STA $0,X        ; store the memory value of a inside the memory addess $0 + X
    DEX             ; x--
    BNE memloop     ; branch to loop untill x == 0 (z flag is set) 

;------------------------------------------------------------------------------------
; filling the ROM size to exactly 4KB
; each .word is 2B of data
;------------------------------------------------------------------------------------
    org $fffc       ; going to ROM posision of $fffc (the last 4 bytes of the ROM)
    .word start     ; reset vector at $fffc (where the program starts)
    .word start     ; interrupt vector at $fffe (unused in the VCS)
    