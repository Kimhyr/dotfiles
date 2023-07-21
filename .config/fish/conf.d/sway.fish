set TTY1 (tty)

export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=sway
export XDG_SESSION_TYPE=wayland

[ "$TTY1" = "/dev/tty1" ] && exec sway
