; stop.g
; called when M0 (Stop) is run (e.g. when a print from SD card is cancelled)
; Also called by slicer end gcode by M0
;
M400			; Finish move queue
M104 S0 		; Extruder heater off
M140 S0 		; Bed heater off
M106 S255 		; Fan at 100 to cool nozzle and bed

M220 S100		; Set speed factor back to 100% in case it was changed
M221 S100		; Set extrusion factor back to 100% in case it was changed
M566 P0         ; uses jerk between all moves. yes or no.
G91			; Relative positioning
G1 E-2 F9000			; Retract filament 2mm
M204 P2600 T2600
G1 X5 Y5 Z-0.2 F12000		; Wipe nozzle 
G1 Z20 F500			; raise nozzle 5mm from printed part
M98 P"0:/macros/Calibration/Bed Leveling/1_Center Nozzle on Bed"		; Move x and Y axis so probe over bed center
;M104 S50		; Set hot end low and wait
;M116			; wait for temp to drop
G4 S60			; Wait 5 minutes
M107 ; stop fan
G28 X Y			; Home X and Y
G28 X Y			; Home it again, Sam.
M290 R0 S0		; clear babystepping
M84			; Steppers off
M98 P"ZSpeedsNormal.g"	; Load normal z speed settings again.
M98 P"CurrentsNormal.g" ; load normal motor currents
M98 P"0:/macros/Musical Tunes/EndPrint.g" ; Thank god that's over! Let's Celebrate with a little ditty.

