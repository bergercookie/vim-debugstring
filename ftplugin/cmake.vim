function! s:DebugStringFunBase()
endfunc

function! s:DebugStringFun()
    let l:debug_str = "message(\"STATUS " . g:DebugstringPrefixStr() . g:debugStringCounter . "\")"
    return l:debug_str
endfunc

command -buffer -nargs=0 GetDebugString :call s:DebugStringFun()
" command -buffer -nargs=1 GetDebugStringExpr :call s:DebugStringFunExpr(<args>)

