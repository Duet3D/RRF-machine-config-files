; ANDROMEDA ( https://www.precisionpiezo.co.uk/product-page/andromeda )
M574 Z0 C"nil"                                   ; no Z endstop switch, free up Z endstop input
M558 P8 C"zstop" H5 F120 T3000 R3                ; P8 unfiltered, P5 filtered, P8 is faster
G31 P100 X0 Y0 Z0 
;M557 X-101:135 Y-106:114 S20                     ; define mesh grid
M557 X-114:122 Y-106:114 P3:3                     ; define mesh grid
M376 H10                                         ; taper compensation during 10mm
