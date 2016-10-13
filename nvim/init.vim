
" Plugin section
call plug#begin()

Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'ludovicchabant/vim-gutentags'
Plug 'scrooloose/nerdtree'

call plug#end()


" Set the cwd to the location of the file opened by default
cd %:p:h


" disable error beeps
set noerrorbells
set visualbell


" make switching windows easier
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h


" make navigating out of a terminal easier
tnoremap jk <C-\><C-n>
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
tnoremap <C-h> <C-\><C-n><C-w>h


" map jk to esc to save a lot of reaching  
noremap! jk <Esc>


" number formats to use for <C-A> and <C-X>
set nrformats=alpha,hex


" formatting options
set formatoptions=tcrqwan
set textwidth=160
filetype plugin indent on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab


" colorscheme
colorscheme wombat
