let g:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

function! s:DebugStringFun(desc, ...)
    let l:debug_str = 'echo "' . a:desc
    if len(a:000) ==# 1
        let l:debug_str .= ' $' . a:1
    endif
    let l:debug_str .= '"'
    return l:debug_str
endfunc

command! -buffer -nargs=0 AddDebugString
            \ put=s:DebugStringFun(g:DebugstringPrefixStr() . g:debugStringCounter)
command! -buffer -nargs=1 AddDebugStringExpr
            \ put=s:DebugStringFun(<args> . ': ', <args>)
