
" Vim configuration loader
" Based on TJ DeVries config

let g:_vimrc_base = expand('<sfile>:p:h')
let g:_vimrc_sources = get(g:, '_vimrc_sources', {})

" Source all scripts in a directory
function! s:source(dir) abort
  " Onlysource files that have the `.vim` extension
  for filename in sort(glob(g:_vimrc_base.'/'.a:dir.'/*.vim', 0, 1))
    let mtime = getftime(filename)
    if !has_key(g:_vimrc_sources, filename) || g:_vimrc_sources[filename] < mtime
      let g:_vimrc_sources[filename] = mtime
      execute 'source '.filename
    endif
  endfor
endfunction

call s:source('init')
