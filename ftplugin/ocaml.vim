setlocal noai
setlocal expandtab
setlocal sw=2
setlocal ts=2
nmap <silent><buffer> <LocalLeader>] :MerlinLocate<return>
nmap <silent><buffer> <LocalLeader>r <Plug>(MerlinRenameAppend)