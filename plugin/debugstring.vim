" debugstring.vim - A Git wrapper so awesome, it should be illegal
" Maintainer:   Nikos Koukis <http://bergercookie.github.io/>
" Version:      0.1

" if exists("g:loaded_debugstring") || &cp
"   finish
" endif
" let g:loaded_debugstring = 1

let s:save_cpo = &cpo
set cpo&vim

let g:debugCnt = 0

" Debug string - Vim {{{
function! s:debugVim()
    :put a
endfunc
" }}}

" Debug string - C/C++ {{{
function! s:debugC()
    let l:debugStr = "std::cout << \"TODO - Remove me. Kalimera ==> \""
    let l:debugBoth = l:debugStr . " << " . g:debugCnt .   " << std::endl;"
    :put=l:debugBoth
    let g:debugCnt = g:debugCnt + 1
endfunc
" }}}

" Debug string - Python {{{
function! s:debugPython()
    :put c
endfunc
" }}}

" Debug string - Ruby {{{

" }}}

" Debug string - Shell {{{

" }}}


" TODO - Method to delete all the debugging strings

" TODO - In current buffer

" TODO - In all open buffers

" TODO - How can somebody easily change the shortcut key?
augroup debugstring_mappings
    autocmd!
    autocmd Filetype vim nnoremap <buffer> <Plug>DumpDebugString  :call s:debugVim()<CR>
    autocmd Filetype c,cpp nnoremap <buffer> <Plug>DumpDebugString :call s:debugC()<CR>
    autocmd Filetype python nnoremap <buffer> <Plug>DumpDebugString  :call s:debugPython()<CR>
augroup END

" Make the mapping only if the user hasn't done so already
"e.g,  map ,c  <Plug>DumpDebugMessage
if !hasmapto('<Plug>DumpDebugString')
  nmap <unique> <Leader>ds  <Plug>DumpDebugString
endif

let &cpo = s:save_cpo
unlet s:save_cpo

