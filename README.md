# RRF-machine-config-files
This repository contains sample configuration files for RepRapFirmware to suit various 3D printers, CNC machines, Laser cutters and engravers.

**WARNING!**
Many of the files here are user-contributed and not tested by Duet3D. **Duet3D Limited accepts no responsibility for any consequences arising from using these files**. So you use them at your own risk! In particular, we recommend you do the following:
- Review the commands in the files to check that they are suitable for your machine. In particular, check that any M143 temperature limits are appropriate, adjust the motor currents in M906 commands to suit your motors, and check that the M208 limits are correct.
- If the files you want to use are for a version of RRF different from the one you are using, check the RRF upgrade notes to see if there are important differences between versons that may affect the behaviour
- Use reduced motor currents during testing, to reduce the possibility of damage
- Test the Z probe carefully before relying on it for homing or bed probing. See the Duet3D wiki page on testing a Z probe.

The root folders in this repository are machine names. Within each root folder are one or more subfolders, each one containing a set of files for the machine. The name of the subfolder is composed from the identifier of the contributor, the electronics type (normally -wifi-, -eth-, -maestro- or -duet3-) with suffix -rrf2- if the files are for RepRapFirmware 2 (no suffix if they are for RepRapFirmware 3), followed by other groups of letters describing the machine or configuration variant. Within each subfolder is a README.md file with more details about that set of files.

Files for Duet WiFi will generally work on Duet Ethernet, and vice versa.

## Contributions

Contributions from users are welcomed. The preferred way to make a contribution is to fork this repository, add your contribution to the fork, and submit a pull request.

Please adhere to the folder naming conventions:
- The root folders are machine identifiers
- Within the folder for a particular machine there is one folder for each contributed set of files for that machine. That folder name should comprise the identifier of the person making the contribution, the electronics name (usually one of wifi, eth, maestro, duet3), and one or more groups to describe the machine variant or configuration variant. If the files are for RepRapFirmware 2 then -rrf2 should be inserted immediately after the electronics name.
- Within that folder should be a README.md file and one or more of the usual folders /sys, /macros, /menu.
- Within those folders are the files that belong there.

Your README.md file should cover at least the following:
- The machine hardware configuration, including any differences from the standard hardware configuration of that machine
- If it is not a standard hardware configuration, the type of hotend, type of extruder, and (if applicable) Bowden tube length
- Any special features of your configuration files
- Where X0 Y0 is, e.g. centre of bed, or front left corner (not needed if the machine is a delta)
- The version(s) of RepRapFirmware that you have tested it with

Make sure that you do not include any passwords in your config.g file or any other files, except perhaps for the default 'reprap' password.

Please note, the Creative Common Zero license for this repository allows anyone to use these files for any purpose, without attribution or any requirement to share derived works. Make sure you are happy with this before submitting your contributions. However, if you wish to submit a contribution derived someone else's files, please ackowledge that person at least in the readme file.

## Support requests

Please use the [forum](https://forum.duet3d.com) for support requests.
