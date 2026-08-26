-- MISC MODULE

local M = {}

function M.setup(hl)
	hl.config({
		misc = {
			force_default_wallpaper = -1,
			disable_hyprland_logo = false,
		},
	})
end

return M