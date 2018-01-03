let g:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

function! DebugStringFun()
    execute 'source ' . g:path . '/common/py_like.vim'
    put=DebugStringFunPython()
endfunc

