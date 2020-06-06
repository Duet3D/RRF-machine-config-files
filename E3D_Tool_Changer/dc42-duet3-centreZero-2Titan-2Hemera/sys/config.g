; Configuration file for Duet WiFi / Ethernet running RRF3 on E3D Tool Changer
; executed by the firmware on start-up

; General preferences
M111 S0 						; Debugging off
G21 							; Work in millimetres
G90 							; Send absolute coordinates...
M83 							; ...but relative extruder moves
M555 P2 						; Set firmware compatibility to look like Marlin
M575 P1 B57600 S1

M918 P1 E4 F2000000                                ; configure direct-connect display

; Network
M550 P"ToolChanger" 			; Set machine name
M552 P192.168.1.153 S1			; Enable Networking
M586 P0 S1 						; Enable HTTP
M586 P1 S0 						; Disable FTP
M586 P2 S0 						; Disable Telnet

M667 S1 						; Select CoreXY mode	

; Drive direction
M569 P0 S1 						; Drive 0 Z
M569 P1 S0 						; Drive 1 Y
M569 P2 S0 						; Drive 2 X
M569 P3 S0 						; Drive 3 E0
M569 P4 S0 						; Drive 4 E1
M569 P5 S0 						; Drive 5 COUPLER
M569 P22.0 S0 D2				; Drive 22.0 (E2) spreadCycle mode
M569 P23.0 S0 D2 				; Drive 23.0 (E3) spreadCycle mode

M584 X2 Y1 Z0 C5				; Axis to driver mapping
M584 E3:4:22.0:23.0				; set extruder drivers

M208 X-185:178.5 Y-149:49 Z0:300 C0:500					; Set axis maxima & minima
M92 X100 Y100 Z1600 C200 E834:834:409:409				; Set steps per mm assuming x16 microstepping
M350 E16:16:16:16 I1 									; Configure microstepping with interpolation
M350 C16 I1
M350 X16 Y16 Z16 I1										; Configure microstepping with interpolation
M566 X400 Y400 Z8 C2 E200:200:200:200					; Set maximum instantaneous speed changes (mm/min)
M203 X35000 Y35000 Z1200 C10000 E5000:5000:5000:5000	; Set maximum speeds (mm/min)
M201 X6000 Y6000 Z400 C500 E2500:2500:2500:2500			; Set accelerations (mm/s^2)
M906 X2000 Y2000 Z1330 C500 E1400:1400:1000:1000 I30	; Set motor currents (mA) and motor idle factor in percent
M84 S120 												; Set idle timeout

; Endstops
M574 X1 Y1 S3 							; Set X / Y endstop stall detection
M574 Z0 								; No Z endstop
M574 C1 S3								; Stall detect coupler at low end of its range

; Z probe
M558 P8 C"io3.in" H3 F360 I0 T20000 	; Set Z probe type to switch, the axes for which it is used and the dive height + speeds
G31 P200 X0 Y0 Z0	 					; Set Z probe trigger value, offset and trigger height
M557 X-140:140 Y-80:80 S40 				; Define mesh grid

;Stall Detection
M915 C S6 F0 H200 R0					; Coupler

;Stall Detection
M915 P1:2 S1 F0 H280 R0					; X / Y Axes

; Heaters and temperature sensors
; Bed heater
M308 S0 P"temp0" Y"thermistor" T100000 B4138 C0 	; Set thermistor 
M950 H0 C"out0" T0						; Bed heater
M143 H0 S225 							; Set temperature limit for heater 0 to 225C
M307 H0 A590.6 C474.5 D4.4 				; Heater 0 tuning results
M140 H0									; Bed heater is heater 0

; Tool 0 heater
M308 S1 P"temp1" Y"thermistor" A"T0" T100000 B4725 C7.06e-8 	; Set thermistor
M950 H1 C"out1" T1						; Extruder 0 heater
M143 H1 S300 							; Set temperature limit for heater 1 to 300C

