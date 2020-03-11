; homey.g
; called to home the Y axis

M400
; Drop all motor currents down
M913 X30 Y30 Z30
; JERK
M566 Y0

; X must be homed first
G90               ; absolute positioning
G0X{move.axes[0].max}

G91               ; relative positioning
G0Z5H2
G0 Y250 F2000 H1  ; move quickly to Y axis endstop and stop there (first pass, 50mm/sec)
G0 Y-5  F600  H2  ; go back 5 mm, slowly 10mm/sec
G0 Y250 F300  H1  ; move slowly to Y axis endstop once more (second pass, 5mm/sec)
G90               ; absolute positioning

; Return all motor currents to 100%
M913 X100 Y100 Z100
; JERK
M566 Y500.00