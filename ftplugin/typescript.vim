" Contents should be identical for javascript, typescript - not creating
" symlinks to make it compatible for potential Windows users.
function! s:DebugStringFun()
    let l:debug_str = 'console.log("' . g:DebugstringPrefixStr()  . g:debugStringCounter . '");'
    :return l:debug_str
endfunc

function! s:DebugVarFun(desc, var)
    let l:debug_str = 'console.log(`' . a:desc . '`, ' . a:var . ')'
    return l:debug_str
endfunc


command! -buffer -nargs=0 AddDebugString put=s:DebugStringFun()
command! -buffer -nargs=1 AddDebugStringExpr
            \ put=s:DebugVarFun(<args> . ': ', <args>)
