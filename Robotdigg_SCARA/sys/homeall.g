; Home All file for Robotdigg SCARA arm printer
;M561			; cancel bed compensation
G91

G1 S2 Z28 F1000		; raise Z to keep nozzle clear of base frame

G1 S1 X200 Y200 F1000	; home proximal and distal arms
G1 S2 X-5 Y-5 F1000	; back off
G1 S1 X10 Y10 F200	; repeat the homing more slowly

G90
G0 X-75 Y75 F3000	; move to a position that correspond to one of the M557 grid points
M564 S0
G30			; home Z
G1 Z28 F1000		; move to safe height again
M564 S1
;G29 S1			; load height map
;