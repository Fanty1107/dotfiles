-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function()
	hl.exec_cmd("waybar & awww-daemon")
	hl.exec_cmd(
		"sleep 1 && hyprctl dispatch moveworkspacetomonitor 1 HDMI-A-1 && hyprctl dispatch moveworkspacetomonitor 2 HDMI-A-1"
	)
	hl.exec_cmd("hypridle")
end)
