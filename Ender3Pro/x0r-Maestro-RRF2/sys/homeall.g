; homeall.g
; called to home all axes
;
; 

M913 X35 Y35 Z35	; Reduce motor currents for homing
G91			; relative positioning
G1 S2 Z3 F600		; lift Z relative to current position
G1 S1 X-250 Y-250 F4000 ; move quickly to X and Y axis endstops and stop there (first pass)
G1 S2 X5 Y5 F4000	; go back a few mm
G1 S1 X-240 Y-240 F360  ; move slowly to X and Y axis endstops once more (second pass)
G90 			; absolute
G1 X159 Y142 F6000	; move probe to bed center
M558 F600 A1 		; Dive fast once 
G30			; probe Z
M558 F100 A10 		; Slow second dive with more accuracy
G30			; probe z again
G29 S1			; Load heightmap and enable mesh grid compensation
G1 X10 Y10 Z10 F6000	; return head to park position
M913 X100 Y100 Z100	; Return motor currents to normal




