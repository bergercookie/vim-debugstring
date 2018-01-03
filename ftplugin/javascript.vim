function! DebugStringFun()
    let l:debugStr = '<script>alert( ' . g:DebugstringPrefixStr()  . g:debugStringCounter . '); </script>'
    :put=l:debugStr
endfunc

