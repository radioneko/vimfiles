set nocompatible
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

" *********************
" Vundle activation
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'gregsexton/VimCalc'
"Plugin 'bbchung/clighter'
Plugin 'ihacklog/HiCursorWords'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'bling/vim-airline'
Plugin 'SirVer/ultisnips'
Plugin 'chrisbra/SudoEdit.vim'
" Cool alignment stuff
"Plugin 'Align'
Plugin 'godlygeek/tabular'
" arguments as text objects
Plugin 'argtextobj.vim'
" alternative file (header/source)
Plugin 'a.vim'
Plugin 'xterm-color-table.vim'
" for useful text objects
Plugin 'kana/vim-textobj-user'
Plugin 'glts/vim-textobj-comment'
Plugin 'Julian/vim-textobj-variable-segment'
" vim exchange via cxMOTION
Plugin 'tommcdo/vim-exchange'
" fish shell syntax highlight
Plugin 'fish-syntax'
"Plugin 'Smart-Tabs'
Plugin 'lyuts/vim-rtags'
Plugin 'jreybert/vimagit'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-syntastic/syntastic'
call vundle#end()
filetype plugin on
filetype indent on
filetype plugin indent on
" *********************

" YouCompleteMe
let g:ycm_server_python_interpreter = '/usr/bin/python2.7'
let g:ycm_confirm_extra_conf = 0
let g:ycm_use_ultisnips_completer = 1
"let g:ycm_add_preview_to_completeopt = 1
"let g:ycm_show_diagnostics_ui = 1
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_key_list_select_completion = ['<TAB>']
let g:ycm_key_list_previous_completion = ['<S-TAB>']
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm-default-conf.py'
set completeopt-=preview
nnoremap <leader>gd :YcmCompleter GoTo<CR>
" UltiSnips
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="\e."
let g:UltiSnipsJumpBackwardTrigger="\e,"
" rtags
let g:rtagsUseLocationList = 0
let g:rtagsUseDefaultMappings = 0

if $COLORTERM =~ "mate\\|gnome" || $TERM =~ "xterm-256color"
	set term=gnome-256color
	set t_Co=256
	colorscheme desert256
else
	colorscheme ron
endif
set ai incsearch
"let b:asmsyntax="nasm"
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set nowrap
set smarttab
let &termencoding=&encoding
"cindent options
set cino=:0,l1,g0,(0,u0,U0
set foldmethod=marker
set fileencodings=utf-8,koi8-r

set exrc
set secure
set noswapfile

"search parameters
set incsearch
set hlsearch
"don't highlight search results from previous searches
nohlsearch

" clang complete
let g:clang_jumpto_declaration_key = "<C-;>"
let g:clang_jumpto_back_key = '<C-:>'
let g:clang_snippets = 1
let g:clang_snippets_engine = 'clang_complete'
let g:clang_library_path="/usr/lib/"
"let loaded_ctx=1

command! -nargs=1 -range SuperRetab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g

au BufNew,BufNewFile,BufRead,FileType *.torrent setlocal binary
"au BufNew,BufNewFile,BufRead,FileType *.lisp,*.asd setlocal ts=2 sw=2 expandtab nocindent
au BufNew,BufNewFile,BufRead,FileType *.rl setlocal ts=4 sw=4 noexpandtab syntax=ragel
"ts=4 sw=4
"enc=utf-8 fenc=utf-8
au BufNew,BufNewFile,BufRead,FileType PROTOCOL,*.txt setlocal nocindent expandtab ts=2 sw=2 enc=utf-8
au BufNew,BufNewFile,BufRead,FileType *.gdb setlocal syntax=gdb
au BufNew,BufNewFile,BufRead,FileType nginx.conf,my.conf setlocal ts=4 sw=4 noexpandtab syntax=nginx
" commentstring=#%s
au FileType git,diff setlocal foldmethod=syntax
let g:tex_flavor = "latex"
"au BufNew,BufNewFile,BufRead,FileType *.tex,*.latex setlocal ts=4 sw=4 expandtab foldmethod=marker fenc=utf-8

"python devel
set path+=/usr/include/python2.7

" taglist configuration
"let Tlist_Auto_Open = 1
"let Tlist_Exit_OnlyWindow = 1

" airline configuration
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

" tabular stuff
vmap <Leader>a= :Tabularize /[+\-*/^\|\&]\?=/l1r1l0<CR>
nmap <Leader>a= :Tabularize /[+\-*/^\|\&]\?=/l1r1l0<CR>
vmap <Leader>a, :Tabularize /,\zs<CR>
nmap <Leader>a, :Tabularize /,\zs<CR>
nmap <Leader>a\ :Tabularize /\\$<CR>

inoremap jj <Esc>
" Adequate movement
"noremap  <down> gj
"inoremap <down> <C-o>gj
"noremap  <up>   gk
"inoremap <up>   <C-o>gk
"noremap  <home> g^
"inoremap <home> <C-o>g^
"noremap  <end>  g$
"inoremap <end>  <C-o>g$

nnoremap <F2> :bp<CR>
nnoremap <F3> :bn<CR>
nnoremap <F4> :bdelete<CR>
nnoremap <F5> :cprevious<CR>
nnoremap <F6> :cnext<CR>

" Some hlper functions
" Align
function! AlignXX()
python << EOF
import re
w = vim.current.window
l, c = w.cursor
s = l
while s > 1 and re.search(r'\\$', w.buffer[s - 2]):
	s = s - 1
e = s
lines = len(w.buffer)
while e < lines and re.search(r'\\$', w.buffer[e - 1]):
	e = e + 1
# s, e - boundaries of long line (line numbers, starting from "1"
if e > s:
	vim.command("%d,%d Tabularize /,\\zs" % (s + 1, e))
	vim.command("%d,%d Tabularize /\\\\" % (s, e))
EOF
endfunction

command! -nargs=0 AlignXX call AlignXX()

" Merlin stuff
let no_ocaml_maps=1
