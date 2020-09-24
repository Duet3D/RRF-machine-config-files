; bed.g
; called to perform automatic bed compensation via G32
;
;M561 					; clear any bed transform
;G28  					; home all axes
;M401 					; deploy probe
;
; Probe the bed at 5 points
;
;G30 P0 X15 Y25 H0 Z-99999
;G30 P1 X15 Y260 H0 Z-99999
;G30 P2 X300 Y260 H0 Z-99999
;G30 P3 X300 Y25 H0 Z-99999
;G30 P4 X175 Y150 H0 Z-99999 S
;
;M402					; retract probe