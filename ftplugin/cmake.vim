function! DebugStringFun()
    let l:debugStr = "message(\"STATUS " . g:DebugstringPrefixStr() . g:debugStringCounter . "\")"
    put=l:debugStr
endfunc

