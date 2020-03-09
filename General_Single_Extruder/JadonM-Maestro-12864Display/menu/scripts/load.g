; Duet 12864 Menu Files
;
; This is a set of menu files for running a 12864 display with a duet3D control board.
;
; Written by Jadon Miller - 2/27/2019
; Partially adapted from the work of tinkerlifeprojects on Github.
;
; File "load.g"
;
; This script is run from the menu system and loads the filament.
; The default script is written for a direct drive Bondtech BMG extruder,
; but feel free to modify it for your own needs.



M83                                                ; relative extruder coordinates
G1 E75 F1200                                       ; load filament fast
G1 E50 F300                                        ; load filament slow