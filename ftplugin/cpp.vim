let g:debugstring_loaded_cpp_vim = 1

let g:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
execute 'source ' . g:path . '/common/c_like.vim'

function! s:DebugStringFun()
    return DebugStringFunC()
endfunc

function! s:DebugStringFunExpr(expr)
    let l:debug_str = 'std::cout << "' . g:DebugstringPrefixStr()
                \ . a:expr . '"' . ' << '
                \ . a:expr
                \ . ' << '
                \ . 'std::endl;'

    if g:debugstringAlwaysIncludeHeader
        let l:incStr = '#include <iostream>; '
        let l:debug_str = l:incStr . l:debug_str
    endif

    return l:debug_str
endfunc

command! -buffer -nargs=0 AddDebugString :put=s:DebugStringFun()
command! -buffer -nargs=1 AddDebugStringExpr :put=s:DebugStringFunExpr(<args>)

