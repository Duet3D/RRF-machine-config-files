; tfree0.g
; called when tool 0 is freed

;Drop the bed
G91
G1 Z4 F1000
G90

;Purge nozzle
;M98 P"purge.g"

;Move In
G53 G1 X-160.5 Y50 F50000
G53 G1 X-160.5 Y100 F50000
G53 G1 X-160.5 Y120 F50000
G53 G1 X-160.5 Y142 F5000

;Open Coupler
M98 P"/macros/Coupler - Unlock"

;fan off
M106 P2 S0

;Move Out
G53 G1 X-160.5 Y75 F50000
