M291 P"Grid bed compensation map and Z Probe trigger height will be cleared. Ok or Cancel?" R"WARNING" S3 ; User must click OK or cancel.
M291 P"Heights will be found in gcode console if logging successful gcode is enabled" R"Did you remember to enabled gcode logging?" S3

; Clear compensation map and Z probe trigger height
;
G28			; home all axis
M561			; Disable any current bed compensation
G90			; Absolute positioning
T0			; Activate first tool
M98 P"ZSpeedsSlow.g"	; Set lower speeds for Z homing and lower Z motor current
M913 Z50		; Drop motor current to prevent damage in case of head crash

; Preheat to probing temps
;
M291 P"Preheating to bed to 60 and nozzle to 210 for accurate probing"
M104 S210		; Set nozzle to 210 and release
M190 S60		; Set bed to 60 and wait
M109 S210		; Set nozzle to 210 and wait

M98 P"0:/macros/musical tunes/GetAttention.g"

; 1
;
M291 P"Nozzle will now move to center of bed to reset Z0 and calibrate probe" S3
M98 P"0:/macros/Calibration/Bed Leveling/1_Center Nozzle on Bed"
G90 G1 Z3 F400
M400
G92 Z4 			; Reset z to 8 to allow jogging up to touch bed to nozzle
M291 P"Jog the Z Axis until the bed and nozzle are touching and click OK" R"Setting Z=0" Z1 S3
M400
G92 Z0			; Set z = 0
G90 G1 Z3 F400
M104 S0 		; Turn off hotend heater as it's no longer needed
M291 P"Probe will now move to center of bed and measure trigger height 10 times" R"ZProbe Trigger Height Calibration" T3
M400
M98 P"0:/macros/Calibration/Bed Leveling/1_Center Probe on Bed"

G1 Z5
M400
G30 S-1
M400
G1 Z5
M400
G30 S-1
M400
G1 Z5
M400
G30 S-1
M400
G1 Z5
M400
G30 S-1
M400
G1 Z5
M400
G30 S-1
M400
G1 Z5
M400
G30 S-1
M400
G1 Z5
M400
G30 S-1
M400
G1 Z5
M400
G30 S-1
M400
G1 Z5
M400
G30 S-1
M400
G1 Z5
M400
G30 S-3 ; measure probe height and set it.
M400
M500 P31 ; save trigger height to config-override.g
G1 Z5

M98 P"0:/macros/musical tunes/GetAttention.g"

; Turn off heaters
; 
M104 S0		; Set nozzle to 0 and release
M140 S0		; Set bed to 0 and release
M98 P"ZSpeedsNormal.g"	; return to normal speeds
M98 P"CurrentsNormal.g"
M400
M291 P"Homing"
G28		; Home Z
M84 ; turn off the motors
M291 P"Probing complete. Turning off heaters and homing axis. Check log for trigger heights and enter into config.g" S2


