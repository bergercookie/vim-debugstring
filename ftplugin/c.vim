if exists('g:debugstring_loaded_cpp_vim')
  finish
endif

function! s:DebugStringFunBase(desc, var)
    let l:debug_str = "printf(\"" . a:desc . "%d\\n\", " . a:var . ");"

    if g:debugstringAlwaysIncludeHeader
        let l:incStr = '#include <stdio.h>; '
        let l:debug_str = l:incStr . l:debug_str
    endif

    return l:debug_str
endfunc

command! -buffer -nargs=0 AddDebugString
            \ put=s:DebugStringFunBase(g:DebugstringPrefixStr(), g:debugStringCounter)
command! -buffer -nargs=1 AddDebugStringExpr
            \ put=s:DebugStringFunBase(<args> . ': ', <args>)
