; Cancel.g 
; Run when a print is paused, and then canceled.

M106 P0 S1 ; max out cooling fan
M400 ; finish movement
M1 ; kill the heaters and turn off the motors
M104 S0 ; set extruder temp to 0
M140 S0 ; set bed temp to 0
M220 S100 ; reset speed factor
M221 S100 ; reset extrusion factor
M290 S0	; reset babystepping
G4 S30 ; wait 30 seconds
M107 ; Turn off the fan