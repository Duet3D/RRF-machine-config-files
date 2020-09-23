; homez.g
; called to home the Z axis
;

; BLTOUCH PREP
;
G4 S1
M280 P3 S160 I1 		; Alarm Release and Push-Pin UP just in case it's in alarm and deployed
G4 S1
M402				; Retract probe just in case it's down

; Drop the bed for travel
;
G91				; Relative positioning
M98 P"ZSpeedsSlow.g"		; Set lower speeds for homing
G1 Z5 F100 S2        		; Lower bed 5mm to ensure it is below the trigger height
M98 P"ZSpeedsNormal.g"		; Set normal speeds again

; Move probe into position
;
G90				; absolute positioning
G1 X192.2 Y98.1 F6000		; Move x and Y axis over to bed center so probe is on top of bed
;G1 X150 Y150 F6000		; Move x and Y axis over to top left quadrant of bed

; Probe the bed
;
M558 A1 F400			; Set single probing at faster feed rate
G30 				; Do a single probe to home our Z axis
M98 P"ZSpeedsSlow.g"		; Set lower speeds for homing
M558 A10 F100			; Set tripple probing at slower feed rate
G30				; Probe again to get a more accurate position
M98 P"ZSpeedsNormal.g"		; Set normal speeds again