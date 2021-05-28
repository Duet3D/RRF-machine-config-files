This is RepRapFirmware V3 compatible config for a Flashforge Creator Pro (or Powerspec 3D Pro) running Duet 2 Wifi. (3.1.1 tested)

Features:
* Cartesian
* Stock dual extruders
* Stock build volume
* Uses stock z-stop
* Origin in plate center
* Assumes duet controlled PSU (can be removed)
* Thermocouples configured for all metal hotends - lower them if needed

Requirements and things to do:
* You need a Type-K Thermocouple daughter board to hook up the native thermocouples (if you don't want to convert them to something else)
* You need to calibrate your extruder steps (likely somewhere between 96-100 steps/mm)