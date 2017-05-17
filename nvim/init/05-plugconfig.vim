" Base file for plugin configuration
" Will be split into separate files as necessary


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
nnoremap <silent> <leader>f :Denite -start-insert buffer file_rec<CR>
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-y>', '<denite:choose_action>', 'noremap')
