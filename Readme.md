[![DeepWiki][DeepWiki_Logo]][DeepWiki_Repo] (sometimes AI explains it better)

<table>
  <tr>
    <th colspan=2 align="center">DS3231 GUI</th>
  </tr>
  <tr>
    <td>
      <table>
        <tr>
          <th>Updated</th>
          <td>2026-11-01</td>
        </tr>
        <tr>
          <th>Created</th>
          <td>2019</td>
        </tr>
        <tr>
          <th>License</th>
          <td>GPL3</td>
        </tr>
        <tr>
          <th>Code size</th>
          <td>&lt; 200 K</td>
        </tr>
        <tr>
          <th>💾</th>
          <td>
            <a href="deploy/ds3231_gui"><code>ds3231_gui</code></a>
          </td>
        </tr>
      </table>
    </td>
    <td align="center">
      GUI program to setup hardware RTC module on DS3231 chip.
    </td>
  </tr>
</table>


## RTC DS3231 GUI

Editable state of [DS3231 real-time clock][ds3231_images].

![status][gui_status]
![moment][gui_moment]
![alarm_1][gui_alarm_1]
![alarm_2][gui_alarm_2]
![core][gui_core]


## Usage

```
$ ds3231_gui
GUI to display and edit data of hardware clock module DS331

Usage:

  <DevicePath>
       ┬
       └── "/dev/ttyUSB<N>" -- use device at that port

-- Martin, 2026-11
```

1. Pre-flight checks
    1. Connect board to USB port
    2. Launch Arduino IDE and upload `StandardFirmata` snippet (it's under `examples/Firmata/`)
    3. Close Arduino IDE serial monitor window
    4. Connect DS3231 module. Check wiring
2. Run

   ```
   $ ds3231_gui /dev/ttyUSB0
   ```

   (Or correct file name to port with your Uno.)


## Requirements

  * Linux
  * Lua 5.4
  * [Tek-UI][tekui-setup]
  * DS3231 module
  * Microcontroller (ATmega, ESP, STM32 ..) with `StandardFirmata`
    firmware. (This firmware is present in Arduino IDE.)


## Shipment

Repository contains

  * Compiled code in [`deploy/`](deploy/)
  * Complete source code in [`src/`](src/)
  * Rebuild script and tools in [`builder/`](builder/)


## See also

* [DS3231 datasheet][datasheet]
* [Details and explanations][details]
* [My other repositories][repos]

[DeepWiki_Logo]: https://deepwiki.com/badge.svg
[DeepWiki_Repo]: https://deepwiki.com/martin-eden/tekui_ds3231

[gui_status]: doc_parts/gui_status.gif
[gui_moment]: doc_parts/gui_moment.png
[gui_alarm_1]: doc_parts/gui_alarm_1.png
[gui_alarm_2]: doc_parts/gui_alarm_2.png
[gui_core]: doc_parts/gui_core.png

[tek-ui]: http://tekui.neoscientists.org/
[tekui-setup]: https://gist.github.com/martin-eden/e721436788994e5b183e94fb2f84b30b

[datasheet]: https://github.com/martin-eden/doc.ds3231/raw/master/DS3231.pdf
[details]: doc_parts/details.md
[repos]: https://github.com/martin-eden/contents
[ds3231_images]: https://duckduckgo.com/?q=ds3231&iax=images&ia=images
