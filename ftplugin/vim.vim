function! DebugStringFun()
    let l:debugStr = "echo '" . g:DebugstringPrefixStr() . g:debugStringCounter . "'"
    put=l:debugStr
endfunc


