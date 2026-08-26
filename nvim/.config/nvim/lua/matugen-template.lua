local M = {}

function M.setup()
  local colors = {
    base00 = '{{colors.surface.default.hex}}',
    base01 = '{{colors.surface_container.default.hex}}',
    base02 = '{{colors.surface_container_high.default.hex}}',
    base03 = '{{colors.outline.default.hex}}',
    base04 = '{{colors.on_surface_variant.default.hex}}',
    base05 = '{{colors.on_surface.default.hex}}',
    base06 = '{{colors.on_surface.default.hex}}',
    base07 = '{{colors.on_background.default.hex}}',
    base08 = '{{colors.error.default.hex}}',
    base09 = '{{colors.tertiary.default.hex}}',
    base0A = '{{colors.secondary.default.hex}}',
    base0B = '{{colors.primary.default.hex}}',
    base0C = '{{colors.tertiary_fixed_dim.default.hex}}',
    base0D = '{{colors.primary_fixed_dim.default.hex}}',
    base0E = '{{colors.secondary_fixed_dim.default.hex}}',
    base0F = '{{colors.on_surface.default.hex}}',
  }

  require('base16-colorscheme').setup(colors)

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = colors.base05,          bg = colors.base00 })
  hi('TelescopeBorder',         { fg = colors.base03,          bg = colors.base00 })
  hi('TelescopePromptNormal',   { fg = colors.base05,          bg = colors.base00 })
  hi('TelescopePromptBorder',   { fg = colors.base03,          bg = colors.base00 })
  hi('TelescopePromptPrefix',   { fg = colors.base0B,          bg = colors.base00 })
  hi('TelescopePromptCounter',  { fg = colors.base04,          bg = colors.base00 })
  hi('TelescopePromptTitle',    { fg = colors.base00,          bg = colors.base0B })
  hi('TelescopePreviewTitle',   { fg = colors.base00,          bg = colors.base0A })
  hi('TelescopeResultsTitle',   { fg = colors.base00,          bg = colors.base09 })
  hi('TelescopeSelection',      { fg = colors.base05,          bg = colors.base02 })
  hi('TelescopeSelectionCaret', { fg = colors.base0B,          bg = colors.base02 })
  hi('TelescopeMatching',       { fg = colors.base0B,          bold = true })
end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 -- Lives at module scope so it only registers once (not on every re-require)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
     vim.g.colors_name = 'noctalia'
     vim.cmd("doautocmd ColorScheme")
   end)
 )

return M
