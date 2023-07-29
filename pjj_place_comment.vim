" Vim plugin that place a comment specified position in the line.
" Maintainer: Atsushi SUGAWARA <peanutsjamjam@gmail.com>
" Last Change:2011 Feb 28
" License:    This file is placed in the public domain.
"
" install to ~/.vim/plugin/

if &cp || exists("g:loaded_place_comment")
    finish
endif
let g:loaded_place_comment = 0

let s:keepcpo = &cpo
set cpo&vim

let s:ps_str = '// abcde'
let s:ps_col = 33

function s:place_comment()

  exe "normal A \<Esc>"
  let s:c = getcursorcharpos('.')[4]
  "let s:n = str2nr(s:c)
  exe "normal x"

  if s:c >= s:ps_col
    exe "normal A \<Esc>"
  endif

  while s:c < s:ps_col
    exe $"normal A\<Tab>\<Esc>"

    exe "normal A \<Esc>"
    let s:c = getcursorcharpos('.')[4]
    exe "normal x"
  endwhile

  "exe $"normal A{s:ps_str}{s:n}\<Esc>"
  exe $"normal A{s:ps_str}\<Esc>"
 
endfunction

nnoremap <silent> <C-H> :call <SID>place_comment()<CR>

" vim: ts=2 sts=2 sw=2 et
let &cpo= s:keepcpo
unlet s:keepcpo
