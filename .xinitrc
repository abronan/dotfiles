export LANG=en_US.UTF-8

pulseaudio --start

xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 &

xscreensaver -nosplash &

exec awesome
