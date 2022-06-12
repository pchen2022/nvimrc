require "nvim-treesitter.configs".setup {
    ensure_installed = {
        "c",
        "lua",
        "bash",
        "python",
        "json",
        "markdown",
        "html",
        "css",
        "javascript"
    },
    ignore_install = {},
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false
    },
    incremental_selection = {
        enable = true,
        keymaps = require("keymaps").maptreesitter()
    },
    indent = {
        enable = true
    }
}

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.foldlevel = 99
