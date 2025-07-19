local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    markdown = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    python = { "black", "isort" },
    c = { "clang-format" },
    cpp = { "clang-format" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
