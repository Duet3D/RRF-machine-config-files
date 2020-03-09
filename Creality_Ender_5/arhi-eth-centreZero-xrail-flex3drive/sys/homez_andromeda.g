; HOME Z WITH ANDROMEDA
T0
G91                     ; relative positioning
G0 Z5   F900  H2        ; drop bed for 5mm
G90                     ; absolute positioning
G0 X0Y0 F3000           ; go to center of the bed, complain if X or Y not homed
G4S3                    ; wait 3sec for andromeda to stabilize
G30                     
G90                     ; absolute positioning
