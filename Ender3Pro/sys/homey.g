; homey.g
; called to home the Y axis
;
; 

M400				; clear buffer
M913 X35 Y35 Z35	; Reduce motor currents for homing
M400				; clear buffer
G91              	; relative positioning
G1 H2 Z5 F600    	; lift Z relative to current position
G1 H1 Y-250 F6000 	; move quickly to Y axis endstop and stop there (first pass)
G1 Y5			   	; go back a few mm
G1 H1 Y-240 F360  	; move slowly to Y axis endstop once more (second pass)
G1 Y1 F6000     	; go back a few mm
G1 H2 Z-5 F600  	; lower Z again
G90              	; absolute positioning
M400				; clear buffer
M913 X100 Y100 Z100	; Return motor currents to normal
M400				; clear buffer