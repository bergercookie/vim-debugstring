" debugstring.vim - Debug, printf()-style, at the speed of light
" Maintainer:   Nikos Koukis <http://bergercookie.github.io/>
" Version:      0.1



""
" @section Introduction, intro
"
"
" @plugin(name) aims to automate standard debugging operations (e.g.,
" segfaults). It does that by facilitating the ubiquitous printf()-debugging
" i.e., scatter logging statements around the various code snippets that you
" want to test.
"
" The form and syntax of the logging statements target the language at hand
" (e.g., use printf() in C/C++ but puts() in Ruby)

""
" @section Configuration, config
" To add a logging statement either use the default normal mode mapping
" (@setting(default_dump_debug_map)) or define your own
"
" nmap <your-key-combination> <Plug>DumpDebugString

""
" @section Functions
"
" Each debug* method supports one (or a family of) programming languages. This
" way it takes care of the different logging directives + different syntaxes.
"
" If you want to extend @plugin(name) for language not yet suppoprted you just
" have to implement a corresponding s:debug* method and also add a line for that
" language in the @setting(debugstring_mappings) group
"


""
" @section About
"
" Original version of this package is written by Nikos Koukis - bergercookie
"
"     https://github.com/bergercookie
"
" * Thanks to Steve Losh for writing the excellent book "Learn Vimscript the
"     Hard Way". If that helped you as much as it helped me seriously consider
"     buying either the e-book or paperback version of it.
"
"     http://learnvimscriptthehardway.stevelosh.com/
"
" * Thanks to tpope for providing so much quality vimscript code to work with
"     and get constant inspiration from while writing this
"
"     https://github.com/tpope/
"


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

" By default debugging lines should be of the form <directive_to_print> " <prefix_string><debug_number>
let s:debugPrefixStr =
            \ "[" . fnamemodify(bufname("%"), ":t") .
            \ ":" .  getcurpos()[1] .
            \ "] DEBUGGING STRING ==> "

" Supplementary functions {{{
""
" Reset the debugging counter.
"
function! s:resetDebugCounter()
    let s:debugCounter = 0
endfunc

""
" Reset the debugging counter
"
command -nargs=0 ResetDebugCounter :call <SID>resetDebugCounter()

""
" Increment the debugging counter
" This is called automaticall every time a debug* method is used
"
function! s:incrDebugCounter()
    let s:debugCounter += s:debugCounterStep
endfunc " }}}

if !hasmapto('<Plug>DumpDebugString')
    ""@setting default_dump_debug_map
    "
    nmap <unique> <Leader>ds  <Plug>DumpDebugString
endif
""
" Set this to false if you want to print just the logging statement without any
" additional directive like '#include <stsdio.h'
" Applicable only in libraries that the logging directive is part of an external
" library
"
let g:debugstringAlwaysIncludeHeader = 0 " Include Header in place?


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

""
" Wrapper around the low-level debug* methods.
" It also takes care of incrementing the g:debugCounter
"
function! s:debugFunctionWrapper(debugFn)
    let b:winvar = winsaveview()

    " call the corresponding function
    let s:processing = function(a:debugFn)
    let @x = s:processing()

    " increase the counter
    call s:incrDebugCounter()

    call winrestview(b:winvar)

    " directly move to the next line
    return getcurpos()[1] + 2
endfunc " }}}


""
" Autocommands group containing the mappings of <Plug>DumpDebugString method for
" the cases that @plugin(name) supports
"
" @setting debugstring_mappings
"
augroup debugstring_mappings
    autocmd!
    autocmd Filetype vim nnoremap        <buffer> <silent>
                \ <Plug>DumpDebugString  :<C-U>exe <SID>debugFunctionWrapper("s:debugVim")<CR>
    autocmd Filetype c,cpp nnoremap      <buffer> <silent>
                \ <Plug>DumpDebugString  :<C-U>exe <SID>debugFunctionWrapper("s:debugC")<CR>
    autocmd Filetype python nnoremap     <buffer> <silent>
                \ <Plug>DumpDebugString  :<C-U>exe <SID>debugFunctionWrapper("s:debugPython")<CR>
    autocmd Filetype haskell nnoremap    <buffer> <silent>
                \ <Plug>DumpDebugString  :<C-U>exe <SID>debugFunctionWrapper("s:debugHaskell")<CR>
    autocmd Filetype ruby nnoremap       <buffer> <silent>
                \ <Plug>DumpDebugString  :<C-U>exe <SID>debugFunctionWrapper("s:debugRuby")<CR>
    autocmd Filetype sh nnoremap      <buffer> <silent>
                \ <Plug>DumpDebugString  :<C-U>exe <SID>debugFunctionWrapper("s:debugShell")<CR>
    autocmd Filetype fortran nnoremap    <buffer> <silent>
                \ <Plug>DumpDebugString  :<C-U>exe <SID>debugFunctionWrapper("s:debugFortran")<CR>
    autocmd Filetype java nnoremap       <buffer> <silent>
                \ <Plug>DumpDebugString  :<C-U>exe <SID>debugFunctionWrapper("s:debugJava")<CR>
    autocmd Filetype javascript nnoremap <buffer> <silent>
                \ <Plug>DumpDebugString  :<C-U>exe <SID>debugFunctionWrapper("s:debugJavascript")<CR>
    autocmd Filetype php nnoremap        <buffer> <silent>
                \ <Plug>DumpDebugString  :<C-U>exe <SID>debugFunctionWrapper("s:debugPhp")<CR>
    autocmd Filetype R nnoremap          <buffer> <silent>
                \ <Plug>DumpDebugString  :<C-U>exe <SID>debugFunctionWrapper("s:debugR")<CR>
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo

