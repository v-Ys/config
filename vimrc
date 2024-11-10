syntax on
filetype indent plugin on
set ttimeout ttyfast ttimeoutlen=1 "esc delay
set nu rnu splitright splitbelow scrolloff=5 cursorline nowrap linebreak foldmethod=manual showmatch
set nocompatible nobackup noswapfile noerrorbells autoread vb t_vb=  mouse=a encoding=utf-8 fileencodings=utf-8
set list listchars=tab:<_,trail:~ fillchars=eob:\  smartindent copyindent expandtab tabstop=4 shiftwidth=4
set laststatus=2 ruler showmode wildmode=longest,list hlsearch incsearch ignorecase smartcase

"cursor
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
"dark:retrobox koehler light:delek
set bg=dark
colorscheme retrobox

let mapleader = "\<Space>"
map K 5k
map J 5j
map L $
map H ^
map ;; %
vmap L $h
nnoremap ;z J
nnoremap > >>
nnoremap < <<
vnoremap > >gv
vnoremap < <gv
nnoremap ;k :nohl<CR>
nnoremap ;j :let @/ = '<c-r><c-w>' \| set hlsearch<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=/opt/homebrew/opt/fzf
let $FZF_DEFAULT_OPTS .= '  --layout=default'
call plug#begin()
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
Plug 'tomtom/tcomment_vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
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

let g:NERDTreeMapChangeRoot="l"
let g:NERDTreeMapUpdir="h"

nnoremap  <Leader>fh :History<CR>
nnoremap  <Leader>ff :Files<CR>
nnoremap  <Leader>fs :Colors<CR>
nnoremap  <Leader>fl :Rg<CR>
nnoremap  <Leader>fm :Marks<CR>
nnoremap  <Leader>fw :Lines<CR>
nnoremap  <Leader>j :Buffers<CR>
nnoremap <leader>n :NERDTree<CR>
