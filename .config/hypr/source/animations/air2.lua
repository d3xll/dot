-- -----------------------------------------------------
-- AIR PRESET: Soft Appear, Quick Disappear
-- -----------------------------------------------------

hl.config({ animations = { enabled = true } })

-- Мягкая кривая для появления (медленный старт, плавный разгон)
hl.curve("softIn", { type = "bezier", points = { { 0.4, 0.0 }, { 0.6, 1.0 } } })

-- Резкая кривая для исчезновения (быстрый финиш)
hl.curve("quickOut", { type = "bezier", points = { { 0.0, 0.0 }, { 0.2, 1.0 } } })

-- Windows In: плавное, «воздушное» появление
hl.animation({ leaf = "windowsIn", enabled = true, speed = 8, bezier = "softIn", style = "slidefade 15%" })

-- Windows Out: быстрое исчезновение (короче и резче)
hl.animation({ leaf = "windowsOut", enabled = true, speed = 4, bezier = "quickOut", style = "slidefade 10%" })

-- Перемещение окон: оставляем умеренно плавным
hl.animation({ leaf = "windowsMove", enabled = true, speed = 6, bezier = "softIn", style = "slidefade 10%" })

-- Border & Fade: плавное появление, быстрое исчезновение
hl.animation({ leaf = "border", enabled = true, speed = 7, bezier = "softIn" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "softIn" })

-- Layers: мягкое появление/движение
hl.animation({ leaf = "layers", enabled = true, speed = 6, bezier = "softIn", style = "slidefade 10%" })

-- Workspaces: плавное появление нового, быстрое исчезновение старого
hl.animation({ leaf = "workspaces", enabled = true, speed = 8, bezier = "softIn", style = "slidefadevert 35%" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 8, bezier = "softIn", style = "slidefadevert 35%" })
