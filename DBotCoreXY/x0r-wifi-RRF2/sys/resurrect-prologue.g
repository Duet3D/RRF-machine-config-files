; resurrect-prologue.g
;
; Called by resurrect.g after a resume from powerloss.
; 

G28 XY			; Home X and Y
g92 Z87.2 ; force current z to the manually measured height
;M98 P"/macros/2_HomeZMax.g"	; Call Home Z Max macro
M116			; Wait for temps
M83			; Relative Extrusion
G1 E2 F1000		; Undo retraction and prime nozzle
M98 P"ZSpeedsPrint.g"	; Return Z speeds to print speeds
M98 P"CurrentsPrint.g" ; return motor currents to print values

; Returns to resurrect.g to resume print