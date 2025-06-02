local flutter_tools_config = {
  "akinsho/flutter-tools.nvim",
  ft = { "dart" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "stevearc/dressing.nvim",
  },
  config = function()
    -- Detectar versão do flutter via .fvm/fvm_config.json
    local flutter_path = nil
    local fvm_config_path = vim.fn.getcwd() .. "/.fvm/fvm_config.json"
    if vim.fn.filereadable(fvm_config_path) == 1 then
      local file = io.open(fvm_config_path, "r")
      if file then
        local content = file:read("*a")
        file:close()
        local decoded = vim.fn.json_decode(content)
        if decoded and decoded.flutterSdkVersion then
          flutter_path = vim.fn.expand("~/.fvm/versions/" .. decoded.flutterSdkVersion .. "/bin/flutter")
        end
      end
    end

    require("flutter-tools").setup({
      lsp = {
	      on_attach = function(_, bufnr)
	  local map = function(mode, lhs, rhs, desc)
	    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
	  end

	  map("n", "gd", vim.lsp.buf.definition, "LSP: Go to Definition")
	  map("n", "gr", vim.lsp.buf.references, "LSP: Find References")
	  map("n", "K", vim.lsp.buf.hover, "LSP: Hover Documentation")
	end,

    --      cmd = { vim.fn.expand("~/fvm/versions/3.27.4/bin/dart"), "language-server", "--protocol=lsp" },
      root_dir = require("lspconfig").util.root_pattern("pubspec.yaml"),
      settings = {
        dart = {
          completeFunctionCalls = true,
          showTodos = true,
      },
    },
      },
      flutter_path = flutter_path, -- usa o path detectado
      widget_guides = { enabled = true },
      closing_tags = { highlight = "Comment" },
      dev_log = { enabled = true, open_cmd = "tabedit" },
      debugger = { enabled = true, run_via_dap = false },
      fvm = true,
    })

    pcall(function()
      require("telescope").load_extension("flutter")
    end)
  end,
}

return flutter_tools_config

