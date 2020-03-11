; homey.g
; called to home the Y axis

M400 				; make sure everything has stopped before we change the motor currents
M913 X20 Y20 		; drop motor currents to 20%

G91 				; use relative positioning
G1 H2 X0.5 Y-0.5 F10000	; energise motors and move them 0.5mm in the +Y direction to ensure they are not stalled
G1 H2 Z3 F5000		; lift Z 3mm
G1 H1 Y-400 F3000 	; move to the front 400mm, stopping at the endstop
G1 Y2 F2000 		; move away from end
G1 H2 Z-3 F1200		; lower Z
G90 				; back to absolute positioning

M400 				; make sure everything has stopped before we reset the motor currents
M913 X100 Y100 		; motor currents back to 100%
