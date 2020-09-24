M291 P"Grid bed compensation map and Z Probe trigger height will be cleared. Ok or Cancel?" R"WARNING" S3 ; User must click OK or cancel.
M291 P"Heights will be found in gcode console if logging successful gcode is enabled" R"Did you remember to enabled gcode logging?" S3

; Clear compensation map and Z probe trigger height
;
G28			; home all axis
M561			; Disable any current bed compensation
G29 S2			; Clear mesh bed compensation parameters
G31 Z0			; Reset Z probe trigger height
G90			; Absolute positioning
T0			; Activate first tool
M98 P"ZSpeedsSlow.g"	; Set lower speeds for Z homing and lower Z motor current
M913 Z60		; Drop motor current to prevent damage in case of head crash

; Preheat to probing temps
;
M291 P"Preheating to bed to 60 and nozzle to 210 for accurate probing"
M104 S210		; Set nozzle to 210 and release
M190 S60		; Set bed to 60 and wait
M109 S210		; Set nozzle to 210 and wait

; 1
;
M291 P"Nozzle will now move to center of bed to reset Z0 and calibrate probe" S3
G1 X149 Y130 Z5 F4000	; Move to bed center
G92 Z8 			; Reset z to 8 to allow jogging up to touch bed to nozzle
M291 P"Jog the Z Axis until the bed and nozzle are touching and click OK" R"Setting Z=0" Z1 S3
G92 Z0			; Set z = 0
M291 P"Probe will now move to center of bed and measure trigger height 10 times" R"ZProbe Trigger Height Calibration" T3
G1 Z1			; Drop bed for nozzle clearance
G1 X192.2 Y98.1 F4000 	; Move to bed center
G1 Z10
G30 S-1

; 2
;
M291 P"Nozzle will now move to center of bed to reset Z0 and calibrate probe" S3
G1 X149 Y130 Z5 F4000	; Move to bed center
G92 Z8 			; Reset z to 8 to allow jogging up to touch bed to nozzle
M291 P"Jog the Z Axis until the bed and nozzle are touching and click OK" R"Setting Z=0" Z1 S3
G92 Z0			; Set z = 0
M291 P"Probe will now move to center of bed and measure trigger height 10 times" R"ZProbe Trigger Height Calibration" T3
G1 Z1			; Drop bed for nozzle clearance
G1 X192.2 Y98.1 F4000 	; Move to bed center
G1 Z10
G30 S-1

; 3
;
M291 P"Nozzle will now move to center of bed to reset Z0 and calibrate probe" S3
G1 X149 Y130 Z5 F4000	; Move to bed center
G92 Z8 			; Reset z to 8 to allow jogging up to touch bed to nozzle
M291 P"Jog the Z Axis until the bed and nozzle are touching and click OK" R"Setting Z=0" Z1 S3
G92 Z0			; Set z = 0
M291 P"Probe will now move to center of bed and measure trigger height 10 times" R"ZProbe Trigger Height Calibration" T3
G1 Z1			; Drop bed for nozzle clearance
G1 X192.2 Y98.1 F4000 	; Move to bed center
G1 Z10
G30 S-1

; 4
;
M291 P"Nozzle will now move to center of bed to reset Z0 and calibrate probe" S3
G1 X149 Y130 Z5 F4000	; Move to bed center
G92 Z8 			; Reset z to 8 to allow jogging up to touch bed to nozzle
M291 P"Jog the Z Axis until the bed and nozzle are touching and click OK" R"Setting Z=0" Z1 S3
G92 Z0			; Set z = 0
M291 P"Probe will now move to center of bed and measure trigger height 10 times" R"ZProbe Trigger Height Calibration" T3
G1 Z1			; Drop bed for nozzle clearance
G1 X192.2 Y98.1 F4000 	; Move to bed center
G1 Z10
G30 S-1

; 5
;
M291 P"Nozzle will now move to center of bed to reset Z0 and calibrate probe" S3
G1 X149 Y130 Z5 F4000	; Move to bed center
G92 Z8 			; Reset z to 8 to allow jogging up to touch bed to nozzle
M291 P"Jog the Z Axis until the bed and nozzle are touching and click OK" R"Setting Z=0" Z1 S3
G92 Z0			; Set z = 0
M291 P"Probe will now move to center of bed and measure trigger height 10 times" R"ZProbe Trigger Height Calibration" T3
G1 Z1			; Drop bed for nozzle clearance
G1 X192.2 Y98.1 F4000 	; Move to bed center
G1 Z10
G30 S-1

