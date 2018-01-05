if exists('g:loaded_sh_like')
  finish
endif
let g:loaded_sh_like = 1

function! DebugStringFunShell()
    let l:debug_str = "echo \"" . g:DebugstringPrefixStr() . g:debugStringCounter . "\";"
    return l:debug_str
endfunc

