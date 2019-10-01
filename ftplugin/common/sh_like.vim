if exists('g:loaded_sh_like')
  finish
endif
let g:loaded_sh_like = 1

function! DebugStringFunShellBase(desc, ...)
    let l:debug_str = 'echo "' . a:desc
    if len(a:000) ==# 1
        let l:debug_str .= ' ${' . a:1 . '}'
    endif

    let l:debug_str .= '"'
    return l:debug_str
endfunc
