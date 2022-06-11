local nvim_lsp = require('lspconfig')

local servers = {
  sumneko_lua = require('lsp.config.lua'), -- apt install lua-language-server
  bashls = require('lsp.config.bash'), -- npm i -g bash-language-server
  jsonls = require('lsp.config.json'), -- npm i -g vscode-langservers-extracted
  remark_ls = require('lsp.config.markdown'), -- npm install -g remark-language-server remark

  html = require('lsp.config.html'), -- npm i -g vscode-langservers-extracted
  cssls = require('lsp.config.css'), -- npm i -g vscode-langservers-extracted
  emmet_ls = require('lsp.config.emmet'), -- npm install -g emmet-ls
  tsserver = require('lsp.config.ts'), -- npm install -g typescript typescript-language-server
  vuels = require('lsp.config.vue'), -- npm install -g vls

  pyright = require('lsp.config.python'), -- npm i -g pyright
}

for lspname, lspconfig in pairs(servers) do
  if lspconfig ~= nil and type(lspconfig) == "table" then
    -- 自定义初始化配置文件必须实现on_setup 方法
    lspconfig.on_setup(nvim_lsp[lspname])
  else
    -- 使用默认参数
    nvim_lsp[lspname].setup({})
  end
end
