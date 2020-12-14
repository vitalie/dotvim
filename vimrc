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
Plug 'zsiciarz/caddy.vim'

" =============================================================================
" Color scheme
Plug 'lifepillar/vim-solarized8'

" =============================================================================
" Plugins - Languages

" Ruby
Plug 'vim-ruby/vim-ruby', { 'tag': 'vim8.2' }
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'

" Go
if v:version > 800
  Plug 'fatih/vim-go', { 'tag': 'v1.22', 'do': ':GoUpdateBinaries' }
endif

" Erlang
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-erlang/vim-erlang-compiler'
Plug 'vim-erlang/vim-erlang-tags'

" Elixir
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'

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
if $TERM == 'screen'
  set t_Co=256
endif
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

" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" vim-go
let g:go_version_warning = 0
