; 0:/macros/Bed Leveling/0_Grid Compensation Assist.g
; Macro to run a mesh bed compensation routine (G29)
;

M291 P"Grid bed compensation map will be cleared and re-calculated. Ok or Cancel?" R"WARNING. This will take about 30 minutes." S3 ; User must click OK or cancel.

; Preheat to probing temps
;
M291 P"Preheating to bed to 60 and nozzle to 210 for accurate probing" R"Proceed?" S3
T0			; Activate first tool
M190 S65		; Set bed to 65 and wait
;M109 S210		; Set nozzle to 210 and wait. Used only for stall detection probing.

; Clear current mesh compensation map and disable compensation.
;
G28			; Home all
M561			; Disable any current bed compensation

; Set lower speeds for Z homing and lower Z motor current
;
M98 P"ZSpeedsSlow.g"
M98 P"CurrentsHoming.g"			; Drop motor current to prevent damage in case of head crash

M98 P"0:/macros/musical tunes/GetAttention.g" ; Tone to get user attention
M291 P"Running mesh grid compensation probing cycle. Do not disturb the printer."

M558 H1.5 ; lower dive height

G29			; Run mesh compensation

M98 P"0:/macros/musical tunes/GetAttention.g" ; Tone to get user attention

M558 H3 ; return dive height

; Turn off heaters
; 
M140 S0		; Set bed to 0 and release
;M104 S0		; turn off hot end heater
M98 P"ZSpeedsNormal.g"
M98 P"CurrentsNormal.g"
M291 P"Homing"
G28		; Home all
M84 ; turn off the motors
M291 P"Check heightmap for results." R"Probing complete!" S3



