# RTC DS3231 GUI

This project provides editable graphical representation of state of
real-time clock implemented on DS3231 IC. It allows you to set by hand
all parameters of clock module for your Arduino project without
writing custom C code. Good for checking and prototyping.

![main window][gui_image]

Status: *initial release*

License: GPLv3

## Requirements

  * Linux
  * Lua 5.3
  * [Tek-UI][tekui-setup]
  * Arduino-compatible board
    * with DS3231 module connected
    * StandardFirmata code burned in Arduino

## Installation

* Clone this repository.

## Deinstallation

* Delete cloned repository.

## Usage

1. Pre-flight checks.
    1. Burn `StandardFirmata` snippet (in IDE it's under `examples/Firmata/`).
    2. Close Arduino IDE serial monitor window.
    3. Connect DS3231 module. Check wiring.
    4. Connect board to USB port.
2. Run main file:

   `$ lua run.lua`

   It will try to open first existing /dev/ttyUSB<n> port (n = 0, 7).

   If you have several Arduinos connected, add port name:

   `$ lua run.lua /dev/ttyUSB2`


## See also

* [Details and explanataions][details]
* [My other repositories][repos]

[tek-ui]: http://tekui.neoscientists.org/
[tekui-setup]: https://gist.github.com/martin-eden/e721436788994e5b183e94fb2f84b30b
[gui_image]: ../master/doc_parts/gui.png
[details]: ../master/doc_parts/details.md
[repos]: https://github.com/martin-eden/contents
