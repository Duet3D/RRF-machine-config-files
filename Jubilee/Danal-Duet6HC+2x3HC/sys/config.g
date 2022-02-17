; Jubilee CoreXY ToolChanging Printer - Config File
; This file intended for Duet 3 hardware, main board plus two expansion boards (or, later, four tool boards)
; As of 10/14/2019 INCOMPLETE AND ONLY PARTIALLY TESTED.  See the discord for more info. 

; Name and Identification
; Printer name is now set on the R Pi. 

; Networking
;;;M552 P192.168.1.2 S1                    ; Use Ethernet with a static IP
;;;M553 P255.255.255.0                     ; Netmask
;;;M554 192.168.1.3                        ; Gateway
M586 P1 S1                              ; Enable FTP
M586 P2 S1                              ; Enable Telnet

; Debugging
M111 S0                                 ; Debug off
M929 P"eventlog.txt" S1                 ; Start logging to file eventlog.txt

; General Preferences
M555 P2                                 ; Set Marlin-style output
G21                                     ; Set dimensions to millimetres
G90                                     ; Send absolute coordinates...
M83                                     ; ...but relative extruder moves

; Axis to driver mapping
M584 X0 Y1 U2 Z3:4:5        ; X and Y for CoreXY.  U for toolchanger lock. Z has three drivers for kinematic bed suspension. 
M584 E1.0:1.1:2.0:2.1       ; Extruders for four tools. 

M569 P0 S0                  ; Drive 0 direction | X stepper
M569 P1 S0                  ; Drive 1 direction | Y Stepper
M569 P2 S0                  ; Drive 2 direction | U Tool Changer Lock
M569 P3 S0                  ; Drive 3 direction | Front Left Z
M569 P4 S0                  ; Drive 4 direction | Front Right Z
M569 P5 S0                  ; Drive 5 direction | Back Z
; End of main board drivers.  Expansion boards have three each.
; Expansion 0
M569 P6 S0                  ; Drive 6 direction | Extruder T0
M569 P7 S0                  ; Drive 7 direction | Extruder T1
; Expansion 1
M569 P8 S0                  ; Drive 8 direction | Extruder T2
M569 P9 S0                  ; Drive 9 direction | Extruder T3

; Kinematics
M669 K1                                 ; CoreXY mode

; Leadscrew locations (really, kinematic coupling locations) extracted from CAD model assuming back right build plate corner is (0, 0)
M671 X300:5:152.5 Y316:316:-14 S10 ; Front Left: (300, 316) | Front Right: (5, 316) | Back: (-14, 152.5)

; Axis and motor configuration
M350 X16 Y16 I1                   ; Set 16x microstepping for axes. Use interpolation.
M350 U4 I1                        ; Set 4x for toolchanger lock. Use interpolation.
M350 Z16 I1                       ; Set 16x microstepping for axes. Use interpolation.
M350 E16 I1

M906 X2500 Y2500 Z1000 E1250 I30        ; Motor currents (mA) and Idle percentage
M906 U900 I60                           ; Motor currents (mA) and Idle percentage
M201 X600 Y600 Z10 E1000 U1000          ; Accelerations (mm/s^2)
M203 X25000 Y25000 Z400 E4000 U10000    ; Maximum speeds (mm/min)
M566 X700 Y700 Z2 E3000 U200          ; Maximum jerk speeds mm/minute

;M92 X200 Y200                           ; Steps/mm for X,Y with 16 tooth pulleys (preferred). 
M92 X160 Y160                           ; Steps/mm for X,Y with 20 tooth pulleys. 
M92 Z3200                               ; Steps/mm for Z - TR8*4 / 0.9 deg stepper
M92 U11.429                             ; Steps/mm for tool lock geared motor. 
M92 E837                                ; Extruder - 0.9 deg/step

; Endstops and probes

M574 X1 S1 P"io1.in"                    ; Set homing switch configuration X1 = low-end, S1 = active-high (NC)
M574 Y1 S1 P"io2.in"                    ; Set homing switch configuration Y1 = low-end, S1 = active-high (NC)
M574 U1 S1 P"io3.in"                    ; Set homing switch configuration U1 = low-end, S1 = active-high (NC)
;M574 Z1 S1 P"!io4.in"                   ; Set homing switch configuration Z1 = low-end,  S1 = active-high (NC).  This is used for tool probing, not actual Z height.

M558 K0 P5 C"io4.in" H5 A5 T6000 S0.02   ; Z probe - Set the height of the bed when homing G28.  Combined with content of bed.g as invoked by G32, levels bed. Also used for Mesh. 
                                           ; P5 = Switch, NC
                                           ; C  = Input Connector
					   ; Hn = dive height
					   ;   A bigger dive height prevents a situation where the bed is out of alignment by more than the dive height
					   ;   on any corner, which can crash the hot-end into the bed while moving the head in XY.
					   ;   Probing speed and travel speed are similarly reduced in case the Z probe isn't connected properly (or
					   ;   disconnects later after moving to a point) giving the user more time to stop.
                                           ; An = Number of times to probe each point. 
                                           ; Tnnn = Travel speed between probe points. 
                                           ; Snnn = Tolerance when probing multiple times. Two readings inside this window and we move on. 
