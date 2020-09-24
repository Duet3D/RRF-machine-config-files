; 0:/sys/ZSpeedsFast.g
; Used to set slower z speeds for delicate movements like homing or calibrating.

M566 Z60			; Set maximum instantaneous speed changes (mm/min) (Jerk)
M203 Z500		; Set maximum speeds (mm/min)
M201 Z120 		; Set maximum accelerations (mm/s^2)