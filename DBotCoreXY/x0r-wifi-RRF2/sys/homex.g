; homex.g
; called to home the X axis
;

; BLTouch prep so we don't catch the probe pin on the edge of the bed
;
M280 P3 S160 I1 		; Alarm Release and Push-Pin UP just in case it's in alarm and deployed
M402				; Retract probe just in case it's down
M98 P"CurrentsHoming.g"		; load homing motor currents
G91               		; relative positioning
G1 S1 X-375 F3000 		; move quickly to X axis endstop and stop there (first pass)
G1 X5 F1000       		; go back a few mm
G1 S1 X-10 F600  		; move slowly to X axis endstop once more (second pass)
M98 P"CurrentsNormal.g"		; return to normal currents