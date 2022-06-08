local lspconfig = require('lspconfig')

-- { key: 语言 value: 配置文件 }
local servers = {
  sumneko_lua = require("lsp.config.lua"),  -- apt install lua-language-server
  bashls = require("lsp.config.bash"),  -- npm i -g bash-language-server
  jsonls = require("lsp.config.json"),  -- npm i -g vscode-langservers-extracted
  remark_ls = require("lsp.config.markdown"),  -- npm install -g remark-language-server

  html = require("lsp.config.html"),  -- npm i -g vscode-langservers-extracted
  cssls = require("lsp.config.css"),  -- npm i -g vscode-langservers-extracted
  emmet_ls = require("lsp.config.emmet"),  -- npm install -g emmet-ls
  tsserver = require("lsp.config.ts"),  -- npm install -g typescript typescript-language-server
  vuels = require("lsp.config.vue"),  -- npm install -g vls

  pyright = require("lsp.config.pyright"),  -- npm i -g pyright
  -- yamlls = require("lsp.config.yaml"),
  -- java_language_server = require("lsp.config.java_language_server"),
}

-- 启动 LanguageServers
for name, _ in pairs(servers) do
  lspconfig[name].setup{}
end
