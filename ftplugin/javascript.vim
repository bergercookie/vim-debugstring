function! s:DebugStringFun()
    let l:debug_str = '<script>alert( ' . g:DebugstringPrefixStr()  . g:debugStringCounter . '); </script>'
    :return l:debug_str
endfunc

command -buffer -nargs=0 GetDebugString :call s:DebugStringFun()
