-- -----------------------------------------------------
-- GLITCH PRESET: Erratic, Jerky, Broken
-- -----------------------------------------------------

hl.config({ animations = { enabled = true } })

-- --- The "Stutter" Curve ---
-- This creates a jagged movement.
hl.curve("stutter", { type = "bezier", points = { { 0.1, 1.1 }, { 0.1, 1.1 } } })
-- A curve that goes backwards and forwards rapidly
hl.curve("glitch", { type = "bezier", points = { { 0.6, 2 }, { 0.4, -1 } } })

-- Windows: They teleport in jagged steps
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4, bezier = "glitch", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "stutter", style = "popin 10%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 4, bezier = "glitch", style = "slide" })

-- Border: Flashing violently
hl.animation({ leaf = "border", enabled = true, speed = 2, bezier = "glitch" })
hl.animation({ leaf = "fade", enabled = true, speed = 1, bezier = "stutter" })

-- Layers
hl.animation({ leaf = "layers", enabled = true, speed = 3, bezier = "glitch", style = "slide" })

-- Workspaces: The screen tears away
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "glitch", style = "slidevert" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 5, bezier = "glitch", style = "slide" })
