; bed.g
; called to perform automatic bed compensation via G32

G29 S2 ; delete compensations
M561   ; clear any bed transform

G31 P{sensors.probes[0].value[0] + 4}
G29 S0 


