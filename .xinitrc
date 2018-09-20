export LANG=en_US.UTF-8

setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl

xscreensaver -nosplash &

screen_monitor &

urxvtd -q -f -o

# Colored emojis support for terminal with pkg on AUR: [noto-font-emoji, cairo-coloredemoji, cairo-compmgr]
# cairo-compmgr &

# xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 &

compton -c -r8 -l-12 -t-8 -b -G -f -D30 -I0.45 -O0.45 --paint-on-overlay --unredir-if-possible --backend glx --glx-no-stencil --glx-no-rebind-pixmap &

exec awesome
