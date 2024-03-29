; homeall.g
; called to home all axes
;
; generated by RepRapFirmware Configuration Tool v3.3.10 on Sun Mar 20 2022 16:46:49 GMT+0000 (Greenwich Mean Time)
G91                     ; relative positioning
G1 H2 Z5 F6000          ; lift Z relative to current position
G1 H1 X310 Y308 F1800 ; move quickly to X or Y endstop and stop there (first pass)
G1 H1 X310             ; home X axis
G1 H1 Y308             ; home Y axis
G1 X300 Y300 F6000          ; go back a few mm
G1 H1 X310 F360        ; move slowly to X axis endstop once more (second pass)
G1 H1 Y308             ; then move slowly to Y axis endstop
G90                     ; absolute positioning
G1 X285 Y285 F6000        ; go to first bed probe point and home Z
M98 Pdeployprobe.g      ; deploy mechanical Z probe
G30                     ; home Z by probing the bed

; Uncomment the following lines to lift Z after probing
;G91                    ; relative positioning
;G1 Z5 F100             ; lift Z relative to current position
;G90                    ; absolute positioning

M98 Pretractprobe.g     ; retract mechanical Z probe
