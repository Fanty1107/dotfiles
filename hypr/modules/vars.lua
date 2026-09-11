-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
	general = {
		gaps_in = 7,
		gaps_out = 10,
		--alter border_size in hyprland-gui.lua
		border_size = 2,

		col = {
			active_border = { colors = { "#cba6f7" }, angle = 45 },
			inactive_border = "#b4befe",
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "dwindle",
	},

	decoration = {
		rounding = 15,
		rounding_power = 10,

		-- Change transparency of focused and unfocused windows
		active_opacity = 0.95,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 8,
			render_power = 5,
			color = "#45475a",
		},

		blur = {
			enabled = true,
			size = 7,
			passes = 3,
			vibrancy = 5,
		},
	},

	animations = {
		enabled = true,
	},
})
