; homeall.g
; called to home all axes
;
; 

; BLTouch prep
M280 P0 S160			; Clear any alarms (RRF2 was P64)
G4 S1					; Pause a couple seconds
M402					; retract pin just in case
;M574 Z2 S2				; configure Z-probe endstop for high end on Z
M400					; clear buffer
M913 X45 Y45 Z45		; Reduce motor currents for homing
M400					; clear buffer
G91						; relative positioning
G1 H2 Z3 F600			; lift Z relative to current position
G1 H1 X-250 Y-250 F6000 ; move quickly to X and Y axis endstops and stop there (first pass)
G1 X5 Y5 				; go back a few mm
G1 H1 X-240 F360  		; move slowly to X and Y axis endstops once more (second pass)
G1 H1 Y-240 			; move slowly to X and Y axis endstops once more (second pass)
G90 					; absolute
G1 X159 Y142 F6000		; move probe to bed center
M558 F600 A1 			; Dive fast once 
G30						; probe Z
M558 F60 A10 			; Slow second dive with more accuracy
G30						; probe z again
G29 S1					; Load heightmap and enable mesh grid compensation
G1 X10 Y10 Z10 F6000	; return head to park position
M400
M913 X100 Y100 Z100		; Return motor currents to normal
M400




