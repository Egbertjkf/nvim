vim.keymap.set("n", "<leader>ff", function()
  require("telescope.builtin").find_files()
end, { desc = "Find Files" })

vim.keymap.set("n", "<leader>fg", function()
  require("telescope.builtin").live_grep()
end, { desc = "Live Grep" })

vim.keymap.set("n", "<leader>fb", function()
  require("telescope.builtin").buffers()
end, { desc = "Find Buffers" })

vim.keymap.set("n", "<leader>fh", function()
  require("telescope.builtin").help_tags()
end, { desc = "Find Help" })

vim.keymap.set("n", "<C-Tab>", function()
  require("telescope.builtin").buffers({
    sort_lastused = true,
    ignore_current_buffer = true,
  })
end, { desc = "Buffers recentes" })

vim.keymap.set("n", "<leader>rr", "<cmd>FlutterRun<CR>", { desc = "Flutter Run" })
vim.keymap.set("n", "<leader>rd", "<cmd>FlutterDevices<CR>", { desc = "Flutter Devices" })
vim.keymap.set("n", "<leader>re", "<cmd>FlutterEmulators<CR>", { desc = "Flutter Emulators" })
vim.keymap.set("n", "<leader>rl", "<cmd>FlutterReload<CR>", { desc = "Flutter Hot Reload" })
vim.keymap.set("n", "<leader>rq", "<cmd>FlutterQuit<CR>", { desc = "Flutter Quit" })
vim.keymap.set("n", "<leader>rf", "<cmd>Telescope flutter commands<CR>", { desc = "Flutter Quit" })
