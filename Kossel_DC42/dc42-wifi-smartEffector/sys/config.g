; Configuration file for dc42 Kossel

; Communication and general
M111 S0                             	; Debug off
M550 PKossel		        	; Machine name (can be anything you like)
M551 Pgbnjr                       	; Machine password (used for FTP)
M552 S1
M555 P2                             	; Set output to look like Marlin
M575 P1 B57600 S1                   	; Set auxiliary serial port baud rate and require checksum (for PanelDue)
M586 P2 S1				; enable Telnet

; Axis and motor configuration
M569 P0 S0 F5				; Drive 0 goes forwards
M569 P1 S0 F5				; Drive 1 goes forwards
M569 P2 S0 F5				; Drive 2 goes forwards
M569 P3 S1				; Drive 3 goes backwards

M584 E3:4

M574 X2 S1 P"xstop"
M574 Y2 S1 P"ystop"
M574 Z2 S1 P"zstop"			; set endstop configuration (all endstops at high end, active high)

M665 L361.676:361.676:361.676 R180.679 H470.070 B150.0 X-0.105 Y0.161 Z0.000
M666 X-0.748 Y-0.006 Z0.755 A0.11 B-0.08
M92 X200 Y200 Z200			; Set axis steps/mm
M906 X1100 Y1100 Z1100 E800		; Set motor currents (mA)
M201 X3000 Y3000 Z3000 E1000		; Accelerations (mm/s^2)
M203 X15000 Y15000 Z15000 E3600		; Maximum speeds (mm/min)
;M593 F44.4
M593 F0					; disable dynamic acceleration
M566 X600 Y600 Z600 E600		; Maximum instant speed changes
G21                                 	; Work in millimetres
G90                                 	; Send absolute coordinates...
M83                                 	; ...but relative extruder moves

; Thermistors and heaters
; RRF 2
M305 P0 T100000 B3950 R4700
M305 P1 X200				; Use RTD to monitor Heater 1 temperature
; RRF 3
M308 S0 Y"thermistor" P"bedtemp" T100000 B3950
M308 S1 Y"rtd-max31865" P"spi.cs1"
M950 H0 C"bedheat" Q10 T0
M950 H1 C"e0heat" T1
M308 S10 y"mcutemp" a"Mcu"
M308 S11 y"drivers" a"Drivers"
 
; Heating models
M307 H0 A232.3 C1182.1, D2.4 B0		; heater 0 model, use PID
M307 H1 A337.1 C137.6, D5.1 B0		; heater 1 model, use PID

; Fans
M950 F0 C"fan0"
M950 F1 C"fan1"
M950 F2 C"fan2"
M106 P1 H1 T45 S1			; hot end fan
;M106 P2 H100:101 T45:55 L0.3		; electronics cooling fan RRF2
M106 P2 H10:11 T45:55 L0.3		; electronics cooling fan RRF3

; Enable logging after setting the heater models to avoid logging the usual warnings of overpowered heaters
M929 S1 P"eventlog.txt"

; Tool definitions
M563 P0 D0 H1                       	; Define tool 0
G10 P0 S0 R0                        	; Set tool 0 operating and standby temperatures
M563 P1 D1 H2
G10 P1 S0 R0                        	; Set tool 1 operating and standby temperatures

M92 E418.5                		; Set extruder steps per mm

; Z probe and compensation definition
M558 P8 C"zprobe.in+zprobe.mod" H3 F1000 T12000 R0.2 S0.02 A5	; Z probe is delta effector, Z probe dive height 3mm, probing speed 1000mm/min, travel speed 12000mm/min, max 5 taps, tolerance 0.02mm
;M558 P8 H4 F1000 T10000 R0.4 S0.02 A1	; Z probe is delta effector, Z probe dive height 3mm, probing speed 1000mm/min, travel speed 12000mm/min, max 5 taps, tolerance 0.02mm
G31 X0 Y0 Z-0.10 P100			; Set the zprobe offsets and threshold (put your own values here)
M557 R140 P11				; Define grid

;*** If you are using axis compensation, put the figures in the following command
M556 S78 X0 Y0 Z0                   	; Axis compensation here

M912 P0 S-19				; CPU temperature correction
M911 S20 R22 P"G91 G1 Z2 F10000 M83 G1 E-5 F3600"	; power fail settings

; Filament
M207 S5 R0 F3600 Z0.2			; firmware retraction parameters
M572 D0 S0.2				; pressure advance
M591 D0 P5 C3 S-1.0 R30			; Duet3D laser filament sensor (RRF2)
;M591 D0 P5 C"e0stop" S-1.0 R30		; Duet3D laser filament sensor (RRF3)
M592 D0 A0.015 B0.0012 L0.2		; nonlinear extrusion

M915 X Y Z H400 S3 R1			; set stall detection parameters

;M501					; run config-override.g

;T0					; select first print head
