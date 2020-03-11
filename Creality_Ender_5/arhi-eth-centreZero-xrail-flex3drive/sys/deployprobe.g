; deployprobe.g
; called to deploy a physical Z probe


;M280 P7 S160   ; Alarm Release and Push-Pin UP
;M280 P7 S10    ; Pin Down
;M280 P7 S90    ; Pin Up
;M280 P7 S120   ; Self-Test


M280 P0 S160    ; Alarm Release and Push-Pin UP
M280 P0 S10     ; Pin Down

