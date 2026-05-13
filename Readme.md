[![DeepWiki][DeepWiki_Logo]][DeepWiki_Repo] (sometimes AI explains it better)

## RTC DS3231 GUI

(2019-12/2020-01, 2024, 2026)

Editable state of [DS3231 real-time clock][ds3231_images].

![status][gui_status]
![moment][gui_moment]
![alarm_1][gui_alarm_1]
![alarm_2][gui_alarm_2]
![core][gui_core]


## Usage

```
$ lua run.lua

GUI to display and edit data of hardware clock module DS331

Usage:

  lua run.lua <DevicePath>
                   ┬
                   ├── "/dev/ttyUSB<N>" -- use device at that port
                   └── "--virtual" -- use virtual device (data in local file)

```

If you just want to test GUI without any Arduino and DS3231 use
```
$ lua run.lua --virtual
```

1. Pre-flight checks
    1. Connect board to USB port
    2. Launch Arduino IDE and upload `StandardFirmata` snippet (it's under `examples/Firmata/`)
    3. Close Arduino IDE serial monitor window
    4. Connect DS3231 module. Check wiring
2. Run

   ```
   $ lua run.lua /dev/ttyUSB0
   ```

   (Or correct file name to port with your Uno.)


## Requirements

  * Linux
  * [Lua 5.3][lua53-setup]
  * [Tek-UI][tekui-setup]
  * DS3231 module
  * Microcontroller (ATmega, ESP, STM ..) with `StandardFirmata`
    firmware. (This firmware is present in Arduino IDE.)

## Install/remove

Clone this repository / Delete directory.

## See also

* [DS3231 datasheet][datasheet]
* [Details and explanations][details]
* [My other repositories][repos]

[DeepWiki_Logo]: https://deepwiki.com/badge.svg
[DeepWiki_Repo]: https://deepwiki.com/martin-eden/tekui_ds3231

[gui_status]: doc_parts/gui_status.png
[gui_moment]: doc_parts/gui_moment.png
[gui_alarm_1]: doc_parts/gui_alarm_1.png
[gui_alarm_2]: doc_parts/gui_alarm_2.png
[gui_core]: doc_parts/gui_core.png

[tek-ui]: http://tekui.neoscientists.org/
[tekui-setup]: https://gist.github.com/martin-eden/e721436788994e5b183e94fb2f84b30b
[lua53-setup]: https://gist.github.com/martin-eden/4d3d1677244234e6501654cb32316305

[datasheet]: https://github.com/martin-eden/doc.ds3231/raw/master/DS3231.pdf
[details]: doc_parts/details.md
[repos]: https://github.com/martin-eden/contents
[ds3231_images]: https://duckduckgo.com/?q=ds3231&iax=images&ia=images
