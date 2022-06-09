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

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

pluginKeys.cmp = function(cmp)
  return {
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
    ['<C-j>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-k>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
  }
end

return pluginKeys
