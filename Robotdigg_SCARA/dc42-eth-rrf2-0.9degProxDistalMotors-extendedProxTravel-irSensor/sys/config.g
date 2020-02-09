; Configuration file for Duet Ethernet in SCARA printer (firmware version 1.19)

; General preferences
M111 S0                             	; Debug off
M550 PRobotdigg SCARA	        	; Machine name
M551 Preprap                        	; Machine password
M552 S1					; Enable networking
M555 P2                             	; Set USB output to look like Marlin
M575 P1 B57600 S1                   	; Set aux port baud rate and require checksum, for PanelDue

; Drives
M569 P0 S0 ; Drive 0 goes backwards X
M569 P1 S1 ; Drive 1 goes forwards Y
M569 P2 S0 ; Drive 2 goes backwards Z
M569 P3 S0 ; Drive 3 goes backwards E

; Movement
M669 K4 P160 D159.5 A-130:22 B-27:157.5 C0:0:0 X165 Y-75 S100 ; set SCARA mode and parameters
M574 X2 Y2 Z1 S1			; Define active high homing switches
M92 X142.2222 Y200			; Steps/degree for proximal and distal joints
M92 Z1600 E106				; Steps/mm for Z and E

M208 S1 X-100 Y-220 Z-1 		; Axis minima
M208 X100 Y230 Z150			; Axis maxima

M350 X64 Y64 Z64 E16:16 I1 		; x16 microstepping with interpolation

M566 X500 Y500 Z100 E500		; XYZE jerk (mm/min)
M203 X5000 Y5000 Z600 E3600		; Maximum speeds (mm/min)
M201 X600 Y600 Z50 E2000		; Accelerations (mm/s^2)
M593 F12.5

M906 X1000 Y1000 Z1000 E1300 I30	; Motor currents (mA) and motor idle percent

; Heaters
M143 H1 S260				; Maximum heater temperature
M140 H-1				; No bed heater
M305 P1 T100000 B4138 C0 R4700		; Thermistor parameters for heater 1
M307 H1 A577.0 C199.0 D9.8 S1.00 B0

; Tools
M563 P0 D0 H1 
G10 P0 X0 Y0 Z0 ; Set tool 0 axis offsets
G10 P0 R00 S00 ; Set initial tool 0 active and standby temperatures to 0C

; Fans
M106 P1 S0 I0 F200 H1 T45		; Fan 1 frequency, thermostatic control

; Z probe
M558 P1 F600 T20000 R0.2
G31 P500 Z1.545
M557 X-75:75 Y-200:225 S25		; grid for G29 probing
;M557 X-80:80 Y-100:100 P2
M671 X-145:-200:-145 Y-100:75:250 P1.0	; adjusting screw positions, M6 screw = 1mm pitch

; Power fail not configured

; Pressure advance
M572 D0 S0.5

; Misc
M83
T0
