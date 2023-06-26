setlocal noai
setlocal expandtab
setlocal sw=2
setlocal ts=2

nnoremap <silent><buffer> <LocalLeader>] :MerlinLocate<return>
inoremap <silent><buffer> <C-g>] <C-o>:MerlinLocate<return>
nnoremap <silent><buffer> <LocalLeader>r <Plug>(MerlinRename)

nnoremap <silent><buffer> <LocalLeader>[ :MerlinLocateType<return>
inoremap <silent><buffer> <C-g>[ <C-o>:MerlinLocateType<return>

vnoremap <silent><buffer> <LocalLeader>t :MerlinTypeOfSel<return>
nnoremap <silent><buffer> <LocalLeader>t :MerlinTypeOf<return>
inoremap <silent><buffer> <C-g><C-t> <C-o>:MerlinTypeOf<return>

nnoremap <silent><buffer> <LocalLeader>f :MerlinOccurrences<return>
inoremap <silent><buffer> <C-g><C-f> <C-o>::MerlinOccurrences<return>

nnoremap <silent><buffer> <LocalLeader>d :MerlinDestruct<return>
inoremap <silent><buffer> <C-g><C-d> <C-o>:MerlinDestruct<return>

nnoremap <silent><buffer> <LocalLeader>/ :MerlinDocument<return>
nnoremap <silent><buffer> <LocalLeader>? :MerlinDocument<return>
inoremap <silent><buffer> <C-g>/ <C-o>:MerlinDocument<return>
inoremap <silent><buffer> <C-g>? <C-o>:MerlinDocument<return>

function! _EscapeText_ocaml(text)
  let trimmed = substitute(a:text, '\_s*$', '', '')
  if match(trimmed,';;\n*$') > -1
    return [trimmed,"\n"]
  else
    return [trimmed . ";;","\n"]
  endif
endfunction

