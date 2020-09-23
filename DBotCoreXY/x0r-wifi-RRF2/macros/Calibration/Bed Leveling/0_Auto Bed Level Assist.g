; Helps guide leveling the bed mechanically, and calibrate the ZProbe trigger height before running a grid bed compensation routine..
;

; Preamble to tell the user to prepare the printer before continuing
;
;M291 P"Before proceeding make sure the printer is mechanically sound and properly functioning." R"Prepare printer for leveling routine" S3 ; User must click OK
;M291 P"ZProbe should be configured and working. Clear the print bed of any obstacles or debris." R"Prepare printer for leveling routine" S3 ; User must click OK
;M291 P"This routine will take about 10-20 minutes and heat both the bed and nozzle." R"Prepare printer for leveling routine" S3 ; User must click OK
;M291 P"You will need a screwdriver and piece of paper. Filament will be unloaded." R"Prepare printer for leveling routine" S3 ; User must click OK
;M291 P"Make sure you have successful Gcodes logged to the console before proceeding." R"WARNING" S3 ; User must click OK or cancel
;M291 P"Make a note of your M558 Z value and backup current heightmap before proceeding." R"WARNING" S3 ; User must click OK or cancel

; Clear compensation map and Zprobe trigger height
;
M291 P"Grid bed compensation map will be disabled. Ok or Cancel?" R"WARNING" S3 ; User must click OK or cancel.
M291 P"Bed and nozzle will preheat and home all axis." R"Preheat and Home" S3 T0 ; User must click OK or cancel

; Heat up bed and nozzle to PLA temps in prep for filament removal and probing
;
T0			; Activate first tool
M104 S85		; Set nozzle to 85 and release
M140 S65		; Set bed to 65 and release

G28				; home all
M561			; Disable any current bed compensation

; Move nozzle forward for filament removal
;
M291 P"Moving nozzle to the front for filament removal and cleaning." T0
M98 P"0:/macros/1_Nozzle Access.g"		; Moves print head to front left and drops the bed down for easy access

M109 S85		; Set nozzle to 85 and wait

M98 P"0:/macros/Musical Tunes/GetAttention.g" ; Tone to get user attention

; Unload filament and clean nozzle
;
M291 P"Unload filament if loaded and clean nozzle, then press OK to continue" R"Unload Filament" S3 T0 ; User must click OK or cancel

; Preheat to probing temps
;
M291 P"Preheating the bed to 60 and nozzle to 210 for accurate probing" T0
M104 S210		; Set nozzle to 210 and release
M190 S60		; Set bed to 60 and wait
M109 S210		; Set nozzle to 210 and wait

M98 P"0:/macros/Musical Tunes/GetAttention.g" ; Tone to get user attention

; Move nozzle to center of bed at Z10 and drop to Z1
;
M291 P"Nozzle will now move to center of bed and move close to the bed" T0
M98 P"0:/macros/0_Center Nozzle.g"
G90 G1 Z3 F400	; drop bed for nozzle clearance
G92 Z4 		; Reset z to 8 to allow jogging up to touch bed to nozzle

; Set lower speeds for Z homing and lower Z motor current
;
M98 P"ZSpeedsSlow.g"
M400
M913 Z50			; Drop motor current to prevent damage in case of head crash

; Dialog to allow user to job z to touch nozzle to bed gently and then move Z down 10
;
M291 P"Carefully Jog the Z Axis until the bed and nozzle are touching and click OK" R"Setting Z=0" Z1 S3
G92 Z0      		; set z = 0

; Move nozzle to leveling points and prompt user to level bed at each
;
M291 P"Nozzle will now move to the 3 leveling points twice." S1 T2

; Move to leveling point 1
G1 Z2      		; move to z2 for travel
M98 P"0:/macros/Calibration/Bed Leveling/1_Leveling Position #1" ; Move to rear left corner

M400
M291 P"Adjust point 1. Jog down by 2 and adjust screw." R"Adjustment Point 1" S2 Z1

; Move to leveling point 2
G1 Z2			; Move to Z2 for clearance
M98 P"0:/macros/Calibration/Bed Leveling/1_Leveling Position #2"	; Move to rear right corner

M400
M291 P"Adjust point 2. Jog down by 2 and adjust screw." R"Adjustment Point 2" S2 Z1

; Move to leveling point 3
G1 Z2			; Move to Z2 for clearance
M98 P"0:/macros/Calibration/Bed Leveling/1_Leveling Position #3"	; Move to front middle

M400
M291 P"Adjust point 3. Jog down by 2 and adjust screw." R"Adjustment Point 3" S2 Z1

; Repeat to verify
;
M291 P"The adjustment sequence will now repeat for fine adjustment." S1 T2

; Move to leveling point 1
G1 Z2      		; move to z2 for travel
M98 P"0:/macros/Calibration/Bed Leveling/1_Leveling Position #1" ; Move to rear left corner

M400
M291 P"Adjust point 1. Jog down by 2 and adjust screw." R"Adjustment Point 1" S2 Z1

; Move to leveling point 2
G1 Z2			; Move to Z2 for clearance
M98 P"0:/macros/Calibration/Bed Leveling/1_Leveling Position #2"	; Move to rear right corner

M400
M291 P"Adjust point 2. Jog down by 2 and adjust screw." R"Adjustment Point 2" S2 Z1

; Move to leveling point 3
G1 Z2			; Move to Z2 for clearance
M98 P"0:/macros/Calibration/Bed Leveling/1_Leveling Position #3"	; Move to front middle

M400
M291 P"Adjust point 3. Jog down by 2 and adjust screw." R"Adjustment Point 3" S2 Z1
G1 Z2			; Move to Z2 for clearance

M98 P"0:/macros/Musical Tunes/GetAttention.g" ; Tone to get user attention

; Turn off heaters
; 
M104 S0		; Set nozzle to 0 and release
M140 S0		; Set bed to 0 and release
M98 P"ZSpeedsNormal.g"
M98 P"CurrentsNormal.g"

M291 P"Homing"
G28		; Home XYZ
M84 ; Turn off the motors

M291 P"The bed has been mechanically leveled and Z0 set." S2

; Tell user to take values from gcode console log and average the Z height and use that as the new Z probe trigger height
;
;M291 P"Average the 10 Z height values in the console and round to 2 decimal places" S2
;M291 P"The resulting value is the ZProbe trigger height value (M558 Zn)" S2
;M291 P"Either set the value in config.g and reboot, or send M558 Zn in the console before running G29." S2
;M291 P"The bed is now mechanically leveled and probe height calibrated." R"Congratulations!" S2
;M291 P"You may now run a Grid Bed Compensation Detailed Probe. (G92)." S2
;
; Run bed grid compensation routine
