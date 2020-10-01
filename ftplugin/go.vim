function! s:DebugStringFunBase(desc, var)
    let l:debug_str = "fmt.Printf(\"" . a:desc . "%+v\\n\", " . a:var . ")"
    return l:debug_str
endfunc

command! -buffer -nargs=0 AddDebugString
            \ put=s:DebugStringFunBase(g:DebugstringPrefixStr(), g:debugStringCounter)
command! -buffer -nargs=1 AddDebugStringExpr
            \ put=s:DebugStringFunBase(<args> . ': ', <args>)
