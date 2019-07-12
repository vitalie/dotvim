" =============================================================================
call plug#begin('~/.vim/bundle')
" =============================================================================

" =============================================================================
" Plugins - General
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-sleuth'
Plug 'scrooloose/syntastic'
Plug 'justinmk/vim-sneak'
Plug 'gcmt/wildfire.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tommcdo/vim-lion'
Plug 'mileszs/ack.vim'
Plug 'farmergreg/vim-lastplace'
Plug 'itchyny/lightline.vim'

" =============================================================================
" Files
Plug 'elzr/vim-json'
Plug 'fatih/vim-nginx'
Plug 'rodjek/vim-puppet'
Plug 'Absolight/vim-bind'
Plug 'tpope/vim-markdown'
Plug 'RobbieClarken/vim-haproxy'
Plug 'CyCoreSystems/vim-cisco-ios'

" =============================================================================
" Color scheme
Plug 'lifepillar/vim-solarized8'

" =============================================================================
" Plugins - Languages

" Ruby
Plug 'vim-ruby/vim-ruby', { 'tag': 'stable-20190106' }
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'

" Go
Plug 'fatih/vim-go', { 'tag': 'v1.20', 'do': ':GoInstallBinaries' }

" Erlang
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-erlang/vim-erlang-compiler'
Plug 'vim-erlang/vim-erlang-tags'

" Elixir
Plug 'elixir-editors/vim-elixir'

" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'othree/javascript-libraries-syntax.vim'

" SCSS
Plug 'cakebaker/scss-syntax.vim'

" Templates
Plug 'tpope/vim-haml'
Plug 'slim-template/vim-slim'

" All Plugins must be added before the following this line.
" =============================================================================
call plug#end()
" =============================================================================

" Settings - General
set nocompatible

set ttyfast
set ttymouse=xterm2
set ttyscroll=3

set mouse=a                    " Enable mouse mode
set noerrorbells               " No beeps
set nomodeline                 " Don't parse modelines to avoid security issues

set laststatus=2
set encoding=utf-8             " Set default encoding to UTF-8
set autoread                   " Reload unchanged files automatically
set autowrite                  " Automatically save before :next, :make etc.
set autoindent                 " Autoindent when starting new line, or using o or O
set backspace=indent,eol,start " Allow backspace in insert mode
set hidden                     " https://medium.com/usevim/vim-101-set-hidden-f78800142855
set fileformats=unix,dos,mac   " Prefer Unix over Windows over OS 9 formats

set incsearch                  " Shows the match while typing
set hlsearch                   " Highlight found searches
set ignorecase                 " Ignore case when searching
set smartcase                  " Don't ignore case when search has capital letter

set showcmd                    " Show me what I'm typing
set noswapfile                 " Don't use swapfile
set nobackup                   " Don't create annoying backup files
set splitright                 " Split vertical windows right to the current windows
set splitbelow                 " Split horizontal windows below to the current windows
set noshowmatch                " Do not show matching brackets by flickering
set noshowmode                 " We show the mode with airline or lightline

set completeopt=menu,menuone
set pumheight=10               " Completion window max size
set nocursorcolumn             " Speed up syntax highlighting
set nocursorline
set updatetime=300
set conceallevel=2             " Concealed text is completely hidden

if v:version > 800
  set shortmess+=c   " Shut off completion messages
  set belloff+=ctrlg " If Vim beeps during completion
endif

"http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
set clipboard^=unnamed
set clipboard^=unnamedplus

" Increase max memory to show syntax highlighting for large files
set maxmempattern=20000

" ~/.viminfo needs to be writable and readable
set viminfo=%,<800,'10,/50,:100,h,f0,n~/.vim/cache/.viminfo
"           | |    |   |   |    | |  + viminfo file path
"           | |    |   |   |    | + file marks 0-9,A-Z 0=NOT stored
"           | |    |   |   |    + disable 'hlsearch' loading viminfo
"           | |    |   |   + command-line history saved
"           | |    |   + search history saved
"           | |    + files marks saved
"           | + lines saved each register (old name for <, vi6.2)
"           + save/restore buffer list

