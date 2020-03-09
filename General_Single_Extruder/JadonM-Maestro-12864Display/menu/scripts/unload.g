; Duet 12864 Menu Files
;
; This is a set of menu files for running a 12864 display with a duet3D control board.
;
; Written by Jadon Miller - 2/27/2019
; Partially adapted from the work of tinkerlifeprojects on Github.
;
; File "unload.g"
;
; This script is run from the menu system and unloads the filament.
; The default script is written for a direct drive Bondtech BMG extruder,
; but feel free to modify it for your own needs.



M83                                                ; relative extruder coordinates
G1 E15 F300                                        ; feed filament
G1 E-100 F1200                                     ; unload filament