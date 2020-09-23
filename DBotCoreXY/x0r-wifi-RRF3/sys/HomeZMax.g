; Also called by 0:/macros/2_HomeZMax.g
; HomeZMax.g
; Called to home Z to max endstop
;

M291 R"Are you sure?" P"Press OK to Home to ZMax. Or Cancel to abort." S3
;
M574 Z2 S1 P"zstop"			; Set active-high switch (Opto) at the high end for Z Max
;
M98 P"0:/sys/CurrentsHoming.g"		; Load lower motor currents for homing
M98 P"0:/sys/ZSpeedsZMaxHome.g"		; Load slower Z Speeds profile
;
G91						; Relative positioning
G1 H1 Z350 F400			; Move bed down until endstop triggers
G1 Z-2 F60				; back off 2mm
G1 H1 Z10 F60			; go back to trigger endstop more slowly
G1 Z-2 F60				; back off 2mm
;
M98 P"0:/sys/ZSpeedsNormal.g"		; Load normal Z Speeds profile	
M98 P"0:/sys/CurrentsNormal.g"		; Load normal motor currents again



