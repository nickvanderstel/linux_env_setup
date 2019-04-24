
if has("win32")
  let g:python2_host_prog='C:/Python27/python.exe'
  let g:python3_host_prog='C:/Python36/python.exe'
endif

" Change leader key
let g:mapleader=','

" Set the cwd to the location of the file opened by default
cd %:p:h

" fix backspace
set backspace=indent,eol,start

" disable error beeps
set noerrorbells
set visualbell

" keep cursor near middle of screen
set scrolloff=20

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
set modeline
set modelines=20


" check spelling - only in gui, looks awful in terminal
if has("gui_running")
  set spell
endif


" don't delete buffers when you switch
set hidden


" reload file changes
set autoread


" don't complete full match, instead show list
set wildmode=longest,list,full

" setup the listchars options, nbsp was added in version 7
if v:version >= 700
  set listchars=eol:$,tab:>-,trail:-,extends:<,precedes:>,nbsp:%
else
  set listchars=eol:$,tab:>-,trail:-,extends:<,precedes:>
endif


" colorscheme
if has("gui_running")
else
  "let base16colorspace=256
  set termguicolors
  " this choice will be overridden by the setting in the plugin options file
  colorscheme elflord
endif
" make sure spelling errors are underlined instead of highlighted in a terminal
hi clear SpellBad
hi SpellBad cterm=underline


" load session if exists
"if filereadable('Session.vim')
"    source 'Session.vim'
"endif
