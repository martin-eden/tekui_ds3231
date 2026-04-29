## RTC DS3231 GUI

(2019, 2020, 2024, 2026)

Editable state of [DS3231 real-time clock][ds3231_images].

![page moment][gui_moment]
![page alarm_1][gui_alarm_1]
![page alarm_2][gui_alarm_2]
![page other][gui_other]


## Usage

```
GUI to display and edit data of hardware clock module DS331

Usage:

  lua run.lua <DevicePath>
                   ┬
                   ├── "/dev/ttyUSB<N>" -- use device at that port
                   └── "--virtual" -- use virtual device (data in local file)

```

If you just want to test GUI without any Arduino and DS3231 use
`--virtual` command-line arg.

1. Pre-flight checks
    1. Connect board to USB port
    2. Launch Arduino IDE and upload `StandardFirmata` snippet (it's under `examples/Firmata/`)
    3. Close Arduino IDE serial monitor window
    4. Connect DS3231 module. Check wiring
2. Run main file:

   ```
   $ lua run.lua /dev/ttyUSB0
   ```

   (Or correct file name to port with your Uno.)


## Requirements

  * Linux
  * [Lua 5.3][lua53-setup]
  * [Tek-UI][tekui-setup]
  * Arduino-compatible board
    * with DS3231 module connected
  * `StandardFirmata` burned in board (delivered with Arduino IDE)

## Install/remove

Clone this repository / Delete directory.

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
[ds3231_images]: https://duckduckgo.com/?q=ds3231&iax=images&ia=images
