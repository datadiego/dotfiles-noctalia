 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
<<<<<<< HEAD
    base00 = '#1a1b26',
    base01 = '#24283b',
    base02 = '#2c3148',
    base03 = '#5d6682',
    base04 = '#9aa5ce',
    base05 = '#c0caf5',
    base06 = '#c0caf5',
    base07 = '#c0caf5',
    base08 = '#f7768e',
    base09 = '#9ece6a',
    base0A = '#bb9af7',
    base0B = '#7aa2f7',
    base0C = '#c1e996',
    base0D = '#87abf8',
    base0E = '#af89f6',
    base0F = '#b20928',
=======
    base00 = '#282a36',
    base01 = '#44475a',
    base02 = '#4d5066',
    base03 = '#6d728b',
    base04 = '#d6d8e0',
    base05 = '#f8f8f2',
    base06 = '#f8f8f2',
    base07 = '#f8f8f2',
    base08 = '#ff5555',
    base09 = '#8be9fd',
    base0A = '#ff79c6',
    base0B = '#bd93f9',
    base0C = '#82e7fd',
    base0D = '#b586f8',
    base0E = '#ff80c9',
    base0F = '#a20000',
>>>>>>> e56a7db (temas)
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

<<<<<<< HEAD
  hi('TelescopeNormal',         { fg = '#c0caf5',          bg = '#1a1b26' })
  hi('TelescopeBorder',         { fg = '#5d6682',             bg = '#1a1b26' })
  hi('TelescopePromptNormal',   { fg = '#c0caf5',          bg = '#1a1b26' })
  hi('TelescopePromptBorder',   { fg = '#5d6682',             bg = '#1a1b26' })
  hi('TelescopePromptPrefix',   { fg = '#7aa2f7',             bg = '#1a1b26' })
  hi('TelescopePromptCounter',  { fg = '#9aa5ce',  bg = '#1a1b26' })
  hi('TelescopePromptTitle',    { fg = '#1a1b26',             bg = '#7aa2f7' })
  hi('TelescopePreviewTitle',   { fg = '#1a1b26',             bg = '#bb9af7' })
  hi('TelescopeResultsTitle',   { fg = '#1a1b26',             bg = '#9ece6a' })
  hi('TelescopeSelection',      { fg = '#c0caf5',          bg = '#2c3148' })
  hi('TelescopeSelectionCaret', { fg = '#7aa2f7',             bg = '#2c3148' })
  hi('TelescopeMatching',       { fg = '#7aa2f7',             bold = true })
=======
  hi('TelescopeNormal',         { fg = '#f8f8f2',          bg = '#282a36' })
  hi('TelescopeBorder',         { fg = '#6d728b',             bg = '#282a36' })
  hi('TelescopePromptNormal',   { fg = '#f8f8f2',          bg = '#282a36' })
  hi('TelescopePromptBorder',   { fg = '#6d728b',             bg = '#282a36' })
  hi('TelescopePromptPrefix',   { fg = '#bd93f9',             bg = '#282a36' })
  hi('TelescopePromptCounter',  { fg = '#d6d8e0',  bg = '#282a36' })
  hi('TelescopePromptTitle',    { fg = '#282a36',             bg = '#bd93f9' })
  hi('TelescopePreviewTitle',   { fg = '#282a36',             bg = '#ff79c6' })
  hi('TelescopeResultsTitle',   { fg = '#282a36',             bg = '#8be9fd' })
  hi('TelescopeSelection',      { fg = '#f8f8f2',          bg = '#4d5066' })
  hi('TelescopeSelectionCaret', { fg = '#bd93f9',             bg = '#4d5066' })
  hi('TelescopeMatching',       { fg = '#bd93f9',             bold = true })
>>>>>>> e56a7db (temas)
end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
