    org $f000       ; define the core origin at $f000

start:
    ; "housekeeping" (enabling and disabling things
    ;  in the proccesor to set it to right values)

    sei             ; diasble intrupt
    cld             ; disable the BCD decimal math mode
    ldx #$ff        ; load the x register with #$ff
    txs             ; transfer the x register to the stack pointer
                    ; loading the x with #$ff and transfering it to the stack pointer
                    ;so to make it the start of the stack (forcing the stack pointer 
                    ;to have that value)
;------------------------------------------------------------------------------------
; clear the page zero region ($00 to $ff)
; the entire RAM and TIA registers
;------------------------------------------------------------------------------------
    lda #0          ; a == 0
    ldx #$ff        ; x == $ff

memloop:
    sta $0, X       ; store the memory value of a inside the memory addess $0 + X
    dex             ; x--
    bne memloop     ; branch to loop untill x == 0 (z flag is set) 

;------------------------------------------------------------------------------------
; filling the ROM size to exactly 4KB
; each .word is 2B of data
;------------------------------------------------------------------------------------
    org $fffc       ; going to ROM posision of $fffc (the last 4 bytes of the ROM)
    .word start     ; reset vector at $fffc (where the program starts)
    .word start     ; interrupt vector at $fffe (unused in the VCS)
    