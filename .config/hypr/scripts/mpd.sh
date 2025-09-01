while pgrep -x hyprlock > /dev/null; do
	sleep 1
done

mpc volume 20
mpc repeat
mpc random
mpc load random\ stuffz\ \[refined\]
mpc play
