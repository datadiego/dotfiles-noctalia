-- AUTOSTART MODULE

local M = {}

function M.setup(hl)
	hl.on("hyprland.start", function()
		hl.exec_cmd("noctalia")
	end)
end

return M