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
  * Lua 5.3 (or maybe 5.4)
  * [Tek-UI][tek-ui]
  * Arduino-compatible board
    * with DS3231 module connected
    * StandardFirmata code burned in Arduino

## Installation

* Install Tek-UI

  ```
  $ wget http://tekui.neoscientists.org/releases/tekui-1.12-r1.tgz
  $ tar -xvf tekui-1.12-r1.tgz
  $ cd tekui-1.12-r1
  $ sudo make LUAVER=5.3 all install clean
  ```
  Test of successful installation: `$ lua -l tek.ui`.

* Clone this repository.

## Deinstallation

* Remove Tek-UI

  ```
  $ sudo rm -rf /usr/local/lib/lua/5.3/tek
  $ sudo rm -rf /usr/local/share/lua/5.3/tek
  ```

* Delete cloned repository.

## Usage

1. Connect board to USB port.
2. Run main file:

   `$ lua run.lua`

   It will try to open first existing /dev/ttyUSB<n> port (n = 0, 7).

   If you have several Arduinos connected, add port name:

   `$ lua run.lua /dev/ttyUSB2`


## See also

* [Details and explanataions][details]
* [My other repositories][repos]

[tek-ui]: http://tekui.neoscientists.org/
[gui_image]: ../master/doc_parts/gui.png
[details]: ../master/doc_parts/details.md
[repos]: https://github.com/martin-eden/contents
