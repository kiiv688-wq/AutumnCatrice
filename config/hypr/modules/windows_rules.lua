--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/


hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- hl.window_rule({
--     name = "Geometry Dash",
--     match = {
--         class = "steam_app_322170",
--     },
--     immediate = true
-- })
hl.window_rule({
    name = " Rename Window fix",
    match = {
        class = "thunar",
        title = ".*Rename.*"
    },
    float=true
})