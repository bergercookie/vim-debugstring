let g:debugstring_loaded_cpp_vim = 1

function! s:DebugStringFunBase(desc, var)
    " Escape quotes in description
    let l:desc = a:desc
    if stridx('"', l:desc)
        let l:desc = substitute(l:desc, '"', '\\"', "g")
    endif

    let l:debug_str = 'std::cout << "' . l:desc
                \ . '" << '
                \ . a:var
                \ . ' << '
                \ . 'std::endl;'

    return l:debug_str
endfunc

command! -buffer -nargs=0 AddDebugString
            \ put=s:DebugStringFunBase(g:DebugstringPrefixStr(), g:debugStringCounter)
command! -buffer -nargs=1 AddDebugStringExpr
            \ put=s:DebugStringFunBase(<args> . ': ', <args>)
