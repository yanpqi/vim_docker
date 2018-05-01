# vim_docker
工程的目的是将Vim运行到docker上,这样可以做到各个平台上拥有通用的使用环境.目前只有ubuntu平台.

## 基本功能
*  目前只是配置了基本的插件,包括nerdtree, lookupfile, buf_explorer, tagbar.
*  代码导航工具使用了global, 但也同时安装了ctags, 未直接安装cscope.
*  补全工具安装了youcompleteme, 编译安装是成功的,但目前未运行起来,正在调试问题.
*  安装了eink, solarize, github, pygments这几款主题.

## 安装使用
1. 系统内安装有Docker.
2. 下载镜像`docker pull ubuntu:14.04`
3. 修改配置
vimrc为主配置文件, 在docker中会放置为~/.vimrc , vim目录会成为~/.vim目录, 目前只是建立了目录结构, settings中保存了各个插件的配置.
4. 执行build.sh
5. 完成后执行run.sh即可,执行时需要提供要编辑的目录做为第一个参数, docker中这个目录会被挂在/mnt下.

## 配置
尽力地修改vimrc和vim目录,符合自己的习惯就好.

目前还没有掌握docker增量构建的方法,所以重编一次比较慢, 喝点咖啡或看个视频, 权看心情.


