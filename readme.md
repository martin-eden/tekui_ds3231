# RTC DS3231 GUI

Editable state of DS3231 real-time clock.

![page moment][gui_moment]
![page alarm_1][gui_alarm_1]
![page alarm_2][gui_alarm_2]
![page other][gui_other]

Status: release

Version: 2.0

License: GPLv3

## Requirements

  * Linux
  * [Lua 5.3][lua53-setup]
  * [Tek-UI][tekui-setup]
  * Arduino-compatible board
    * with DS3231 module connected
  * `StandardFirmata` burned in board (delivered with Arduino IDE)

## Installation

* Clone this repository.

## Deinstallation

* Delete cloned repository.

## Usage

If you don't have Arduino or DS3231 and just wish to take a look at interface, checkout [virtual_rtc] branch.

1. Pre-flight checks.
    1. Connect board to USB port.
    2. Launch Arduino IDE and upload `StandardFirmata` snippet (it's under `examples/Firmata/`).
    3. Close Arduino IDE serial monitor window.
    4. Connect DS3231 module. Check wiring.
2. Run main file:

   `$ lua run.lua`

   It will try to open first existing /dev/ttyUSB<n> port (n = 0, 7).

   If you have several Arduinos connected, add port name:

   `$ lua run.lua /dev/ttyUSB2`


### Usage details

If you use alarm and it have hour time, alarm will trigger *iff*
hour is stored in same format as moment time: 12h AM/PM or 24h.

## See also

* [DS3231 datasheet][datasheet]
* [Details and explanations][details]
* [My other repositories][repos]

[tek-ui]: http://tekui.neoscientists.org/
[tekui-setup]: https://gist.github.com/martin-eden/e721436788994e5b183e94fb2f84b30b
[lua53-setup]: https://gist.github.com/martin-eden/4d3d1677244234e6501654cb32316305
[gui_moment]: doc_parts/gui_moment.png
[gui_alarm_1]: doc_parts/gui_alarm_1.png
[gui_alarm_2]: doc_parts/gui_alarm_2.png
[gui_other]: doc_parts/gui_other.png
[virtual_rtc]: https://github.com/martin-eden/tekui_ds3231/tree/virtual_rtc
[datasheet]: https://github.com/martin-eden/doc.ds3231/raw/master/DS3231.pdf
[details]: doc_parts/details.md
[repos]: https://github.com/martin-eden/contents
