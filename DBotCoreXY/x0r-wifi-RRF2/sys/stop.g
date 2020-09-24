; stop.g
; called when M0 (Stop) is run (e.g. when a print from SD card is cancelled)
; Also called by slicer end gcode by M0
;
M400			; Finish move queue
M104 S0 		; Extruder heater off
M140 S0 		; Bed heater off
;M106 S255 		; Fan at 100 to cool nozzle and bed
G91			; Relative positioning
M220 S100		; Set speed factor back to 100% in case it was changed
M221 S100		; Set extrusion factor back to 100% in case it was changed
G1 E-2 F9000			; Retract filament 2mm
G1 X5 Y5 F9000		; Wipe nozzle 
G1 Z20 F500			; raise nozzle 5mm from printed part
G90				; absolute positioning
G1 X150 Y130 F6000		; Move x and Y axis over to bed center so probe is on top of bed
;M104 S35		; Set hot end low and wait
G4 S60			; Wait 5 minutes
;M116			; wait for temp to drop
G28 X Y			; Home X and Y
G28 X Y			; Home it again, Sam.
M290 R0 S0		; clear babystepping
M84			; Steppers off
M98 P"ZSpeedsNormal.g"	; Load normal z speed settings again.
;M106 P0 F15000 B1 T45 H1 C"Duet Fans"			; Fan off
M106 P2 F15000 B1 S0.025 C"Duet Fans" H-1 ; duet case fans always on

;Play a little beep beep beep to show print ended.
M400			; Clear queue again before jingle
G4 S1
M300 P250 S750
G4 P251
M300 P200 S1250
G4 P201
M300 P250 S750
G4 P251
M300 P200 S1250
G4 P201
M300 P250 S2500
G4 P251
M300 P150 S2000
G4 P151
M300 P150 S2500
G4 P151
M300 P350 S3700
G4 P351