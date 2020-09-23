; homeall.g
; called to home all axes
;

; BLTOUCH PREP
;
M400
G4 S1
M280 P0 S160 		; Alarm Release and Push-Pin UP just in case it's in alarm and deployed
G4 S1
M402				; Retract probe just in case it's down
M400

; Drop the bed for travel
;
G91				; Relative positioning
M98 P"ZSpeedsSlow.g"		; Set lower speeds for homing
G1 H2 Z3 F100        		; Lower bed 5mm to ensure it is below the trigger height
M98 P"ZSpeedsNormal.g"		; Set normal speeds again
M98 P"CurrentsHoming.g"		; set motor currents lower for homing

; Home XY
;
M400
M913 X30 Y30	 				; set X Y motors to 30% of their normal current for homing
G1 H1 X-375 Y305 F3000   		; course home X or Y
G1 H1 X-375		            	; course home X
G1 H1 Y305		              	; course home Y
G1 X5 Y-5		             	; move away from the endstops
G1 H1 X-10 F600           		; fine home X
G1 X2 							; back off endstop
G1 H1 Y10		               	; fine home Y
G1 Y-2 							; back off endstop

; Z homing section for BLTouch follows
;
G90				; absolute positioning

M98 P"0:/macros/Calibration/Bed Leveling/1_Center Probe on Bed"		; Move x and Y axis so probe over bed center
M400

; Probe the bed
;
M558 A1 F400 B0			; Set single probing at faster feed rate
G30 				; Do a single probe to home our Z axis
M98 P"ZSpeedsSlow.g"		; Set lower speeds for homing
M558 A10 F60 B1			; Set tripple probing at slower feed rate
G30				; Probe again to get a more accurate position

; Move X and Y back Home
;
G1 X1 Y270 Z5 F12000
M400
M98 P"0:/sys/ZSpeedsNormal.g"		; Set normal speeds again
M98 P"0:/sys/CurrentsNormal.g"		; Set motor currents to normal values
M98 P"0:/macros/musical tunes/ZeldaSecret.g"
