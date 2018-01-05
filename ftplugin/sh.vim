let g:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

function! s:DebugStringFun()
    execute 'source ' . g:path . '/common/sh_like.vim'
    put=DebugStringFunShell()
endfunc

command -buffer -nargs=0 AddDebugString :call s:DebugStringFun()
