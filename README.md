# 一、非插件

## 1.1 系统剪切板

- Ctrl+c: visual模式下复制到系统剪切板
- Ctrl+x: visual模式下剪切到系统剪切板
- Ctrl+v: insert模式下粘贴系统剪切板内容
- :reg 查看vim寄存器值


## 1.2 分屏大小调整

- Ctrl+right: 水平方向扩大
- Ctrl+left: 水平方向缩小
- Ctrl+up: 垂直方向扩大
- Ctrl+down: 垂直方向缩小


## 1.3 终端
- :terminal 自带终端


# 二、插件

# 2.1 nvim-tree

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
- x 剪切文件, 切换到想要粘贴的目录，p进行粘贴
- H 切换点文件的可见性
- I 切换隐藏文件夹/文件的可见性
- W 折叠目录树
- E 展开目录树
- s 调用系统应用打开
- S 查询文件
- <Tab> 预览文件
- - 切换到上级目录
- Ctrl+] 切换根目录
- Ctrl+k 查看文件信息
- Ctrl+v 水平分屏
- Ctrl+x 垂直分屏
- ]c 跳到下一个git修改的文件
- [c 跳到上一个git修改的文件

# 2.2 nvim-cmp

- tab 下一个
- shift+tab 上一个
- ctrl+j 补全的函数详情向下翻页
- ctrl+k 补全的函数详情向上翻页


# 2.2 telescope

- 查找文件: <leader>ff
- 查找文字: <leader>fg
- 查找特殊符号: <leader>fb
- 查找帮助文档: <leader>fh
- 查找最近打开的文件: <leader>fo
- 查找 marks 标记: <leader>fm

```cmd
<CR> 打开选中的搜索结果
<Tab> 选中当前的搜索结果，可搭配 <CR> 一次性打开多个
<C-v> 垂直拆分打开选中的搜索结果
<C-c> 退出搜索框
<C-n> 选择下一项目（插入模式下）
<C-p> 选择上一个项目（插入模式下）
j     选择下一个项目（普通模式下）
k     选择上一个项目（普通模式下）
```
