-- -----------------------------------------------------
-- FADE PRESET: Pure Opacity / Ethereal
-- -----------------------------------------------------

hl.config({ animations = { enabled = true } })

-- --- Curves for Fading ---
hl.curve("sine", { type = "bezier", points = { { 0.5, 0.5 }, { 0.5, 0.5 } } })
hl.curve("sharpFade", { type = "bezier", points = { { 0.33, 1 }, { 0.68, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })

-- Windows: THE FIX
-- Windows don't have a 'fade' style.
-- We set them to 'popin 100%' (no scaling) and make them fast (but not instant,
-- or the fade might be skipped).
-- The actual visual "fade" is handled by the 'fade' animation below.
hl.animation({ leaf = "windows", enabled = true, speed = 3, bezier = "sharpFade", style = "popin 100%" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 3, bezier = "sharpFade", style = "popin 100%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "sharpFade", style = "popin 100%" })

-- Windows Move: Needs to slide to feel natural
hl.animation({ leaf = "windowsMove", enabled = true, speed = 4, bezier = "sine", style = "slide" })

-- Border: Pulse effect
hl.animation({ leaf = "border", enabled = true, speed = 5, bezier = "sine" })
hl.animation({ leaf = "fade", enabled = true, speed = 5, bezier = "sine" })

-- Layers (Waybar, etc.): Dissolve in
-- 'fade' IS valid for layers
hl.animation({ leaf = "layers", enabled = true, speed = 4, bezier = "sharpFade", style = "fade" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "sharpFade", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 2, bezier = "sharpFade", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 3, bezier = "sharpFade" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 2, bezier = "sharpFade" })

-- Workspaces: Cross-Dissolve
-- 'fade' IS valid for workspaces
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "sine", style = "fade" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 6, bezier = "sine", style = "fade" })