; 6
;
M291 P"Nozzle will now move to center of bed to reset Z0 and calibrate probe" S3
G1 X149 Y130 Z5 F4000	; Move to bed center
G92 Z8 			; Reset z to 8 to allow jogging up to touch bed to nozzle
M291 P"Jog the Z Axis until the bed and nozzle are touching and click OK" R"Setting Z=0" Z1 S3
G92 Z0			; Set z = 0
M291 P"Probe will now move to center of bed and measure trigger height 10 times" R"ZProbe Trigger Height Calibration" T3
G1 Z1			; Drop bed for nozzle clearance
G1 X192.2 Y98.1 F4000 	; Move to bed center
G1 Z10
G30 S-1

; 7
;
M291 P"Nozzle will now move to center of bed to reset Z0 and calibrate probe" S3
G1 X149 Y130 Z5 F4000	; Move to bed center
G92 Z8 			; Reset z to 8 to allow jogging up to touch bed to nozzle
M291 P"Jog the Z Axis until the bed and nozzle are touching and click OK" R"Setting Z=0" Z1 S3
G92 Z0			; Set z = 0
M291 P"Probe will now move to center of bed and measure trigger height 10 times" R"ZProbe Trigger Height Calibration" T3
G1 Z1			; Drop bed for nozzle clearance
G1 X192.2 Y98.1 F4000 	; Move to bed center
G1 Z10
G30 S-1

; 8
;
M291 P"Nozzle will now move to center of bed to reset Z0 and calibrate probe" S3
G1 X149 Y130 Z5 F4000	; Move to bed center
G92 Z8 			; Reset z to 8 to allow jogging up to touch bed to nozzle
M291 P"Jog the Z Axis until the bed and nozzle are touching and click OK" R"Setting Z=0" Z1 S3
G92 Z0			; Set z = 0
M291 P"Probe will now move to center of bed and measure trigger height 10 times" R"ZProbe Trigger Height Calibration" T3
G1 Z1			; Drop bed for nozzle clearance
G1 X192.2 Y98.1 F4000 	; Move to bed center
G1 Z10
G30 S-1

; 9
;
M291 P"Nozzle will now move to center of bed to reset Z0 and calibrate probe" S3
G1 X149 Y130 Z5 F4000	; Move to bed center
G92 Z8 			; Reset z to 8 to allow jogging up to touch bed to nozzle
M291 P"Jog the Z Axis until the bed and nozzle are touching and click OK" R"Setting Z=0" Z1 S3
G92 Z0			; Set z = 0
M291 P"Probe will now move to center of bed and measure trigger height 10 times" R"ZProbe Trigger Height Calibration" T3
G1 Z1			; Drop bed for nozzle clearance
G1 X192.2 Y98.1 F4000 	; Move to bed center
G1 Z10
G30 S-1

; 10
;
M291 P"Nozzle will now move to center of bed to reset Z0 and calibrate probe" S3
G1 X149 Y130 Z5 F4000	; Move to bed center
G92 Z8 			; Reset z to 8 to allow jogging up to touch bed to nozzle
M291 P"Jog the Z Axis until the bed and nozzle are touching and click OK" R"Setting Z=0" Z1 S3
G92 Z0			; Set z = 0
M291 P"Probe will now move to center of bed and measure trigger height 10 times" R"ZProbe Trigger Height Calibration" T3
G1 Z1			; Drop bed for nozzle clearance
G1 X192.2 Y98.1 F4000 	; Move to bed center
G1 Z10
G30 S-1

M400

; Turn off heaters
; 
M104 S0		; Set nozzle to 0 and release
M140 S0		; Set bed to 0 and release
M98 P"ZSpeedsNormal.g"	; return to normal speeds
M913 Z75	; reset z motor current
G28		; Home Z

M291 P"Probing complete. Turning off heaters and homing axis. Check log for trigger heights and enter into config.g" S2


; Tone to get user attention
;
M400			; Clear movement buffer so tones play reliably
M300 S666 P500
G4 P501
M300 S1111 P300
G4 P301