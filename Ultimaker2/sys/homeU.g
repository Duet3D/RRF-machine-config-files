G91                     ; Relative mode
M584 Z2                 ; Split Z into 2 (Z+U)
G1 Z0 U0 F2000 S1	; Move up to 0mm in the -Z direction. S1 to stop if endstop is triggered
G1 Z2 U2 F600 S2        ; Move 2mm in the +Z direction - (I'm not sure what S2 is for?)
G1 Z-1 U-1 F100 S1	; Move slowly 1mm in the -Z direction, stopping at the homing switch
M584 Z2:4               ; Join U to Z again (pay attention to drive numbers used)
G1 Z5 F3000             ; Move back again 5mm in the +Z direction
G90                     ; Back to absolute mode