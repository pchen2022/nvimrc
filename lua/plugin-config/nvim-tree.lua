require('nvim-tree').setup {
    -- 视图
    view = {
        -- 宽度
        width = 30,
        -- 高度
        height = 30,
        -- 隐藏顶部的根目录显示
        hide_root_folder = false,
        -- 自动调整大小
        auto_resize = true,
    },
    diagnostics = {
        -- 是否启用文件诊断信息
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = ""
        }
    },
    git = {
        -- 是否启用 git 信息
        enable = true,
        ignore = true,
        timeout = 500
    }
}
