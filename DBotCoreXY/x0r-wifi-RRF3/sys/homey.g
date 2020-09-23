; homey.g
; called to home the Y axis
;

; BLTouch prep so we don't catch the probe pin on the edge of the bed
;
M280 P0 S160 		; Alarm Release and Push-Pin UP just in case it's in alarm and deployed
M402				; Retract probe just in case it's down

G91               		; relative positioning
M98 P"CurrentsHoming.g"		; set motor currents lower for homing
G1 H1 Y305 F3000 		; move quickly to Y axis endstop and stop there (first pass)
G1 Y-5 F1000       		; go back a few mm
G1 H1 Y10 F600  		; move slowly to Y axis endstop once more (second pass)
G1 Y-2
M98 P"CurrentsNormal.g" 	; set motor currents back to normal