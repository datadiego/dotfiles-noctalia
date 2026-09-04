-- MISC MODULE

local M = {}

function M.setup(hl)
	hl.config({
		misc = {
			force_default_wallpaper = -1,
			disable_hyprland_logo = false,
		},
	})

	hl.config({
		xwayland = {
			force_zero_scaling = true,
		},
	})
end

return M