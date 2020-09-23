; 0:/sys/ZSpeedsPrint.g
; Used to set faster z speeds for printing.

M566 Z30			; Set maximum instantaneous speed changes (mm/min) (Jerk)
M203 Z400		; Set maximum speeds (mm/min)
M201 Z30 		; Set maximum accelerations (mm/s^2)