let g:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

function! DebugStringFun()
    execute 'source ' . g:path . '/common/sh_like.vim'
    put=DebugStringFunShell()
endfunc

