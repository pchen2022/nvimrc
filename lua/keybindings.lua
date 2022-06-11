vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keybinds = {
  gmap = vim.api.nvim_set_keymap,
  bmap = vim.api.nvim_buf_set_keymap,
  dgmap = vim.api.nvim_del_keymap,
  dbmap = vim.api.nvim_buf_del_keymap,
  opts = { noremap = true, silent = true }
}

----------------
-- 常用快捷键 --
----------------

-- 1. 系统剪切板
vim.keybinds.gmap("v", "<C-c>", '"+y', vim.keybinds.opts)
vim.keybinds.gmap("v", "<C-x>", '"+x', vim.keybinds.opts)
vim.keybinds.gmap("i", "<C-v>", '<Esc>"+pA', vim.keybinds.opts)

-- 2. 分屏大小调整
vim.keybinds.gmap("n", "<C-right>", ':vertical resize +2<CR>', vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-left>", ':vertical resize -2<CR>', vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-up>", ':resize +2<CR>', vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-down>", ':resize -2<CR>', vim.keybinds.opts)


----------------
-- 插件快捷键 --
----------------
local pluginKeys = {}

-- 1. nvim-tree
vim.keybinds.gmap("n", "<leader>e", ":NvimTreeToggle<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>n", ":NvimTreeFindFile<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>r", ":NvimTreeRefresh<CR>", vim.keybinds.opts)

-- 2. bufferline
vim.keybinds.gmap("n", "<C-h>", ":BufferLineCyclePrev<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-l>", ":BufferLineCycleNext<CR>", vim.keybinds.opts)

-- 3. nvim-treesitter
pluginKeys.maptreesitter = function()
  return {
    init_selection = 'gnn',
	node_incremental = 'grn',
	node_decremental = 'grm',
	scope_incremental = 'grc',
  }
end

-- 4. toggleterm
vim.keybinds.gmap("t", "<Esc>", "<C-\\><C-n>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>tt", "<cmd>exe v:count.'ToggleTerm'<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>tf", "<cmd>lua require('toggleterm').float_toggle()<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>tg", "<cmd>lua require('toggleterm').lazygit_toggle()<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>ta", "<cmd>ToggleTermToggleAll<CR>", vim.keybinds.opts)

local term_on_open_float = function(term)
  return {
    -- 删除 Esc 的映射
    vim.keybinds.dgmap("t", "<Esc>"),
    -- 浮动终端中 Esc 是退出
    vim.keybinds.bmap(term.bufnr, "t", "<Esc>", "<C-\\><C-n>:close<CR>", vim.keybinds.opts),
  }
end
local term_on_open_lazygit = function(term)
  return {
    -- 删除 Esc 的映射
    vim.keybinds.dgmap("t", "<Esc>"),
    -- lazygit 中 q 是退出
    vim.keybinds.bmap(term.bufnr, "i", "q", "<cmd>close<CR>", vim.keybinds.opts),
  }
end
local term_on_close = function()
  return {
    -- 重新映射 Esc
    vim.keybinds.gmap("t", "<Esc>", "<C-\\><C-n>", vim.keybinds.opts)
  }
end
pluginKeys.maptoggleterm = {
  on_open_float = term_on_open_float,
  on_open_lazygit = term_on_open_lazygit,
  on_close = term_on_close,
}

-- 5. telescope
vim.keybinds.gmap("n", "<leader>ff", "<cmd>Telescope find_files theme=dropdown<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>fg", "<cmd>Telescope live_grep theme=dropdown<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>fb", "<cmd>Telescope buffers theme=dropdown<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>fh", "<cmd>Telescope help_tags theme=dropdown<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>fo", "<cmd>Telescope oldfiles theme=dropdown<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>fm", "<cmd>Telescope marks theme=dropdown<CR>", vim.keybinds.opts)

-- 3. nvim-cmp
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

pluginKeys.mapcmp = function(cmp)
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

-- 4. nvim-lsp
pluginKeys.maplsp = function(mapbuf)
  mapbuf('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', vim.keybinds.opts)
  mapbuf('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', vim.keybinds.opts)
  mapbuf('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', vim.keybinds.opts)
  mapbuf('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', vim.keybinds.opts)
  mapbuf('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', vim.keybinds.opts)

  mapbuf('n', 'go', '<cmd>lua vim.diagnostic.open_float()<CR>', vim.keybinds.opts)
  mapbuf('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', vim.keybinds.opts)
  mapbuf('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', vim.keybinds.opts)
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', vim.keybinds.opts)

  mapbuf('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', vim.keybinds.opts)

  mapbuf('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', vim.keybinds.opts)

  mapbuf('n', '<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>', vim.keybinds.opts)
  -- mapbuf('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', vim.keybinds.opts)
  -- mapbuf('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', vim.keybinds.opts)
  -- mapbuf('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', vim.keybinds.opts)
  -- mapbuf('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', vim.keybinds.opts)
  -- mapbuf('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', vim.keybinds.opts)
end

return pluginKeys
