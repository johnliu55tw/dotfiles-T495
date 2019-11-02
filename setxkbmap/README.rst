##################
Re-mapping the key
##################

Enable XKB options
==================

- ``ctrl:nocaps``: Map Capslock to Left Ctrl
- ``lv3:lwin_switch``: Map Left Win key to “Level 3 Shift”
- ``terminate:ctrl_alt_bksp``: Enable Ctrl+Alt+Backspace to terminate X server

Permanent solution
------------------

Put these into ``~/.Xkbmap`` and LightDM will load them automatically.
See `./HOME/.Xkbmap <./HOME/.Xkbmap>`_ for detail.

Re-mapping the key using XKB
============================

Because both ``xkbcomp`` and ``xmodmap`` don't work for me, I decided to
directly modify the default layout file (``/usr/share/X11/xkb/symbols/us``).

Permanent solution
------------------

Whenever the package ``xkeyboard-config`` got updated or reinstalled,
**the symbol file will be overwritten**. Therefore, I wrote a script to
automatically modify the file for my needs, and using pacman post-install
hook to run the script everytime the package got upgraded or reinstalled.
