" Vim plugin that place a comment specified position in the line.
" Maintainer: Atsushi SUGAWARA <peanutsjamjam@gmail.com>
" Last Change:2023 Jul 29
" License:    This file is placed in the public domain.
"
" install to ~/.vim/plugin/

if &cp || exists("g:loaded_place_comment")
    finish
endif
let g:loaded_place_comment = 1

let s:keepcpo = &cpo
set cpo&vim

let s:pc_str = '// test comment'
let s:pc_col = 73

function s:place_comment()

  exe "normal A \<Esc>"
  let s:c = getcursorcharpos('.')[4]
  exe "normal x"

  if s:c >= s:pc_col
    exe "normal A \<Esc>"
  endif

  while s:c < s:pc_col
    exe $"normal A\<Tab>\<Esc>"

    exe "normal A \<Esc>"
    let s:c = getcursorcharpos('.')[4]
    exe "normal x"
  endwhile

  exe $"normal A{s:pc_str}\<Esc>"
 
endfunction

nnoremap <silent> <C-H> :call <SID>place_comment()<CR>

" vim: ts=2 sts=2 sw=2 et
let &cpo= s:keepcpo
unlet s:keepcpo
