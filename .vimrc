let mapleader = ","

" Essential settings {{{
  set nocompatible

  " Theme
  set t_Co=256
  syntax on
  color desert
  set background=dark

  " Required to detect filetype and load type specific indentation
  filetype plugin indent on

  " Status line
  set statusline=%f\ %=col:%2c\ line:%2l

  scriptencoding utf-8                      " Default to UTF-8 encoding
  set backspace=indent,eol,start	          " Sane backspacing
  set number                                " Show line number
  set relativenumber                        " Note: can make your VIM slow, but issa favourite of mine.
  set clipboard^=unnamed
  set hls
  set list listchars=tab:»·,trail:·         " Display extra whitespace
  set lazyredraw                            " Faster rendering command options
  set ttyfast                               " Faster terminal connections
  set noeol                                 " Don’t add empty line at EOF
  set showcmd                               " Show partial command while typing
  set ruler                                 " Show line/column number of cursor
  set nostartofline                         " Don't reset cursor to line start
  set showmode                              " Show current mode
  set title                                 " Show filename in titlebar
  set showmatch                             " Highlight matching parenthesis
  set scrolloff=3                           " Scroll 3 lines before window edge
  set mouse=a                               " Automatically enable mouse usage
  set mousehide                             " Hide the mouse cursor while typing
  set hidden                                " Buffer settings
  set iskeyword-=.                          " '.' is an end of word designator
  set iskeyword-=#                          " '#' is an end of word designator
  set iskeyword-=-                          " '-' is an end of word designator
  set linespace=0                           " No extra spaces between rows
  set autowrite                             " Automatically save before :next
  set autoread                              " Automatically reread changed files
  set diffopt+=vertical                     " Vertical diff splits
  set nowrap                                " Do not wrap long lines
  set splitright                            " New vsplit windows to the right
  set splitbelow                            " New split windows to the bottom
  set comments=sl:/*,mb:*,elx:*/            " auto format comment blocks
  set modelines=1                           " Last line reserved for vim actions
  set linebreak                             " Wrap lines at convenient points
  set noswapfile			                      " Don't swap buffer to file"

  " Save undo history into a undo folder
  if !isdirectory(expand("~/.vim/undo/"))
    silent !mkdir -p ~/.vim/undo
  endif

  set undodir^=~/.vim/undo/                  " Directory to put undo files
  set undofile
  set nobackup                               " No backup files
  set nowritebackup                          " No backup files while editing
  set numberwidth=2			                     " Line numbers width
  set autoindent			                       " Autoindentation
  set expandtab				                       " Spaces > tabs
  set ignorecase                             " Ignore case of searches
  set incsearch                              " Dynamic highlighting
  set gdefault                               " Default global search flag
  set wrapscan                               " Wrap search around the file

  " Nicer search highlights color
  highlight IncSearch ctermfg=15 cterm=bold,underline term=standout
  highlight Search ctermfg=15 cterm=NONE term=standout ctermbg=NONE

  " https://vi.stackexchange.com/questions/201/make-panes-resize-when-host-window-is-resized/204
  autocmd VimResized * wincmd =

  set tabstop=2 shiftwidth=2 softtabstop=2   " Default tabwidth

  " 1 tab = 4 spaces for GO and Python
  autocmd Filetype go setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
  autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

" }}}

