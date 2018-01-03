let g:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
execute 'source ' . g:path . '/common/c_like.vim'

function! DebugStringFun()
    put=DebugStringFunC()
endfunc

function! DebugStringFunExpr(expr)
    let l:debugStr = 'std::cout << "' . g:DebugstringPrefixStr()
                \ . a:expr . '"' . ' << '
                \ . a:expr
                \ . ' << '
                \ . 'std::endl;'

    if g:debugstringAlwaysIncludeHeader
        let l:incStr = '#include <iostream>; '
        let l:debugStr = l:incStr . l:debugStr
    endif

    return l:debugStr
endfunc
