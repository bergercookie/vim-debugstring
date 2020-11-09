let g:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

function! s:DebugStringFun(desc, ...)
    execute 'source ' . g:path . '/common/sh_like.vim'
    if len(a:000) ==# 0
        return DebugStringFunShellBase(a:desc)
    else
        return DebugStringFunShellBase(a:desc, a:1)
    endif
endfunc

command! -buffer -nargs=0 AddDebugString
            \ put=s:DebugStringFun(g:DebugstringPrefixStr() . g:debugStringCounter)
command! -buffer -nargs=1 AddDebugStringExpr
            \ put=s:DebugStringFun(<args> . ': ', <args>)
