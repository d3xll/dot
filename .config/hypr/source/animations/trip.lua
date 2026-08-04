-- -----------------------------------------------------
-- TRIP PRESET: Psychedelic, Wavy, Disorienting
-- -----------------------------------------------------

hl.config({ animations = { enabled = true } })

-- --- The "Hallucination" Curves ---
-- Starts by going backwards (-0.55), shoots way past target (1.55), then settles.
-- This creates a massive "wobble" effect.
hl.curve("hallucination", { type = "bezier", points = { { 0.68, -0.55 }, { 0.265, 1.55 } } })

-- Slow, lazy wave for fading
hl.curve("dream", { type = "bezier", points = { { 0.4, 0 }, { 0.2, 1 } } })

-- Constant rotation
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })

-- Windows: The "Breathing" Effect
-- They shrink first, then explode in. Duration 9 makes it slow and deliberate.
hl.animation({ leaf = "windowsIn", enabled = true, speed = 9, bezier = "hallucination", style = "popin 0%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 9, bezier = "hallucination", style = "popin 0%" })

-- Windows Move: Swimming through syrup
hl.animation({ leaf = "windowsMove", enabled = true, speed = 9, bezier = "hallucination", style = "slide" })

-- Border: THE SPIN
-- This makes your border colors rotate infinitely.
-- (Requires gradient borders in 'general' settings to be visible)
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "dream" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 100, bezier = "linear", style = "loop" })

-- Fade: Long, slow dissolves
hl.animation({ leaf = "fade", enabled = true, speed = 10, bezier = "dream" })

-- Layers: Drifting in from the void
hl.animation({ leaf = "layers", enabled = true, speed = 8, bezier = "dream", style = "popin 50%" })

-- Workspaces: The "Warp Tunnel"
-- slidefade 80% creates a massive ghosting trail effect when switching.
hl.animation({ leaf = "workspaces", enabled = true, speed = 12, bezier = "dream", style = "slidevertfade 80%" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 12, bezier = "dream", style = "slidefade 80%" })
