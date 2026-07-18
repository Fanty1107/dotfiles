------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "HDMI-A-1",
    mode     = "1920x1080@100",
    position = "0x0",
    scale    = "1",
})
hl.monitor({
    output   = "DVI-D-1",
    mode     = "1920x1080@100",
    position = "1920x0",
    scale    = "1",
})

-- workspaces main monitor
hl.workspace_rule({workspace = "1", monitor = "HDMI-A-1", persistent = true})
hl.workspace_rule({workspace = "2", monitor = "HDMI-A-1", persistent = true})
hl.workspace_rule({workspace = "3", monitor = "HDMI-A-1", persistent = true})
hl.workspace_rule({workspace = "4", monitor = "HDMI-A-1", persistent = true})
hl.workspace_rule({workspace = "5", monitor = "HDMI-A-1", persistent = true})

hl.workspace_rule({workspace = "6", monitor = "DVI-D-1", persistent = true})
hl.workspace_rule({workspace = "7", monitor = "DVI-D-1", persistent = true})
hl.workspace_rule({workspace = "8", monitor = "DVI-D-1", persistent = true})
hl.workspace_rule({workspace = "9", monitor = "DVI-D-1", persistent = true})