; tpre0.g
; called before tool 0 is selected

M98 P"/macros/Coupler - Unlock"	; unlock Coupler

M564 S0 ; allow movement outside the normal limits

G1 X-160.5 Y100 F50000			; move to location
G1 Y115 F50000					; move in
G1 Y127.2 F2500					; collect

M98 P"/macros/Coupler - Lock"	; close Coupler

;WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING!
;if you are using non-standard length hotends ensure the bed is lowered enough BEFORE undocking the tool!
G91
G1 Z10 F1000
G90

G1 Y50 F4000					; move out

M208 Y66						; set Y max for this tool
M564 S1 						; apply the normal limits again
