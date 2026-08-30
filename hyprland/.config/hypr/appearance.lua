-- APPEARANCE MODULE (Look & Feel)

local M = {}

function M.setup(hl)
	hl.config({
		general = {
			gaps_in = 5,
			gaps_out = 10,
			border_size = 1,
			col = {
				active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
				inactive_border = "rgba(595959aa)",
			},
			resize_on_border = false,
			allow_tearing = false,
			layout = "dwindle",
		},
		decoration = {
			rounding = 0,
			rounding_power = 2,
			active_opacity = 1.0,
			inactive_opacity = 1.0,
			shadow = {
				enabled = true,
				range = 4,
				render_power = 3,
				color = 0xee1a1a1a,
			},
			blur = {
				enabled = true,
				size = 3,
				passes = 1,
				vibrancy = 0.1696,
			},
		},
		animations = {
			enabled = true,
		},
	})

	-- Animation curves
	hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
	hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
	hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
	hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
	hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
	hl.curve("easy", { type = "spring", mass = 1, stiffness = 238.1191, dampening = 24.21279333 })

	-- Animations
	hl.animation({ leaf = "global", enabled = true, speed = 0.1, bezier = "default" })
	hl.animation({ leaf = "border", enabled = true, speed = 0.1, bezier = "easeOutQuint" })
	hl.animation({ leaf = "windows", enabled = true, speed = 1, spring = "easy" })
	hl.animation({ leaf = "windowsIn", enabled = true, speed = 1, spring = "easy", style = "popin 87%" })
	hl.animation({ leaf = "windowsOut", enabled = true, speed = 1, bezier = "linear", style = "popin 87%" })
	hl.animation({ leaf = "fadeIn", enabled = true, speed = 1, bezier = "almostLinear" })
	hl.animation({ leaf = "fadeOut", enabled = true, speed = 1, bezier = "almostLinear" })
	hl.animation({ leaf = "fade", enabled = true, speed = 1, bezier = "quick" })
	hl.animation({ leaf = "layers", enabled = true, speed = 0.1, bezier = "easeOutQuint" })
	hl.animation({ leaf = "layersIn", enabled = true, speed = 0.1, bezier = "easeOutQuint", style = "fade" })
	hl.animation({ leaf = "layersOut", enabled = true, speed = 0.1, bezier = "linear", style = "fade" })
	hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 0.1, bezier = "almostLinear" })
	hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 0.1, bezier = "almostLinear" })
	hl.animation({ leaf = "workspaces", enabled = true, speed = 0.1, bezier = "almostLinear", style = "fade" })
	hl.animation({ leaf = "workspacesIn", enabled = true, speed = 0.1, bezier = "almostLinear", style = "fade" })
	hl.animation({ leaf = "workspacesOut", enabled = true, speed = 0.1, bezier = "almostLinear", style = "fade" })
	hl.animation({ leaf = "zoomFactor", enabled = true, speed = 0.1, bezier = "quick" })
end

return M
