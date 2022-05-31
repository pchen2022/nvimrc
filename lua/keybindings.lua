vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = {
  noremap = true,
  silent = true,
}

-- 本地变量
local map = vim.api.nvim_set_keymap
----------------
-- 常用快捷键 --
----------------

-- 1. 系统剪切板
map("v", "<C-c>", '"+y', opt)
map("v", "<C-x>", '"+x', opt)
map("i", "<C-v>", '<Esc>"+pA', opt)

-- 2. 分屏大小调整
map("n", "<C-right>", ':vertical resize +2<CR>', opt)
map("n", "<C-left>", ':vertical resize -2<CR>', opt)
map("n", "<C-up>", ':resize +2<CR>', opt)
map("n", "<C-down>", ':resize -2<CR>', opt)


----------------
-- 插件快捷键 --
----------------

-- 1. nvim-tree

map("n", "<leader>e", ":NvimTreeToggle<CR>", opt)
map("n", "<leader>n", ":NvimTreeFindFile<CR>", opt)
map("n", "<leader>r", ":NvimTreeRefresh<CR>", opt)


-- 2. bufferline

-- 左右Tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
