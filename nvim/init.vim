
" Plugin section
call plug#begin()

"Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'powerline/fonts', { 'do': './install.sh' }
Plug 'vim-airline/vim-airline'
Plug 'ludovicchabant/vim-gutentags'
"Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-obsession'
"Plug 'equalsraf/neovim-gui-shim'

call plug#end()


let g:airline_powerline_fonts=1


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
inoremap jk <Esc>


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


" don't delete buffers when you switch
set hidden


" colorscheme
colorscheme base16-tomorrow-night


" load session if exists
"if filereadable('Session.vim')
"    source 'Session.vim'
"endif
