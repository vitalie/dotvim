function! RubocopAutocorrect()
  execute "!bundle exec rubocop -a " . bufname("%")
  call SyntasticCheck()
endfunction

augroup ruby
  autocmd!
  autocmd FileType ruby nmap <silent> <leader>t  :Rails<cr>
  autocmd FileType ruby nmap <silent> <Leader>l  :call SyntasticCheck('rubocop')<cr>
  autocmd FileType ruby nmap <silent> <Leader>f  :call RubocopAutocorrect()<cr>
augroup END
