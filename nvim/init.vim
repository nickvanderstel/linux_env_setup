
" Plugin section
call plug#begin()

" colorschemes
"Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'

" status line
Plug 'powerline/fonts', { 'do': './install.sh' }
Plug 'vim-airline/vim-airline'
Plug 'mkitt/tabline.vim'

" ctags
Plug 'ludovicchabant/vim-gutentags'

" file tree
"Plug 'scrooloose/nerdtree'

" git integration
Plug 'tpope/vim-fugitive'

" language pack
Plug 'sheerun/vim-polyglot'

" session management
Plug 'tpope/vim-obsession'

" helper for guis
"Plug 'equalsraf/neovim-gui-shim'

" automatically sets tab mode
Plug 'tpope/vim-sleuth'

" unite
Plug 'Shougo/denite.nvim'

" add quotes and parenthesis etc easier
Plug 'tpope/vim-surround'

" completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-vim'
Plug 'Shougo/neco-syntax'

call plug#end()


" airline specific config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#obsession#enabled = 1


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
set number

" check spelling
set spell


" don't delete buffers when you switch
set hidden

" reload file changes
set autoread

" colorscheme
colorscheme base16-tomorrow-night


" load session if exists
"if filereadable('Session.vim')
"    source 'Session.vim'
"endif
