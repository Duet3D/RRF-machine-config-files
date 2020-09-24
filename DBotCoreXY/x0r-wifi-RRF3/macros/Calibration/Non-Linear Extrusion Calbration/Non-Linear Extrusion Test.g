;Non-linear extrusion script from Duet forum. Used to adjust A and B parameters in M592.
;

M291 S3 R"Non-Linear Extrusion Calibration" P"Preheating and homing. Press Ok to begin."

G10 P0 S230			; heat nozzle to 230
G28 XY				; home all axis
G28 Z
M98 P"0:/macros/1_Nozzle Access.g"	; move to nozzle access position
G1 X0
M116				; wait for temps
M83				; relative extrusion
G1 E5 F300			; prime the nozzle
M400				; wait for all moves to finish

M291 S3 R"Preparing for Test" P"Mark 60mm on filament for each test, then press OK"
M291 S3 R"Begin Extrusion Test" P"Nozzle will move back and forth and extrude."

M117 "1mm/sec extrusion"
G1 X50 E50 F60
M400
M291 S3 R"1mm/sec extrusion" P"Measure distance, and mark next 60mm"

M117 "1.5mm/sec extrusion"
G1 X0 E50 F90
M400
M291 S3 R"1.5mm/sec extrusion" P"Measure distance, and mark next 60mm"

M117 "2mm/sec extrusion"
G1 X50 E50 F120
M400
M291 S3 R"2mm/sec extrusion" P"Measure distance, and mark next 60mm"

M117 "2.5mm/sec extrusion"
G1 X0 E50 F150
M400
M291 S3 R"2.5mm/sec extrusion" P"Measure distance, and mark next 60mm"

M117 "3mm/sec extrusion"
G1 X50 E50 F180
M400
M291 S3 R"3mm/sec extrusion" P"Measure distance, and mark next 60mm"

M117 "3.5mm/sec extrusion"
G1 X0 E50 F210
M400
M291 S3 R"3.5mm/sec extrusion" P"Measure distance, and mark next 60mm"

M117 "4mm/sec extrusion"
G1 X50 E50 F240
M400
M291 S3 R"4mm/sec extrusion" P"Measure distance, and mark next 60mm"

M117 "4.5mm/sec extrusion"
G1 X0 E50 F270
M400
M291 S3 R"4.5mm/sec extrusion" P"Measure distance, and mark next 60mm"

M117 "5mm/sec extrusion"
G1 X50 E50 F300
M400
M291 S3 R"5mm/sec extrusion" P"Measure distance, and mark next 60mm"

M117 "5.5mm/sec extrusion"
G1 X0 E50 F330
M400
G10 P0 S0	; turn off heater
M291 S3 R"5.5mm/sec extrusion" P"Measure final distance."

M291 R"Test Complete" P"Calculate A and B values for M592" S2