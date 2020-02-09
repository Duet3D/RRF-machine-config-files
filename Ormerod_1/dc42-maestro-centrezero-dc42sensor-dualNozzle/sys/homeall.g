; Ormerod 1 home all file for use with dc42 firmware
; Adjust the M208 parameters in config.g to set the correct XY coordinates when homed
G91
G1 S2 Z6 F200   ; increased to 6mm to prevent IR sensor triggering on bed clip when homing X after Y has reached the endstop
G1 X-240 Y240 F3000 S1
G1 S2 X4 Y-4 F600
G1 X-10 Y10 S1
G90
G1 X0 Y0 F12000
G30
