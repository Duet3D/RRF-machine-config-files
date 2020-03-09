; Drives (TMC2660 - DUET2ETHERNET)
; DUAL EXTRUDER
M569 P0 S0                                       ; physical drive 0 goes backwards
M569 P1 S0                                       ; physical drive 1 goes backwards
M569 P2 S0                                       ; physical drive 2 goes backwards
M569 P3 S1                                       ; physical drive 3 goes forward
M569 P4 S0                                       ; physical drive 4 goes backwards
M584 X0 Y1 Z2 E3:4                               ; set drive mapping dual extruder
M350 X16 Y16 Z16 E8:8 I1                         ; configure microstepping with interpolation dual extruder
M906 X1000 Y1000 Z1200 E1000:1000 I30            ; set motor currents (mA) and motor idle factor in per cent DUAL extruder
M84 S30                                          ; Set idle timeout
M92 X80.00 Y80.00 Z1600.00 E1900:1900            ; set steps per mm (Z screw 2mm 1 start) DUAL extruder
M566 X900.00 Y900.00 Z50.00 E6.00:6.00           ; set maximum instantaneous speed changes (mm/min) JERK DUAL extruder
M203 X60000.00 Y60000.00 Z600.00 E1200.00:1200.00 ; max speed (f3d say 2400 but it's too fast for E) DUAL EXTRUDER
M201 X3000.00 Y3000.00 Z60.00 E120.00:120.00     ; max accel  DUAL EXTRUDER

