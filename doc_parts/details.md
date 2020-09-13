# Details and Explanations

## Thoughts About Datasheet

* Strong points

  * Natural moment representation

    Moment in time internally stored almost same as displayed in
    typical digital clock. 2-digit year, month number, month date,
    day of week number, hour, minute, second.

    These numbers stored in BCD format so 23 is stored as 0x23.

  * Little endianess

    More frequently changed units allocated closer to zero offset.
    So seconds at offset 0, then minutes, then hours, dow, date and
    so on. So if you need to know current second you just read first
    byte. If you want to know current daytime - read three bytes
    from start.

    As typically you want to know time, or time and date, little
    endianess simplifies code.

* Strange points

  * AM/PM hour format

    Every hour byte in this module may be saved in two different
    representations: (`0`, BCD hour 00..23), (`1`, AM/PM flag,
    BCD hour 01..12). From my point of view fixing to any of these
    formats is better than supporting both. But module supports
    them both and interface should do.


  * Alarms multiplicity spread across bytes

    Checking for "alarm" may be done with intervals of month, day of
    week, hour, minute, second.

    Well, indeed for month it means it checks date with alarm date
    and if it equal, then it sets "alarm flag" to true. So if you set
    alarm date to 31, it will be triggered only in months having 31
    days.

    To get one hour interval you need to specify alarm minute and
    second and then set "ignore bit" for fields containing hour and
    date/dow. To get one minute interval you need also set "ignore bit"
    for alarm field with minute. So there is only one cluster of
    "ignore bits" set.

    (I've call "ignore bit" bit 7 in values storing alarm time.
    In datasheet they designated as A1M1, A1M2, A1M3, A1M4, A2M2,
    A2M3, A2M4. Meh.)

    So instead of using one more byte of memory engineers used high
    bits of several bytes. Also they failed to give logical names
    to values.
