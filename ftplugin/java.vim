function! DebugStringFun()
    let l:debugStr = "System.out.println(\"" . g:DebugstringPrefixStr() . g:debugStringCounter . "\");"
    put=l:debugStr
endfunc

