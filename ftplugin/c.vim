" indentation etc
setlocal ts=4
setlocal sw=4
setlocal cindent

" navigation with rtags
"noremap <buffer> <Leader>ri :call rtags#SymbolInfo()<CR>
"SymbolInfo is broken (because of echo, use YcmCompleter)
noremap <buffer> <Leader>ri :YcmCompleter GetType<CR>
noremap <buffer> <Leader>rj :call rtags#JumpTo(g:SAME_WINDOW)<CR>
noremap <buffer> <Leader>rJ :call rtags#JumpTo(g:SAME_WINDOW, { '--declaration-only' : '' })<CR>
noremap <buffer> <Leader>rS :call rtags#JumpTo(g:H_SPLIT)<CR>
noremap <buffer> <Leader>rV :call rtags#JumpTo(g:V_SPLIT)<CR>
noremap <buffer> <Leader>rT :call rtags#JumpTo(g:NEW_TAB)<CR>
noremap <buffer> <Leader>rp :call rtags#JumpToParent()<CR>
noremap <buffer> <Leader>rf :call rtags#FindRefs()<CR>
noremap <buffer> <Leader>rn :call rtags#FindRefsByName(input("Pattern? ", "", "customlist,rtags#CompleteSymbols"))<CR>
noremap <buffer> <Leader>rs :call rtags#FindSymbols(input("Pattern? ", "", "customlist,rtags#CompleteSymbols"))<CR>
noremap <buffer> <Leader>rr :call rtags#ReindexFile()<CR>
noremap <buffer> <Leader>rl :call rtags#ProjectList()<CR>
noremap <buffer> <Leader>rw :call rtags#RenameSymbolUnderCursor()<CR>
noremap <buffer> <Leader>rv :call rtags#FindVirtuals()<CR>
noremap <buffer> <Leader>rb :call rtags#JumpBack()<CR>
noremap <buffer> <Leader>rC :call rtags#FindSuperClasses()<CR>
noremap <buffer> <Leader>rc :call rtags#FindSubClasses()<CR>
noremap <buffer> <Leader>rd :call rtags#Diagnostics()<CR>
