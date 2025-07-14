local lspconfig = require("lspconfig")

lspconfig.clangd.setup({
  cmd = { "clangd" }, -- Mason-managed clangd
  on_attach = function(client, bufnr)
    -- optional keymaps or formatting
  end,
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  flags = {
    debounce_text_changes = 150,
  },
})

