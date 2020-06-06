; homeall.g
; called to home all axes

while iterations < 4
  if iterations < #sensors.gpIn && sensors.gpIn[iterations] != null && sensors.gpIn[iterations].value = 0
    M291 S1 T5 P{"Please return tool "^iterations^" to dock before homing"} R"Cannot home"
    abort

M98 Phomec.g			; Home C (ToolHead)
M98 Phomey.g			; Home Y
M98 Phomex.g			; Home X
M98 Phomez.g			; Home Z

G1 X0 Y-148 F15000		; Park