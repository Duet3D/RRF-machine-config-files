M140 S60
T0			; Select Tool 0
M291 P"Print Started. Preheating and Homing." T10
G4 S1
M98 P"0:/macros/Musical Tunes/LuckyTune.g" ; Lucky tune to start print off on the right foot
G4 S1
M220 S100		; Set speed factor back to 100% in case it was changed
M221 S100		; Set extrusion factor back to 100% in case it was changed
M290 R0 S0		; clear babystepping
M106 S0			; Turn part cooling blower off if it is on
G10 P0 R0 S80		; Set extruder to 80 and release
M190 S65		; set heated bed to 65 and wait
G28			; home XYZ
M400
G10 P0 R80 S180	; Set extruder to 180 and release

; Slicer Start Gcode begins.