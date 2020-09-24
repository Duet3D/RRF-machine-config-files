M106 P2 F15000 L0.1 X0.8 B0.5 T25:40 H100:101:102 C"Duet Fans"
M106 P0 F100 S0 H-1 B0.5 C"Part Cooling"                             ; Set fan 0 (Part cooling blower) G-code controlled. Thermostatic control is turned off
M140 S65		; set heated bed to 65 and release
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
G29 S1			; load heightmap
M400
G10 P0 R80 S180	; Set extruder to 180 and release
M98 P"0:/sys/ZSpeedsPrint.g"	; Load Z speeds for printing
M98 P"0:/sys/CurrentsPrint.g"	; Load print motor currents

; Slicer Start Gcode begins.