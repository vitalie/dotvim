augroup elixir
  autocmd!
  autocmd BufWritePost *.exs silent :!mix format %
  autocmd BufWritePost *.ex silent :!mix format %
augroup END
