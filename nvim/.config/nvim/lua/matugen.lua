local M = {}

function M.setup()
  local colors = {
    base00 = '#282828',
    base01 = '#3c3836',
    base02 = '#474240',
    base03 = '#76706c',
    base04 = '#ebdbb2',
    base05 = '#fbf1c7',
    base06 = '#fbf1c7',
    base07 = '#fbf1c7',
    base08 = '#fb4934',
    base09 = '#83a598',
    base0A = '#fabd2f',
    base0B = '#b8bb26',
    base0C = '#96e9c9',
    base0D = '#e8e995',
    base0E = '#fcd782',
    base0F = '#fbf1c7',
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
