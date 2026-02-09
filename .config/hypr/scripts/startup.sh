while pgrep -x hyprlock > /dev/null; do
	sleep 1
done

hyprctl dispatch workspace 1
vesktop&
sleep 1
hyprctl dispatch workspace 4
ghostty -e "rmpc"&
hyprctl dispatch moveworkspacetomonitor 4 DP-1
sleep 1
hyprctl dispatch workspace 3
firefox&
sleep 1
hyprctl dispatch workspace 2
