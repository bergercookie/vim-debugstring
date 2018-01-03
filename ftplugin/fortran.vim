function! DebugStringFun()
    let l:debugStr = "PRINT *, \"" . g:DebugstringPrefixStr() . g:debugStringCounter . "\""
    put=l:debugStr
endfunc

