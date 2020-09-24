; homez.g
; called to home the Z axis
;
; 


M913 X35 Y35 Z35	; Reduce motor currents for homing
G91			; relative positioning
G1 S1 Z300 F600		; move Z up stopping at the endstop
G1 S2 Z-2 F600		; back off
G1 S1 Z10 F300		; rehome slowly
G1 S2 Z-1 F300		; lift Z relative to current position
G90			; absolute positioning
M913 X100 Y100 Z100	; Return motor currents to normal