syntax  on
filetype indent on
set hlsearch incsearch ignorecase smartcase
set nowrap linebreak scrolloff=5 laststatus=2
set list listchars=tab:»·,trail:· fillchars=eob:\  
set nocompatible wildmenu wildmode=longest:list,full
set nobackup noswapfile noerrorbells vb t_vb=  mouse=a
set foldmethod=manual encoding=utf-8 fileencodings=utf-8 autoread
set cursorline number relativenumber ruler showcmd showmode showmatch
set autoindent smartindent copyindent expandtab tabstop=4 shiftwidth=4
"fix delay
set ttimeout ttyfast ttimeoutlen=1
"cursor
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
"dark:default slate,light:delek 
set bg=dark 
colorscheme slate

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
