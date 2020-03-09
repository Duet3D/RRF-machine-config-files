; Duet 12864 Menu Files
;
; This is a set of menu files for running a 12864 display with a duet3D control board.
;
; Written by Jadon Miller - 2/27/2019
; Partially adapted from the work of tinkerlifeprojects on Github.
;
; File "bedLevel.g"
;
; This script is run from the menu system to run the auto leveling routine.
; By default, it first homes all the axis then uses M32 to run the bed.g file.



G28                                                ; Home all
G32                                                ; Run the bed.g file.