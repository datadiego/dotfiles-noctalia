-- MONITORS MODULE

local M = {}

function M.setup(hl, monitorMode)
	hl.monitor({
		output = "eDP-1",
		mode = "preferred",
		position = "0x0",
		scale = "auto",
	})

	-- configuraciones para segundo monitor
	if monitorMode == "mirror" then
		hl.monitor({ output = "HDMI-A-1", mode = "preferred", position = "0x0", scale = "auto", mirror = "eDP-1" })
	else
		hl.monitor({ output = "HDMI-A-1", mode = "preferred", position = "1280x0", scale = 1.0 })
	end
end

return M
