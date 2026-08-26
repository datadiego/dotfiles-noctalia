-- ENVIRONMENT VARIABLES MODULE

local M = {}

function M.setup(hl)
	hl.env("XCURSOR_SIZE", "24")
	hl.env("HYPRCURSOR_SIZE", "24")
end

return M