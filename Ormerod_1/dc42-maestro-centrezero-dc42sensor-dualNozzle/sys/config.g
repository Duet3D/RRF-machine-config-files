; Ormerod 1 config file for dc42 Duet firmware
M111 S0						; Debug off
M550 POrmerod					; Set the machine's name
M551 Preprap					; Set the password
M552 S1
M555 P2						; Emulate Marlin USB output
M575 P1 B57600 S1				; Comms parameters for PanelDue
M912 S-14					; CPU temperature calibration

G21						; Work in mm
G90						; Absolute positioning
M83						; Extrusions relative
M569 P0 S1
M569 P1 S0
M569 P2 S0
M569 P3 S0
M569 P4 S0

M574 X1 S2					; use Z probe for X homing at low end
M574 Y2 Z0 S1					; set endstop configuration (Y endstop only, at high end, active high)
M201 X1000 Y1000 Z20 E1000			; set accelerations
;M593 F24
M593 F0						; disable dynamic acceleration
M203 X6000 Y6000 Z250 E3600			; set XYZ and extruder speeds
M566 X600 Y600 Z40 E300            		; Maximum instantaneous speed changes mm/minute
M208 X107 Y105 Z190				; set axis maxima
M208 X-113 Y-105 Z-1 S1				; set axis minima
M906 X1000 Y1000 Z800 E1000			; Motor currents (mA)

; Heaters
M305 P0 T10000 R2200				; set thermistor parameters
M305 P1 T100000 R2200				; set thermistor parameters
M305 P2 T100000 R2200				; set thermistor parameters

M307 H0 A99.6 C496.1 D12.4 B0			; heater 0 model, use PID
M307 H1 A542.8 C76.1 D5.1 S0.80 B0		; heater 1 model, use PID

; Tools
M563 P0 D0 H1 S"Nozzle 1"			; Define tool 0
G10 P0 X-11 Y0 Z0 S0 R0             		; Set tool 0 offset, operating and standby temperatures
M563 P1 D1 H2 S"Nozzle 2"			; Define tool 1
G10 P1 X11 Y0.4 Z0 S0 R0          		; Set tool 1 offset, operating and standby temperatures

M92 E420:420					; Set extruder steps/mm

; Fans
M106 P1 S1 H1:2 T45

; Z probe
M558 P1 H3 A4					; enable differential IR sensor
G31 P500 X-23 Y0 Z2.03				; set probe height, threshold and XY offsets

M671 X-109:-109:104 Y115:-105:5 S0.5		; 3 screws at Ormerod adjusting screw positions
M557 X-100:60 Y-80:80 S40			; grid for bed compensation

M556 S78 X0 Y0 Z0                  		; Put your axis compensation here
G1 F6000					; Set default feed rate

M572 D0:1 S0.1					; Pressure advance
M564 H0
M501
T0						; select the first head
