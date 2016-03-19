" Reload config file with with:
"
"   :so $MYVIMRC
"
" Original version by @bcarrell.

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
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'justinmk/vim-sneak'
Bundle 'scrooloose/syntastic'
Bundle 'mileszs/ack.vim'
Bundle 'ntpeters/vim-better-whitespace'
Bundle 'mattn/emmet-vim'
Bundle '29decibel/vim-stringify'
Bundle 'Absolight/vim-bind'
Bundle 'itchyny/lightline.vim'
" Bundle 'SirVer/ultisnips'
" Bundle 'Valloric/YouCompleteMe'

" =============================================================================
" Color schemes
" Bundle 'chriskempson/base16-vim'
" Bundle 'nanotech/jellybeans.vim'
" Bundle 'tpope/vim-vividchalk'
" Bundle 'Lokaltog/vim-distinguished'
" Bundle 'tomasr/molokai'
" Bundle 'sjl/badwolf'
Bundle 'altercation/vim-colors-solarized'


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

" Elixir
Bundle 'elixir-lang/vim-elixir'


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
set wildignore+=*/tmp/*,*.so,*.beam,*.zip,
      \.pdf,.jpg,.gif,.png,
      \.avi,.mkv,
      \*/deps/*,*/_build/*,*/priv/static/*,
      \*/bin/*,*/pkg/*,*/vendor/src/*,*/vendor/pkg/*,
      \*/node_modules/*,*/bower_components/*
set pastetoggle=<F2>

set background=dark
colorscheme default
if has("gui_running")
  set cursorline
  set background=dark
  colorscheme solarized

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
    set guifont=Menlo\ Regular:h14
    set guioptions-=T   " Hde toolbar.
    set guioptions-=r   " Remove scrollbar.
  elseif has("gui_win32")
    set guifont=DejaVu_Sans_Mono:h10:cANSI
  elseif has("x11")
    set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
  else
    set guifont=Courier_New:h11:cDEFAULT
  endif
endif

" Set swap file location.
set nobackup
set nowritebackup
set swapfile
set directory=$HOME/.vim/swapfiles//

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
let g:go_fmt_command = "goimports"
let g:go_gocode_bin="gocode"
let g:go_goimports_bin="goimports"
let g:go_godef_bin="godef"
let g:go_oracle_bin="oracle"
let g:go_golint_bin="golint"
let g:go_errcheck_bin="errcheck"

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" JavaScript libraries
let g:used_javascript_libs = 'jquery,underscore,angularjs,jasmine'

" Ctrl-P
let g:ctrlp_match_window = 'bottom,order:ttb' " bottom, listing from top to bottom
let g:ctrlp_switch_buffer = 0                 " disable
let g:ctrlp_working_path_mode = 0             " disable

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

" Use `ag` when available.
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
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

" List all open buffers.
nnoremap <Leader>bl :ls<CR>

" Close all buffers.
nnoremap <Leader>bd :bufdo bd<CR>

" =============================================================================
" Keybindings - Languages

" Go
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>dx <Plug>(go-def-split)
au FileType go nmap <Leader>ds <Plug>(go-def-vertical)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

" Show a list of interfaces which is implemented by the type under cursor.
au FileType go nmap <Leader>im <Plug>(go-implements)

" Show type info for the word under your cursor.
au FileType go nmap <Leader>in <Plug>(go-info)

" Rename the identifier under the cursor to a new name.
au FileType go nmap <Leader>e <Plug>(go-rename)

" =============================================================================
" Functions
