let g:debugstring_loaded_cpp_vim = 1

let g:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
execute 'source ' . g:path . '/common/c_like.vim'

function! s:DebugStringFun()
    put=DebugStringFunC()
endfunc

function! s:DebugStringFunExpr(expr)
    let l:debugStr = 'std::cout << "' . g:DebugstringPrefixStr()
                \ . a:expr . '"' . ' << '
                \ . a:expr
                \ . ' << '
                \ . 'std::endl;'

    if g:debugstringAlwaysIncludeHeader
        let l:incStr = '#include <iostream>; '
        let l:debugStr = l:incStr . l:debugStr
    endif

    put=l:debugStr
endfunc

command -buffer -nargs=0 AddDebugString :call s:DebugStringFun()
command -buffer -nargs=1 AddDebugStringExpr :call s:DebugStringFunExpr(<args>)
