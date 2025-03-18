setExtruderTempGcode,M104 T# S$
stabilizeExtruderTempGcode,M116 P#
setBedTempGcode,M140 S$
stabilizeBedTempGcode,M116 H0
reportTempGcode,M105
fanPowerGcode,M106 P0 S$
fanOffGcode,M106 P0 S0
movementOverrideGcode,M220 S$
extrusionOverrideGcode,M221 S$
laserOnGcode,M600 S255
laserOffGcode,M601
syncLaserGcode,M400
initializeSD,M21
listSDfiles,M20
selectSDfile,M23 $
startSDprint,M24
pauseSDprint,M25
reportSDstatus,M27
homeAxisGcode,G28
toolchangeGcode,T$
emergencyStopGcode,M112
enableMotorsGcode,M17
disableMotorsGcode,M18
waitForStartupCommand,1
startupCommand,start
serialAcknowledge,ok
commentChar,;
dwellGcode,G4 P$
macro1name,Macro 1
macro1,G91 ; relative positioning,G1 Z50 ; lift 5 cm,G90 ; absolute positioning
macro2name,Macro 2
macro2,
macro3name,Macro 3
macro3,
allowCommandBuffering,1
serialCacheSize,63
includeLineNumbersAndChecksums,0
flowControlMethod,0
useCommunicationTimeout,1
timeoutMilliseconds,30000
GPXconfig,r2
XstepsPerMM,88.573186
YstepsPerMM,88.573186
ZstepsPerMM,400.000000
AstepsPerMM,96.2752018703
BstepsPerMM,96.2752018703
AaxisHasHBP,0
BaxisHasHBP,0