; Tool 1 heater
M308 S2 P"temp2" Y"thermistor" A"T1" T100000 B4725 C7.06e-8 	; Set thermistor
M950 H2 C"out2" T2						; Extruder 0 heater
M143 H2 S300 							; Set temperature limit for heater 2 to 300C

; Tool 2 heater
M308 S3 P"22.temp0" Y"thermistor" T100000 B4725 C7.06e-8
M950 H3 C"22.out0" T3
M143 H3 S300 							; Set temperature limit for heater 3 to 300C

; Tool 3 heater
M308 S4 P"23.temp0" Y"thermistor" T100000 B4725 C7.06e-8
M950 H4 C"23.out0" T4
M143 H4 S300 							; Set temperature limit for heater 4 to 300C
M307 H4 A452 C235 D5.5 V24.0			; Heater 4 tuning results

; Fans
M950 F1 C"out4"							; T0 HE
M950 F2 C"out5"							; T0 PCF
M950 F3 C"out7"							; T1 HE
M950 F4 C"out8"							; T1 PCF

M950 F5 C"22.out2+out2.tach" 			; Tool 2 hot end fan with tacho
M950 F6 C"22.out1" 						; Tool 2 print cooling fan, no tacho

M950 F7 C"23.out2+out2.tach" 			; Tool 3 hot end fan with tacho
M950 F8 C"23.out1" 						; Tool 3 print cooling fan, no tacho

M106 P1 S255 H1 T50						; T0 HE
M106 P2 S0								; T0 PCF
M106 P3 S255 H2 T50 					; T1 HE
M106 P4 S0								; T1 PCF 
M106 P5 S255 H3 T50 					; Tool 2 hot end
M106 P6 S0 								; Tool 2 PCF
M106 P7 S255 H4 T50 					; Tool 3 hot end
M106 P8 S0 								; Tool 3 PCF

; Tools
M563 P0 S"T0" D0 H1 F2 					; Define tool 0
G10 P0 X-9 Y39 Z-5						; Set offset
G10 P0 R0 S0 							; Reset initial tool 0 active and standby temperatures to 0C

M563 P1 S"T1" D1 H2 F4 					; Define tool 1
G10 P1 X-9 Y39 Z-5					`	; Set offset
G10 P1 R0 S0 							; Reset initial tool 1 active and standby temperatures to 0C

M563 P2 S"T2" D2 H3 F6 					; Define tool 2
G10 P2 X23 Y41 Z-5.4  					; Set tool 2 axis offsets
G10 P2 R0 S0 							; Reset initial tool 2 active and standby temperatures to 0C

M563 P3 S"T3" D3 H4 F8 					; Define tool 3 (uses extruder 2 until we have tool 2)
G10 P3 X23 Y41 Z-5.4 					; Set tool 3 axis offsets
G10 P3 R0 S0 							; Reset initial tool 3 active and standby temperatures to 0C

M593 F50								; cancel ringing at 50Hz (https://forum.e3d-online.com/threads/accelerometer-and-resonance-measurements-of-the-motion-system.3445/)
M376 H15								; bed compensation taper

; Bowden tubes are ~700mm long so PA on the Bowden tools almost certainly needs to be increased
M572 D0 S0.2 							; pressure advance T0
M572 D1 S0.2 							; pressure advance T1
M572 D2 S0.05 							; pressure advance T2
M572 D3 S0.05 							; pressure advance T3

; Define the bed mounting coordinates for the manual bed levelling assistant
M671 X-140:-140:280:260 Y-90:190:190:-90 S7.5  ; Front left, Rear Left, Right  S7.5 is the max correction

; Set up the dock indicator switches on the Hemera tools. These are wired NO so invert the pin.
M950 J2 C"22.!^io0.in"					; GpIn 2 = tool 2 dock switch
M950 J3 C"23.!^io0.in"					; GpIn 2 = tool 2 dock switch
