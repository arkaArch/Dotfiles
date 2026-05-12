local terminal = "ghostty"
local file_manager = "thunar"
local menu = "rofi -show drun"

hl.bind("SUPER + return", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + space", hl.dsp.exec_cmd(menu))
hl.bind("SUPER + q", hl.dsp.window.close())
hl.bind("SUPER + SHIFT + e", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind("SUPER + s", hl.dsp.window.float({ action = "toggle" }))

--  Open distinguished kitty instance for yazi and ncmpcpp
hl.bind("SUPER + p", hl.dsp.exec_cmd("kitty --class=yazi yazi"))
hl.bind("SUPER + m", hl.dsp.exec_cmd("kitty --class=ncmpcpp ncmpcpp"))

-- Shortcut for GUI applications
hl.bind("SUPER + w", hl.dsp.exec_cmd("firefox"))
hl.bind("SUPER + SHIFT + p", hl.dsp.exec_cmd(file_manager))

-- Lock the screen
hl.bind("SUPER + SHIFT + l", hl.dsp.exec_cmd("hyprlock"))
-- Reload waybar
hl.bind("SUPER + r", hl.dsp.exec_cmd("$HOME/.config/waybar/launch.sh"))

hl.bind("SUPER + b", hl.dsp.window.pseudo())
hl.bind("SUPER + J", hl.dsp.layout("togglesplit")) -- dwindle only

-- Move focus with mod + arrow keys
hl.bind("SUPER + left",  hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up",    hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mod + [0-9]
-- Move active window to a workspace with mod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10
    hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind("SUPER + v", hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + v", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mod + scroll
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mod + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Multimedia keys for volume and brightness:
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("$HOME/.config/mako/scripts/volume.sh up"),         { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("$HOME/.config/mako/scripts/volume.sh down"),       { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("$HOME/.config/mako/scripts/volume.sh mute"),              { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),        { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("$HOME/.config/mako/scripts/brightness.sh up"),      { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("$HOME/.config/mako/scripts/brightness.sh down"),  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
