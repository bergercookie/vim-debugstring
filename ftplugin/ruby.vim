function! DebugStringFun()
    let l:debugStr = "puts \"" . g:DebugstringPrefixStr() . g:debugStringCounter . "\""
    put=l:debugStr
endfunc

