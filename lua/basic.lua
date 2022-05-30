vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"
-- 使用相对行号
vim.wo.number = true
vim.wo.relativenumber = true
-- 右侧参考线，超过表示代码太长了，考虑换行
vim.wo.colorcolumn = "80"
-- 缩进4个空格等于一个Tab
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true
-- 搜索高亮
vim.o.hlsearch = true
-- 禁止创建备份文件
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"
-- 配置剪切板
vim.opt.clipboard = "unnamedplus"
-- 粘贴保留原文件格式
-- vim.o.paste = true
