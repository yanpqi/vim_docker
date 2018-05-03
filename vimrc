" 环境配置
set nocompatible " 关闭 vi 兼容模式
if has("multi_byte")
" UTF-8 编码
set formatoptions+=mM
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
endif

syntax enable
syntax on
colorscheme github
set t_Co=256
set guifont=Courier_New:h18:cANSI   " 设置字体
set number " 显示行号
set cursorline " 突出显示当前行
set ruler " 打开状态栏标尺
set guioptions-=T " 隐藏工具栏
set guioptions-=m " 隐藏菜单栏
set smartindent " 开启新行时使用智能自动缩进
let cmdheight=1 " 设定命令行的行数为 1
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 
" 设置在状态行显示的信息
set shiftwidth=4
set tabstop=4 " 设定 tab 长度为 4
set softtabstop=4
set expandtab
set nobackup " 覆盖文件时不备份
set autochdir " 自动切换当前目录为当前文件所在的目录
set backspace=indent,eol,start
set backspace=indent,eol,start
" 不设定在插入状态无法用退格键和 Delete 键删除回车符
"操作功能类设定
set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
"set nowrapscan " 禁止在搜索到文件两端时重新搜索
set incsearch " 输入搜索内容时就显示搜索结果
set hlsearch " 搜索时高亮显示被找到的文本
set noerrorbells " 关闭错误信息响铃
set novisualbell " 关闭使用可视响铃代替呼叫
set t_vb= " 置空错误铃声的终端代码
set hidden " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存

set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示
set cul
autocmd InsertEnter * se cul    " 用浅色高亮当前行
set showcmd         " 输入的命令显示出来，看的清楚些
set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离

" 显示中文帮助
if version >= 603
	set helplang=cn
	set encoding=utf-8
endif

" 自动缩进
set autoindent
set cindent

" 显示行号
set number
" 历史记录数
set history=1000
"搜索逐字符高亮
set hlsearch
set incsearch

noremap <silent> <F9> :A<CR>

source ~/.vim/settings/color.conf
source ~/.vim/settings/gtag.conf
source ~/.vim/settings/lookupfile.conf
source ~/.vim/settings/nerdtree.conf
source ~/.vim/settings/buf_ex.conf
source ~/.vim/settings/tagbar.conf
source ~/.vim/settings/yd.conf
source ~/.vim/settings/ycm.conf
