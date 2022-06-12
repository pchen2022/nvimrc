-- https://github.com/nvim-pack/nvim-spectre

-- WARN: spectre 手动安装依赖项 sed 和 ripgrep
-- sed 命令（自行安装，如果已有则忽略）
-- repgrep： https://github.com/BurntSushi/ripgrep

require("spectre").setup(
    {
        mapping = require('keybindings').mapspectre()
    }
)

