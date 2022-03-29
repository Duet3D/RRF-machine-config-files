; bed.g
; called to perform automatic bed compensation via G32

G28 ; home
G30 P0 X10 Y10 Z-99999 ; probe near a leadscrew
G30 P1 X10 Y290 Z-99999 ; probe near a leadscrew
G30 P2 X290 Y290 Z-99999 ; probe near a leadscrew 
G30 P3 X290 Y10 Z-99999 S4 ; probe near a leadscrew and calibrate 3 motors
