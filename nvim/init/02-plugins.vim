" Plugin loader

call plug#begin()

" colorschemes
"Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'

" status line
if has("unix")
  Plug 'powerline/fonts', { 'do': './install.sh' }
endif
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
if has("python3")
  Plug 'Shougo/denite.nvim'
else
  Plug 'Shougo/unite.vim'
endif
Plug 'ujihisa/unite-colorscheme'
Plug 'tsukkee/unite-tag'

" syntax checking
"Plug 'scrooloose/syntastic'

" add quotes and parenthesis etc easier
Plug 'tpope/vim-surround'

" completion
if has("python3")
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/neocomplete'
endif
Plug 'Shougo/neco-vim'
Plug 'Shougo/neco-syntax'

" VHDL stuff
Plug 'cognoscan/vim-vhdl'
Plug 'jpr75/vip'

" whitespace highlighting
Plug 'ntpeters/vim-better-whitespace'

" align stuff
Plug 'godlygeek/tabular'

" multiline cursor
Plug 'terryma/vim-multiple-cursors'

" number conversion
Plug 'glts/vim-magnum'
Plug 'glts/vim-radical'

" startup screen
Plug 'mhinz/vim-startify'

call plug#end()

