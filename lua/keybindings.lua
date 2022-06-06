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
pluginKeys = {}

-- 1. nvim-tree

map("n", "<leader>e", ":NvimTreeToggle<CR>", opt)
map("n", "<leader>n", ":NvimTreeFindFile<CR>", opt)
map("n", "<leader>r", ":NvimTreeRefresh<CR>", opt)


-- 2. bufferline

-- 左右Tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)

-- 3. nvim-cmp
-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
  return {
    -- 上一个
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    -- 下一个
    ['<C-j>'] = cmp.mapping.select_next_item(),
    -- 出现补全
    ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    -- 取消
    ['<A-,>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- 确认
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({
      select = true ,
      behavior = cmp.ConfirmBehavior.Replace
    }),
    -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
  }
end

return pluginKeys
