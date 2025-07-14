require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del
local M = {}

-- Basic key mappings
map("n", ";", ":", {desc = "Enter command mode"})
map("i", "jk", "ESC", {desc = "Exit insert mode"})
map("i", "jj", "ESC", {desc = "Exit insert mode"})

-- Window navigation (normal and terminal mode)
map({"n", "t"}, "<A-h>", "<cmd>wincmd h<cr>", {desc = "Move to left Window"})
map({"n", "t"}, "<A-j>", "<cmd>wincmd j<cr>", {desc = "Move to down Window"})
map({"n", "t"}, "<A-k>", "<cmd>wincmd k<cr>", {desc = "Move to up Window"})
map({"n", "t"}, "<A-l>", "<cmd>wincmd l<cr>", {desc = "Move to right Window"})
 

-- Additional terminal mode specific mappings
M.terminal = {
  t = {
    ["Esc"] = { [[<C-\><C-N>]], "Exit terminal mode"},
  }
}

return M
