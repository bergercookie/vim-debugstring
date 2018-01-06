function! s:DebugStringFun()
    let l:debug_str = 'message(STATUS "' . g:DebugstringPrefixStr() . g:debugStringCounter . '")'
    return l:debug_str
endfunc

function! s:DebugStringFunExpr(expr)
    let l:debug_str = 'message(STATUS ' . '"'
                \ . a:expr . ': '
                \ . '${' . a:expr . '}'
                \ . '")'
    return l:debug_str
endfunc

command -buffer -nargs=0 AddDebugString put=s:DebugStringFun()
command -buffer -nargs=1 AddDebugStringExpr put=s:DebugStringFunExpr(<args>)

