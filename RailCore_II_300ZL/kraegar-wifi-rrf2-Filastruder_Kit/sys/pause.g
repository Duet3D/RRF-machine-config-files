; Pause macro file
M83					; relative extruder moves
G1 E-2 F2500		; retract 2mm
G91					; relative moves
G1 Z5 F5000			; raise nozzle 5mm
G90					; absolute moves
G1 X25 Y25 F5000		; move head out of the way of the print
