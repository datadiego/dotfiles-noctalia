-- ENVIRONMENT VARIABLES MODULE

local M = {}

function M.setup(hl, terminal)
	hl.env("XCURSOR_SIZE", "24")
	hl.env("HYPRCURSOR_SIZE", "24")
	hl.env("TERMINAL", terminal)
	hl.env("GDK_BACKEND", "wayland")
	hl.env("QT_QPA_PLATFORM", "wayland")
end

return M