" if has('persistent_undo')
"   set undofile
"   set undodir=~/.vim/cache
" endif

set pastetoggle=<F2>
set listchars=tab:▸\ ,nbsp:⎵,extends:…,trail:•

" Ignored files.
set wildignore+=*.o,*.a,*.so,*.out,*.obj,.git,.svn,*.gem,tags
set wildignore+=*.zip,*.rar,*.tgz,*.gz,*.bz2,*.xz
set wildignore+=*.gif,*.jpg,*.png,*.pdf
set wildignore+=*/node_modules/*
set wildignore+=*/pkg/*,*/vendor/pkg/*
set wildignore+=*/deps/*,*/_build/*,*/priv/static/*
set wildignore+=*/tmp/*,*/log/*,*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

if has("gui_running")
  " Tabs navigation.
  nnoremap <C-Tab>    :tabnext<CR>
  nnoremap <C-S-Tab>  :tabprevious<CR>
  nnoremap <C-t>      :tabnew<CR>
  nnoremap <C-w>      :tabclose<CR>
  nnoremap <C-Insert> :tabnew<CR>
  nnoremap <C-Delete> :tabclose<CR>

  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
  noremap <D-0> :tablast<CR>

  inoremap <C-S-Tab> <Esc>:tabprevious<CR>i
  inoremap <C-Tab>   <Esc>:tabnext<CR>i
  inoremap <C-t>     <Esc>:tabnew<CR>

  if has("gui_gtk2")
    set guifont=Ubuntu\ Mono\ 11
  elseif has("gui_photon")
    set guifont=Courier\ New:s11
  elseif has("gui_kde")
    set guifont=Courier\ New/11/-1/5/50/0/0/0/1/0
  elseif has("gui_macvim")
    set guioptions-=T " Hde toolbar.
    set guioptions-=r " Remove scrollbar.
    if system("osascript -e 'tell application \"Finder\" to get bounds of window of desktop' | cut -d ' ' -f 4") > 1080
      set guifont=Menlo\ Regular:h15
    else
      set guifont=Menlo\ Regular:h14
    endif
  elseif has("gui_win32")
    set guifont=DejaVu_Sans_Mono:h10:cANSI
  elseif has("x11")
    set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
  else
    set guifont=Courier_New:h11:cDEFAULT
  endif
endif

" Configure colorscheme
set background=dark
colorscheme solarized8

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
if !has('gui_running')
  set notimeout
  set ttimeout
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

" =============================================================================
augroup filetypedetect
  command! -nargs=* -complete=help Help vertical belowright help <args>
  autocmd FileType help wincmd L

  autocmd BufNewFile,BufRead .env.* setf sh
  autocmd BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
  autocmd BufNewFile,BufRead .nginx.conf*,nginx.conf* setf nginx
  autocmd BufNewFile,BufRead *.hcl setf conf
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

  autocmd BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.md setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.html setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.vim setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.hcl setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.proto setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.sh setlocal expandtab shiftwidth=2 tabstop=2

  autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2
  autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2
  autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
augroup END

" =============================================================================
" Keybindings - General

nnoremap ci( %ci(

" Leader
let mapleader=" "
nnoremap <leader>q :q!<CR>
nnoremap <leader>w :w!<CR>
nnoremap <leader>s :vsplit<space>
nnoremap <leader>x :split<space>
nnoremap <leader>a :Ack<space>
nnoremap <leader><leader> :CtrlP<CR>
nnoremap <leader>cpt :CtrlPBufTag<CR>

nnoremap <silent><Tab> <C-w>w

" List all open buffers.
nnoremap <leader>bl :ls<CR>

" Close all buffers.
nnoremap <leader>bd :bufdo bd<CR>

" Toggle highlighting.
nnoremap <silent> <leader>n :nohl<CR>

" Strip whitespaces.
nnoremap <silent> <leader>sp :StripWhitespace<CR>

" Search navigation next/previous.
nnoremap n nzzzv
nnoremap N Nzzzv

" Window movements.
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" Disable arrows
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

nnoremap <silent> <F5> :source $MYVIMRC<CR>
nnoremap <F6> :setlocal spell! spell?<CR>

" =============================================================================
" Settings - Plugins

" Fugitive
vnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gb :Gblame<CR>
vnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gw :Gwrite<CR>

" Lightline
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" Syntastic
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_sass_checkers=['sass_lint']
let g:syntastic_scss_checkers=['sass_lint']
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '✗'
let g:syntastic_warning_symbol = '✗'
let g:syntastic_go_checkers = ['govet', 'golint']
let g:syntastic_ruby_checkers = ['mri']
let g:syntastic_haml_checkers = ['haml', 'haml_lint']

" Lion
let g:lion_squeeze_spaces = 1

" CtrlP
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'et' " Jump to a file if it's open already.
let g:ctrlp_mruf_max=450         " Number of recently opened files.
let g:ctrlp_max_files=0          " Do not limit the number of searchable files.
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_match_window = 'bottom,order:ttb,max:10,results:10'
let g:ctrlp_buftag_types = {
  \ 'go'         : '--language-force=go --golang-types=ft',
  \ }
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pdf|jpg|png)$',
  \ }
let g:ctrlp_user_command = {
  \ 'types': {
    \1: ['.git', 'cd %s && git ls-files'],
    \2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
  \ 'fallback': 'find %s -type f'
  \ }

" Wildfire
let g:wildfire_objects = [
      \ "i'", 'i"', "i)", "i]", "i}", "ip", "it",
      \ "a'", 'a"', "a)", "a]", "a}", "ap", "at"
      \ ]

" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" javascript-libraries-syntax
let g:used_javascript_libs = 'jquery'

" Ruby
function! RubocopAutocorrect()
  execute "!rubocop -a " . bufname("%")
  call SyntasticCheck()
endfunction

augroup ruby
  autocmd!
  autocmd FileType ruby nmap <silent> <leader>t  :Rails<cr>
  autocmd FileType ruby nmap <silent> <Leader>l  :call SyntasticCheck('rubocop')<cr>
  autocmd FileType ruby nmap <silent> <Leader>f  :call RubocopAutocorrect()<cr>
augroup END


" Erlang
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

" Elixir
augroup elixir
  autocmd!
  autocmd BufWritePost *.exs silent :!mix format %
  autocmd BufWritePost *.ex silent :!mix format %
augroup END

" Go
let g:go_version_warning = 0
let g:go_fmt_fail_silently = 0
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_auto_type_info = 0
let g:go_def_mode = "guru"
let g:go_echo_command_info = 1
let g:go_gocode_autobuild = 0
let g:go_gocode_unimported_packages = 1

let g:go_autodetect_gopath = 1
let g:go_info_mode = "guru"
let g:go_metalinter_command='golangci-lint'


let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

let g:go_modifytags_transform = 'camelcase'

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

augroup go
  autocmd!

  autocmd FileType go nmap <C-g> :GoDecls<cr>
  autocmd FileType go imap <C-g> <esc>:<C-u>GoDecls<cr>

  autocmd FileType go nmap <silent> <Leader>v <Plug>(go-def-vertical)
  autocmd FileType go nmap <silent> <Leader>s <Plug>(go-def-split)

  autocmd FileType go nmap <silent> <Leader>x <Plug>(go-doc-vertical)

  autocmd FileType go nmap <silent> <Leader>i <Plug>(go-info)
  autocmd FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)

  autocmd FileType go nmap <silent> <leader>b :<C-u>call <SID>build_go_files()<CR>
  autocmd FileType go nmap <silent> <leader>t  <Plug>(go-test)
  autocmd FileType go nmap <silent> <leader>r  <Plug>(go-run)
  autocmd FileType go nmap <silent> <leader>e  <Plug>(go-install)

  autocmd FileType go nmap <silent> <Leader>c <Plug>(go-coverage-toggle)

  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END
