-- LAYOUTS MODULE

local M = {}

function M.setup(hl)
	hl.config({
		dwindle = {
			force_split = 2,
			use_active_for_splits = true,
			preserve_split = true,
		},
	})

	hl.config({
		master = {
			new_status = "slave",
			new_on_active = right,
			orientation = left,
		},
	})

	hl.config({
		scrolling = {
			fullscreen_on_one_column = true,
		},
	})
end

return M