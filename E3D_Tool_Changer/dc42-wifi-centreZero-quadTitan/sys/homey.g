; homey.g
; called to home the Y axis
; DC42 reduced stall sensitivity from 3 to 2
; DC42 replaced G1 S parameters by H
; DC42 removed redundant G4 and M574 commands

G91 				; use relative positioning

G1 H2 X0.5 Y-0.5 F10000	; energise motors to ensure they are not stalled

M400 				; make sure everything has stopped before we change the motor currents
M913 X20 Y20 		; drop motor currents to 20%
M915 H200 X Y S3 R0 F0 	; set X and Y to sensitivity 3, do nothing when stall, unfiltered

G1 H2 Z3 F5000		; lift Z 3mm
G1 H1 Y-400 F3000 	; move to the front 400mm, stopping at the endstop
G1 H1 Y2 F2000 		; move away from end
G1 H2 Z-3 F1200		; lower Z
G90 				; back to absolute positioning

M400 				; make sure everything has stopped before we reset the motor currents
M913 X100 Y100 		; motor currents back to 100%
