
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
"Plug 'Shougo/denite.nvim'
Plug 'Shougo/unite.vim'

" add quotes and parenthesis etc easier
Plug 'tpope/vim-surround'

" completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'Shougo/neocomplete'
Plug 'Shougo/neco-vim'
Plug 'Shougo/neco-syntax'

" VHDL stuff
Plug 'VHDL-indent-93-syntax'

" whitespace highlighting
Plug 'ntpeters/vim-better-whitespace'

" align stuff
Plug 'godlygeek/tabular'

" VHDL Interface Plugin
Plug 'jpr75/vip'

" multiline cursor
Plug 'terryma/vim-multiple-cursors'


call plug#end()


" airline specific config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#obsession#enabled = 1

" deoplete specific config
let g:deoplete#enable_at_startup = 1

" whitespace options
let g:strip_whitespace_on_save = 1

" VIP options
let g:sigPrefix_VIP = ""
let g:instPrefix_VIP = "u_"
let g:instSuffix_VIP = ""

" Tabular aliases
command! -range Tassign Tabularize /<=/l1r1
command! -range Tsignal Tabularize /^[^:]*\zs:/l1r1 <bar> Tabularize /:=/l1r1


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

nnoremap <silent> <leader>f :Unite -start-insert buffer file_rec<CR>


" number formats to use for <C-A> and <C-X>
set nrformats=alpha,hex


" map enter to insert new line without entering insert mode
nmap <CR> o<Esc>


" formatting options
set formatoptions=tcrqwn
set wrap
set textwidth=160
filetype plugin indent on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set number


" check spelling
set spell
" disable spell check in terminal
augroup terminal
  autocmd TermOpen * setlocal nospell
augroup END


" don't delete buffers when you switch
set hidden


" reload file changes
set autoread


" setup the listchars options, nbsp was added in version 7
if v:version >= 700
  set listchars=eol:$,tab:>-,trail:-,extends:<,precedes:>,nbsp:%
else
  set listchars=eol:$,tab:>-,trail:-,extends:<,precedes:>
endif


" colorscheme
colorscheme elflord
" make sure spelling errors are underlined instead of highlighted in a terminal
hi clear SpellBad
hi SpellBad cterm=underline


" load session if exists
"if filereadable('Session.vim')
"    source 'Session.vim'
"endif
