-- Monitors
hl.monitor({
    output = "eDP-1", 
    mode = "2560x1600@60", 
    position = "auto", 
    scale = "1.33"
})

-- Autostart
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar & hypridle & hyprpaper")
end)

-- Environment variables
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Source modules
require("hypr_modules.lookfeel")
require("hypr_modules.input")
require("hypr_modules.keybinds")
require("hypr_modules.windowrules")
