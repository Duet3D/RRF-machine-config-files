; Auto calibration routine for large delta printer
M561                    ; clear any bed transform

; If the printer hasn't been homed, home it
if !move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed
  G28

; Probe the bed and do auto calibration
G1 X0 Y140 Z10 F10000        ; go to just above the first probe point
while true
  if iterations = 5
    abort "too many auto calibration attempts"
  G30 P0 X0.00 Y140.00 Z-99999
  if result != 0
    continue
  G30 P1 X70.00 Y121.24 Z-99999
  if result != 0
    continue
  G30 P2 X121.24 Y70.00 Z-99999
  if result != 0
    continue
  G30 P3 X140.00 Y0.00 Z-99999
  if result != 0
    continue
  G30 P4 X121.24 Y-70.00 Z-99999
  if result != 0
    continue
  G30 P5 X70.00 Y-121.24 Z-99999
  if result != 0
    continue
  G30 P6 X0.00 Y-134.85 Z-99999
  if result != 0
    continue
  G30 P7 X-65.57 Y-113.57 Z-99999
  if result != 0
    continue
  G30 P8 X-112.29 Y-64.83 Z-99999
  if result != 0
    continue
  G30 P9 X-130.59 Y-0.00 Z-99999
  if result != 0
    continue
  G30 P10 X-115.90 Y66.91 Z-99999
  if result != 0
    continue
  G30 P11 X-69.45 Y120.29 Z-99999
  if result != 0
    continue
  G30 P12 X0.00 Y70.00 Z-99999
  if result != 0
    continue
  G30 P13 X60.62 Y-35.00 Z-99999
  if result != 0
    continue
  G30 P14 X-52.28 Y-30.19 Z-99999
  if result != 0
    continue
  G30 P15 X0 Y0 Z-99999 S8
  if result != 0
    continue

  if move.calibration.final.deviation <= 0.03
    break
  echo "Repeating calibration because deviation is too high (" ^ move.calibration.final.deviation ^ "mm)"
; end loop
echo "Auto calibration successful, deviation", move.calibration.final.deviation ^ "mm"
G1 X0 Y0 Z150 F10000                ; get the head out of the way