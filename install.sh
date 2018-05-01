#!/bin/bash

# 安装相关组件
echo "-->install system packages."
apt-get install software-properties-common -y
add-apt-repository ppa:nilarimogard/webupd8
apt-add-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-3.9 main"
apt-get update
apt-get install launchpad-getkeys -y
launchpad-getkeys
echo "deb http://apt.llvm.org/trusty/ llvm-toolchain-trusty-3.9 main" >> /etc/apt/sources.list
echo "deb-src http://apt.llvm.org/trusty/ llvm-toolchain-trusty-3.9 main" >> /etc/apt/sources.list
apt-get update
# apt-get install software-properties-common python-software-properties -y
# add-apt-repository ppa:ubuntu-toolchain-r/test
# apt-get update

function install_basic {
    apt-get install build-essential python-dev python3-dev python-pip unzip cmake vim git curl openssl wget libncurses5-dev libncursesw5-dev clang-3.9 global lldb-3.9 exuberant-ctags -y
}

# 复制vimrc到家目录
vim_root=/root/.vim
mkdir $vim_root/doc
mkdir $vim_root/syntax
mkdir $vim_root/autoload
mkdir $vim_root/plugin
echo "-->set up vim config system."
cd $vim_root
function tag_global {
    # 编译global, 配置文件已经放在settings中.
    wget http://tamacom.com/global/global-6.6.2.tar.gz && tar -xzvf global-6.6.2.tar.gz
    cd global-6.6.2 && ./configure && make && make install && cd -
    cp global-6.6.2/gtags.vim $vim_root/plugin/ && cp global-6.6.2/gtags-cscope.vim $vim_root/plugin/
    rm -rf global-6.6.2 global-6.6.2.tar.gz
}

function tagbar {
    # 安装tagbar
    cd /tmp/
    git clone https://github.com/majutsushi/tagbar.git
    mv tagbar/autoload/* $vim_root/autoload/
    mv tagbar/doc/* $vim_root/doc/
    mv tagbar/plugin/* $vim_root/plugin/
    mv tagbar/syntax/* $vim_root/syntax/
    rm -rf tagbar
    cd -
}

function nerdtree {
    # 安装nethtree
    wget https://www.vim.org/scripts/download_script.php?src_id=23731 -O nerdtree.zip
    unzip nerdtree.zip -d $vim_root/
    rm -rf nerdtree.zip
}

function buf_explorer {
    # 安装bufexplorer
    wget https://www.vim.org/scripts/download_script.php?src_id=25593 -O bufexplorer.zip
    unzip bufexplorer.zip -d $vim_root/
    rm -rf bufexplorer.zip
}

function lookupfile {
    # 安装lookupfile
    cd /tmp/
    wget https://www.vim.org/scripts/download_script.php?src_id=11399 -O genutils-2.5.zip
    unzip genutils-2.5.zip -d $vim_root/
    wget https://www.vim.org/scripts/download_script.php?src_id=7671 -O lookupfile-1.8.zip
    unzip lookupfile-1.8.zip -d $vim_root/
    rm genutils-2.5.zip lookupfile-1.8.zip
    cd -
}

function youdao_dict {
    # 安装youdao字典
    cd /tmp/
    git clone https://github.com/ianva/vim-youdao-translater.git
    mv vim-youdao-translater/plugin/* $vim_root/plugin/
    rm -rf vim-youdao-translater
    cd -
}

function you_complete_me {
    # 安装you-complete-me
    cd $vim_root
    git clone https://github.com/Valloric/YouCompleteMe.git
    cd YouCompleteMe && git submodule update --init --recursive && ./install.py --clang-completer
    mkdir ycm_build && cd ycm_build && cmake -G "Unix Makefiles" -DEXTERNAL_LIBCLANG_PATH=/usr/lib/llvm-3.9/lib/libclang.so.1 . ../third_party/ycmd/cpp && cmake --build . --target ycm_core --config Release
    cp $vim_root/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py ~/.vim/
    cd -
}
 
function install_colors {
    # 安装主题
    cd /tmp/
    color_path=/root/.vim/colors/
    git clone https://github.com/endel/vim-github-colorscheme.git
    mv vim-github-colorscheme/colors/* $color_path
    rm -rf vim-github-colorscheme

    git clone https://bitbucket.org/MicroJoe/vim-pygments-colorscheme.git
    mv vim-pygments-colorscheme/pygments.vim $color_path
    rm -rf vim-pygments-colorscheme

    git clone https://github.com/clinstid/eink.vim.git
    mv eink.vim/colors/* $color_path
    rm -rf eink.vim

    git clone https://github.com/altercation/vim-colors-solarized.git
    mv vim-colors-solarized/colors/* $color_path
    rm -rf vim-colors-solarized
    cd -
} 

echo "安装基本系统包"
install_basic
if [ $? -ne 0 ]; then
   exit
fi
echo "安装Global"
tag_global
if [ $? -ne 0 ]; then
   exit
fi
echo "安装Tagbar"
tagbar
if [ $? -ne 0 ]; then
   exit
fi
echo "安装NerdTree"
nerdtree
if [ $? -ne 0 ]; then
   exit
fi
echo "安装BufExplorer"
buf_explorer
if [ $? -ne 0 ]; then
   exit
fi
echo "安装LookupFile"
lookupfile
if [ $? -ne 0 ]; then
   exit
fi
echo "安装有道字典"
youdao_dict
if [ $? -ne 0 ]; then
   exit
fi
echo "安装自动补全"
you_complete_me
if [ $? -ne 0 ]; then
   exit
fi
echo "安装配色"
install_colors
if [ $? -ne 0 ]; then
   exit
fi


echo "-->finnished..."
