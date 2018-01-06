" debugstring.vim - Debug, printf()-style, at the speed of light
" Maintainer: Nikos Koukis <http://bergercookie.github.io/>
" Version:    0.1


" TODO: Add option for variable debugging
" Make the counter buffer-specific
" Escape double single quotes vimscript variable printing
" TODO - Append to current line if that is empty


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
if exists('g:loaded_debugstring') || &compatible
  finish
endif
let g:loaded_debugstring = 1

let s:save_cpo = &cpoptions
set cpoptions&vim
" }}}
"
let s:modes = {
            \ 'std_debug': 0,
            \ 'var_debug': 1,
            \}


let g:debugStringCounter = 0
let g:debugStringCounterStep = 1

" By default debugging lines should be of the form <directive_to_print> " <prefix_string><debug_number>
function! g:DebugstringPrefixStr()
  let l:debug_str =
        \ '[' . fnamemodify(bufname('%'), ':t') .
        \ ':' .  getcurpos()[1] .
        \ '] DEBUGGING STRING ==> '
  return l:debug_str
endfunc

" Supplementary functions {{{
""
" Reset the debugging counter.
"
function! s:resetDebugCounter()
    let g:debugStringCounter = 0
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
    let g:debugStringCounter += g:debugStringCounterStep
endfunc

if !hasmapto('<Plug>DumpDebugString')
    ""@setting default_dump_debug_map
    "
    nmap <unique> <Leader>ds  <Plug>DumpDebugString
    ""@setting default_dump_debug_map
    "
    nmap <unique> <Leader>dS  <Plug>DumpDebugStringExpr
endif
""
" Set this to false if you want to print just the logging statement without any
" additional directive like '#include <stsdio.h'
" Applicable only in libraries that the logging directive is part of an external
" library
"
let g:debugstringAlwaysIncludeHeader = 0 " Include Header in place?

" Wrapper around the low-level debug* methods.
" It also takes care of incrementing the g:debugCounter
"
function! s:debugFunctionWrapper(mode)
    let l:prev_pos = getcurpos()

    let l:append_at_same_line = 0
    if getline('.') =~# "^$" " Empty line
        let l:append_at_same_line = 1
    endif

    if a:mode ==# s:modes['std_debug']
        if !exists(':AddDebugString')
            echoerr "Command AddDebugString isn't implemented for filetype \"" . &filetype . "\""
            return 0
        endif

        AddDebugString

    elseif a:mode ==# s:modes['var_debug']
        if !exists(':AddDebugStringExpr')
            echoerr "Command AddDebugStringExpr isn't implemented for filetype \"" . &filetype . "\""
            return 0
        endif
        let l:expr = input("Input Expression: ")
        AddDebugStringExpr(l:expr)
    else
        echoerr 's:debugFunctionWrapper - Unknown mode: ' a:mode
        return 0
    endif

    " correct indentation level
    " normal ==

    call s:incrDebugCounter() " increase the counter

    let l:new_pos = l:prev_pos
    if l:append_at_same_line
        " move them to previous line
        normal! kJ
        let l:new_pos[1] += 1
    else
        let l:new_pos[1] += 2 " go directly to the next line
    endif
    call setpos('.', l:new_pos)
endfunc

nnoremap <silent> <Plug>DumpDebugString :<C-U> :call <SID>debugFunctionWrapper(0)<CR>
nnoremap <silent> <Plug>DumpDebugStringExpr :<C-U> :call <SID>debugFunctionWrapper(1)<CR>

let &cpoptions = s:save_cpo
unlet s:save_cpo

