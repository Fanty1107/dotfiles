--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})
hl.window_rule({ match = { class = "org.kde.dolphin" }, float = true })
hl.window_rule({ match = { class = "Spotify" }, workspace = "special:spotify" })

hl.config({
	general = {
		allow_tearing = true,
	},
})
hl.window_rule({
	match = { class = "steam_app_.*" }, -- pega qualquer jogo rodando via Steam
	fullscreen = true,
	immediate = true, -- permite tearing nessa janela (menos latência)
	no_shadow = true, -- desliga sombra
	no_blur = true, -- desliga blur
	no_dim = true, -- desliga dimming quando não focada
	border_size = 0,
	rounding = 0, -- desliga bordas arredondadas
	no_anim = true, -- desliga animações da janela
})
