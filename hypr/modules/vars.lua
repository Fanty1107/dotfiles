-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
	general = {
		gaps_in = 7,
		gaps_out = 5,
		--alter border_size in hyprland-gui.lua
		border_size = 2,

		col = {
			active_border = { colors = { "#b195de" }, angle = 90 },
			inactive_border = "#90438a",
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = true,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = true,

		layout = "dwindle",
	},

	decoration = {
		rounding = 13,
		rounding_power = 3,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 8,
			render_power = 5,
			color = "#472d33",
		},

		blur = {
			enabled = true,
			size = 6,
			passes = 2,
			vibrancy = 3,
		},
	},

	animations = {
		enabled = true,
	},
})
