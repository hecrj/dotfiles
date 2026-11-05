-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/configuring/

-- You can split this configuration into multiple files
-- Create your files separately and then link them to this file like this:
-- require("myColors")

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/configuring/core/monitors/
hl.monitor({
    output   = "desc:LG Electronics LG TV SSCR2 0x01010101",
    mode     = "3840x2160@120",
    position = "0x0",
    scale    = 2,
})

---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "tofi-drun"
local browser     = "google-chrome-stable"

-------------------
---- AUTOSTART ----
-------------------

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

-- hl.on("hyprland.start", function()
--   hl.exec_cmd("waybar")
--   hl.exec_cmd("hyprpaper")
-- end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/configuring/core/environment-variables/

-- hl.env("XCURSOR_SIZE", "24")
-- hl.env("HYPRCURSOR_SIZE", "24")
-- hl.env("LIBVA_DRIVER_NAME", "nvidia")
-- hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
-- hl.env("NVD_BACKEND", "direct")

-----------------------
----- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/configuring/core/config-options/

hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 10,

        border_size = 1,

        col = {
            active_border   = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        -- Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/configuring/extra/tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        dim_special = 0.5,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled  = true,
            size     = 3,
            passes   = 1,

            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

-- Default curves and animations, see https://wiki.hypr.land/configuring/core/animations/ for more
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1} } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}    } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1} } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}  } })

hl.animation({ leaf = "global",        enabled = true, speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 4.1,  bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })

-- "Smart gaps" / "No gaps when only"
-- See https://wiki.hypr.land/configuring/core/rules/workspace-rules/
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
hl.window_rule({
    name        = "no-decoration-wtv1",
    match       = { float = false, workspace = "w[tv1]" },
    border_size = 0,
    rounding    = 0,
})
hl.window_rule({
    name        = "no-decoration-f1",
    match       = { float = false, workspace = "f[1]" },
    border_size = 0,
    rounding    = 0,
})

hl.workspace_rule({ workspace = "1", persistent = true, default = true })
hl.workspace_rule({ workspace = "2", persistent = true })
hl.workspace_rule({ workspace = "3", persistent = true })
hl.workspace_rule({ workspace = "4", persistent = true })
hl.workspace_rule({ workspace = "5", persistent = true })
hl.workspace_rule({ workspace = "6", persistent = true })
hl.workspace_rule({ workspace = "7", persistent = true })
hl.workspace_rule({ workspace = "8", persistent = true })

-- iced
hl.window_rule({ match = { title = ".*(i|I)ced.*" }, float = true, move = "20 20" })
-- comet
hl.window_rule({ match = { title = "comet$" }, float = true, move = "monitor_w-window_w-20 20" })

-- latent
hl.window_rule({ match = { title = "^Latent$" }, float = true })

-- icebreaker
hl.window_rule({ match = { title = "^Icebreaker$" }, float = true })

-- File pickers
hl.window_rule({ match = { class = "^xdg-desktop-portal-gtk$" }, float = true })

-- nanosuit
hl.window_rule({ match = { title = ".*nanosuit.*" }, workspace = "special:magic" })
hl.window_rule({ match = { title = ".*nanosuit.*" }, float = true })
hl.window_rule({ match = { title = ".*nanosuit.*" }, center = true })

-- See https://wiki.hypr.land/configuring/layouts/dwindle-layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/configuring/layouts/master-layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

hl.config({
    misc = {
        force_default_wallpaper = -1, -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background. :(
    },
})

----------------
----  INPUT  ----
----------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "caps:escape, compose:menu",
        kb_rules   = "",

        repeat_rate  = 60,
        repeat_delay = 200,

        follow_mouse  = 1,
        accel_profile = "flat",

        sensitivity = -0.2, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },

    xwayland = {
        force_zero_scaling = true,
    },
})

-- Old: gestures:workspace = false — disable the default 3-finger horizontal workspace swipe.
-- In 0.57 gestures only exist if declared in the config, so simply not adding
-- hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" }) is the port.
-- (Unsetting a gesture that was never added fails with "Can't remove a non-existent gesture".)

-- Example per-device config
-- See https://wiki.hypr.land/configuring/core/devices/ for more
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

---------------------
---- KEYBINDINGS ----
---------------------

-- See https://wiki.hypr.land/configuring/core/binds/
local mainMod = "SUPER" -- Sets "Windows" key as main modifier

hl.bind(mainMod .. " + Return",     hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q",          hl.dsp.window.close())
hl.bind(mainMod .. " + M",          hl.dsp.exec_cmd("uwsm stop"))
hl.bind(mainMod .. " + E",          hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V",          hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + V",  hl.dsp.layout("togglesplit")) -- dwindle
hl.bind(mainMod .. " + R",          hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + F",          hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + N",          hl.dsp.exec_cmd("fish -c 'ninfer-nightly-toggle'"))
hl.bind("Print",                    hl.dsp.exec_cmd('grim -g "$(slurp -o)" - | swappy -f -'))

-- Move focus with mainMod + HJKL
hl.bind(mainMod .. " + H",          hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + J",          hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + K",          hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + L",          hl.dsp.focus({ direction = "right" }))

-- Snap a freed (floating / pseudotiled) window to a screen edge; vi motions
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))

-- Switch workspaces with mainMod + [0-9] / move window with mainMod + SHIFT + [0-9]
-- (10 maps to key 0, same as before)
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Scroll through existing workspaces with mainMod + arrow left/right
hl.bind(mainMod .. " + left",  hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ workspace = "e+1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
-- (old `bindel` was locked+latched; the latched flag no longer exists)
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl s 10%+"),                           { locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"),                           { locked = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/configuring/core/rules/window-rules/ for more

-- Ignore maximize requests from apps. You'll probably like this.
hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
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
