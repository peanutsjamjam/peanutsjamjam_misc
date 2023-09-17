vim9script
# Vim plugin that place a comment specified position in the line.
# Maintainer: Atsushi SUGAWARA <peanutsjamjam@gmail.com>
# Last Change:2023 Jul 30
# License:    This file is placed in the public domain.
#
# install to ~/.vim/plugin/

if &cp || exists("g:loaded_place_comment")
    finish
endif
g:loaded_place_comment = 1

var keepcpo = &cpo
set cpo&vim

var pc_str = '// test comment'
var pc_col = 37

def PlaceComment()

  exe "normal A \<Esc>"
  var p = getcursorcharpos()
  echo p
  var pos = p[4]
  exe "normal x"

  if pos >= pc_col
    exe "normal A \<Esc>"
  endif

  while pos < pc_col
    exe $"normal A\<Tab>\<Esc>"

    exe "normal A \<Esc>"
    pos = getcursorcharpos()[4]
    exe "normal x"
  endwhile

  exe $"normal A{pc_str}\<Esc>"
 
enddef

nnoremap <C-H> <ScriptCmd>:call <SID>PlaceComment()<CR>

# vim: ts=2 sts=2 sw=2 et
&cpo = keepcpo

