" neovim-qt config

GuiTabline 0

" set gui font
" Liberation Mono won't install on Windows
"if has("win32")
"  Guifont Fira Mono for Powerline:h10
"else
"  Guifont Liberation Mono for Powerline:h9
"endif
Guifont! Literation Mono Powerline:h11
"Guifont Fira Mono for Powerline:h11
"Guifont Liberation Mono for Powerline:h9

" use true colors in qt
set termguicolors
colorscheme PerfectDark
