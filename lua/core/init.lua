-- ~/.config/nvim/lua/core/init.lua
vim.env.PATH = vim.env.PATH ..':/opt/homebrew/bin'
vim.opt.number = true              
vim.opt.relativenumber = true      
require("core.lazy")
require("core.keymaps")
