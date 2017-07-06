" =============================================================================
" Vundle
set nocompatible
filetype off

let has_vundle=1
if !filereadable($HOME."/.vim/bundle/Vundle.vim/README.md")
  echo "Installing Vundle ..."
  echo ""
  silent !mkdir -p $HOME/.vim/bundle
  silent !git clone https://github.com/VundleVim/Vundle.vim $HOME/.vim/bundle/Vundle.vim
  let has_vundle=0
endif

" Set the runtime path to include Vundle and initialize.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required.
Plugin 'gmarik/Vundle.vim'

" =============================================================================
" Plugins - General
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-endwise'
Plugin 'gcmt/wildfire.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'justinmk/vim-sneak'
Plugin 'scrooloose/syntastic'
Plugin 'mileszs/ack.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'mattn/emmet-vim'
Plugin '29decibel/vim-stringify'
Plugin 'Absolight/vim-bind'
Plugin 'itchyny/lightline.vim'
Plugin 'RobbieClarken/vim-haproxy'
Plugin 'rodjek/vim-puppet'

" =============================================================================
" Color scheme
Plugin 'altercation/vim-colors-solarized'

" =============================================================================
" Plugins - Languages

" Ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'

" JavaScript
Plugin 'pangloss/vim-javascript'

" CoffeeScript
Plugin 'kchmck/vim-coffee-script'

" Go
Plugin 'fatih/vim-go'

" SCSS
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'gcorne/vim-sass-lint'

" HAML
Plugin 'tpope/vim-haml'

" Slim
Plugin 'slim-template/vim-slim'

" Markdown
Plugin 'plasticboy/vim-markdown'

" JSON
Plugin 'elzr/vim-json'

" AngularJS
Plugin 'burnettk/vim-angular'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'claco/jasmine.vim'

" Elixir
Plugin 'elixir-lang/vim-elixir'

" Cisco IOS
Plugin 'CyCoreSystems/vim-cisco-ios'

" Text aligning around a selected character.
Plugin 'tommcdo/vim-lion'

" All Plugins must be added before the following this line.
call vundle#end()            " required
filetype plugin indent on    " required

" =============================================================================
" Settings - General

" Load the plugin and indent settings for the detected filetype.
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
set smartcase
set laststatus=2
set encoding=utf-8
set showcmd
set statusline=%<\ %n\ %f\ %m%r%y%=\ Line:\ \%l\/\%L\ Column:\ \%c%V
set history=700
set autoread
set nowritebackup
set nobackup
set noautowrite
set numberwidth=1
set so=3
" set re=1
set cursorline
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

set smarttab
set tabstop=2     " How many spaces to be rendered for a tab.
set shiftwidth=2  " The number of columns used in indentat operations (<< and >>).
set expandtab     " Replace tab key with spaces in insert mode.

set list
set listchars=tab:▸\ ,nbsp:⎵,extends:…,trail:•

set pastetoggle=<F2>

set wildmenu
set wildmode=list:longest,list:full

" Ignored files.
set wildignore+=*.o
set wildignore+=*.a
set wildignore+=*.so
set wildignore+=*.pdf
set wildignore+=*.gif
set wildignore+=*.jpg
set wildignore+=*.png
set wildignore+=*.zip
set wildignore+=*/.git/*
set wildignore+=*/.bundle/*
set wildignore+=*/log/*
set wildignore+=*/tmp/*
set wildignore+=*/deps/*
set wildignore+=*/_build/*
set wildignore+=*/priv/static/*
set wildignore+=*.beam
set wildignore+=*/pkg/*
set wildignore+=*/vendor/pkg/*
set wildignore+=*/node_modules/*
set wildignore+=*/bower_components/*

" Set swap file location.
set nobackup
set nowritebackup
set swapfile
set directory=$HOME/.vim/swapfiles//

" Solarized theme settings.
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
if !has("gui_running")
  let g:solarized_termtrans = 1
  let g:solarized_termcolors = 256
endif
set background=dark
colorscheme solarized

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

" =============================================================================
" Settings - Plugins

" Go
let g:go_disable_autoinstall = 1
let g:go_fmt_command = 'goimports'
let g:go_gocode_bin='gocode'
let g:go_goimports_bin='goimports'
let g:go_godef_bin='godef'
let g:go_oracle_bin='oracle'
let g:go_golint_bin='golint'
let g:go_errcheck_bin='errcheck'

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 1

" Syntastic
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_sass_checkers=['sass_lint']
let g:syntastic_scss_checkers=['sass_lint']
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '✗'
let g:syntastic_warning_symbol = '✗'
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']

" vim-lion
let g:lion_squeeze_spaces = 1

" Ctrl-P
let g:ctrlp_match_window = 'bottom,order:ttb' " bottom, listing from top to bottom
let g:ctrlp_switch_buffer = 0                 " disable
let g:ctrlp_working_path_mode = 0             " disable

" Wildfire
let g:wildfire_objects = [
      \ "i'", 'i"', "i)", "i]", "i}", "ip", "it",
      \ "a'", 'a"', "a)", "a]", "a}", "ap", "at"
      \ ]

" Use `ag` when available.
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" =============================================================================
" Keybindings - General

" Autocommands
if !exists("autocommands_loaded")
  let autocommands_loaded = 1

  " Reload vimrc automatically
  autocmd BufWritePost  vimrc     source %
  autocmd FileType      go        setlocal ai ts=4 sw=4 sts=4 noexpandtab nolist
  autocmd FileType      cisco     set nofoldenable

  " Remember cursor position
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

endif

nnoremap ci( %ci(
vnoremap = :call Stringify()<CR>

" Leader
let mapleader=" "
nnoremap <leader>q :q!<CR>
nnoremap <leader>w :w!<CR>
nnoremap <leader>s :vsplit<space>
nnoremap <leader>x :split<space>
nnoremap <leader>a :Ack<space>
nnoremap <leader><leader> :CtrlP<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>ga :Git add -p %<CR>

nnoremap <silent><Tab> <C-w>w

" List all open buffers.
nnoremap <leader>bl :ls<CR>

" Close all buffers.
nnoremap <leader>bd :bufdo bd<CR>

" Toggle highlighting.
nnoremap <silent> <leader>n :nohl<CR>

" Strip whitespaces.
nnoremap <silent> <leader>sp :StripWhitespace<CR>

" Window movements.
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" =============================================================================
" Keybindings - Languages

" Markdown
let g:vim_markdown_folding_disabled = 1

" Go
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <leader>dx <Plug>(go-def-split)
au FileType go nmap <leader>ds <Plug>(go-def-vertical)

au FileType go nmap <leader>gd <Plug>(go-doc)
au FileType go nmap <leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>gb <Plug>(go-doc-browser)

" Show a list of interfaces which is implemented by the type under cursor.
au FileType go nmap <Leader>im <Plug>(go-implements)

" Show type info for the word under your cursor.
au FileType go nmap <Leader>in <Plug>(go-info)

" Rename the identifier under the cursor to a new name.
au FileType go nmap <Leader>e <Plug>(go-rename)

" =============================================================================
" Functions