;M558 K1 P5 C"!io4.in"                   ; create probe #1 for use with M585, active low


; Set axis software limits and min/max switch-triggering positions. Adjust such that (0,0) lies at the lower left corner of the build plate.
M208 X-5:305 Y-10:365 Z-0.5:220
M208 U0:180

; Temperature sensors
M308 S0 P"0.temp0" Y"thermistor" T100000 B3950 A"Bed" 
M308 S1 P"1.temp0" Y"thermistor" T100000 B3950 A"HE1"
M308 S2 P"1.temp1" Y"thermistor" T100000 B3950 A"HE2"
M308 S3 P"2.temp0" Y"thermistor" T100000 B3950 A"HE3"
M308 S4 P"2.temp1" Y"thermistor" T100000 B3950 A"HE4"

; Heaters
M950 H0 C"0.out0" T0           ; Bed.  H = Heater 0, C is output for heater itself, T = Temperature sensor (defined above)
M950 H1 C"1.out0" T1           ; Heater for extruder out tool 0
M950 H2 C"1.out1" T2           ; Heater for extruder out tool 1
M950 H3 C"2.out0" T3           ; Heater for extruder out tool 2
M950 H4 C"2.out1" T4           ; Heater for extruder out tool 3

; Further setup for bed
M143 H0 S130                                           ; set temperature limit for heater 0 to 130C
M307 H0 B0 S1.00                                       ; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                                ; map heated bed to heater 0

; Default heater model
;;;;M307 H0 A270.7 C90.4 D6.7 B0 S1.0          ; Default Bed Heater Parameters, before tuning / if config-override.g is missing
; Calibration 28 Oct 2019
;Heater 0 model: gain 139.6, time constant 252.2, dead time 0.7, max PWM 1.00, calibration voltage 24.5, mode PID
;Computed PID parameters for setpoint change: P468.8, I35.594,  D225.7
;Computed PID parameters for     load change: P468.8, I136.631, D225.7
M307 H0 A140 C252 D0.7 S1.0 V24.5 B0       ; Tuned Bed Heater Paramaters, same as report above, also B0 to turn off bang-bang

; Fans for hot end cooling
M950 F1 C"1.out6"
M106 P1 S255 H1 T45    ; S = Speed of fan Px, Hxx = heater for thermo mode, T = temps for thermo mode.
M950 F2 C"1.out7"
M106 P2 S255 H2 T45    ; S = Speed of fan Px, Hxx = heater for thermo mode, T = temps for thermo mode.
M950 F3 C"2.out6"
M106 P3 S255 H3 T45    ; S = Speed of fan Px, Hxx = heater for thermo mode, T = temps for thermo mode.
M950 F4 C"2.out7"
M106 P4 S255 H4 T45    ; S = Speed of fan Px, Hxx = heater for thermo mode, T = temps for thermo mode.

; Fans for print cooling
M950 F5 C"1.out3" 
M106 P5 C"PrintCool5"
M950 F6 C"1.out4" 
M106 P6 C"PrintCool6"
M950 F7 C"2.out3" 
M106 P7 C"PrintCool7"
M950 F8 C"2.out4" 
M106 P8 C"PrintCool8"

; Tool definitions
M563 P0 S"Tool 0" D0 H1 F5      ; Px = Tool number, Dx = Drive Number (start at 0, after movement drives), H1 = Heater Number, Fx = Fan number print cooling fan
G10  P0 S210 R160               ; Set tool 0 operating and standby temperatures(-273 = "off")
M572 D0 S0.1  		            ; Set pressure advance on 

M563 P1 S"Tool 1" D1 H2 F6      ; Px = Tool number, Dx = Drive Number (start at 0, after movement drives), H1 = Heater Number, Fx = Fan number print cooling fan
G10  P1 S210 R160               ; Set tool 1 operating and standby temperatures(-273 = "off")
M572 D1 S0.1		            ; Set pressure advance on 

M563 P2 S"Tool 2" D2 H3 F7      ; Px = Tool number, Dx = Drive Number (start at 0, after movement drives), H1 = Heater Number, Fx = Fan number print cooling fan
G10  P2 S210 R160               ; Set tool 1 operating and standby temperatures(-273 = "off")
M572 D2 S0.1		            ; Set pressure advance on

M563 P3 S"Tool 3" D3 H4 F8      ; Px = Tool number, Dx = Drive Number (start at 0, after movement drives), H1 = Heater Number, Fx = Fan number print cooling fan
G10  P3 S210 R160               ; Set tool 1 operating and standby temperatures(-273 = "off")
M572 D3 S0.1		            ; Set pressure advance on 

M98  P"/sys/Toffsets.g"                  ; Set tool offsets from the bed. In separate file so test macro can invoke. 



;M98 P"config-user.g"    ; Load custom user config if one exists.

;M501                    ; Load saved parameters from non-volatile memory

;G29 S1

; Note: you will need to tune the bed heater, and both extruder cartridges before printing.
; See the following link for more details. https://docs.duet3d.com/en/User_manual/Connecting_hardware/Heaters_tuning

