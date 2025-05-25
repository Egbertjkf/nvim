-- ~/.config/nvim/lua/core/plugins/lualine.lua

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- ícones bonitos
  config = function()
    require("lualine").setup({
      options = {
        theme = "catppuccin",
        icons_enabled = true,
        section_separators = "",
        component_separators = "",
      },
    })
  end,
}

