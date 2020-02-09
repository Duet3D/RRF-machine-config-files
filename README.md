# RRF-machine-config-files
This repository contains sample configuration files for RepRapFirmware to suit various 3D printers, CNC machines, Laser cutters and engravers.

**WARNING!**
Many of the files here are user-contributed and not tested by Duet3D. Use them at your own risk! In particular, we recommend you the following:
- Review the commands in the files to check that they are suitable for your machine. In particular, check that any M143 temperature limits are appropriate, adjust the motor currents in M906 commands to suit your motors, and check that the M208 limits are correct.
- Use reduced motor currents during testing, to reduce the possibility of damage
- Test the Z probe carefully before relying on it for homing or bed probing. See the Duet3D wiki page on testing a Z probe.

**Contributions**
Contributions from users are welcomed. The preferred way to make a contribution is to fork this repository, add your contribution to the fork, and submit a pull request.

Please adhere to the folder naming conventions:
- The root folders are machine identifiers
- Within the folder for a particular machine there is one folder for each contributed set of files for that machine. That folder name should include the identifier of the person making the contribution and a few characters to describe the machine variant or configuration variant. If the files are for RepRapFirmware 2 then the folder name should end in -rrf2. No suffix is needed if the files are intyended for RepRapFirmware 3.
- Within that folder are a Readme.md file and one or more of the usual folders /sys, /macros, /menu.
- Within those folders are the files that belong there.

Your Readme.md file should cover at least the following:
- The machine hardware configuration, including any differences from the standard hardware configuration of that machine
- If it is not a standard hardware configuration, the type of hotend, type of extruder, and (if applicable) Bowden tube length
- Any special features of your configuration files
- Where X0 Y0 is, e.g. centre of bed, or front left corner (not needed if the machine is a delta printer)
- The version(s) of RepRapFirmware that you have tested it with
