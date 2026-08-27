-- MONITORS MODULE

local M = {}

local function getMonitorMode()
	local file = io.open(os.getenv("HOME") .. "/.config/hypr/monitor_mode", "r")
	if file then
		local mode = file:read("*l")
		file:close()
		return mode or "scale"
	end
	return "scale"
end

function M.setup(hl)
	hl.monitor({
		output = "eDP-1",
		mode = "preferred",
		position = "0x0",
		scale = "auto",
	})

	local monitorMode = getMonitorMode()

	if monitorMode == "mirror" then
		hl.monitor({ output = "HDMI-A-1", mode = "preferred", position = "0x0", scale = "auto", mirror = "eDP-1" })
	else
		hl.monitor({ output = "HDMI-A-1", mode = "preferred", position = "1280x0", scale = 1.0 })
	end
end

return M
