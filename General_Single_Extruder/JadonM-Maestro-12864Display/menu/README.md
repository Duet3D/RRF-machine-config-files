# Ultimate Duet Menu System

![Menu While Printing](https://user-images.githubusercontent.com/61329420/76150822-5ff00c80-607c-11ea-942c-f297da326593.jpg)

[Here's a video giving a tour of the menu.](https://youtu.be/9U0oqMW-FwY) I'm warning you - after watching this it will be obvious why I'm
a programmer and not a Youtuber! :smile:


## An attempt to make the best set of menu files for a 12864 display.
 There are a few menu sets available for a Duet with a connected 12864 display, but many of them
 suffer from depreciated commands, bad coding practices, or simply a lack of functionality!

 Therefore, I attempted to make an "ultimate" menu system that can be used to completely control the printer
 in an event of a network outage or similar problem. As a print farm owner, my printers can't quit
 when the wifi has a glitch!
 
 I'm quite satisfied with the result, and while not perfect, I think it makes good use of the available
 menu functionality. I decided to share it with the 3D printing community in hopes that someone else can benefit
 from it as well.
 
 These files are written for a single extruder, cartesian 3D printer with a heated bed. This means there's
 one heater and extruder for the nozzle and one heater for the bed. It's also designed for a cooling fan blowing on the
 printed part, which is standard on most printers.
 </br>
 </br>
 
## What are these files and how do I use them?
 One of the Duet Maestro's greatest advantages is something called the DWC, or Duet Web Control.
 This network interface offers full control of the printer from a remote location, making it incredibly
 handy when you have your printers in another room like I do. However, all networks have glitches every
 once in a while, and it's really helpful to have a screen mounted on the printer for quick adjustments.
 
 The solution to this is to buy a "Reprap Discount 12864 Display." They're quite cheap at about $15 USD,
 and very easy to set up if you buy the genuine version.
 
 The two cables from the display plug into the Maestro, simply match up the names beside the plugs. (Note that 
 the Maestro is currently the only Duet board capable of running these displays. Check into a "PanelDue" if 
 you need a display on a different board.)
 
 To configure the board with this new display, just add `M918 P1 E-4 F2000000` to your configuration file. 
 Your printer now knows it has a connected display, so the next step is to tell it what to display! That's 
 where these files come in - they tell the printer what to put where. Compress them into a ZIP folder, or 
 download it from the [Github Releases Page](https://github.com/jadonmmiller/UltimateDuetMenuSystem/releases) 
 page, and upload it to your printer via the blue "Upload" button on the display tab of the web interface. 
 That should be all that's needed for a basic setup--enjoy your new display!
 </br>
 </br>
 
 ## Key Features
 - Print files from the external SD card (Not supported in any other known menu system)
 **Note:** There was a bug in firmware versions prior to 3.01-RC2, so you must use that version or newer to use the external SD card.
 - Control Speed, Extrusion, Babystepping, Fans, and Heaters all from the homepage
 - Supports running custom macros from the /macros folder on the main SD card
 - Easy manual and automatic bed leveling
 - Deploy and Retract a Z Probe using the native commands.
 - Allows control of the power supply using `M80` and `M81` commands
 - Easily Customizable
 </br>
 </br> 
 
## Menu Structure
 The main overview screen shows the most-used settings, with an option to scroll right for more print settings. 
 (speed, extrusion, and baby-stepping) The menu offers options to move axis, disable motors, control the printer,
 run macros, and many other features!
 </br>
 </br>
 
## What you might want to change
 While these menu files are a good starting point, some things will need changed. Namely, the fan and
 heater numbers, as well as a few gcode scripts for things such as loading and unloading filament.
 Here's a list:
 
 - File main - Heater and fan numbers may need to be changed. By default, the bed is heater 0, the extruder 
 is heater 1, and the print cooling fan is fan 0.
 
 - File preheat - Heater numbers may need to be changed here as well. You can also change the preset
 temperatures. The instructions are in the file.
 
 - File moveExtruder - Once again, the temperature display will need to be changed to fit your heater
 configuration.
 
 - File changeFilament - This page shows the hotend temperature as well, and will therefore need updated.
 
 - Script unload.g - Found in the /scripts folder, this gcode file unloads the filament from your printer.
 by default it's set up for a direct-driven E3D V6 hotend with a Bondtech BMG extruder.
 
 - Script load.g - The same story as the unload file, but to load filament. :)
 
 - Script autoLevel.g - The menu runs this script to auto-level the bed. Currently it homes all the axis,
 then calls G32.
 
 - Scripts goToLevelPoint1.g, etc. - These scripts are used in the manual leveling procedure and should
 move the head over one leveling point (likely a leveling screw) per file.
 </br>
 </br>
 
## Features waiting on firmware compatability
 These are features I'd like to add to the display system but aren't yet available in the firmware. The 
 creator of the Duet (David Crocker) told me that in release 3.02 of the firmware he plans on adding support
 for displaying anything in the object model, so these should be possible in the near future!
 
 - Only show SD cards when they're mounted (Supported for the internal card, but not the external yet.)
 
 - Show print estimations based on the slicer
 
 - Show the elapsed print time
 </br>
 </br>
 
## Inspiration
 I owe a big thank you to Github user @tinkerlifeprojects. I really liked his menu system and used the
 basic framework to write mine. I also want to thank @mudcruzr, as I used some ideas from his menus as
 well.
 
 I had trouble finding menu systems contributed by other users, so here's a list of some of the other
 currently available files:
 
 [Tinkerlifeproject's TinkerLCD](https://github.com/tinkerlifeprojects/DUET3D_12864LCD_MenuFiles)
 
 [Mudcruzr's LCD files](https://github.com/mudcruzr/Duet-Maestro-12864-Menu-Files)
 
 [Sidic101's improvements on Mudcruzr's menu](https://github.com/Sidic101/Duet-Maestro-12864-Menu-Files)
 </br>
 </br>
 
## Contributing
 I tried to make these files the best out there, but they're by no means perfect! Please feel free to suggest
 any changes or features that you think would be helpful. Thanks!
