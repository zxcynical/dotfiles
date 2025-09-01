while pgrep -x hyprlock > /dev/null; do
	sleep 1
done

firefox&
sleep 1
hyprctl dispatch focuswindow class:firefox
hyprctl dispatch movetoworkspacesilent 3

vesktop&
sleep 1
hyprctl dispatch focuswindow class:vesktop
hyprctl dispatch movetoworkspacesilent 1

ghostty -e "rmpc"&
sleep 1
hyprctl dispatch focuswindow class:com.mitchellh.ghostty
hyprctl dispatch movetoworkspacesilent 4

hyprctl dispatch workspace 4
hyprctl dispatch moveworkspacetomonitor 4 DP-1
