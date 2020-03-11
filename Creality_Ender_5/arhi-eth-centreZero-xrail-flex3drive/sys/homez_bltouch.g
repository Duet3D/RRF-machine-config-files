; HOME Z WITH BLTOUCH
G91               ; relative positioning
G0 Z5   F900 H2   ; drop bed for 5mm
G90               ; absolute positioning
G0 X0Y0 F3000     ; go to center of the bed, complain if X or Y not homed
M401              ; deploy probe
G30               
M402              ; retract probe
G90               ; absolute positioning
