; HomeZMax.g
;
; Called to home Z to max endstop
;

M574 Z2 S1		; Set active-high switch (Opto) at the high end for Z Max.

; Set lower speeds for homing
;M566 Z5				; Set maximum instantaneous speed changes (mm/min) (Jerk)
;M203 Z300			; Set maximum speeds (mm/min)
;M201 Z60	 		; Set maximum accelerations (mm/s^2)

; Move to Z Max
;
G91				; Relative positioning
G1 S1 Z330 F300			; Move bed down until endstop triggers

; Set normal speeds again
;
;M566 Z60			; Set maximum instantaneous speed changes (mm/min) (Jerk)
;M203 Z500			; Set maximum speeds (mm/min)
;M201 Z60			; Set maximum accelerations (mm/s^2)


