" Original version by @bcarrell

set nocompatible
set t_Co=256
filetype off


" =============================================================================
" Vundle

let has_vundle=1
if !filereadable($HOME."/.vim/bundle/vundle/README.md")
  echo "Installing Vundle..."
  echo ""
  silent !mkdir -p $HOME/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle $HOME/.vim/bundle/vundle
  let has_vundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'


" =============================================================================
" Bundles - General

Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-vinegar'
Bundle 'gcmt/wildfire.vim'
Bundle 'jiangmiao/auto-pairs'
Bundle 'kien/ctrlp.vim'
Bundle 'justinmk/vim-sneak'
Bundle 'scrooloose/syntastic'
Bundle 'mileszs/ack.vim'
Bundle 'SirVer/ultisnips'
Bundle 'ntpeters/vim-better-whitespace'
" Bundle 'Valloric/YouCompleteMe'
Bundle 'mattn/emmet-vim'
Bundle '29decibel/vim-stringify'
Bundle 'Absolight/vim-bind'
Bundle 'elixir-lang/vim-elixir'

" =============================================================================
" Color schemes
" Bundle 'chriskempson/base16-vim'
" Bundle 'nanotech/jellybeans.vim'
" Bundle 'tpope/vim-vividchalk'
" Bundle 'Lokaltog/vim-distinguished'
" Bundle 'altercation/vim-colors-solarized'


" =============================================================================
" Bundles - Languages

" Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'

" JavaScript
Bundle 'pangloss/vim-javascript'

" CoffeeScript
Bundle 'kchmck/vim-coffee-script'

" Go
Bundle 'fatih/vim-go'

" Rust
Bundle 'wting/rust.vim'

" Python
Bundle 'hdima/python-syntax'

" Less
Bundle 'groenewege/vim-less'

" Sass
Bundle 'cakebaker/scss-syntax.vim'

" Haml
Bundle 'tpope/vim-haml'

" Markdown
Bundle 'tpope/vim-markdown'

" Stylus
Bundle 'wavded/vim-stylus'

" Jade
Bundle 'digitaltoad/vim-jade'

" Slim
Bundle 'slim-template/vim-slim'

" JSON
Bundle 'elzr/vim-json'

" AngularJS
Bundle 'burnettk/vim-angular'
Bundle 'othree/javascript-libraries-syntax.vim'
" Bundle 'matthewsimo/angular-vim-snippets'
Bundle 'claco/jasmine.vim'


" =============================================================================
" Settings - General

filetype plugin indent on
syntax on
set backspace=indent,eol,start
set complete-=i
set showmatch
set nrformats-=octal
set shiftround
set ttimeout
set ttimeoutlen=50
set incsearch
set hlsearch
" set ignorecase
set smartcase
set laststatus=2
set encoding=utf-8
set showcmd
" set cc=80
set statusline=%<\ %n\ %f\ %m%r%y%=\ Line:\ \%l\/\%L\ Column:\ \%c%V
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set history=700
set autoread
set nowritebackup
set nobackup
" set noswapfile
set noautowrite
" set number
" set relativenumber
set numberwidth=1
set so=3
" set re=1
set background=dark
" set cursorline
set ruler
set splitright
set splitbelow
set shortmess+=I
set nowrap
set nostartofline
set mouse=
set hidden
set vb t_vb=
set scrolloff=999999
set wildmenu
set wildignore+=.bak,.pyc,.o,.ojb,.,a,
      \.pdf,.jpg,.gif,.png,
      \.avi,.mkv,.so,
      \node_modules/*,vendor/*,target/*
colorscheme default
set pastetoggle=<F2>

" Set swap file location.
set nobackup
set nowritebackup
set swapfile
set directory=$HOME/tmp/vim,$HOME/tmp

" =============================================================================
" Settings - Plugins

" YouCompleteMe
" let g:ycm_key_list_select_completion=["<S-Tab>", "<Down>"]
" let g:ycm_key_list_previous_completion=["<Up>"]
" let g:ycm_key_invoke_completion=""
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1

" Go
let g:go_disable_autoinstall = 1
let g:go_fmt_command = "gofmt"
" let g:go_gocode_bin="~/your/custom/gocode/path"
" let g:go_goimports_bin="~/your/custom/goimports/path"
" let g:go_godef_bin="~/your/custom/godef/path"
" let g:go_oracle_bin="~/your/custom/godef/path"
let g:go_golint_bin="~/workspace/golang/bin/golint"
" let g:go_errcheck_bin="~/your/custom/errcheck/path"


" UltiSnips
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsSnippetDirectories=["bundle/ultisnips/UltiSnips", "bundle/more-snippets"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"

" Syntastic
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_coffee_checkers=[]
let g:syntastic_go_checkers=[]

" JavaScript libraries
let g:used_javascript_libs = 'jquery,underscore,angularjs,jasmine'

" Ctrl-P
let g:ctrlp_custom_ignore = {
      \ 'dir': 'node_modules\|vendor\|target\|resources/public/*',
      \ 'file': '.lein*'
      \ }

" Whitespace
autocmd BufWritePre * StripWhitespace

" Wildfire
let g:wildfire_objects = [
      \ "i'", 'i"', "i)", "i]", "i}", "ip", "it",
      \ "a'", 'a"', "a)", "a]", "a}", "ap", "at"
      \ ]

" Remember cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" =============================================================================
" Settings - Languages

" Python
let python_highlight_all = 1

" Go
au BufNewFile,BufRead *.go set filetype=go
au FileType go setlocal ai ts=4 sw=4 sts=4 noexpandtab
let g:go_auto_type_info = 1

" Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Bind
au BufNewFile,BufReadPost *.bind set filetype=bindzone

" Cfg
au BufNewFile,BufReadPost *.cfg set filetype=config

" =============================================================================
" Keybindings - General

nnoremap ci( %ci(
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
inoremap ,c <C-x><C-o>
map Q mzgg=G`z<CR>
cmap w!! w !sudo tee % >/dev/null
vnoremap = :call Stringify()<CR>

" Leader
let mapleader=" "
nnoremap <Leader>q :q!<CR>
nnoremap <Leader>w :w!<CR>
nnoremap <Leader>s :vsplit<space>
nnoremap <Leader>x :split<space>
nnoremap <Leader>a :Ack<space>
nnoremap <Leader><Leader> :CtrlP<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>ga :Git add -p %<CR>

nnoremap <silent><Tab> <C-w>w

" =============================================================================
" Keybindings - Languages

" Go
au FileType go nmap K <Plug>(go-doc)
au FileType go nmap gd <Plug>(go-def-split)
au FileType go nmap cgr <Plug>(go-run)
au FileType go nmap cgb <Plug>(go-build)
au FileType go nmap cgt <Plug>(go-test)
au FileType go nmap cgv <Plug>(go-vet)

" =============================================================================
" Functions
