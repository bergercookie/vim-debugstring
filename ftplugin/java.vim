function! s:DebugStringFun()
    let l:debug_str = "System.out.println(\"" . g:DebugstringPrefixStr() . g:debugStringCounter . "\");"
    return l:debug_str
endfunc

command -buffer -nargs=0 GetDebugString :call s:DebugStringFun()
