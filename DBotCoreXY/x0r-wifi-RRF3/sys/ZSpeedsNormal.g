; 0:/sys/ZSpeedsNormal.g
; Used to set normal movement speeds for the Z axis
; Make sure these values match those in config.g

M566 Z30			; Set maximum instantaneous speed changes (mm/min) (Jerk)
M203 Z400			; Set maximum speeds (mm/min)
M201 Z30			; Set maximum accelerations (mm/s^2)