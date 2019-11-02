###################################
Fix: Brightness key steps two times
###################################

Description
===========

When pressing Brightness-up and Brightness-down keys (F5 and F6), Both
``showkey`` and ``libinput debug-events`` shows these keys will be triggered
twice when only pressed one time.

Solution
========

Set video module parameter ``hw_changes_brightness`` to ``1``::

    echo -n 1 > /sys/module/video/parameters/hw_changes_brightness`

Permanent solution
------------------

    Note: I can’t find where to change this module’s parameter on load, so make
    use of systemd.path unit to set the attribute when it appears. Referencing
    https://wiki.archlinux.org/index.php/TrackPoint#systemd.path_unit for an
    example.

1. Put everything in this folder to place, following the filestructure
2. Start and enable ``hw_changes_brightness.path``
