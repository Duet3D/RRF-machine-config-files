; Ender 3 Custom Start G-code to Prime the Nozzle
G90 							; absolute position
M83 							; Relative extrusion
M400 							; clear movement buffer
M116 							; Wait for temps
G1 Z2.0 F3000 					; Move Z Axis up little to prevent scratching of Heat Bed
G1 X0.1 Y20 Z0.1 F5000.0 		; Move to start position
G91 							; relative position
G1 Z0.2 E15 					; Extrude blob
G1 Y200.0 E15 F1500.0 			; Draw the first line
G1 X0.4 F6000.0 				; Move to side a little
G1 Y-200 E30 F1500.0 			; Draw the second line
G1 E1							; quick squirt
G10								; retract
G1 X2 Y2 F120000				; quick wipe
G90								; absolute position
G92 E0 							; Reset Extruder
M400							; clear movement buffer

