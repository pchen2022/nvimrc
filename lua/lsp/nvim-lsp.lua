local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local nvim_lsp = require('lspconfig')

local servers = {
  "sumneko_lua", -- apt install lua-language-server
  "bashls", -- npm i -g bash-language-server
  "jsonls", -- npm i -g vscode-langservers-extracted
  "remark_ls", -- npm install -g remark-language-server remark

  "html", -- npm i -g vscode-langservers-extracted
  "cssls", -- npm i -g vscode-langservers-extracted
  "emmet_ls", -- npm install -g emmet-ls
  "tsserver", -- npm install -g typescript typescript-language-server
  "vuels", -- npm install -g vls

  "pyright", -- npm i -g pyright
}

for _, lsp in pairs(servers) do
  nvim_lsp[lsp].setup{
	on_attach = on_attach,
    capabilities = capabilities,
  }
end
