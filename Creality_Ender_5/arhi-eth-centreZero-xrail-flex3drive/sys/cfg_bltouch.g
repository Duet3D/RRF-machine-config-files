; BL-TOUCH v3

M558 P9 C"^zprobe.in" H5 F120 T3000 A2           ; FW v3 BLTouch connected to Z probe IN pin
M950 S0 C"exp.heater3"                           ; FW v3 create servo/gpio 0 on heater 3 pin on expansion connector
G31 P100 X35 Y0 Z2.2                             ; set Z probe trigger value, offset and trigger height 
                                                 ; (Trigger should be 0-connected, 1000-triggered, so P500 is middle 
												 ; but RR3B11 introduced a bug so dropping P to 100)
M557 X-104:112 Y-115:85 S20                      ; define mesh grid
M376 H10                                         ; taper compensation during 10mm
