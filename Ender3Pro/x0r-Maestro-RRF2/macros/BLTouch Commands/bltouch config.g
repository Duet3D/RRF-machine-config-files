; Z-Probe
M574 Z2 S2								; configure Z-probe endstop for high end on Z
M950 S0 C"^zprobe.mod"					; create servo pin 0 for BLTouch
M558 P9 C"^zprobe.in" H3 F120 T6000		; BLTouch Z probe settings
M558 P9 A10 S0.003 B0 R0.2				; BLTouch advanced settings
G31 P500 X-44 Y-17 Z1.996				; Set BLTouch offsets
M557 X5:190 Y5:215 P3					; Define mesh grid