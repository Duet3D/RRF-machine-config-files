; stop.g
; called when M0 (Stop) is run (e.g. when a print from SD card is cancelled)
; Also called by slicer end gcode by M0
;
M400			; Finish move queue
M104 S0 		; Extruder heater off
M140 S0 		; Bed heater off
M106 S255 		; Fan at 100 to cool nozzle and bed
G91				; Relative positioning
M220 S100		; Set speed factor back to 100% in case it was changed
M221 S100		; Set extrusion factor back to 100% in case it was changed
G10 			; retract
;G1 E-2 F9000	; Retract filament 2mm
G1 X5 Y5 F9000	; Wipe nozzle 
G1 Z20 F500		; raise nozzle 5mm from printed part
G90				; absolute positioning
G1 X115 Y130 F6000		; Move x and Y axis over to bed center so probe is on top of bed
;M104 S45		; Set hot end low and wait
G4 S60			; Wait 5 minutes
;M116			; wait for temp to drop
G1 X0 Y230		; present print
M290 R0 S0		; clear babystepping
M84				; Steppers off
M106 S0			; Fan off

; Play a tune
M98 P"0:/macros/Musical Tunes/TwoBits.g"