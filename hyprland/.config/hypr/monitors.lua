-- MONITORS MODULE

local M = {}

function M.setup(hl)
	hl.monitor({
		output = "",
		mode = "preferred",
		position = "auto",
		scale = "auto",
	})
end

return M