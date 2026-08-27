-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function smart_resize(direction)
  local current = vim.fn.winnr()
  local has_right_neighbor = vim.fn.winnr('l') ~= current and vim.fn.winnr('l') > 0

  if not has_right_neighbor then
    if direction == '>' then
      direction = '<'
    elseif direction == '<' then
      direction = '>'
    end
  end

  vim.cmd('wincmd ' .. direction)
end

vim.keymap.set('n', '<C-Right>', function() smart_resize('>') end, { desc = 'Resize: move separator right' })
vim.keymap.set('n', '<C-Left>', function() smart_resize('<') end, { desc = 'Resize: move separator left' })
