-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

map("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Telescope find files" })
map("i", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Telescope find files" })
