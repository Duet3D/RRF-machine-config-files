; tfree2.g
; called when tool 2 is freed

;Drop the bed
G91
G1 Z4 F1000
G90

;Purge nozzle
;M98 P"purge.g"

;Move In
G53 G1 X64.5 Y50 F50000
G53 G1 X64.5 Y100 F50000
G53 G1 X64.5 Y120 F50000
G53 G1 X64.5 Y143 F5000

;Open Coupler
M98 P/macros/Coupler - Unlock

;fan off
M106 P6 S0

;Move Out
G53 G1 X64.5 Y75 F50000

