let g:loaded_gzip              = 1
let g:loaded_tar               = 1
let g:loaded_tarPlugin         = 1
let g:loaded_zip               = 1
let g:loaded_zipPlugin         = 1
let g:loaded_rrhelper          = 1
let g:loaded_2html_plugin      = 1
let g:loaded_vimball           = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_getscript         = 1
let g:loaded_getscriptPlugin   = 1
"let g:loaded_netrw             = 1
"let g:loaded_netrwPlugin       = 1
"let g:loaded_netrwSettings     = 1
"let g:loaded_netrwFileHandlers = 1


set helplang=ja,en
set autoindent smartindent
set autochdir
set modeline
set tabstop=4 shiftwidth=4 softtabstop=0
set nobackup
set noesckeys
"set dictionary=/usr/share/dict/words
set browsedir=buffer
set nofileignorecase
set number
set noincsearch

"set runtimepath+=/usr/home/sugawara/repos/vimdoc-ja

set hlsearch
set tags+=tags;
set mouse=a
"set ttymouse=xterm2
set encoding=utf8
set fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,sjis
"set fileencodings=ucs-bom,utf-8,iso-8859-1,euc-jp,sjis,utf-16le
set ambiwidth=double
set laststatus=2
set statusline=%<%f\ %([%{&fenc}]%)%y%h%m%r%=%l,%c%V\ %P

"colorscheme desert
syntax enable
set complete+=k
filetype indent on
filetype plugin on


hi MatchParen cterm=underline ctermbg=darkgray ctermfg=red

au WinEnter,FileType * call s:JamSetColor()
func! s:JamSetColor()
  hi MatchParen cterm=underline ctermbg=black ctermfg=7
  hi Visual ctermfg=0 ctermbg=7

  if &filetype == "cpp"
    hi PreProc ctermfg=Darkblue
    hi Comment ctermfg=Green
    syn keyword cConstant LC_MESSAGES
  endif

  if &filetype == "c"
    hi PreProc ctermfg=Darkblue
    hi Comment ctermfg=Green
    hi Search ctermfg=1 ctermbg=Yellow
  endif

  if &filetype == "perl"
    "exe 'colorscheme pablo'
    "hi PreProc ctermfg=LightGreen
    "hi Comment ctermfg=DarkGreen
    "hi PmenuSel ctermbg=darkblue  ctermfg=white
    "hi Pmenu    ctermbg=lightgray ctermfg=black
  endif

  if &filetype == "scheme"
    exe 'colorscheme darkblue'
    "hi Constant ctermfg=white
    " hi Error term=reverse cterm=bold,underline ctermfg=1 ctermbg=0 guibg=DarkCyan
    hi Error term=standout cterm=bold ctermfg=1 ctermbg=4 guifg=#d14a14 guibg=#1248d1
    hi Comment ctermfg=2
    set ts=2 sts=2 sw=2 et
  endif

  if &filetype == "html"
    exe 'colorscheme desert'
    "hi Title ctermfg=lightgray
  endif

  if &filetype == "pod"
    exe 'colorscheme desert'
    syn match podTrailWhite "\s\+$"
    syn region podOriginal start=/^=begin original/ end=/^=end original/ contains=podTrailWhite
    hi link podTrailWhite Error
    "hi link podOriginal Ignore
    hi podOriginal ctermfg=2
    hi LineNr ctermfg=red
    hi PreProc ctermfg=darkgreen
    ab bo =begin original
    ab eo =end original
  endif

  if &filetype == "vim"
    set ts=2 sts=2 sw=2 et
  endif

endfunc

set noequalalways
nmap <F8> <C-W>+
nmap <F9> <C-W>-
nmap <C-N> :bnext<CR>
nmap <C-P> :bprevious<CR>
vmap / y/<C-R>"
"inoremap <silent> jj <ESC>
nnoremap <silent> <C-@> :nohlsearch<CR>

