;M98 P"0:/sys/PrimeNozzle.g"

G90 			; Absolute positioning
G1 X1 Y270 F6000 	; Move to front left corner
M400 			; clear movement buffer
M116 			; Wait for temps
G1 Z0.3 F100		; Move Z to prime height
G91 			; Relative positioning
M83 			; Relative extrusion
G1 E5 F300 ; pre-prime nozzle
G1 X40 E10 F300 	; Prime line
G10			; Retract
G1 Y-1 X1 F10000 	; Wipe nozzle
M400
