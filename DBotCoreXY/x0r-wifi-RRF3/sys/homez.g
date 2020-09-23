; homez.g
; called to home the Z axis
;

; BLTOUCH PREP
;
G4 S1
M280 P0 S160 		; Alarm Release and Push-Pin UP just in case it's in alarm and deployed
G4 S1
M402				; Retract probe just in case it's down

; Drop the bed for travel
;
G91				; Relative positioning
M400
M98 P"CurrentsHoming.g"		; set motor currents lower for homing
M400
M98 P"ZSpeedsSlow.g"		; Set lower speeds for homing
G1 H2 Z5 F100        		; Lower bed 5mm to ensure it is below the trigger height
M98 P"ZSpeedsNormal.g"		; Set normal speeds again

; Move probe into position
;
G90				; absolute positioning
M98 P"0:/macros/Calibration/Bed Leveling/1_Center Probe on Bed"		; Move x and Y axis so probe over bed center
M400

; Probe the bed
;
M558 A1 F400 B1			; Set single probing at faster feed rate
G30 				; Do a single probe to home our Z axis
M98 P"ZSpeedsSlow.g"		; Set lower speeds for homing
M558 A10 F60 B0			; Set tripple probing at slower feed rate
G30				; Probe again to get a more accurate position
M98 P"ZSpeedsNormal.g"		; Set normal speeds again
M98 P"CurrentsNormal.g"		; Set motor currents to normal values