;General Setup - RailCore RRF on a SBC for Duet3
G21						;Work in millimetres
G90						;Send absolute coordinates...
M83						;...but relative extruder moves

; Stepper configuration
M569 P0 S1 D3					;Drive 0 X / Rear
M569 P1 S1 D3					;Drive 1 Y / Front
M569 P2 S0 D3					;Drive 2 Z Front Left
M569 P3 S0 D3					;Drive 3 Z Rear Left
M569 P4 S0 D3					;Drive 4 Z Right
M569 P5 S1 D3					;Drive 5 Extruder

;Axis configuration
M669 K1						;corexy mode
M584 X0 Y1 Z2:3:4 E5				; Map X to drive 0 Y to drive 1, Z to drives 2, 3, 4, and E to drive 5

;Leadscrew locations
M671 X-10:-10:333  Y22.5:277.5:150 S7.5

M350 X16 Y16 Z16 E16 I1				;set 16x microstepping for axes with interpolation
M906 X1400 Y1400 Z1200 E800 I80			;Set motor currents (mA)
M201 X2500 Y2500 Z100 E1500			;Accelerations (mm/s^2)
M203 X24000 Y24000 Z900 E3600			;Maximum speeds (mm/min) 
M566 X800 Y800 Z100 E1500			;Maximum jerk speeds mm/minute 
M208 X290 Y290 Z280				;set axis maxima and high homing switch positions (adjust to suit your machine)
M208 X0 Y0 Z0 S1				;set axis minima and low homing switch positions (adjust to make X=0 and Y=0 the edges of the bed)
M92 X200 Y200 Z1600 E837			;steps/mm
 
; End Stops
M574 X1 S1 P"io1.in"				;Map the X endstop to io1.in
M574 Y1 S1 P"io2.in"				;May the Y endstop to io2.in
 
; Thermistors
M308 S0 P"temp0" Y"thermistor" A"bed_heat" T100000 B4240 H0 L0 		;Bed thermistor - connected to temp0
M308 S1 P"temp1" Y"thermistor" A"e0_heat" T100000 B4725 C7.06e-8 H0 L0	;duet3 e3d thermistor - connected to e0_heat

;Define Heaters
M950 H0 C"out0" T0				;Bed heater is on out0
M950 H1 C"out1" T1				;Hotend heater is on out1

;Define Bed
M140 H0

M307 H0 A90.0 C700.0 D10.0 S1.00 B1 		;Keenovo duet 3 configuration
M307 H1 A310.1 C144.7 D2.6 S1.00 B0 		;E3D Hotend  duet 3 configuration

M570 S360					;Hot end may be a little slow to heat up so allow it 180 seconds
M143 S285					;Set max hotend temperature			

; Fans
M950 F0 C"out5"					;Hotend fan on "out5" connector
M106 P0 S255 H1 T50 			;enable thermostatic mode for hotend fan
M950 F1 C"out4"					;Layer fan on "out4" connector
M106 P1 S0 						;Layer Fan

; Tool definitions
M563 P0 D0 H1 F1                       		;Define tool 0
G10 P0 S0 R0                        		;Set tool 0 operating and standby temperatures

;BLTouch
M558 P9 C"io7.in" H5 R1 F120 T6000 A5 S0.02 B1	;define the bltouch input on io7.in
M950 S0 C"io7.out"				;define the bltouch servo on io7.out
G31 X2 Y42 Z2.00 P25 			;set the offsets for the bltouch

T0						;select first hot end