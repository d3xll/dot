-- Minimal preset

hl.config({ animations = { enabled = true } })

-- --------------------------------------------------------
-- Bezier Curves
-- --------------------------------------------------------
hl.curve("pro", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.0 } } })
hl.curve("snap", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

-- --------------------------------------------------------
-- Application Windows (Speed: 3 - Relaxed/Clear)
-- --------------------------------------------------------
hl.animation({ leaf = "windows", enabled = true, speed = 3, bezier = "snap", style = "popin 80%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "snap", style = "popin 80%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 3, bezier = "snap" })

-- --------------------------------------------------------
-- UI Layers: SwayNC, Rofi, Waybar (Speed: 2 - Snappy)
-- --------------------------------------------------------
-- This '2' is the key. It makes SwayNC faster than windows.
-- We use 'slide' generally, but can override direction in layer rules.
hl.animation({ leaf = "layers", enabled = true, speed = 2, bezier = "pro", style = "slide" })
hl.animation({ leaf = "fade", enabled = true, speed = 2, bezier = "pro" })

-- fix for screenshot gray capture
hl.animation({ leaf = "layersOut", enabled = false, speed = 1, bezier = "pro" })

hl.animation({ leaf = "border", enabled = true, speed = 3, bezier = "pro" })

-- --------------------------------------------------------
-- Workspaces (vertical Slide)
-- --------------------------------------------------------
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "pro", style = "slidevert" })

-- Special Workspace (Scratchpad)
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3, bezier = "pro", style = "slide" })
