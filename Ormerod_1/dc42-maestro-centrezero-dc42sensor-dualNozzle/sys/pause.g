; Pause macro file
M83
G1 E-4 F2500		; retract 4mm
G91					; relative moves
G1 Z5 F5000			; raise nozzle 2mm
G90					; absolute moves
G1 X-105 Y95 F5000	; move head out of the way of the print
