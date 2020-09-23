; 0:/macros/Bed Leveling/0_Measure Zmax trigger.g
; Automates measuring the Zmax trigger for optical endstop at 305mm
;
M291 P"This will set Z0 and calibrate Zmax height to 305mm" R"Proceed?" S3
M291 P"Homing all axis" T5
G28			; Home all
G90			; Absolute positioning
M291 P"Bed will now drop to Z305" S3
G1 Z305			; Move bed down 305mm
M291 P"Adjust optical endstop flag until light just turns off" R"Set Zmax=305mm" S3
M291 P"ZMax homing will now be tested, starting with homing Zmin" S3
M291 P"Homing to Zmin" T5
G28
M291 P"Ready to test Zmax homing?" R"Proceed?" S3
M291 P"Homing to Zmax" T5
G1 Z350 H3 F400		; home to z max and set the trigger height as the M208 Z maxima
M500 ; save the measured M208 Z maxima to config-override.g
M291 P"ZMax homing test complete. Printer will now home all." R"Proceed?" S3
G28	; Home all
M291 P"ZMax calibration complete." S3