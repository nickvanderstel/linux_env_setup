"
" a temp macro
" let g:ListNumber = 0
" nmap <F4> <C-V>7jc<C-R>=g:ListNumber<ENTER><ESC>9j:let g:ListNumber = g:ListNumber + 1<ENTER>
"
" temp number incrementing function
" let g:reqNum = 535
" function! GetReqNum()
"   let g:reqNum += 1
"   return g:reqNum
" endfunction

" Windows only commands
if has('win32') || has('win64')
  " If the shell is set to "/bin/bash" then this is a windows gvim launched from 
  " cygwin, correct the shell.
  if &shell =~ 'bash'
    set shell=C:\Windows\system32\cmd.exe
    set shellcmdflag=\\c
    set shellpipe=>%s 2>&1
    set shellredir=>%s 2>&1
    set shellxquote=(
    set shellxescape="&|<>()@^"
  endif

  " avoid having the menu and toolbar elements in the gui
  set guioptions=erL

  " For windows systems use the vimfiles directory
  set runtimepath=~/vimfiles/,$VIMRUNTIME

  " keep the backups in a manageable place
  set backupdir=~/backup,$TMP
  set directory=~/swap,$TMP

  " set my font preference
  "set guifont=Sheldon_Narrow:h9:cANSI
  set guifont=Liberation_Mono:h8:cANSI
  "set guifont=Envy_Code_R:h8:cANSI

  " force vim files to be unix format
  autocmd FileType vim set fileformat=unix
elseif has('win32unix')
  " avoid having the menu and toolbar elements in the gui, and add an icon
  set guioptions=eirL

  " For cygwin use the same directories as windows
  set runtimepath=~/vimfiles/,$VIMRUNTIME
  set backupdir=~/backup,$TMP
  set directory=~/swap,$TMP

  " set my gtk-vim compatible font preference (Sheldon renders badly for some 
  " reason in GTK)
  "set guifont=Envy\ Code\ R\ 8
  set guifont=Courier_New:h10:cANSI
  "set guifont=ProFontWindows\ 9
else
  set guioptions=eirL
  " For *ix systems use the .vim directory
  set runtimepath=~/.vim/,$VIMRUNTIME

  " keep the backups in a manageable place
  set backupdir=~/.backup,$TMP
  set directory=~/.swap,$TMP

  " set my font preference
  "set guifont=FreeMono\ 10
  "set guifont=DejaVu\ Sans\ Mono\ 9
  "set guifont=Sheldon_Narrow:h9:cANSI
  "set guifont=ProFontWindows\ 9
  "set guifont=ProFont\ 10
  "set guifont=AnonymousPro\ 9
  set guifont=Courier_New:h10:cANSI
  "set guifont=Envy_Code_R:h8:cANSI
endif

" Force the default the CWD to be $HOME
cd $HOME

set nocompatible
set title

" prevent the annoying warning bell
set noerrorbells
set visualbell

" I very rarely use octal numbers, but do use hex
set nrformats=alpha,hex

" Load the doxygen syntax plugin and set .dox files as doxygen documentation 
" files.
let g:load_doxygen_syntax=1
let g:doxygen_enhanced_color=1
let g:doxygen_javadoc_autobrief=0
autocmd BufRead,BufNewFile *.dox set filetype=doxygen

" C syntax options
let g:c_gnu = 1
let g:c_comment_strings = 1
let g:c_space_errors = 1
let g:c_curly_error = 1
" Don't show errors on curly brackets to prevent gnu ({ ... }) syntax from 
" being detected as a syntax error.
"let g:c_no_curly_error = 1
let g:c_syntax_for_h = 1

" Ada syntax options
let g:ada_default_compiler = 'gnat'
let g:ada_extended_tagging = 'jump'
let g:ada_folding = 'gibpx'
"let g:ada_rainbow_color = 1
"let g:ada_space_errors = 1
let g:ada_standard_types = 1
let g:ada_with_gnat_project_files = 1
let g:ada_extended_completion = 1
"let g:ada_line_errors = 1
let g:ada_omni_with_keywords = 1
let g:ada_begin_preproc = 1
let g:ada_gnat_extensions = 1

" Ada gnat compiler details
"call gnat#New()
"let g:gnat.Make_Program = '"make -C Build"'
"let g:gnat.Error_Format .= ",%f:%l:%c: %m"

" Python syntax options
let g:python_highlight_all = 1

" Set the default format options, text width and auto indent for normal 
" buffers.
" (disable autowrap for normal buffers)
set formatoptions=roqwn
set textwidth=120
set cindent
"set autoindent

syntax on
filetype plugin indent on

" setup spell checking variables for version 7 and up
if v:version >= 700 && has("gui_running")
  set spell spelllang=en_us
endif

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" setup the options that the behave command does.. but differently than either 
" the pure xterm or mswin settings dictate
set selection=exclusive

if has("gui_running")
  set mousemodel=extend
  set selectmode=mouse,key
  set keymodel=startsel,stopsel
else
  set mousemodel=extend
  set selectmode=key
  set keymodel=startsel,stopsel
endif
set mouse=a

" enable Vim to backspace over anything
set backspace=indent,eol,start

" always show the mode
set showmode

" setup my searching options
set showmatch
set incsearch

" I like to see where I am in a file
set ruler

" Ensure that visual selection shows how many lines are selected
set showcmd

" keep backups and a viminfo file
"set backup
set nobackup

" Configure the command line completion mode to give a list of matches instead 
" of just the first full match.
set wildmode=longest,list

" the < data is new since 603..4, not sure which but I know 604 has it and 602
" doesn't... so I'll just check for 604 to be safe.
if v:version >= 604
  " If this is a cygwin vim, use a different viminfo file since it seems to 
  " clash with the windows-only vim otherwise.
  if has('win32unix')
    set viminfo='1000,f1,<500,n~/.viminfo.cygwin
  else
    set viminfo='1000,f1,<500,n~/.viminfo
  endif
else
  " If this is a cygwin vim, use a different viminfo file since it seems to 
  " clash with the windows-only vim otherwise.
  if has('win32unix')
    set viminfo='1000,f1,n~/.viminfo.cygwin
  else
    set viminfo='1000,f1,n~/.viminfo
  endif
endif

" setup the listchars options, nbsp was added in version 7
if v:version >= 700
  set listchars=eol:$,tab:>-,trail:-,extends:<,precedes:>,nbsp:%
else
  set listchars=eol:$,tab:>-,trail:-,extends:<,precedes:>
endif

" setup folding values, this will enable us to fold code segments
set foldmethod=syntax
set foldcolumn=0
"set foldlevel=0
set foldlevel=99

" setup the scrolloff option so that I can see a few lines below the cursor
set scrolloff=1

" setup tab options
if v:version >= 700
  "allow a lot of tabs
  set tabpagemax=25
endif

" set the correct colorscheme
try
    colorscheme wombat
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme elflord
endtry

" if this is vim7, turn on the cursorline highlighting but only in modifiable 
" buffers
if v:version >= 700
  set cursorline
  " au InsertLeave * set nocursorline
  " au InsertEnter * set cursorline
  "au BufWinEnter * if &modifiable == 1 | setlocal cursorline | else 
    "| setlocal nocursorline
endif

" set the proper window size 
if has("gui_running")
  "set the window to 85 columns wide to accommodate the line numbers which are
  "turned on by default
  "set lines=55 columns=85
  "set lines=50 columns=85

  "Make the screen wider than usual
  set lines=55 columns=100
end

set numberwidth=5
set number

" setup session and view options to be able to store a project editing session
set sessionoptions=buffers,curdir,folds,globals,help,resize,slash,tabpages,unix,winpos,winsize

" make vim automatically reload a file which has changed and the buffer is
" still loaded
set autoread

" allow buffers to be modified and hidden at the same time
" !!! with this option enabled it is absolutely necessary to be very
" !!! careful with :q! and :qa!
set hidden

" setup the search path to help with simple VIM tasks like finding include
" files or macro defs
set path=.

" set the tag search path
" set tags=

" Set the diffoptions
"set diffopt=filler,icase,iwhite,vertical
set diffopt=filler,vertical,iwhite

" Force the keywordprg to be :help on all platforms
set keywordprg=:help

" configure the cscope options, and prepend the cygwin directory to the path if 
" this is running under windows so that the cygwin1.dll can be found.
"if has('win32') || has('win64')
"let $PATH = 'C:\cygwin\bin;' . $PATH
"endif
"set csprg=C:/cygwin/usr/local/bin/cscope.exe
"set cscoperelative
""set cscopequickfix=s+,g+,c+,t+,e+,f-,i+,d+
"" Hardcode the cscope database with flags for the AHMU project, must use cygwin 
"" or windows paths depending on host environment.
"if has('win32') || has('win64')
"  cs add D:/workspace/GE/AHMU/OGP/PATIO/cscope.out D:/workspace/GE/AHMU/OGP/PATIO -qkR
"elseif has('win32unix')
"  cs add /cygdrive/d/workspace/GE/AHMU/OGP/PATIO/cscope.out /cygdrive/d/workspace/GE/AHMU/OGP/PATIO -qkR
"endif

" Set the starting directory to be something more useful than the Vim start 
" menu directory
"cd C:\Working\

" ---
" Auto Commands
" ---

" setup options for text files
"autocmd BufRead *.txt set autoindent | set textwidth=80 | set formatoptions=twa1

" setup my formating options for C code and comments... these are in addition
" to the defaults done by the ftplugin for c/cpp code
"autocmd FileType c,cpp set textwidth=80 | set cinoptions=>s,e0,n0,f0,{0,}0,^0,:s,=s,l1,gs,b0,hs,ps,t0,is,+s,c3,C3,/0,(0,u0,Us,w0,Ws,M0,j1,)20,*30 | set comments=s1:/*,mb:*,ex:*/
"autocmd FileType c,cpp set textwidth=80 | set formatoptions=croqwa21 | set cinoptions=>s,e0,n0,f0,{0,}0,^0,L0,:0,=s,l1,b0,g0,hs,ps,t0,is,+s,c3,C3,/0,(0,u0,U0,w1,Ws,m0,M0,j1,J1,)20,*70,#0 | set comments=lbO://,s1:/*,mb:*,ex:*/
autocmd FileType c,cpp set textwidth=120 | set formatoptions=roqwa21 | set cinoptions=>s,e0,n0,f0,{0,}0,^0,L0,:0,=s,l1,b0,g0,hs,ps,t0,is,+s,c3,C3,/0,(0,u0,U0,w1,Ws,m0,M0,j1,J1,)20,*70,#0 | set comments=lbO://,s1:/*,mb:*,ex:*/

" force Ada files to use my correct formatoptions
autocmd FileType ada set textwidth=80 | set formatoptions=croqwa21 | setlocal tabstop=2 | setlocal softtabstop=2 | setlocal shiftwidth=2

" After a Diff has occurred, resize the window
"autocmd FilterWritePost * if &diff != 0 | call BufViewer#Close("quit") | let &columns = 173 | let &winwidth = 86 | endif
autocmd FilterWritePost * if &diff != 0 | call BufViewer#Close("quit") | let &columns = 173 | let &winwidth = 86 | let &equalalways = 1 | endif

" Add the .tst filetype
"autocmd BufRead *.tst set filetype=tst

" Force the options for tex/latex files to be a bit different than default.
" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
"set sw=2
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
"set iskeyword+=:
autocmd FileType tex set iskeyword+=: | set formatoptions+=c

" Add Scons files as python
autocmd BufRead,BufNewFile SConstruct set filetype=python
autocmd BufRead,BufNewFile SConscript* set filetype=python

" ---
" Mappings
" ---

" setup F1 to just turn on line numbering
nmap <silent> <F1> :if &number == 0 <bar> let &columns = &columns + 4 <bar> set number <bar> else <bar> let &columns = &columns - 4 <bar> set nonumber <bar> endif<CR>

" setup F2 to show invisible characters (such as tabs and return characters)
nmap <silent> <F2> :set invlist<CR>

" setup F3 to toggle search highlighting
nmap <silent> <F3> :set invhlsearch<CR>

" setup F4 to insert line numbers into the file
map <F4> :execute "vimgrep /" . expand("<cword>") . "/j ./**/*.[c,h]" <bar> cw<CR>
"nnoremap <silent> <F4> :%s/^/\=strpart(line('.')."     ",0,5)/<CR>
"vnoremap <silent> <F4> :s/^/\=strpart((line('.')-line("'<")+1)."     ",0,5)/<CR>

" setup the next key to remove line numbers
" nnoremap <silent> <F5> :%s/^[0-9 ]\{5}//<CR>

" setup F11 to enable text formatting options
nmap <silent> <F11> :if !exists("g:nonTextOptions") <bar> let g:nonTextOptions = [ &autoindent, &textwidth, &formatoptions, &filetype ] <bar> set autoindent <bar> set textwidth=80 <bar> set formatoptions=twa21 <bar> set filetype= <bar> endif<CR>

" setup F12 to reenable the non-text formatting options.
nmap <silent> <F12> :if exists("g:nonTextOptions") <bar> let [ &autoindent, &textwidth, &formatoptions, &filetype ] = g:nonTextOptions <bar> unlet g:nonTextOptions <bar> endif<CR>

" Modify the mouse buttons so that selection with left mouse button yanks to
" the clipboard and middle click pastes from the clipboard, also setup the
" double, triple clicks to copy also.  I use Shift-Mouse here because there
" are issues with some of the plugins I'm using if the mouse events are not
" modified.  These had to be modified for vim 7 because of the addition of the 
" <LeftDrag> event.
if v:version >= 700
  noremap <S-LeftMouse> <LeftMouse>
  noremap <S-LeftDrag> <LeftDrag>
  noremap <S-LeftRelease> <LeftRelease>"+ygV
else
  noremap <S-LeftMouse> <LeftMouse>
  noremap <S-LeftRelease> <LeftRelease>"+y
endif
noremap <S-MiddleMouse> <LeftMouse>"+gp

" for some reason when mapping the double and triple clicks to copy, I need
" to insert the <LeftMouse> before the <X-LeftMouse> to get them to work
noremap <S-2-LeftMouse> <LeftMouse><2-LeftMouse>"+y
noremap <S-3-LeftMouse> <LeftMouse><3-LeftMouse>"+y

" since I have a mouse with more buttons, map the X1 and X2 mouse buttons
" to go forward and back in the cursor jump list position
noremap <X1Mouse> <C-O>
noremap <X2Mouse> <C-I>

" setup keys that will format the current code block and file
nmap <F5> =i{
nmap <F6> gg=G

" setup some keys to make it easier to go to the next and previous errors
noremap ,o :copen<CR>
noremap ,w :cwindow<CR>
noremap ,c :cclose<CR>
noremap ,n :cnext <bar> if foldclosed('.') != -1 <bar> foldopen! <bar> endif<CR>
noremap ,p :cprevious <bar> if foldclosed('.') != -1 <bar> foldopen! <bar> endif<CR>

" Some commands to reduce the number of keystrokes required to move between
" windows
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-h> <C-W><C-H>
nnoremap <C-l> <C-W><C-L>

" Create some maps for the commands to open up the filename under the cursor in 
" a new window, and in a new tab.
"nnoremap <C-f> <C-W><C-F>
"nnoremap <C-g> <C-W>gf

" - Functionality now added to TagsParser plugin
" Map C-] to :tjump so that when multiple selections are available 
"nmap <silent> <C-]> :exec "tjump " . expand("<cword>")<cr>
"vmap <silent> <C-]> "0y:exec "tjump " . getreg("0")<cr>

" Create a keymap so that the \s and \S commands will do a search-and-replace, 
" using the current word in normal mode and the current selection in visual 
" mode.
nnoremap <leader>s :exec "%s/\\<" . expand("<cword>") . "\\>/" . input(">") .
      \ "/gc"<cr>
nnoremap <leader>S :exec "%s/\\<" . expand("<cword>") . "\\>/" . input(">") .
      \ "/g"<cr>
vnoremap <leader>s "0y:exec "%s/\\<" . getreg("0") . "\\>/" . input(">") .
      \ "/gc"<cr>
vnoremap <leader>S "0y:exec "%s/\\<" . getreg("0") . "\\>/" . input(">") .
      \ "/gc"<cr>

" Convert to hex
"nmap <leader>x b"0dwa<C-R>=printf("0x%08x", eval(getreg("0")))<CR><ESC>
nnoremap ,x :s/\(-\?\d*\%#-\?\d*\)/\=printf("0x%08x", eval(submatch(1)))/<CR>$

" Convert to decimal
"nmap <leader>d b"0dwa<C-R>=printf("%d", eval(getreg("0")))<CR><ESC>
nnoremap ,d :s/\([0-9a-fA-FxX]*\%#[0-9a-fA-FxX]*\)/\=printf("%d", eval(submatch(1)))/<CR>$

" Eval and append result
vnoremap ,e "0y$a<C-R>=Eval(getreg("0"))<CR><ESC>

function! Eval(string, ...)
  " Search for <<, >> or ** operations
  if a:string =~ "<<"
    let l:op = "<<"
  elseif a:string =~ ">>"
    let l:op = ">>"
  elseif a:string =~ "\\*\\*"
    let l:op = "**"
  else
    let l:op = "eval"
  endif

  " Check if there is a specified output format
  if a:0 == 1
    let l:format = "%" . a:1
  else
    let l:format = "%d"
  endif

  " Now eval the string
  if l:op == "eval"
    let l:result = eval(a:string)
  elseif l:op == "<<"
    "echomsg substitute(a:string, "<<\s*", "* float2nr(pow(2, ", "") . "))"
    let l:result = eval(substitute(a:string, "<<\s*", "* float2nr(pow(2, ", "") . "))")
  elseif l:op == ">>"
    let l:result = eval(substitute(a:string, ">>\s*", "\/ float2nr(pow(2, ", "") . "))")
  elseif l:op == "**"
    let l:result = eval("float2nr(pow(" . substitute(a:string, "\s*\\*\\*", ",", "") . "))")
  endif
  
  " Lastly, return the formated output string
  return " = " . printf(l:format, l:result)
endfunction "function! Eval(string, ...)

function! CBitFieldReverse() range
  let l:lastline = line('$')

  " If the first and last lines are equal, no range was given so process the 
  " entire file.
  if a:firstline == a:lastline
    call cursor( 0, 0 )
    let l:stopline = l:lastline
  else
    call cursor( a:firstline, 0 )
    let l:stopline = a:lastline
  endif

  let l:skippedStructs = []
  let l:bitFieldsNotModified = 0
  let l:bitFieldsModified = 0

  while 1
    let [ l:startline, l:startcol ] = searchpos( 'struct {', 'W', l:stopline )
    if l:startline == 0 && l:startcol == 0
      break
    endif

    let l:searchstop = l:startline + 9
    if l:stopline != l:lastline
      let l:searchstop = l:stopline
    endif

    let [ l:endline, l:endcol ] = searchpos( '} \%(Merged\)\{-,1}Bits;', 'W', l:searchstop )
    if l:endline == 0 && l:endcol == 0
      let l:bitFieldsNotModified += 1
      call add( l:skippedStructs, { 'bufnr': bufnr('%'), 'filename': bufname('%'), 'lnum': l:startline, 'pattern': '\%' . l:startline . 'l', 'col': l:startcol } )
      continue
    endif

    let l:lines = getline( l:startline + 1, l:endline - 1 )
    call reverse( l:lines )
    call setline( l:startline + 1, l:lines )

    let l:bitFieldsModified += 1
  endwhile

  " Only do this stuff if processing the whole file.
  if l:stopline == l:lastline
    echo "Reversed " . bitFieldsModified . " bitfields"
    echo "Ignored " . bitFieldsNotModified . " structures"

    call setqflist( l:skippedStructs )
    copen
  endif
endfunction "function! CBitFieldReverse() range

" ---
" Plugin Settings
" ---

" The imaps plugin installed with the Latex plugin messes up my <C-J> 
" mappings, so pre-map them to something different.
imap ,f <Plug>IMAP_JumpForward
nmap ,f <Plug>IMAP_JumpForward

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
"filetype plugin on - already done

if has('win32') || has('win64')
  " IMPORTANT: win32 users will need to have 'shellslash' set so that latex 
  " can be called correctly.
  set shellslash
  set grepprg=findstr\ /n\ $*
else
  " IMPORTANT: grep will sometimes skip displaying the file name if you search 
  " in a single file. This will confuse Latex-Suite. Set your grep program to 
  " always generate a file-name.
  set grepprg=grep\ -nH\ $*
endif

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" Not all scripts properly init this variable
let g:mapleader = '\'

" - ~/vimfiles/plugins/TagsParser.vim -
"---------------
" Global options
"---------------
"let g:TagsParserDebugLevel = "afe"
"let g:TagsParserOff = 1

" Ctags data strings
let $PATH = 'C:\cygwin\bin;' . $PATH
let g:TagsParserTagsProgram = 'C:/cygwin/usr/local/bin/ctags.exe'

" Set these variables, even though they can be found automatically this should 
" allow startup to occur faster.
let g:TagsParserSavedCtagsTyperefSupportedString = ""
let g:TagsParserSavedCtagsVersionString = "Exuberant Ctags"

let g:TagsParserLastPositionJump = 1
let g:TagsParserReplaceTagCmd = 'tjump'
let g:TagsParserKeywordFix = 1
let g:TagsParserKeywordFixChars = ',.,-'

"------------
" GUI options
"------------
let g:TagsParserFoldColumnDisabled = 1
let g:TagsParserAutoOpenClose = 1
let g:TagsParserWindowSize = 40
let g:TagsParserSingleClick = 1
let g:TagsParserHighlightCurrentTag = 1
let g:TagsParserSortType = "line"
let g:TagsParserSaveInterval = 10
let g:TagsParserTagDisplayOption = "alpha"
let g:TagsParserFileReadTag = 1

"--------------------
" Autotagging options
"--------------------
" Always exclude .svn, .git, directories
let g:TagsParserDirExcludePattern = '+\|.git\|.svn'
" Exclude all ., o, txt, xml, elf, sr, sr1 and gnat.adc files
let g:TagsParserFileExcludePattern = '+\|^\..*$\|^.*\.\%(\co\)$\|' .
      \ '^.*\.\%(\ctxt\)$\|^.*\.\%(\cxml\)$\|^.*\.\%(\celf\)$\|' .
      \ '^.*\.\%(\csr\)$\|^.*\.\%(\csr1\)$\|^.*\.\%(\cmap\)$\|' .
      \ '^\%(\cgnat\.adc\)$'

" Generate backwards search patterns, and ignore common macros and keywords 
" that confuse ctags.
"let g:TagsParserCtagsOptions = "-B -I ADDR_ALIGNED+ -I SECTION+ -I ALIGN32"
let g:TagsParserCtagsOptions = "-B -I _CRTIMP -I CRITICAL_SECTION"

"let g:TagsParserCtagsOptionsTypeList = [ "ada", "c" ]
let g:TagsParserCtagsOptionsTypeList = [ "c" ]

" Ada options (currently disabled)
"let g:TagsParserCtagsOptions_ada = "--ada-kinds=+TUVEay"

"" force non-informative specifications to be folded for ada files
"let g:TagsParserFoldHeading_ada_R = 1
"let g:TagsParserFoldHeading_ada_E = 1
"let g:TagsParserFoldHeading_ada_T = 1
"let g:TagsParserFoldHeading_ada_U = 1
"let g:TagsParserFoldHeading_ada_V = 1

" C options
let g:TagsParserCtagsOptions_c = "--c-kinds=+lp"
let g:TagsParserCtagsOptions_cpp = "--c-kinds=+lp"

" force the prototypes to be folded for c/cpp files
let g:TagsParserFoldHeading_c_p = 1
let g:TagsParserFoldHeading_cpp_p = 1

" Configure the projects
let g:TagsParserTagsDirRoot = '~/.project_tags'
let g:TagsParserProjectConfig = {}

" To generate monolithic tags files simliar to the TagsParser plugin, use this 
" command:
"   ctags -R --extra=fq --excmd=p --fields=+nS-t --sort=yes --tag-relative=yes <dir>

" For the AHMU software just define the searchPath and tagsLib.
let g:TagsParserProjectConfig['D:/workspace/GE/AHMU/AHMS/trunk/SW/SessionManager'] =
      \ { 'tagsPathList': [ '/**/*.[ch]' ],
      \   'savedTagsFile': '~/.project_tags/AHMU.savedtags',
      \   'searchPath': '$PRJ/**/',
      \   'dirExcludePattern': '+\|.metadata',
      \   'fileExcludePattern': '+' }

" custom command maps:
nmap <C-f> <Plug>TagsParserGrep
vmap <C-f> "0y:exec 'TagsParserGrep ' . getreg("0")

" Set up some user events to open the dir/buffer browse windows when we are in a 
" project.
"autocmd User TagsParserProjectEnter,TagsParserProjectLeave  :BufViewerToggle

" - ~/vimfiles/plugins/BufViewer.vim
"let g:loaded_bufviewer = 1
"let g:BufViewerDebugLevel = "fea"

let g:BufViewerCurrentFileCWD = 1
let g:BufViewerWindowSize = 40
let g:BufViewerSingleClick = 1
"let g:BufViewerAutoOpen = 1
let g:BufViewerAutoOpen = 0
let g:BufViewerDisplayMode = "buflist"
let g:BufViewerShowNonBuflist = 1

let g:BufViewerWindowPosition = 'topleft-vertical'

" Define a function to open up a browsing window for netrw 
function! OpenHiddenWindow(pos, pat, cmd, height, width)
  " Save the current window and buffer numbers (the window numbers can change when 
  " new windows are opened).
  let l:curBuf = bufnr('%')
  let l:curWin = winnr()

  " Use a generic temp buffer name
  let l:name = fnamemodify(tempname(), ":t")

  " If the specified buffer name pattern is not present on the current tabpage,
  " open it
  "if bufwinnr(a:pat) == -1
  let l:matchlist = filter(map(
        \ tabpagebuflist(), "bufname(v:val)"), 'v:val =~ "' . a:pat . '"')
  if empty(l:matchlist)
    "ignore events while opening the window
    let l:oldEvents = &eventignore
    let &eventignore = 
      \ "BufNewFile,BufReadPre,BufRead,BufReadPost,BufReadCmd,FileReadPre," .
      \ "FileReadPost,FileReadCmd,FilterReadPre,FilterReadPost,StdinReadPre," .
      \ "StdinReadPost,BufWrite,BufWritePre,BufWritePost,BufWriteCmd," .
      \ "FileWritePre,FileWritePost,FileWriteCmd,FileAppendPre,FileAppendPost," .
      \ "FileAppendCmd,FilterWritePre,FilterWritePost,BufAdd,BufCreate," .
      \ "BufDelete,BufWipeout,BufFilePre,BufFilePost,BufEnter,BufLeave," .
      \ "BufWinEnter,BufWinLeave,BufUnload,BufHidden,BufNew,SwapExists," .
      \ "FileChangedShell,FileChangedShellPost,FileChangedRO,ShellCmdPost," .
      \ "ShellFilterPost,SourcePre,SourceCmd,CursorHold,CursorHoldI," .
      \ "CursorMoved,CursorMovedI,WinEnter,WinLeave,TabEnter,TabLeave," .
      \ "CmdwinEnter,CmdwinLeave,InsertEnter,InsertChange,InsertLeave," .
      \ "InsertCharPre,QuickFixCmdPre,QuickFixCmdPost,SessionLoadPost"

    " Split the window
    if a:height != 0
      exec 'silent ' . a:pos . ' ' . a:height . 'split ' . l:name
    elseif a:width != 0
      exec 'silent ' . a:pos . ' ' . a:width . 'split ' . l:name
    else
      exec 'silent ' . a:pos . ' split ' . l:name
    endif

    " Set the local options for the new window that has been created
    "setlocal winfixheight
    "setlocal winfixwidth
    setlocal nobuflisted
    setlocal buftype=nofile
    setlocal bufhidden=wipe
    setlocal noswapfile

    " execute the specified command
    exec a:cmd

    " Return to the previous window
    if winbufnr(l:curWin) != l:curBuf
      exec bufwinnr(l:curBuf) . 'wincmd w'
    else
      exec l:curWin . 'wincmd w'
    endif

    "un ignore events 
    let &eventignore=l:oldEvents
    unlet l:oldEvents
  endif
endfunction

" To open a NERDTree-like directory browsing window with netrw (NERDTree tends 
" to try and be too smart to get it to play well with my plugins), 
"autocmd User BufViewerOpen call OpenHiddenWindow(
"      \ 'leftabove', 'NetrwTreeListing*', ':Explore', (&lines - 16), 0) |
"      \ setlocal winfixheight
"autocmd User BufViewerClose wincmd k | q

"let g:BufViewerWindowPosition = 'rightbelow'

" To force the bufviewer to open below the TagsParser window, we must register 
" an autocommand that when a __tags__ window is entered, if the BufViewer is not 
" visible then it should be opened.
"autocmd User TagsParserOpen call BufViewer#Open()
"autocmd User TagsParserClose call BufViewer#Close()

" TODO: tabe did not cause the TagsParser and BufViewer windows to play nice.

" There should be no special commands necessary when closing the BufViewer 
" window.
"let g:BufViewerCloseExecuteCommand =
"      \ 'call CurTabBufFindExec(".*_NERD_tree_$", "bwipeout") | ' .
"      \ 'call ViewBufNotFoundExec("^__buffers__$", "let &columns -= 41")'

" There should be no special commands necessary when restoring a session.
"let g:BufViewerSessionLoadPostCommand =
"      \ 'call BufFindBufCmdExec(".*_NERD_tree_$", "bwipeout") | ' .
"      \ 'let g:ResizeOverride = 1'

" Function that executes a command if buffer is not found being viewed in any 
" tab.
function! ViewBufNotFoundExec(pat, cmd)
  " Find all the buffers being viewed in all tabs
  let l:buflist = [ ]
  for l:tabnum in range(1, tabpagenr("$"))
    call extend(l:buflist, tabpagebuflist(l:tabnum))
  endfor

  " See if any of the buffers match our target pattern.
  let l:found = 0
  for l:bufnum in l:buflist
    if bufname(l:bufnum) =~ a:pat
      " A buffer is found, set the found flag and quit.
      let l:found = 1
      break
    endif
  endfor

  " If nothing was found, execute the command.
  if l:found == 0
    exec a:cmd
  endif
endfunction " function! ViewBufNotFoundExec(pat, cmd)

" function that goes through all buffers, and if it finds one that matches the 
" specified pattern, the command is executed.
function! BufFindBufCmdExec(pat, cmd)
  for l:bufnum in range(1, bufnr("$"))
    if bufexists(l:bufnum) && bufname(l:bufnum) =~ a:pat
      " execute the specified buffer command
      exec l:bufnum . a:cmd
    endif
  endfor
endfunction " function! BufFindBufCmdExec(path, cmd)

" function that finds a buffer in the current tab, and executes a command in 
" each window that contains that buffer (if it is found).
function! CurTabBufFindExec(pat, cmd)
  " Search all buffers in the current tab.
  for l:bufnum in tabpagebuflist()
    if bufname(l:bufnum) =~ a:pat
     " A match was found, move to that window, execute the command and then go 
     " back to the previous window.
      exec bufwinnr(l:bufnum) . "wincmd w"
      exec a:cmd
      wincmd p
    endif
  endfor
endfunction " function! CurTabBufFindExec(pat, cmd)

" vim:ts=2:sts=2:sw=2
