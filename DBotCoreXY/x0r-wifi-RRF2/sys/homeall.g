; homeall.g
; called to home all axes
;

; BLTOUCH PREP
;
M400
G4 S1
M280 P3 S160 I1 		; Alarm Release and Push-Pin UP just in case it's in alarm and deployed
G4 S1
M402				; Retract probe just in case it's down
M400

; Drop the bed for travel
;
G91				; Relative positioning
M98 P"ZSpeedsSlow.g"		; Set lower speeds for homing
G1 Z5 F100 S2        		; Lower bed 5mm to ensure it is below the trigger height
M98 P"ZSpeedsNormal.g"		; Set normal speeds again
M98 P"CurrentsHoming.g"		; set motor currents lower for homing

; Home XY
;
M913 X30 Y30	 		; set X Y motors to 30% of their normal current for homing
G1 S1 X-375 Y305 F3000   	; course home X or Y
G1 S1 X-375 F3000              	; course home X
G1 S1 Y305 F3000              	; course home Y
G1 X5 Y-5 F1000             	; move away from the endstops
G1 S1 X-10 F600           	; fine home X
G1 S1 Y10 F600               	; fine home Y
M400
M913 X75 Y75	 		; set X Y motors to 75% of their normal max current

; Z homing section for BLTouch follows
;
G90				; absolute positioning
G1 X192.2 Y98.1 F12000		; Move x and Y axis over to bed center so probe is on top of bed
M400
;G1 X150 Y150 F6000		; Move x and Y axis over to top left quadrant of bed

; Probe the bed
;
M558 A1 F400			; Set single probing at faster feed rate
G30 				; Do a single probe to home our Z axis
M98 P"ZSpeedsSlow.g"		; Set lower speeds for homing
M558 A10 F100			; Set tripple probing at slower feed rate
G30				; Probe again to get a more accurate position

; Move X and Y back Home
;
G1 X1 Y270 Z5
M400
M98 P"0:/sys/ZSpeedsNormal.g"		; Set normal speeds again
M98 P"0:/sys/CurrentsNormal.g"		; Set motor currents to normal values
M98 P"0:/macros/musical tunes/ZeldaSecret.g"
