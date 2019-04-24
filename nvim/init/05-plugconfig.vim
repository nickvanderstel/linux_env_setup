" Base file for plugin configuration
" Will be split into separate files as necessary


" airline specific config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#obsession#enabled = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab


" deoplete specific config
let g:deoplete#enable_at_startup = 1


" whitespace options
let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1
let g:strip_whitespace_confirm = 0


" VIP options
let g:sigPrefix_VIP = ""
let g:instPrefix_VIP = "u_"
let g:instSuffix_VIP = ""


" Tabular aliases
command! -range Tassign Tabularize /<=/l1r1
command! -range Tsignal Tabularize /^[^:]*\zs:/l1r1 <bar> Tabularize /:=/l1r1


" syntastic options
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_vhd_checkers = ["vcom"]
let g:syntastic_vhdl_checkers = ["vcom"]

" Denite options
nnoremap <silent> <leader>uf :<C-u>Denite buffer<CR>
nnoremap <silent> <leader>of :Denite -start-insert buffer file_rec<CR>
nnoremap <silent> <leader>tg :<C-u>Denite tag<CR>
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-y>', '<denite:choose_action>', 'noremap')


"call denite#custom#source('file,file/new,buffer,file_rec,line', 'matchers', 'matcher_fuzzy')
"nnoremap <leader>fs :<C-u>Denite -buffer-name=search -start-insert line<cr>


"call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
"nnoremap <leader>fs :Denite grep:`systemlist('pwd')[0]`<CR>


" base16 options
colorscheme base16-tomorrow-night

" vimtext
let g:polyglot_disabled = ['latex']
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0

let g:vimtex_view_general_viewer = 'qpdfview'
let g:vimtex_view_general_options = '--unique @pdf\#src:@tex:@line:@col'
let g:vimtex_view_general_options_latexmk = '--unique'
