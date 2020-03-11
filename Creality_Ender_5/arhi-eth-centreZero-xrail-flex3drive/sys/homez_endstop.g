M574Z1S1P"zstop"  ; Z min active high endstop switch
G91               ; relative positioning
G1 Z2 F1000 S2    ; lift Z relative to current position
G1 S1 Z-305 F1000 ; move Z down until the endstop is triggered
G1 Z5 F1000       ; go back a few mm
G1 S1 Z-305 F200  ; move slowly, second pass
G90               ; absolute positioning
G92 Z0            ; set Z position to axis minimum (you may want to adjust this)
G91               ; relative positioning
G1 S2 Z5 F100     ; lift Z relative to current position
G90               ; absolute positioning

