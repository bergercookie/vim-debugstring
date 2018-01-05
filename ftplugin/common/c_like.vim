if exists('g:loaded_c_like')
  finish
endif
let g:loaded_c_like = 1

function! DebugStringFunC()
    let l:debugStr = "repeat(" ", indent(".")) . printf(\"" . g:DebugstringPrefixStr() . g:debugStringCounter . "\\n\");"

    if g:debugstringAlwaysIncludeHeader
        let l:incStr = '#include <stdio.h>; '
        let l:debugStr = l:incStr . l:debugStr
    endif

    return l:debugStr
endfunc

