" Define :ErlTidy command to run erl_tidy on current file.
command! -range=% ErlTidy <line1>,<line2>!
  \erl -noshell -eval 'erl_tidy:file("%",[{stdout,true},{keep_unused,true},{quiet,true}]).' -s erlang halt

"Run :ErlTidy on entire buffer and return cursor to (approximate) original position"
function! DoErlTidy()
  let l = line(".")
  let c = col(".")
  :write
  :ErlTidy
  call cursor(l, c)
  call SyntasticCheck()
endfunction

augroup erlang
  autocmd!
  autocmd FileType erlang nmap <silent> <Leader>f  :call DoErlTidy()<cr>
augroup END
