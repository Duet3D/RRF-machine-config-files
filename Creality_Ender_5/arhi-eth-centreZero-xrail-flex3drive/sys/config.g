; https://docs.duet3d.com/en/User_manual/Reference/Gcodes

; General preferences
G90                                              ; send absolute coordinates...
M83                                              ; ...but relative extruder moves
M550 P"ENDER5"                                   ; set printer name

; Network
M551 P""                                         ; set password
M552 P0.0.0.0 S1                                 ; enable network, use DHCP
M586 P0 S1                                       ; enable HTTP
M586 P1 S0                                       ; disable FTP
M586 P2 S0                                       ; disable Telnet

; Drives (TMC2660 - DUET2ETHERNET)
; cfg_drivers_dual.g for DUAL extruder

; SINGLE EXTRUDER
M569 P0 S0                                       ; physical drive 0 goes backwards
M569 P1 S0                                       ; physical drive 1 goes backwards
M569 P2 S0                                       ; physical drive 2 goes backwards
M569 P3 S1                                       ; physical drive 3 goes forward
M569 P4 S0                                       ; physical drive 4 goes backwards
M584 X0 Y1 Z2 E3                                 ; set drive mapping single extruder
M350 X16 Y16 Z16 E8 I1                           ; configure microstepping with interpolation
M906 X900 Y1000 Z1200 E1400 I30                  ; set motor currents (mA) and motor idle factor in %
M84 S30                                          ; Set idle timeout
M92 X80.00 Y80.00 Z1600.00 E1900                 ; set steps per mm (Z screw 2mm 1 start) ( E1841.37 ideal )
M566 X500.00 Y500.00 Z50.00 E6.00                ; set maximum instantaneous speed changes (mm/min) JERK 
M203 X60000.00 Y60000.00 Z1200.00 E2400.00        ; max speed (f3d say 2400 but it's too fast for E)
M201 X1000.00 Y1000.00 Z50.00 E120.00            ; max accel 


; Axis Limits
; // original ender5 M208 X0:220 Y0:220 Z0:300

; DUAL FLEX 
; M208 X-104:132 Y-135:85 Z-1:300

; FLEX + MELLOW
;M208 X-114:122 Y-111:114 Z-1:300

; FLEX + E3DV6
M208 X-111:125 Y-121:104 Z-1:300


; Endstops
M574 X2 S1 P"xstop"                              ; X min active high endstop switch
M574 Y2 S1 P"ystop"                              ; Y min active high endstop switch

; Heaters
M308 S0 P"bedtemp" Y"thermistor" T100000 B3950            ; define bed temperature sensor
M308 S1 P"e0temp"  Y"thermistor" T100000 B4725 C7.06e-8   ; define E0 temperature sensor - 104GT2 semitec
M308 S2 P"e1temp"  Y"thermistor" T100000 B3974            ; define E1 temperature sensor

M950 H0 C"bedheat" T0 Q100                       ; heater 0 uses the bed_heat pin, sensor 0
M950 H1 C"e0heat" T1                             ; heater 1 uses the e0_heat pin and sensor 1
M950 H2 C"e1heat" T2                             ; heater 1 uses the e0_heat pin and sensor 1

; Fans
M950 F0 C"fan0" 

; Tools / Extruders
M563 P0 D0 H1 F0 S"Extruder0"                    ; define tool 0
G10 P0 X0 Y0 Z0                                  ; set tool 0 axis offsets
G10 P0 R0 S0                                     ; set initial tool 0 active and standby temperatures to 0C
;M563 P1 D1 H2 F1 S"Extruder1"                    ; define tool 1
;G10 P1 X0 Y0 Z0                                  ; set tool 1 axis offsets
;G10 P1 R0 S0                                     ; set initial tool 1 active and standby temperatures to 0C

; Configure Z-Probe
;M98 P"cfg_andromeda.g"
;M98 P"cfg_bltouch.g"
M98 P"cfg_orion.g"

; call startup
M98 P"startup.g"

;Multiple names on a line are aliases for a single pin.
;An exclamation mark before the pin name means that there
;is inversion between the processor and the corresponding
;output, and that RRF3 will automatically allow for 
;this inversion.
;
;// Duet 2 and DueX heater outputs
;
;!bedheat
;!e0heat
;!e1heat
;exp.heater3, exp.8, !duex.e2heat, !duex.pwm1
;exp.heater4, exp.13, !duex.e3heat, !duex.pwm2
;exp.heater5, exp.18, !duex.e4heat, !duex.pwm3
;exp.heater6, exp.23, !duex.e5heat, !duex.pwm4
;exp.heater7, exp.31, !duex.e6heat, !duex.pwm5
;
;// Duet 2 and DueX temperature inputs
;bedtemp
;e0temp
;e1temp
;e2temp, duex.e2temp, exp.thermistor3, exp.35
;e3temp, duex.e3temp, exp.thermistor4, exp.36
;e4temp, duex.e4temp, exp.thermistor5, exp.37
;e5temp, duex.e5temp, exp.thermistor6, exp.38
;e6temp, duex.e6temp, exp.thermistor7, exp.39
;
;// Duet 2 and DueX fan outputs
;fan0
;fan1
;fan2
;duex.fan3
;duex.fan4
;duex.fan5
;duex.fan6
;duex.fan7
;duex.fan8
;
;// Endstop inputs
;xstop
;ystop
;zstop
;e0stop
;e1stop
;exp.e2stop, exp.4
;exp.e3stop, exp.9, duex.cs6
;exp.e4stop, exp.14, duex.cs7
;exp.e5stop, exp.19, duex.cs8
;exp.e6stop, exp.24
;duex.e2stop
;duex.e3stop
;duex.e4stop
;duex.e5stop
;duex.e6stop
;
;// Misc
;zprobe.in
;zprobe.mod
;duex.cs5
;connlcd.encb, connlcd.3
;connlcd.enca, connlcd.4
;connsd.encsw, connsd.7
;exp.pb6, exp.29, duex.pb6
;duex.gp1
;duex.gp2
;duex.gp3
;duex.gp4
;
;// SPI CS
;spi.cs1
;spi.cs2
;spi.cs3
;spi.cs4
;spi.cs5, duex.cs5, exp.50
;spi.cs6, duex.cs6, exp.9
;spi.cs7, duex.cs7, exp.14
;spi.cs8, duex.cs8, exp.19
;
;// Pins on additional SX1509B expander
;sx1509b.0
;sx1509b.1
;sx1509b.2
;sx1509b.3
;sx1509b.4
;sx1509b.5
;sx1509b.6
;sx1509b.7
;sx1509b.8
;sx1509b.9
;sx1509b.10
;sx1509b.11
;sx1509b.12
;sx1509b.13
;sx1509b.14
;sx1509b.15