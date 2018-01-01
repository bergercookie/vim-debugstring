" debugstring.vim - A Git wrapper so awesome, it should be illegal
" Maintainer:   Nikos Koukis <http://bergercookie.github.io/>
" Version:      0.1

" Introductory moves {{{
" if exists("g:loaded_debugstring") || &cp
"   finish
" endif
" let g:loaded_debugstring = 1

let s:save_cpo = &cpo
set cpo&vim
" }}}

let s:debugCounter = 0
let s:debugCounterStep = 1

" Debugging lines should be of the form <directive_to_print> " <prefix_string><debug_number>
let s:debugPrefixStr =
            \ "[" . fnamemodify(bufname("%"), ":t") .
            \ ":" .  getcurpos()[1] .
            \ "] DEBUGGING STRING ==> "

function! g:ResetDebugCounter()
    let s:debugCounter = 0
endfunc " }}}

function! s:incrDebugCounter()
    let s:debugCounter += s:debugCounterStep
endfunc " }}}

if !hasmapto('<Plug>DumpDebugString')
  nmap <unique> <Leader>ds  <Plug>DumpDebugString
endif
let g:debugstringAlwaysIncludeHeader = 1 " Include Header in place?


" Debug string - Vim {{{
function! s:debugVim()
    let l:debugStr = "echo \"" . s:debugPrefixStr . s:debugCounter . "\""
    :put=l:debugStr
endfunc " }}}

" Debug string - C/C++ {{{
function! s:debugC()
    let l:debugStr = "printf(\"" . s:debugPrefixStr . s:debugCounter . "\");"

    if g:debugstringAlwaysIncludeHeader
        let l:incStr = "#include <stdio.h>; "
        let l:debugStr = l:incStr . l:debugStr
    endif

    :put=l:debugStr
endfunc " }}}

" Debug string - Python {{{
function! s:debugPython()
    let l:debugStr = "print(\"" . s:debugPrefixStr . s:debugCounter . "\")"
    :put=l:debugStr
endfunc " }}}

" Debug string - Haskell {{{
function! s:debugHaskell()
    let l:debugStr = "putStrLn \"" . s:debugPrefixStr . s:debugCounter . "\""
    :put=l:debugStr
endfunc " }}}

" Debug string - Ruby {{{
function! s:debugRuby()
    let l:debugStr = "puts \"" . s:debugPrefixStr . s:debugCounter . "\""
    :put=l:debugStr
endfunc " }}}

" Debug string - Shell {{{
function! s:debugShell()
    let l:debugStr = "echo \"" . s:debugPrefixStr . s:debugCounter . "\";"
    :put=l:debugStr
endfunc " }}}

" Debug string - R {{{
function! s:debugR()
    call s:debugPython()
endfunc " }}}

" Debug string - Fortran {{{
function! s:debugFortran()
    let l:debugStr = "PRINT *, \"" . s:debugPrefixStr . s:debugCounter . "\""
    :put=l:debugStr
endfunc " }}}

" Debug string - Java {{{
function! s:debugJava()
    let l:debugStr = "System.out.println(\"" . s:debugPrefixStr . s:debugCounter . "\");"
    :put=l:debugStr
endfunc " }}}

" Debug string - Javascript {{{

function! s:debugJavascript()
    let l:debugStr = "<script>alert( " . s:debugPrefixStr . s:debugCounter . "); </script>"
    :put=l:debugStr
endfunc " }}}

" Debug string - PHP {{{
function! s:debugPhp()
    call s:debugShell()
endfunc " }}}

function! s:debugFunctionWrapper(debugFn)
    " call the corresponding function
    let s:processing = function(a:debugFn)
    let @x = s:processing()

    " increase the counter
    :call s:incrDebugCounter()
endfunc " }}}


" TODO - Method to delete all the debugging strings

" TODO - In current buffer

" TODO - In all open buffers

augroup debugstring_mappings
    autocmd!
    autocmd Filetype vim nnoremap <buffer> <Plug>DumpDebugString  :<C-U>exe <SID>debugFunctionWrapper("s:debugVim")<CR>
    autocmd Filetype c,cpp nnoremap <buffer> <Plug>DumpDebugString :<C-U>exe <SID>debugFunctionWrapper("s:debugC")<CR>
    autocmd Filetype python nnoremap <buffer> <Plug>DumpDebugString  :<C-U>exe <SID>debugFunctionWrapper("s:debugPython")<CR>
    autocmd Filetype haskell nnoremap <buffer> <Plug>DumpDebugString  :<C-U>exe <SID>debugFunctionWrapper("s:debugHaskell")<CR>
    autocmd Filetype ruby nnoremap <buffer> <Plug>DumpDebugString  :<C-U>exe <SID>debugFunctionWrapper("s:debugRuby")<CR>
    autocmd Filetype shell nnoremap <buffer> <Plug>DumpDebugString  :<C-U>exe <SID>debugFunctionWrapper("s:debugShell")<CR>
    autocmd Filetype fortran nnoremap <buffer> <Plug>DumpDebugString  :<C-U>exe <SID>debugFunctionWrapper("s:debugFortran")<CR>
    autocmd Filetype java nnoremap <buffer> <Plug>DumpDebugString  :<C-U>exe <SID>debugFunctionWrapper("s:debugJava")<CR>
    autocmd Filetype javascript nnoremap <buffer> <Plug>DumpDebugString  :<C-U>exe <SID>debugFunctionWrapper("s:debugJavascript")<CR>
    autocmd Filetype php nnoremap <buffer> <Plug>DumpDebugString  :<C-U>exe <SID>debugFunctionWrapper("s:debugPhp")<CR>
    autocmd Filetype R nnoremap <buffer> <Plug>DumpDebugString  :<C-U>exe <SID>debugFunctionWrapper("s:debugR")<CR>
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo

