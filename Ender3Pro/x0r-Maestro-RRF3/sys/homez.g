; homez.g
; called to home the Z axis
;
; 

M574 Z2 S1 P"zstop"						; configure active-high endstop for high end on Z via pin zstop
M400
M913 X35 Y35 Z35	; Reduce motor currents for homing
M400
G91					; relative positioning
G1 H1 Z300 F900		; move Z up stopping at the endstop
G1 Z-1 F600			; back off
G1 H1 Z10 F120		; rehome slowly
G1 Z-10 F600		; lift Z relative to current position
G90					; absolute positioning
M400
M913 X100 Y100 Z100	; Return motor currents to normal
M400