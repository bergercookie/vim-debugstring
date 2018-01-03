function! DebugStringFun()
    let l:debugStr = "putStrLn \"" . g:DebugstringPrefixStr() . g:debugStringCounter . "\""
    put=l:debugStr
endfunc

