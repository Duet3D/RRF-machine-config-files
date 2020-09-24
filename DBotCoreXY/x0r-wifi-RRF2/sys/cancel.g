; cancel.g
;
; Run when the print is paused, and then canceled.
;

G10 P0 R0 S0		; Set hotend temp to 0
M140 S0			; Set bed temp to 0
M106 S255 		; Fan at 100 to cool nozzle and bed
M220 S100		; Set speed factor back to 100% in case it was changed
M221 S100		; Set extrusion factor back to 100% in case it was changed
M290 R0 S0 ; clear babystepping
M204 P1000 T4000	; Set printing and travel accelerations
M566 X900 Y900 Z30 	; Set maximum instantaneous speed changes (mm/min) (Jerk)
G28 XY			; home XY
M98 P"0:/sys/CurrentsNormal.g" ; return motor currents to normal
M98 P"0:/sys/ZSpeedsNormal.g" ; return Z axis speeds to normal
M84			; turn off steppers
G4 S60			; wait 1 minute for nozzle to cool
M107			; turn off the fan
M98 P"0:/macros/Musical Tunes/TwoBits.g" ; play a tune