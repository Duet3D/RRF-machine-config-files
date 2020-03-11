; tfree1.g
; called when tool 1 is freed

G91
G1 Z4 F1000 ; drop the bed
G90

M564 S0 						; allow movement outside the normal limits

;M98 P"purge.g"					; purge nozzle

G53 G1 X-70.5 Y50 F50000		; move to location
G53 G1 Y115 F50000; move in
G53 G1 Y127.2 F5000

M98 P"/macros/Coupler - Unlock"	; open Coupler

M106 P4 S0						; fan off

G53 G1 Y104 F2500 ; move Out
G53 G1 Y50 F50000

M564 S1 						; apply the normal limits again