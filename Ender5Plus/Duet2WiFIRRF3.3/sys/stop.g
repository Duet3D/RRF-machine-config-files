; stop.g
; called when M0 (Stop) is run (e.g. when a print from SD card is cancelled)
; Also called by slicer end gcode by M0
;
M400			; Finish move queue
M104 S0 		; Extruder heater off
M140 S0 		; Bed heater off
M106 S255 		; Fan at 100 to cool nozzle and bed
G91			; Relative positioning
M220 S100		; Set speed factor back to 100% in case it was changed
M221 S100		; Set extrusion factor back to 100% in case it was changed
G1 E-2			; Retract filament 2mm
G1 Z5			; raise nozzle 5mm from printed part
G90			; Absolute positioning
G28 X Y			; Home X and Y
G28 X Y			; Home it again, Sam.
M104 S35		; Set hot end low and wait
G4 S300			; Wait 5 minutes
M116			; wait for temp to drop
M106 S0			; Fan off
M104 S0			; extruder heater off
M84			; Steppers off