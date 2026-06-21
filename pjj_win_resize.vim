" Vim global plugin that enables us to move status line with keys 'j' and 'k'.
" Maintainer: Atsushi SUGAWARA <peanutsjamjam@gmail.com>
" Last Change:2026 Jun 22
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
let s:keys = ['j', 'k', 'h', 'l']
let s:saved = {}

function! s:Enable()

  if (winnr("$") == 1)
    " there is only 1 window. byebye.
    let s:enabled = 0
    echo "pjj_win_resize: only one window."
    return
  endif

  " 入る前のノーマルモードマッピングを保存（復元用）
  for key in s:keys
    let s:saved[key] = maparg(key, 'n', 0, 1)
  endfor

  if (winnr() != winnr("$"))
    " not the last window
    nnoremap j <C-W>+
    nnoremap k <C-W>-
  else
    " here is the last (bottom) window
    nnoremap j <C-W>-
    nnoremap k <C-W>+
  endif

  nnoremap h <C-W><
  nnoremap l <C-W>>

  echo "Resize mode on. Press <C-W><C-E> again to quit."
endfunction

function! s:Disable()

  " リサイズ用マッピングを外し、保存しておいた元のマッピングを復元
  for key in s:keys
    if has_key(s:saved, key) && !empty(s:saved[key])
      call mapset('n', 0, s:saved[key])
    else
      execute 'silent! nunmap ' . key
    endif
  endfor
  let s:saved = {}

  echo "Resize mode off."

endfunction

function! s:ToggleMode()

  if s:enabled == 0
    let s:enabled = 1
    call s:Enable()
    " Enable() がウィンドウ1枚で中断した場合は s:enabled が 0 に戻る
  else
    let s:enabled = 0
    call s:Disable()
  endif

endfunction

nnoremap <silent> <C-W><C-E> :call <SID>ToggleMode()<CR>

" vim: ts=2 sts=2 sw=2 et
let &cpo= s:keepcpo
unlet s:keepcpo
