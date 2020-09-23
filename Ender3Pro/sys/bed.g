; bed.g
; called to perform automatic bed compensation via G32
;
; 
M291 P"Performing Mesh Grid Mapping of Bed Surface for Active Compensation" R"Please Wait"
M140 S60		; Set bed temp to 60
M116			; wait for temps
M561 			; clear any bed transform
G28			; home all
M561 ; clear any bed transform
G29  			; probe the bed and enable compensation
M140 S0			; Turn off heater
G1 Z10 Y200 X10 F6000



