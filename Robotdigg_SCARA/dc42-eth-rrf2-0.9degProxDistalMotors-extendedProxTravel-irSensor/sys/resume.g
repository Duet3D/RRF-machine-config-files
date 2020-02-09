; resume.g
; called before a print from SD card is resumed

G1 R1 X0 Y0 Z2 F5000	; go to 2mm above position of the last print move
G1 R1 X0 Y0 Z0 F500	; go back to the last print move
M83			; relative extruder moves
G1 E5 F3600		; extrude 5mm of filament
