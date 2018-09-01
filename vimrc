" =============================================================================
call plug#begin('~/.vim/bundle')
" =============================================================================

" Plugins - General
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-sleuth'
Plug 'gcmt/wildfire.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'justinmk/vim-sneak'
Plug 'scrooloose/syntastic'
Plug 'mileszs/ack.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'mattn/emmet-vim'
Plug '29decibel/vim-stringify'
Plug 'farmergreg/vim-lastplace'
Plug 'AndrewRadev/splitjoin.vim'
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
Plug 'altercation/vim-colors-solarized'

" =============================================================================
" Plugins - Languages

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-dispatch'

" Go
Plug 'fatih/vim-go'

" Elixir
Plug 'elixir-editors/vim-elixir'

" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'kchmck/vim-coffee-script'

" SCSS
Plug 'cakebaker/scss-syntax.vim'

" Templates
Plug 'tpope/vim-haml'
Plug 'slim-template/vim-slim'

" Text aligning around a selected character.
Plug 'tommcdo/vim-lion'

" All Plugins must be added before the following this line.
" =============================================================================
call plug#end()
" =============================================================================

" Settings - General
set nocompatible
filetype off
filetype plugin indent on

set ttyfast
set ttymouse=xterm2
set ttyscroll=3

set laststatus=2
set encoding=utf-8             " Set default encoding to UTF-8
set autoread                   " Automatically reread changed files without asking me anything
set autoindent
set backspace=indent,eol,start " Makes backspace key more powerful.
set incsearch                  " Shows the match while typing
set hlsearch                   " Highlight found searches
set mouse=a                    " Enable mouse mode

set noerrorbells               " No beeps
set showcmd                    " Show me what I'm typing
set noswapfile                 " Don't use swapfile
set nobackup                   " Don't create annoying backup files
set splitright                 " Split vertical windows right to the current windows
set splitbelow                 " Split horizontal windows below to the current windows
set autowrite                  " Automatically save before :next, :make etc.
set hidden
set fileformats=unix,dos,mac   " Prefer Unix over Windows over OS 9 formats
set noshowmatch                " Do not show matching brackets by flickering
set noshowmode                 " We show the mode with airline or lightline
set ignorecase                 " Search case insensitive...
set smartcase                  " ... but not it begins with upper case
set completeopt=menu,menuone
set nocursorcolumn             " speed up syntax highlighting
set nocursorline
set updatetime=300

set pumheight=10               " Completion window max size

"http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
set clipboard^=unnamed
set clipboard^=unnamedplus

" ~/.viminfo needs to be writable and readable
set viminfo='200

set lazyredraw          " Wait to redraw

if has('persistent_undo')
  set undofile
  set undodir=~/.cache/vim
endif

set pastetoggle=<F2>
set listchars=tab:▸\ ,nbsp:⎵,extends:…,trail:•

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
set wildignore+=tags
set wildignore+=gems.tags

" Solarized theme settings.
" For iterm2:
" 1. Preferences > Text -> Uncheck "Draw bold text in bright colors"
" 2. Preferences > Terminal > Terminal Emulation -> Set "Report Terminal Type" to "xterm-256color"
set t_Co=256
syntax enable
let g:solarized_termtrans  = 1
let g:solarized_termcolors = 256
set background=dark
colorscheme solarized

" Open help vertically.
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L

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
" Filetypes
augroup reload_vimrc
  autocmd!
  autocmd BufWritePost vimrc source %
augroup END

augroup filetypedetect
  autocmd BufNewFile,BufRead .env.* setf sh
  autocmd BufNewFile,BufRead .nginx.conf*,nginx.conf* setf nginx
augroup END

" =============================================================================
" Keybindings - General

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
" Settings - Plugins

" Fugitive
vnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gb :Gblame<CR>

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
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_match_window = 'bottom,order:ttb,max:10,results:10'
let g:ctrlp_buftag_types = {'go' : '--language-force=go --golang-types=ftv'}

" Wildfire
let g:wildfire_objects = [
      \ "i'", 'i"', "i)", "i]", "i}", "ip", "it",
      \ "a'", 'a"', "a)", "a]", "a}", "ap", "at"
      \ ]

" Use `ag` when available.
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

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


" Elixir
autocmd BufWritePost *.exs silent :!mix format %
autocmd BufWritePost *.ex silent :!mix format %

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

" let g:go_metalinter_autosave = 1
" let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']

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
