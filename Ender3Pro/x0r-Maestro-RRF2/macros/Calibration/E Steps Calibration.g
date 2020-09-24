; 0:/macros/Calibration/E Steps Calibration.g
; Macro to calibrate the extruder steps per mm by extruding 110mm of filament slowly and comparing expected result with actual result.

M291 S3 R"Proceed?" P"Run E Steps per MM Calibration?"
G28 XY
G28 Z 					; Home All Axis
M98 P"0:/macros/1_Nozzle Access.g"	; Move print head to nozzle access
T0					; Activate Tool0
G10 P0 S240 R0				; Hot end to 215c
M291 S3 R"Heating..." P"Mark 110mm on filament from top of extruder body."
M116					; Wait for temp to 215
M291 P"Extruding 100mm at 1mm/s"
G1 E100 F60				; Extrude 100mm of filament at 1mm/s
G10 P0 S0 R0				; Turn off hot end
T0					; Deactivate Tool0
M291 S2 R"Repeat test to verify." P"Measure distance to mark and update e steps."
M291 S2 P"E Steps calibration complete."