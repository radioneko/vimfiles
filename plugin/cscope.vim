if has("cscope")
	" use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
	"set cscopetag
	" check cscope for definition of a symbol before checking ctags: set to 1
	" if you want the reverse search order.
	set csto=0
	" add any cscope database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	" else add the database pointed to by environment variable
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif

	" show msg when any other cscope db added
	set cscopeverbose
	if has("quickfix")
		set cscopequickfix=s-,c-,d-,i-,t-,e-
	endif

	" find references 
	nmap <Leader>sd :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <Leader>sc :cs find d <C-R>=expand("<cword>")<CR><CR>
	nmap <Leader>sr :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <Leader>si :cs find i <C-R>=expand("%")<CR><CR>
	nmap <F5> :cp<CR>
	nmap <F6> :cn<CR>
	nmap <F9> :copen<CR>
endif
