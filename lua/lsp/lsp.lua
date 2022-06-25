local lspconfig = require("lspconfig")

local servers = {
    sumneko_lua = require("lsp.config.lua"), -- apt不能安装，可参考https://github.com/sumneko/lua-language-server/wiki/Build-and-Run
    bashls = require("lsp.config.bash"), -- npm i -g bash-language-server
    jsonls = require("lsp.config.json"), -- npm i -g vscode-langservers-extracted
    remark_ls = require("lsp.config.markdown"), -- npm install -g remark-language-server remark
    html = require("lsp.config.html"), -- npm i -g vscode-langservers-extracted
    cssls = require("lsp.config.css"), -- npm i -g vscode-langservers-extracted
    emmet_ls = require("lsp.config.emmet"), -- npm install -g emmet-ls
    tsserver = require("lsp.config.ts"), -- npm install -g typescript typescript-language-server
    vuels = require("lsp.config.vue"), -- npm install -g vls
    pyright = require("lsp.config.python") -- npm i -g pyright
}

for name, config in pairs(servers) do
    if config ~= nil and type(config) == "table" then
        -- 自定义初始化配置文件必须实现on_setup 方法
        config.on_setup(lspconfig[name])
    else
        -- 使用默认参数
        lspconfig[name].setup({})
    end
end
