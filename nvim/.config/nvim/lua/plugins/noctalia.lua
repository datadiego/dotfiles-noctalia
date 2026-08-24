local function apply()
  pcall(function()
    require("matugen").setup()
    vim.g.colors_name = "noctalia"
  end)
end

return {
  -- Disable LazyVim default colorschemes so they don't mix with the base16 palette
  { "folke/tokyonight.nvim", enabled = false },
  { "catppuccin/nvim", enabled = false },

  {
    "RRethy/base16-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      apply()
      vim.api.nvim_create_autocmd("VimEnter", { callback = apply })
    end,
  },

  -- Make LazyVim apply the noctalia base16 palette instead of its default
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = apply,
    },
  },
}
