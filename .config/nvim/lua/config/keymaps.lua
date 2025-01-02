-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

map({ "n", "i" }, "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Telescope find files" })
map("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "Telescope find files" })
map("n", "<leader>/", "<cmd>Telescope live_grep<cr>", { desc = "Telescope live grep" })
