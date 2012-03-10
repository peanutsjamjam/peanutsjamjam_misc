" Vim global plugin that enables us to move status line with keys 'j' and 'k'.
" Maintainer: Atsushi SUGAWARA <peanutsjamjam@gmail.com>
" Last Change:2011 Feb 28
" License:    This file is placed in the public domain.
"
" install to ~/.vim/plugin/

if &cp || exists("g:loaded_pjj_win_resize")
  finish
endif
let g:loaded_pjj_win_resize = 1

let s:keepcpo = &cpo
set cpo&vim

let s:enabled = 0

function s:Enable()

  if (winnr("$") == 1)
    " there is only 1 window. byebye.
    let s:enabled = 0
    return
  endif

  if (winnr() != winnr("$"))
    " not the last window
    exe "nmap j <C-W>+"
    exe "nmap k <C-W>-"
  else
    " here is the last (bottom) window
    exe "nmap j <C-W>-"
    exe "nmap k <C-W>+"
  endif

  exe "nmap h <C-W><"
  exe "nmap l <C-W>>"

  echo "Resize mode on. Press <C-W><C-E> again to quit."
endfunction

function s:Disable()

  exe "nunmap j"
  exe "nunmap k"
  exe "nunmap h"
  exe "nunmap l"
  echo "Resize mode off."

endfunction

function! s:ToggleMode()

  if s:enabled == 0
    let s:enabled = 1
    call s:Enable()
  else
    let s:enabled = 0
    call s:Disable()
  endif

endfunction

nnoremap <silent> <C-W><C-E> :call <SID>ToggleMode()<CR>

" vim: ts=2 sts=2 sw=2 et
let &cpo= s:keepcpo
unlet s:keepcpo
