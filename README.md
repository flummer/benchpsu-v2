# Benchtop PSU v2

![Benchtop PSU v2](https://github.com/flummer/benchpsu-v2/raw/master/Images/bench_top_psu_v2_wide-8711.jpg "Benchtop PSU v2")

This is a conversion of an HP DPS-800GB server power supply, into a benchtop supply with connectors more commonly used for electronics and electrical prototyping.

It's designed to be relatively easy to make, and not least easier to assemble, as there are no dantling wires to solder, and the front part can be assembled by it self and tehn mounted on the PSU. The only modification I have done to the PSU is to remove the retaining clip, simply by opening the case and drilling out the rivet, holding it in place. It's not a critical modification, but I prefered to get rid of it.

## Features

This is a fairly simple conversion, and there are 3 fixed outputs:

- 3.3 V (5 A max)
- 5.0 V (2 A max)
- 12 V (30 A max)

The DPS-800GB PSU can deliver **much** more than 30A on 12 V, but the measuring circuit used for that channel has a max rating of 30A and the traces on the PCB probably also have a limit, though they have been made as wide as posssible to cope with a bit more current.

The screen will display the current draw on each output.

As the 3.3 V and 5.0 V outputs are part of the standby system in the DPS-800GB, they are always on, but the 12 V output is controlled via an optocoupler from the microcontroller, and the firmware is set up so that the single button turns that on and off.

## Notes

When mains power is connected, the fan is **not** running, but the PSU will get a bit warm if it sits like that for some time and it will also draw about 15W just sitting there, which isn't ideal. When the 12 V output is enabled, the fan will kick in, but unless you put a heavy load on it, it will only run slowly and not be super noisy, though it isn't silent in any way.

## Electronics

The electronics is build around an ATmega328p microcontroller and 3 ACS712 current sensors with analog output, and the firmware has some magic numbers for converting the value read from the analog inputs into ampere. Those have been found by putting a few known loads on the PSU and looking at the readings. It's a bit hacky, but good enough for a quick measurement if you just need to know if you are in the ballpark.

The banana connectors are the Pomona 6883 Dual Binding post and they are also used to hold the PCB inside the 3D printed case, and the friction of the connector and the 3D print against the case of the DPS-800GB is enough to keep it together, though the 3D model do have holes that match up with the existing screws of the DPS-800GB.

The card edge connector used to match with the DPS-800GB is an Amphenol FCI 10046971-001LF.

## License

The hardware, firmware, 3D models and artwork in this repository are released under the following license:

* the "Creative Commons Attribution-ShareAlike 4.0 International License"
  (CC BY-SA 4.0) full text of this license is included in the LICENSE file
  and a copy can also be found at
  [http://creativecommons.org/licenses/by-sa/4.0/](http://creativecommons.org/licenses/by-sa/4.0/)
