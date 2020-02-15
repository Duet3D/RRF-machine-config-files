G0     X152.5 Y40 H1 F10000
G30 P0 X152.5 Y40 Z-99999       ; probe near back leadscrew
G0     X275   Y260 H1 F10000
G30 P1 X275   Y260 Z-99999      ; probe near front left leadscrew
G0     X25    Y315 H1 F10000
G30 P2 X25    Y315 Z-99999 S3   ; probe near front right leadscrew and calibrate 3 motors
G1     X0     Y0 F10000