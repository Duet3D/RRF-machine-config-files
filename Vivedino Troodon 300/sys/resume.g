; resume.g
; called before a print from SD card is resumed
;
; generated by RepRapFirmware Configuration Tool v3.3.10 on Sun Mar 20 2022 16:46:49 GMT+0000 (Greenwich Mean Time)
G1 R1 X0 Y0 Z1 F6000 ; go to 1mm above position of the last print move
G1 R1 X0 Y0          ; go back to the last print move
M83                  ; relative extruder moves
G1 E10 F3600         ; extrude 10mm of filament
M42 P26 S0
M42 P25 S0
M42 P24 S255
