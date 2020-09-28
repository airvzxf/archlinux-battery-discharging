# Linux Battery Discharging Beep
Generate a sound when the battery is discharging. It solves my personal problem which is a false in the connection
between the wire, and the laptop then I need a sound which indicates if my battery is discharging.

Execute:
- At any time in the terminal/console with the command `battery-discharging-beep &`
- It could be start everytime your X environment init, add `battery-discharging-beep &` into the `~/.xinitrc` before
the `openbox-session` command.

TODOs:
- Maybe create services to execute this command on the start system and every 'x' amount of time.