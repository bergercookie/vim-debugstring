if exists('g:loaded_c_like')
  finish
endif
let g:loaded_c_like = 1

function! DebugStringFunC()
    let l:debug_str = "printf(\"" . g:DebugstringPrefixStr() . g:debugStringCounter . "\\n\");"

    if g:debugstringAlwaysIncludeHeader
        let l:incStr = '#include <stdio.h>; '
        let l:debug_str = l:incStr . l:debug_str
    endif

    return l:debug_str
endfunc

