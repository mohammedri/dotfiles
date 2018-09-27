" General settings {{{

  set nocompatible  " Make Vim more useful
  set relativenumber
  set clipboard^=unnamed  " Allows you to copy to system clipboard by default
  let mapleader = "," " set leader to ,
  set hls

  " Vim sessions
  set sessionoptions=buffers
  " Automatically save the current session whenever vim is closed
  autocmd VimLeave * mksession! ~/.vim/shutdown_session.vim

  " <F7> restores that 'shutdown session'
  noremap <F7> :source ~/.vim/shutdown_session.vim<CR>

  " If you really want to, this next line should restore the shutdown session 
  " automatically, whenever you start vim.  (Commented out for now, in case 
  " somebody just copy/pastes this whole block)
  " 
  " autocmd VimEnter source ~/.vim/shutdown_session.vim<CR>

  " manually save a session with <F5>
  noremap <F5> :mksession! ~/.vim/manual_session.vim<cr>

  " recall the manually saved session with <F6>
  noremap <F6> :source ~/.vim/manual_session.vim<cr>

  " display extra whitespace
  set list listchars=tab:»·,trail:·
  set spelllang=en_ca
" }}}

augroup qf
  autocmd!
  autocmd FileType qf set nobuflisted
augroup END

" Plugins {{{
" Use vim-plug to manage dependencies, stored to ~/.vim/plugged
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
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
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
  Plug 'morhetz/gruvbox'
  Plug 'leafgarland/typescript-vim'
call plug#end()
" }}}

