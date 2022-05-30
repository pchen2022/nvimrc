vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = {
  noremap = true,
  silent = true,
}

-- 本地变量
local map = vim.api.nvim_set_keymap

--------------------------------------------------------------------
-- 插件快捷键

-- 1. nvim-tree

map("n", "<leader>e", ":NvimTreeToggle<CR>", opt)
map("n", "<leader>n", ":NvimTreeFindFile<CR>", opt)
map("n", "<leader>r", ":NvimTreeRefresh<CR>", opt)


-- 2. bufferline

-- 左右Tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
