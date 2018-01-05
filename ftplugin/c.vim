if exists('g:debugstring_loaded_cpp_vim')
  finish
endif

let g:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
execute 'source ' . g:path . '/common/c_like.vim'

function! s:DebugStringFun()
    put=DebugStringFunC()
endfunc

command -buffer -nargs=0 AddDebugString :call s:DebugStringFun()
