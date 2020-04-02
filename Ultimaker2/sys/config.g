; Configuration file for Duet WiFi (firmware version 3)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v2.1.8 on Sat Mar 07 2020 23:07:21 GMT+0100 (CET)

; General preferences
G90                                        ; send absolute coordinates...
M83                                        ; ...but relative extruder moves
M550 P"Duetmaker"                            ; set printer name

; Network
M552 S1                                    ; enable network
M586 P0 S1                                 ; enable HTTP
M586 P1 S0                                 ; disable FTP
M586 P2 S0                                 ; disable Telnet

; Drives
M569 P0 S1                                 ; physical drive 0 goes forwards
M569 P1 S1                                 ; physical drive 1 goes forwards
M569 P2 S1                                 ; physical drive 2 goes forwards
M569 P3 S1                                 ; physical drive 3 goes forwards
M584 X0 Y1 Z2 E3                           ; set drive mapping
M350 X16 Y16 Z16 E16 I1                    ; configure microstepping with interpolation
M92 X80.00 Y80.00 Z400.00 E415.00         ; set steps per mm
M566 X600.00 Y600.00 Z15.00 E250.00        ; set maximum instantaneous speed changes (mm/min)
M203 X18000.00 Y18000.00 Z2000.00 E9000.00 ; set maximum speeds (mm/min)
M201 X1000.00 Y1000.00 Z250.00 E1000.00       ; set accelerations (mm/s^2)
M906 X900 Y900 Z900 E650 I30               ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                    ; Set idle timeout

; Axis Limits
M208 X0 Y0 Z0 S1                           ; set axis minima
M208 X223 Y223 Z210.2 S0                     ; set axis maxima

; Endstops
M574 X1 S0 P"xstop"                        ; configure active-high endstop for low end on X via pin xstop
M574 Y2 S0 P"ystop"                        ; configure active-high endstop for high end on Y via pin ystop
M574 Z2 S0 P"zstop"                        ; configure active-high endstop for high end on Z via pin zstop

; Z-Probe
;M558 P0 H5 F120 T6000                      ; disable Z probe but set dive height, probe speed and travel speed
;M557 X15:215 Y15:195 S20
G31 Z-5.2                   ; define mesh grid

; Heaters
M143 H0 S120                               ; set temperature limit for heater 0 to 120C
M307 H0 B0 S1.00                           ; disable bang-bang mode for the bed heater and set PWM limit
M143 H1 S290                               ; set temperature limit for heater 1 to 290C
M307 H1 B0 S1.00                           ; disable bang-bang mode for heater  and set PWM limit
M305 P1 X200
M305 P0 X201
; Fans
M106 P0 S0 I0 F500 H-1         ; Set fan 0 - print cooling side fans -  value, PWM signal inversion and frequency. Thermostatic control is turned off
M106 P1 S255 I0 F500 H1 T50        ; Set fan 1 - heatsinkfan -value, PWM signal inversion and frequency. Thermostatic control is turned on
M106 P2 S255 I0 F500 H-1         ; Set fan 2 - case FANS - value, PWM signal inversion and frequency. Thermostatic control is turned off

; Tools
M563 P0 D0 H1 F0                           ; define tool 0
G10 P0 X Y Z0                            ; set tool 0 axis offsets
G10 P0 R0 S0                               ; set initial tool 0 active and standby temperatures to 0C

; Custom settings are not defined
M501

