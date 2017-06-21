" neovim-qt config

" set gui font
" Liberation Mono won't install on Windows
if has("win32")
  Guifont Fira Mono for Powerline:h10
else
  Guifont Liberation Mono for Powerline:h9
endif


" use true colors in qt
set termguicolors
"colorscheme base16-tomorrow-night
colorscheme base16-apathy
