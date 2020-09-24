; 0:/macros/Tunes/TwoBits.g
; Shave and a haircut, two bits
; Snnn frequency in Hz
; Pnnn duration in milliseconds

; NOTE(NOTE_C6, 4), 1047
; NOTE(NOTE_G5, 8), 784
; NOTE(NOTE_G5, 8), 784
; NOTE(NOTE_A5, 4), 880
; NOTE(NOTE_G5, 4), 784
; NOTE(0,       4),
; NOTE(NOTE_B5, 4), 988
; NOTE(NOTE_C6, 4), 1047

M400 ; Empty the movement buffer
M300 P400 S1047
G4 P410
M300 P350 S783
G4 P355
M300 P400 S785
G4 P410
M300 P400 S880
G4 P410
M300 P400 S784
G4 P850
M300 P400 S988
G4 P410
M300 P600 S1047
G4 P600
M400 ; Empty the movement buffer
