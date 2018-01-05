function! s:DebugStringFunBase()
endfunc

function! s:DebugStringFun()
    let l:debugStr = "message(\"STATUS " . g:DebugstringPrefixStr() . g:debugStringCounter . "\")"
    put=l:debugStr
endfunc

command -buffer -nargs=0 AddDebugString :call s:DebugStringFun()
" command -buffer -nargs=1 AddDebugStringExpr :call s:DebugStringFunExpr(<args>)

