local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()



-- Shared on_attach function (optional keymaps)
local on_attach = function(client, bufnr)
  -- Example keymaps (customize as needed)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
end


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

-- HTML
lspconfig.html.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "htmldjango" }, -- Add more if needed
})

-- CSS
lspconfig.cssls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Python
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "strict", -- or "basic"
      },
    },
  },
})

-- Markdown 
lspconfig.marksman.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Lua
lspconfig.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } }, -- Fix 'vim' global warnings
    },
  },
})
