-- ~/.config/nvim/lua/core/plugins/lsp.lua

return {
  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatic LSP server manager
      { "williamboman/mason.nvim", build = ":MasonUpdate" },
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "bashls" }, -- ajuste como quiser
        automatic_installation = true,
      })

      local lspconfig = require("lspconfig")

      -- Exemplo: Configuração do LSP para Lua
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      -- Exemplo: JavaScript / TypeScript
      lspconfig.ts_ls.setup({})

      -- Bash
      lspconfig.bashls.setup({})
    end,
  },
}

