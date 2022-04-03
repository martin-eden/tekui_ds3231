# Details and explanations

## Thoughts about data format

* Strong points

  * Natural moment representation

    Moment in time stored almost same as displayed in typical digital
    clock. Two-digit year, month number, month day, day of week, hour,
    minute, second.

    These numbers stored in BCD format so 23 is stored as 0x23.

  * Little endianness

    Values ordered from more frequently changed to less. Seconds at
    offset 0, then minutes, hours, dow, date and so on. So if you need
    to know current second you just read first byte.

    As typically you want to know time, or time and date, little
    endianness simplifies code.

* Strange points

  * AM/PM hour format

    Every hour byte in this module may be saved in two different
    representations:

      * (`0` \<BCD hour 00..23>) or
      * (`1` \<AM/PM flag> \<BCD hour 01..12>)

    From my point of view fixing to any of these formats is better than
    supporting both. But module supports them both and interface should
    do.

  * Alarm flags spread across bytes

    Alarm granularity is month, day of week, hour, minute, second.

    For month it means it checks date with alarm date and if it equal,
    then it sets "alarm flag" to true. So if you set alarm date to 31,
    it will be triggered only in months having 31 days.

    To get one hour interval you need to specify alarm minute and second
    and then set "ignore bit" for fields containing hour and date/dow.
    To get one minute interval you specify second and set "ignore bits"
    for minutes, hours and date/dow. So there is only one cluster of
    "ignore bits" set.

    (I've call "ignore bit" bit 7 in values storing alarm time. In
    datasheet they designated as A1M1, A1M2, A1M3, A1M4, A2M2, A2M3,
    A2M4. Meh.)

    So instead of using one more byte of memory engineers used high
    bits of several bytes.
