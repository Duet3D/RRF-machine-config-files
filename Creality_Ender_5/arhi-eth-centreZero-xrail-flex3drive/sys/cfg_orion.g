; ORION DIGITAL ( https://www.precisionpiezo.co.uk/product-page/precision-piezo-orion-pcb )
;M574 Z0 C"nil"                                   ; no Z endstop switch, free up Z endstop input
;M558 P8 C"!zstop" H5 F300 T3000 R4               ; P8 unfiltered, P5 filtered, P8 is faster
;G31 P100 X0 Y0 Z0 

; ORION ANALOG 
M558 P1 C"zprobe.in" R2 H5 F1200 T3000 A3 S0.03 K0 
G31 X0 Y0 Z0 P780 


; COMMON settings for ORION
M376 H10                                         ; taper compensation during 10mm
M557 X-110:110 Y-100:100 P5:5                    ; define mesh grid
;M566 Z0                                         ; Z JERK
