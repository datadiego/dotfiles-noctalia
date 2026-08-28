return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    opts.formatters_by_ft = opts.formatters_by_ft or {}
    opts.formatters_by_ft.javascript = { "prettier" }
    opts.formatters_by_ft.typescript = { "prettier" }
    opts.formatters_by_ft.html = { "prettier" }
    opts.formatters_by_ft.css = { "prettier" }
    opts.formatters_by_ft.json = { "prettier" }
    opts.formatters_by_ft.python = { "ruff", "black" }
    opts.formatters_by_ft.lua = { "stylua" }
    opts.formatters_by_ft.sql = { "sqlfmt" }
    opts.formatters_by_ft.markdown = nil
    opts.formatters_by_ft["markdown.mdx"] = nil
  end,
}