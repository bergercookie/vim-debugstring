function! s:DebugStringFun()
    let l:debug_str = 'console.log("' . g:DebugstringPrefixStr()  . g:debugStringCounter . '");'
    :return l:debug_str
endfunc

command! -buffer -nargs=0 AddDebugString put=s:DebugStringFun()
