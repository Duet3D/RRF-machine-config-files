; HOME Z WITH ORION

T0
G90
G0 X0Y0 F3000           ; go to center of the bed, complain if X or Y not homed
G91                     ; relative positioning
G0 Z5   F900  H2        ; drop bed for 5mm
G90                     ; absolute positioning
G4S3                    ; wait 3sec

G31 P{sensors.probes[0].value[0] + 8}

G30                     ; Probe the bed at the current XY position. 
                        ; When the probe is triggered, set the Z coordinate 
						; to the probe trigger height.
