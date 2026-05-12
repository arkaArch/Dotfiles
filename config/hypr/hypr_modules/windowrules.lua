hl.window_rule({
    match = { class = "ristretto" },
    float = true,
    center = true,
    size = { 1200, 800 },
})

hl.window_rule({
    match = { class = "yazi" or "ncmpcpp" },
    float = true,
    center = true,
    size = { 800, 500 },
})

hl.window_rule({
    match = { class = "Thunar" or "thunar" },
    float = true,
    center = true,
    size = { 900, 600 },
})

hl.window_rule({
    match = { class = "blueman-manager" },
    float = true,
    center = true,
    size = { 600, 400 },
})

hl.window_rule({
    -- Ignore maximize requests from all apps.
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule ({
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
    no_focus = true
})
