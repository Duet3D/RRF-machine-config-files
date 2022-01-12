Config for Duet WiFi on stock Ender 5 Plus hardware with Creality metal extruder upgrade. Duet firmware 3.3

Connections as follows:

Motors:
    Standard plug pushed onto Duet connectors. 
    Dual Z motors connected to ZA and ZB. They only go on comfortably one way.

End Stops:
    Must be converted to 3 pin connectors, using outer 2 pins on X and Y (GND and STOP). No Z stop as equipped with BLTouch.

Thermistors:
    Bed > Thermitor0.
    Hotend > E0 Thermistor E1.
    These can be simply pushed onto the connectors if you don't want to re-crimp.

Fans:
    Can be simply pushed onto the connectors Fan0 for part cooling, Fan1 for hotend. These need reversing polarity from the way the connectors want to comfortably fit, so best re-crimped.

Bed Heater:
    Connect wires leading to the solid state relay into the bed heater output.

Nozzle Heater:
    Connect into E0 heater.

BLTouch:
    Connected as per https://forum.duet3d.com/assets/uploads/files/1587224870310-ender-5-pro-duet-2-wifi-hemera-bltouch-firmware-3.pdf

    Before going ahead, check that you've got BLTouch 3.1 or later. Earlier versions require a mod to work at 3.3V and may damage your Duet board. The version is printed on the PCB.

    Black (3 pin connector):
        Red wire > Expansion pin1 (+5V)
        Brown wire > Expansion pin2 (GND)
        Orange wire > Expansion pin8 (Heater3)
    White (2 pin connector)
        Black wire > Z Probe Z_PROBE_MOD
        White wire > +3.3V

    For the red, brown and orange wires, the simplest way I found to do this was pop out the wires from the plastic 3 pin and pop them into a a 2x4 pin plastic. I actually used an old USB expansion header with the blanked pin end trimmed down, but you could use anything that fits the pins spacing. The white connector ideally want re-cripming onto one of the 4 pin bodies in the Duet kit, but it'll press on as-is.

Power. Obvs:
    Red > Vin
    Black > Vout

Suggested Testing routing:
    Upload the config.
    Connect everything except the motors and BLTouch.
    Manually move the bed 10cm down away from the nozzle.
    Fire up, check that X and Y end stop lights (next to the motor connectors) light up and switch OFF when you manually press the end stop switches.
    Connect X and Y motors.
    Home each axis individually with your finger over the emergency stop buttom on the web config in case you've got a motor that needs reversing.
    Check that both the bed and nozzle thermistors read something near room temp.
    Check that both the fans work.
    Connect the BLTouch probe. It should light up red.
    Sending M280 P0 S10 I1 should extend the probe, M280 P0 S90 I1 should retract it. Assuming you're using the Heater 3 output like I did. If your probe hit something during its self test, is flashing red and you get a message in the gui saying "Error: Probe already triggered at start of probing move" send Error: M280 P0 S160
    Connect and test the Z motors by homing Z, being careful to check the the probe is extending and triggering it manually. Follow the excellent guide here to compete the routine to calibrate the nozzle height from the probe: https://betrue3d.dk/bltouch-on-duet-wifi-configuratio-and-usage/#testandcalibrate Note that the guide connects the orange wire to Heater7 instead of 3 like I did.
    If using PID control for the bed, run the PID tune routine here: https://duet3d.dozuki.com/Wiki/Tuning_the_heater_temperature_control. If you don't you may get message that the expected temp rise wasn't enough. Mine would never complete and would hang on stage 4. My values ought to work, though.
    Connect and test the extruder. This may need to motor reversing if you are running something different to me. You may also need to tune the steps/mm as detailed in the Duet guide.
    Run the bed level routine and adjust the bed.

Happy printing! Usual caveats: Use your own brain/discretion and at own risk.
    

