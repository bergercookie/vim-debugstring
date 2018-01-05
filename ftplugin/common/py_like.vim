if exists('g:loaded_py_like')
  finish
endif
let g:loaded_py_like = 1

function! DebugStringFunPython()
    let l:debug_str = "print(\"" . g:DebugstringPrefixStr() . g:debugStringCounter . "\")"
    return l:debug_str
endfunc