" Plugins {{{
  " Following script autoloads the plugin manager if it doesn't exist already.
  " (If you're behind an HTTP proxy, you may need to add --insecure option to the curl command.
  " In that case, you also need to set $GIT_SSL_NO_VERIFY to true.)
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif

  call plug#begin('~/.vim/plugged')
    Plug 'jremmen/vim-ripgrep'
    Plug 'airblade/vim-gitgutter'
    Plug 'altercation/vim-colors-solarized'
    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-endwise'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-surround'
    Plug 'majutsushi/tagbar'
    Plug 'itchyny/lightline.vim'
    Plug 'mgee/lightline-bufferline'
    Plug 'vim-syntastic/syntastic'
    Plug 'rhysd/vim-clang-format', { 'for': ['c', 'cpp', 'proto']}
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'elzr/vim-json', { 'for': 'json' }
    Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
    Plug 'fatih/vim-go'
    Plug 'rking/ag.vim'
    Plug 'scrooloose/nerdcommenter'
    Plug 'Yggdroot/indentLine'
    Plug 'mhinz/vim-startify'
    Plug 'craigemery/vim-autotag'
    Plug 'qpkorr/vim-bufkill'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'
    Plug 'mattn/emmet-vim'
  call plug#end()

  " Plugin settings {{{
    " Startify
      let g:startify_change_to_dir = 1
      let g:startify_change_to_vcs_root = 1

      let g:startify_bookmarks = [
        \ { 'c': '~/.vimrc' },
        \ ]
      let g:startify_transformations = [
        \ ['.*vimrc$', 'vimrc'],
        \ ]

    " FZF
      command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

      " Let fzf use colors from your color scheme
      let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

    " NERDTree settings
      " Close NERDTree when the last file closes
      " This basically translates to: after entering a buffer run an
      " autocommand (autocommands tell Vim to run certain commands whenever
      " certain events happen).
      " http://learnvimscriptthehardway.stevelosh.com/chapters/12.html
      " So it checks if the last window is window 1 and if Nerdtree buffer is
      " active, if so call quit.
      autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
            \ b:NERDTree.isTabTree()) | q | endif

    " IndentLine settings
      " Switch of indentation display by default
      let g:indentLine_enabled = 0

    " Vim-JSON
      let g:vim_json_syntax_conceal = 0

    " LightLine
      set laststatus=2
      set noshowmode
      let g:lightline = {
            \ 'colorscheme': 'seoul256',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'fugitive#head'
            \ },
            \ }

    " Lightline-bufferline
      set showtabline=2
      let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
      let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
      let g:lightline.component_type   = {'buffers': 'tabsel'}

      " Nerdcommentor
        let g:NERDSpaceDelims = 1
        let g:NERDCompactSexyComs = 1

      " Language
        " C/C++
          let g:clang_format#code_style = 'google'
          let g:syntastic_cpp_compiler = 'g++'
          let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'
          autocmd FileType c,cpp ClangFormatAutoEnable   " Toggle auto formatting

        " Ruby
          set regexpengine=1
          let g:tags_ripper = 0
          autocmd FileType ruby let g:tags_ripper = 1
  " }}}
" }}}

" Mappings {{{

  " General
    " Auto indent pasted text
      nnoremap p p=`]<C-o>
      nnoremap P P=`]<C-o>

    " Center screen on line search is found
      nnoremap n nzzzv
      nnoremap N Nzzz

    " Buffer navigation
      nnoremap <Tab> :bnext<CR>
      nnoremap <S-Tab> :bprevious<CR>

    " Highlight last inserted text, for when you get lost
    " http://vim.wikia.com/wiki/Using_marks
      nnoremap <leader>hi `[v`]

    " Get full path of the current file copied to your system wide clipboard
      map <leader>? :let @+ = expand("%:p")<CR>

      " Strip trailing white space (,sw)
        function! StripWhiteSpace()
          let save_cursor = getpos(".")
          let old_query = getreg('/')
          :%s/\s\+$//e
          call setpos('.', save_cursor)
          call setreg('/', old_query)
        endfunction
        nnoremap <leader>sw :call StripWhiteSpace()<CR>

  " Tagbar toggle
    nmap <S-t> :TagbarToggle<CR>

  " Copy the entire buffer into + ( normal mode )
  nmap <leader>a gg"+yG<CR>

  " Remove all trailing whitespace
  " \+ means 1 or more of the previous condition
  " \s is the whitespace character
  " /e no error should display if substitution not possible
  " $ end of line
  nmap <leader>0 :%s/\s\+$//e<CR>

  " NERDTREE  mappings
    " Open current file in the Nerdtree sidebar listings similar to sublime reveal.
    nmap <leader>s :NERDTreeFind<CR>

    " Toggle NerdTree with , ne "
    nmap <leader>ne :NERDTreeToggle<cr>

  " FZF mappings
    map <c-p> :Files<cr>
    map <leader>l :Lines<cr>

  " Bufkill
    map <C-c> :BD<cr>

  " NERDTree
    nmap <leader>s :NERDTreeFind<CR>
    nmap <leader>ne :NERDTreeToggle<CR>

  " IndentLine
    nmap <leader><leader>i :IndentLinesToggle<cr>

  " EasyMotion
    map  <Leader>w <Plug>(easymotion-bd-w)
    nmap <Leader>w <Plug>(easymotion-overwin-w)

"}}}
