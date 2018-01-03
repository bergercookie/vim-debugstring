" debugstring.vim - Debug, printf()-style, at the speed of light
" Maintainer: Nikos Koukis <http://bergercookie.github.io/>
" Version:    0.1


" TODO: Add option for variable debugging
" Make the counter buffer-specific


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
function! s:debugFunctionWrapper()
    let l:prev_pos = getcurpos()

    call DebugStringFun()
    call s:incrDebugCounter() " increase the counter

    let l:new_pos = l:prev_pos
    let l:new_pos[1] += 2 " go directly to the next line
    call setpos('.', l:new_pos)
endfunc

nnoremap <silent> <Plug>DumpDebugString :<C-U> :call <SID>debugFunctionWrapper()<CR>

let &cpoptions = s:save_cpo
unlet s:save_cpo

