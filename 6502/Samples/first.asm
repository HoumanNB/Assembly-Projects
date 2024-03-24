    org $f000       ; define the core origin at $f000

start:
    ; "housekeeping" (enabling and disabling things
    ;  in the proccesor to set it in right values)

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