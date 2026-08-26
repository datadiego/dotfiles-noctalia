-- MONITORS MODULE

local M = {}

function M.setup(hl)
	hl.monitor({
		output = "eDP-1",
		mode = "preferred",
		position = "0x0",
		scale = "auto",
	})

	-- configuraciones para segundo monitor
	-- mirror
	--hl.monitor({ output = "HDMI-A-1", mode = "preferred", position = "0x0", scale = "auto", mirror = "eDP-1" })

	--scaled
	hl.monitor({ output = "HDMI-A-1", mode = "preferred", position = "0x0", scale = "2.0" })
end

return M
