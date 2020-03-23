let g:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

function! s:DebugStringFun(desc, ...)
    execute 'source ' . g:path . '/common/sh_like.vim'
    let b:res = ""
    if len(a:000) ==# 0
        let b:res = DebugStringFunShellBase(a:desc)
    else
        let b:res = DebugStringFunShellBase(a:desc, a:1)
    endif
    return "RUN " . b:res
endfunc

command! -buffer -nargs=0 AddDebugString
            \ put=s:DebugStringFun(g:DebugstringPrefixStr() . g:debugStringCounter)
command! -buffer -nargs=1 AddDebugStringExpr
            \ put=s:DebugStringFun(<args> . ': ', <args>)