" " Theme {{{
  set t_Co=256
  " syntax enable
  " let g:solarized_termtrans = 1
  " let g:solarized_termcolors=256
  " set background=dark
  " colorscheme solarized
  " set background=dark
  let g:gruvbox_contrast_dark="hard"
  colorscheme gruvbox
  syntax enable
  set hlsearch
  hi Search cterm=NONE ctermfg=White ctermbg=Magenta

" }}}

" Spacing {{{
  set autoindent                            " Autoindent
  set expandtab                             " Tabs are spaces
  filetype plugin indent on                 " Load filetype-specific indentation
  set tabstop=2 shiftwidth=2 softtabstop=2  " Default tabwidth

  " Language specific tabwidth
  autocmd Filetype go setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
  autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
" }}}

" Search {{{
  set ignorecase                            " Ignore case of searches
  set incsearch                             " Dynamic highlighting
  set gdefault                              " Default global search flag
  set wrapscan                              " Wrap search around the file
  " highlight IncSearch ctermfg=15 cterm=bold,underline term=standout
  " highlight Search ctermfg=15 cterm=NONE term=standout ctermbg=NONE
" }}}

" Undo/Backup/Swap {{{
  if !isdirectory(expand("~/.vim/undo/"))
    silent !mkdir -p ~/.vim/undo
  endif

  set undodir^=~/.vim/undo/                  " Directory to put undo files
  set undofile
  set nobackup                               " No backup files
  set nowritebackup                          " No backup files while editing
  set noswapfile                             " No swap files
" }}}

" Auto-complete {{{
  set wildmenu                                     " Command-line completion
  set wildmode=list:full
  set wildignore+=.hg,.git,.svn                    " Version control
  set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
  set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " Binary images
  set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " Compiled object files
  set wildignore+=*.spl                            " Compiled spelling lists
  set wildignore+=*.sw?                            " Vim swap files
  set wildignore+=*.DS_Store                       " OSX bullshit
  set wildignore+=*.orig                           " Merge resolution files
" }}}

" Miscellaneous {{{
  set lazyredraw                            " Faster rendering command options
  set ttyfast                               " Faster terminal connections
  set noeol                                 " Don’t add empty line at EOF
  set showcmd                               " Show partial command while typing
  set ruler                                 " Show line/column number of cursor
  set shortmess=atIfilmnrxoOtT              " Skip intro message when starting
  set spell                                 " Spell checking on
  set nostartofline                         " Don't reset cursor to line start
  set cursorline                            " Highlight current cursor line
  set showmode                              " Show current mode
  set title                                 " Show filename in titlebar
  set showmatch                             " Highlight matching parenthesis
  set scrolloff=3                           " Scroll 3 lines before window edge
  set number                                " Line number settings
  set mouse=a                               " Automatically enable mouse usage
  set mousehide                             " Hide the mouse cursor while typing
  set hidden                                " Buffer settings
  set iskeyword-=.                          " '.' is an end of word designator
  set iskeyword-=#                          " '#' is an end of word designator
  set iskeyword-=-                          " '-' is an end of word designator
  set backspace=indent,eol,start            " Backspace for dummies
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
  autocmd VimResized * wincmd =

  scriptencoding utf-8                      " Default to UTF-8 encoding
  highlight LineNr cterm=NONE ctermbg=NONE
  highlight MatchParen cterm=bold ctermbg=NONE ctermfg=15 term=standout
  highlight clear SignColumn      " SignColumn should match background
  highlight clear CursorLine
  highlight VertSplit cterm=NONE ctermbg=NONE
  highlight CursorLineNR cterm=bold ctermfg=226
  " Instead of reverting the cursor to the last position in the buffer, we
  " set it to the first line when editing a git commit message
  au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
  " Use an upright bar cursor in Insert mode, a block in normal
  if exists('$TMUX')
      let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
      let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  endif

  " }}}

" Plugins {{{

  " startify {{{
    let g:startify_change_to_dir = 1
    let g:startify_change_to_vcs_root = 1

    let g:startify_bookmarks = [
      \ { 'c': '~/.vimrc' },
      \ ]
    let g:startify_transformations = [
      \ ['.*vimrc$', 'vimrc'],
      \ ]

  " }}}

  "  fzf {{{
    command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
    command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

    nnoremap <S-b> :Buffers<CR>
    nnoremap <S-f> :Rg -F "
    map <c-p> :Files<cr>
    map <leader>l :Lines<cr>
    map <leader>t :Tags<cr>
    " let fzf use colors from your color scheme
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

    command! -bang -nargs=* Rg
          \ call fzf#vim#grep(
          \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
          \   <bang>0 ? fzf#vim#with_preview('up:60%')
          \           : fzf#vim#with_preview('right:50%:hidden', '?'),
          \   <bang>0)

    command! -bang -nargs=* Ag
          \ call fzf#vim#ag(<q-args>,
          \                 <bang>0 ? fzf#vim#with_preview('up:60%')
          \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
          \                 <bang>0)

    command! -bang -nargs=? -complete=dir Files
          \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
  " }}}

  "  Bufkill {{{
    " Kill buffer using bufstop, normal vim behaviour is to close the window as
    " well. That is not desirable
      map <C-c> :BD<cr>
  " }}}

  " NERDTree settings {{{

    " Open current file in the Nerdtree sidebar listings similar to sublime reveal.
    nmap ,s :NERDTreeFind<CR>

    " Toggle NerdTree with , ne "
    nmap <leader>ne :NERDTreeToggle<cr>

    " Close NERDTree when the last file closes
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
          \ b:NERDTree.isTabTree()) | q | endif
  " }}}

  " indentLine settings {{{
    let g:indentLine_enabled = 0
    nmap <leader><leader>i :IndentLinesToggle<cr>
  " }}}

  " Vim-JSON {{{
    let g:vim_json_syntax_conceal = 0
  " }}}

  " Airline {{{
    set noshowmode
    let g:airline#extensions#default#section_truncate_width = {}
    set t_Co=256
    let g:airline_theme='luna'         " distinguished, Lucius, Base16, or Solarized, Luna
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#fnamemod = ':t'
    set laststatus=2                       " To show status bar on startup
  " }}}

  " EasyMotion {{{
    " <Leader>w Move to word
    map  <Leader>w <Plug>(easymotion-bd-w)
    nmap <Leader>w <Plug>(easymotion-overwin-w)
  " }}}

  " nerdcommentor {{{
    let g:NERDSpaceDelims = 1
    let g:NERDCompactSexyComs = 1
  " }}}

