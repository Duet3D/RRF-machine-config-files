This is RepRapFirmware V3 compatible config for a Flashforge Creator Pro (or Powerspec 3D Pro) running Duet 2 Wifi. (3.1.1 tested)

Features:
* Cartesian
* Single stock extruder (Left)
* Stock build volume
* Uses BLTouch sensor
* Origin in plate center
* Assumes duet controlled PSU (can be removed)
* Thermocouple configured for all metal hotend - lower it if needed
* Automatically loads mesh compensation on homing (can be removed)

Requirements and things to do:
* You need a Type-K Thermocouple daughter board to hook up the native thermocouple (if you don't want to convert it to something else)
* Calibrate your extruder steps (likely somewhere between 96-100 steps/mm)
* Calibrate your BLTouch probe offset - current config assumes an added glass bed topper
* Choose which size of mesh grid you'd like.  A couple of options exist in the config you can switch between.