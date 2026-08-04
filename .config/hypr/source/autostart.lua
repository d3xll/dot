-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
-- "hyprland.start" fires once at startup (analog of exec-once)

hl.on("hyprland.start", function()
    -- Notification
    hl.exec_cmd("swaync")

    -- Bar
    hl.exec_cmd("waybar")

    -- VPN Client
    hl.exec_cmd("/opt/Throne/Throne")

    -- Wallpaper
    hl.exec_cmd("awww-daemon")

    -- Polkit agent
    hl.exec_cmd("systemctl --user start hyprpolkitagent.service")

    -- Equalizer for audio/micro
    hl.exec_cmd("easyeffects --gapplication-service")

    -- Auto-mount removable storage
    hl.exec_cmd("udiskie")

    -- Clipboard manager
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    -- OSD
    hl.exec_cmd("swayosd-server")
end)
