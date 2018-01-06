let g:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

function! s:DebugStringFun()
    execute 'source ' . g:path . '/common/sh_like.vim'
    return DebugStringFunShell()
endfunc

command -buffer -nargs=0 AddDebugString put=s:DebugStringFun()
