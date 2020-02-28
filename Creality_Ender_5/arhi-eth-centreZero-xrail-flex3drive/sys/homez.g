; homez.g
; called to home the Z axis

M400
; Drop all motor currents down
M913 X30 Y30 Z30
; JERK
M566 Z0


;M98 P"homez_andromeda.g"
;M98 P"homez_bltouch.g"
;M98 P"homez_endstop.g"
M98 P"homez_orion.g"


; Return all motor currents to 100%
M913 X100 Y100 Z100
; JERK
M566 Z50.00