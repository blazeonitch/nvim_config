return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"

      local lspconfig = require("lspconfig")

      local function get_vcpkg_includes()
        local vcpkg_root = os.getenv("VCPKG_ROOT") or os.getenv("HOME") .. "/vcpkg"
        local triplet = os.getenv("VCPKG_DEFAULT_TRIPLET") or "x64-linux"
        return {
          "-I" .. vcpkg_root .. "/installed/" .. triplet .. "/include",
        }
      end

      lspconfig.clangd.setup({
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--enable-config",
        },
        init_options = {
          fallbackFlags = get_vcpkg_includes(),
        },
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = function(client, bufnr)
          -- optional keybinds
        end,
      })
    end,
  },
}

