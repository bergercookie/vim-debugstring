function! s:DebugStringFun()
    let l:debugStr = '<script>alert( ' . g:DebugstringPrefixStr()  . g:debugStringCounter . '); </script>'
    :put=l:debugStr
endfunc

command -buffer -nargs=0 AddDebugString :call s:DebugStringFun()
