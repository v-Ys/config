" 禁用 vi 兼容模式
set nocompatible
"在命令模式下，按下 tab 键可以自动补全命令
set wildmenu
set wildmode=longest:list,full
set showcmd
"禁止生成临时文件
set nobackup
set noswapfile
"关闭错误信息响铃
set noerrorbells
set vb t_vb=
syntax on
set mouse=a
set nowrap
 "换行显示时不把一个单词拆开
set linebreak
  "复制粘贴时保留原有的缩进
set copyindent
set foldmethod=manual
set encoding=utf-8 fileencodings=utf-8
   "设置当文件被改动时自动载入
set autoread
" 高亮当前行
set cursorline
"行号
set number
set relativenumber
"将光标位置设置为第 5 行
set scrolloff=5
"显示状态栏（默认值为1，表示无法显示状态栏）
set laststatus=2
"在状态栏显示光标当前位置
set ruler
"左下角显示当前 vim 模式
set showmode
" hide the ~ ,show tab and space
set fillchars=eob:\ "
set list
set listchars=tab:»·,trail:·

 "遇到括号（小括号，中括号，大括号）时，自动高亮匹配的括号：
set showmatch

"搜索
set hlsearch
"高亮显示搜索的匹配过程，每输入一个字符，就自动跳到第一个匹配的结果：
set incsearch
set ignorecase
set smartcase

filetype indent on
"回车后下一行自动缩进
set autoindent
set smartindent
"tab键输入转化为相应的空格数
set expandtab
"缩进
set tabstop=4
set shiftwidth=4
"cursor
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
"fix delay
set ttimeout
set ttimeoutlen=1
set ttyfast


let mapleader = "\<Space>"
noremap K 5k
noremap J 5j
noremap L $
noremap H ^
noremap ;z J
noremap ;; %
noremap ;k :nohl<CR>
nnoremap ;j :let @/ = '<c-r><c-w>' \| set hlsearch<cr>
nnoremap <c-]> :bd<CR>
nnoremap <leader>n :NTree<CR>

"dark default habamax light:delek 
set bg=dark 
colorscheme delek


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=/opt/homebrew/opt/fzf
let $FZF_DEFAULT_OPTS .= '  --layout=default'

call plug#begin()
Plug 'mhinz/vim-startify'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/fzf.vim'
call plug#end()


let g:startify_files_number = 5
let g:startify_session_autoload = 1
let g:startify_custom_header = [
                        \'',
                        \'',
                        \'        ⢀⣴⡾⠃⠄⠄⠄⠄⠄⠈⠺⠟⠛⠛⠛⠛⠻⢿⣿⣿⣿⣿⣶⣤⡀  ',
                        \'      ⢀⣴⣿⡿⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣸⣿⣿⣿⣿⣿⣿⣿⣷ ',
                        \'     ⣴⣿⡿⡟⡼⢹⣷⢲⡶⣖⣾⣶⢄⠄⠄⠄⠄⠄⢀⣼⣿⢿⣿⣿⣿⣿⣿⣿⣿ ',
                        \'    ⣾⣿⡟⣾⡸⢠⡿⢳⡿⠍⣼⣿⢏⣿⣷⢄⡀⠄⢠⣾⢻⣿⣸⣿⣿⣿⣿⣿⣿⣿ ',
                        \'  ⣡⣿⣿⡟⡼⡁⠁⣰⠂⡾⠉⢨⣿⠃⣿⡿⠍⣾⣟⢤⣿⢇⣿⢇⣿⣿⢿⣿⣿⣿⣿⣿ ',
                        \' ⣱⣿⣿⡟⡐⣰⣧⡷⣿⣴⣧⣤⣼⣯⢸⡿⠁⣰⠟⢀⣼⠏⣲⠏⢸⣿⡟⣿⣿⣿⣿⣿⣿ ',
                        \' ⣿⣿⡟⠁⠄⠟⣁⠄⢡⣿⣿⣿⣿⣿⣿⣦⣼⢟⢀⡼⠃⡹⠃⡀⢸⡿⢸⣿⣿⣿⣿⣿⡟ ',
                        \' ⣿⣿⠃⠄⢀⣾⠋⠓⢰⣿⣿⣿⣿⣿⣿⠿⣿⣿⣾⣅⢔⣕⡇⡇⡼⢁⣿⣿⣿⣿⣿⣿⢣ ',
                        \' ⣿⡟⠄⠄⣾⣇⠷⣢⣿⣿⣿⣿⣿⣿⣿⣭⣀⡈⠙⢿⣿⣿⡇⡧⢁⣾⣿⣿⣿⣿⣿⢏⣾ ',
                        \' ⣿⡇⠄⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢻⠇⠄⠄⢿⣿⡇⢡⣾⣿⣿⣿⣿⣿⣏⣼⣿ ',
                        \' ⣿⣷⢰⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⢰⣧⣀⡄⢀⠘⡿⣰⣿⣿⣿⣿⣿⣿⠟⣼⣿⣿ ',
                        \' ⢹⣿⢸⣿⣿⠟⠻⢿⣿⣿⣿⣿⣿⣿⣿⣶⣭⣉⣤⣿⢈⣼⣿⣿⣿⣿⣿⣿⠏⣾⣹⣿⣿ ',
                        \' ⢸⠇⡜⣿⡟⠄⠄⠄⠈⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟⣱⣻⣿⣿⣿⣿⣿⠟⠁⢳⠃⣿⣿⣿ ',
                        \'  ⣰⡗⠹⣿⣄⠄⠄⠄⢀⣿⣿⣿⣿⣿⣿⠟⣅⣥⣿⣿⣿⣿⠿⠋  ⣾⡌⢠⣿⡿⠃ ',
                        \' ⠜⠋⢠⣷⢻⣿⣿⣶⣾⣿⣿⣿⣿⠿⣛⣥⣾⣿⠿⠟⠛⠉            ',
                        \'',
                        \'',
                        \]
nnoremap  <Leader>fh :History<CR>
nnoremap  <Leader>ff :Files<CR>
nnoremap  <Leader>fs :Colors<CR>
nnoremap  <Leader>fl :Rg<CR>
nnoremap  <Leader>fm :Marks<CR>
nnoremap  <Leader>fw :Lines<CR>
nnoremap  <Leader>j :Buffers<CR>
