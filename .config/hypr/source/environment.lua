-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

-- --- cursors ---
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XCURSOR_SIZE", "24")

-- --- backend ---
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")

-- --- XDG ---
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- --- QT ---
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-- --- NVIDIA ---
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

-- --- HYPRSHOT ---
hl.env("HYPRSHOT_DIR", os.getenv("HOME") .. "/Pictures/Screenshots/")

hl.config({
    cursor = {
        no_hardware_cursors = true,
    },
})

-- --- СЕТЕВЫЕ ПРОКСИ (Раскомментировать при необходимости) ---
-- hl.env("http_proxy", "http://127.0.0.1:2080")
-- hl.env("https_proxy", "http://127.0.0.1:2080")
-- hl.env("all_proxy", "socks5h://127.0.0.1:2080")
