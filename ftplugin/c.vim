let g:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
execute 'source ' . g:path . '/common/c_like.vim'

function! DebugStringFun()
    put=DebugStringFunC()
endfunc

" function! DebugStringFunExpr(expr)
"     echoerr fnamemodify(bufname('%'), ':t') . ': ' .
"                 \'DebugStringFunExpr not implemented yet.'
" endfunc

