# 一、非插件

## 1.1 系统剪切板

- Ctrl+c: visual 模式下复制到系统剪切板
- Ctrl+x: visual 模式下剪切到系统剪切板
- Ctrl+v: insert 模式下粘贴系统剪切板内容
- :reg 查看 vim 寄存器值

## 1.2 分屏大小调整

- Ctrl+right: 水平方向扩大
- Ctrl+left: 水平方向缩小
- Ctrl+up: 垂直方向扩大
- Ctrl+down: 垂直方向缩小

## 1.3 终端

- :terminal 自带终端

* 由终端插件 toggleterm 替代

# 二、插件

## 2.1 nvim-tree

- <leader>e 打开关闭目录树
- <leader>n 在目录树中定位到当前文件
- a 创建文件,创建文件夹时需要在后面加上/
- d 删除文件
- r 重命名
- y 拷贝文件名
- gy 拷贝绝对路径
- Y 拷贝相对路径
- c 拷贝文件
- p 粘贴上面拷贝的内容
- x 剪切文件, 切换到想要粘贴的目录，p 进行粘贴
- H 切换点文件的可见性
- I 切换隐藏文件夹/文件的可见性
- W 折叠目录树
- E 展开目录树
- s 调用系统应用打开
- S 查询文件
- f 过滤文件
- F 清空过滤条件
- <Tab> 预览文件
- - 切换到上级目录
- Ctrl+] 切换根目录
- Ctrl+k 查看文件信息
- Ctrl+v 水平分屏
- Ctrl+x 垂直分屏
- ]c 跳到下一个 git 修改的文件
- [c 跳到上一个 git 修改的文件

## 2.2 bufferline

- <C-h> 切换到前一个 buffer
- <C-l> 切换到后一个 buffer

## 2.3 nvim-treesitter

- gnn 初始化增量选择
- grn node 增量选择
- grm node 缩量选择
- grc scope 增量选择
- = 对选中的代码格式化, 考虑使用代码格式化插件替代
- zc 折叠{}中的代码，可替换
- zo 展开{}中的代码，可替换

## 2.4 toggleterm

- <leader>tt 打开普通终端
- <leader>tf 打开浮动终端
- <leader>tg 打开 lazy git 终端
- <leader>ta 打开或关闭所有终端

## 2.5 telescope

- <leader>ff 查找文件
- <leader>fg 文件中查找字符串
- <leader>fb buffer 中查找帮助文件
- <leader>fh 查看帮助文档
- <leader>fo oldfiles 中查找最近打开的文件
- <leader>fm 查找 marks 标记
- <CR> 打开选中的搜索结果
- <Tab> 选中下一个(插入模式和普通模式)
- <S-Tab> 选中上一个(插入模式和普通模式)
- <C-n> 选中下一个(普通模式)
- <C-n> 选中下一个(普通模式)
- <j> 选中下一个(插入模式)
- <k> 选中下一个(插入模式)
- <C-v> 垂直拆分打开选中的搜索结果
- <C-x> 水平拆分打开选中的搜索结果
- <C-c> 退出搜索框

## 2.6 spectre

- <leader>rg 全项目替换
- <leader>rb 当前文件 buffer 替换
- <leader>rw 全项目中搜索替换当前单词
- <leader>R 全部替换
- dd 删除选中/恢复删除的选中
- <CR> 前往选中的文件
- <leader>o 查看菜单(忽略大小写、忽略隐藏文件)
- <leader>v 显示差异

## 2.7 neoformat

- <leader>cf 格式化代码

## 2.8 nvim-cmp

- tab 下一个
- shift+tab 上一个
- ctrl+j 补全的函数详情向下翻页
- ctrl+k 补全的函数详情向上翻页
- enter 确定选中

## 2.9 nvim-lsp

- gd 跳转到定义处
- gD 跳转到申明处
- gr 查看引用
- gh 查看详情
- gi
- go
- gn 跳转到下一个语法有问题的地方
- gp 跳转到上一个语法有问题的地方
- <leader>rn 重命名
- <leader>ca
- <leader>= 格式化代码, 考虑使用代码格式化插件替代


# 三、安装注意事项

## 3.1 nvim-treesitter

- 需要安装npm i -g tree-sitter-cli

## 3.2 nvim-lsp

- 参考https://github.com/sumneko/lua-language-server/wiki/Build-and-Run
- npm i -g bash-language-server
- npm i -g vscode-langservers-extracted
- npm install -g remark-language-server remark
- npm i -g vscode-langservers-extracted
- npm i -g vscode-langservers-extracted
- npm install -g emmet-ls
- npm install -g typescript typescript-language-server
- npm install -g vls
- npm i -g pyright
