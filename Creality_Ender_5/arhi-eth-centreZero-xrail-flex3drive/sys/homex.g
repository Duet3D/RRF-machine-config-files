; homex.g
; called to home the X axis

M400
; Drop all motor currents down
M913 X30 Y30 Z30
; JERK
M566 X0

G91               ; relative positioning
G0 X250 F3000 H1  ; move quickly to X axis endstop and stop there (first pass, 50mm/sec)
G0 X-5  F600  H2  ; go back 5 mm, slowly 10mm/sec
G0 X250 F300  H1  ; move slowly to X axis endstop once more (second pass, 5mm/sec)
G90               ; absolute positioning


; Return all motor currents to 100%
M913 X100 Y100 Z100
; JERK
M566 X500.00