" }}}

" Language {{{
  " {{{ C/C++
    let g:clang_format#code_style = 'google'
    let g:syntastic_cpp_compiler = 'g++'
    let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'
    autocmd FileType c,cpp ClangFormatAutoEnable   " Toggle auto formatting
  " }}}

  " {{{ Ruby
    set regexpengine=1
    let g:tags_ripper = 0
    autocmd FileType ruby let g:tags_ripper = 1
  " }}}
" }}}

" Mappings {{{
" Allow using the repeat operator with a visual selection (!)
  vnoremap . :normal .<CR>

" Auto indent pasted text
  nnoremap p p=`]<C-o>
  nnoremap P P=`]<C-o>

" For when you forget to sudo.. Really Write the file.
  cmap w!! w !sudo tee % >/dev/null

" Move vertically by visual line
  nnoremap j gj
  nnoremap k gk
  nnoremap J gj
  nnoremap K gk

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in
  nnoremap n nzzzv
  nnoremap N Nzzz

" Easier buffer navigation
  nnoremap <Tab> :bnext<CR>
  nnoremap <S-Tab> :bprevious<CR>

" Do not show stupid q: window
  map q: :q

" Space opens/closes folds
  nnoremap <space> za

" Highlight last inserted text
  nnoremap <leader>hi `[v`]

" Edit/load .vimrc bindings
  nnoremap <leader>ev :vsp $MYVIMRC<CR>
  nnoremap <leader>sv :source $MYVIMRC<CR>

" Get full path of the current file copied to your system wide clipboard
  map <leader>? :let @+ = expand("%:p")<CR>

" Open Tagbar with Shift+T
  nmap <S-t> :TagbarToggle<CR>

" Shift key fixes
  if has("user_commands")
    command! -bang -nargs=* -complete=file E e<bang> <args>
    command! -bang -nargs=* -complete=file W w<bang> <args>
    command! -bang -nargs=* -complete=file Wq wq<bang> <args>
    command! -bang -nargs=* -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
  endif
" }}}

  " Toggle over length highlighting (,ol) {{{
    function! ToggleOverLengthIndicator()
        if g:over_length_hl_enabled
            highlight OverLength ctermbg=NONE ctermfg=NONE cterm=NONE
            let g:over_length_hl_enabled = 0
        else
            highlight OverLength ctermbg=NONE ctermfg=red cterm=bold
            let g:over_length_hl_enabled = 1
        endif
    endfunction
    let g:over_length_hl_enabled = 1
    highlight OverLength ctermbg=NONE ctermfg=NONE cterm=NONE
    match OverLength /\%81v.\+/
    nnoremap <leader>ol :call ToggleOverLengthIndicator()<CR>
  " }}}

  " Toggle fold (, ) {{{
    function! ToggleFold()
      if(&foldlevel == 0)
        set foldlevel=99
      else
        set foldlevel=0
     endif
    endfunc
    noremap <leader><space> :call ToggleFold()<CR>
  " }}}

  " Change to directory of current file, window specific (,lcd) {{{
    function! LocallyChangeCurrentDirectory()
      lcd %:p:h
    endfunction
    nnoremap <leader>lcd :call LocallyChangeCurrentDirectory()<CR>
  " }}}

  " Change to directory of current file (,cd) {{{
    function! ChangeCurrentDirectory()
      cd %:p:h
    endfunction
    nnoremap <leader>cd :call ChangeCurrentDirectory()<CR>
  " }}}

  " Strip trailing white space (,sw) {{{
    function! StripWhiteSpace()
      let save_cursor = getpos(".")
      let old_query = getreg('/')
      :%s/\s\+$//e
      call setpos('.', save_cursor)
      call setreg('/', old_query)
    endfunction
    nnoremap <leader>sw :call StripWhiteSpace()<CR>
  " }}}
" }}}
