; Decreases the value from #100 to #0
    LDY #100 ; Y = 100
loop:   ; a name for a segment in memory
    DEY ;Y--
    BNE loop ;branch to loop if not equat to zero(repeat untill Y == 0)