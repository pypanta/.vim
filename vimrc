"=====================
"   VIM CONFIG FILE
"=====================

" Auto reload .vimrc file
autocmd! bufwritepost ~/.vim/vimrc source %

" Sets the character encoding used inside Vim
set encoding=utf-8

" save file with Ctrl+S
inoremap <C-s> <esc>:w<cr>a
nnoremap <C-s> :w<cr>a

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamedplus

" Mouse and backspace
set mouse=a
set bs=2

" Show cursor line and column
set cursorline
set cursorcolumn

" Show wildmenu for completion, when press TAB the possible matches are shown
set wildmenu

" Rebind <Leader> key
let mapleader = ","

" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
colorscheme wombat256i

" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype plugin indent on
syntax on

" Showing line numbers and length
set relativenumber " show the line number relative to the line with the cursor
set textwidth=79 " maximum width of text that is being inserted
set nowrap " don't automatically wrap on load
set fo-=t " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" Useful settings
set history=700
set undolevels=700

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Set two spaces indention for HTML, CSS, JavaScript files
autocmd FileType html,htmldjango,css,javascript
    \ setlocal tabstop=2 softtabstop=2 shiftwidth=2

" Set htmldjango as default file type for HTML files
autocmd FileType html
    \ setlocal filetype=htmldjango

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Jump between next and previous file when using vimgrep
noremap <F11> :cnfile<CR>
noremap <F12> :cpfile<CR>

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" ====================
" WINDOWS
" ====================

" Split Windows
set splitbelow
set splitright

" Switch between split windows
nmap <C-j> <C-w><C-j>
nmap <C-k> <C-w><C-k>
nmap <C-h> <C-w><C-h>
nmap <C-l> <C-w><C-l>

" Resize split windows
nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>0 :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>9 :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" ====================
" FOLDING
" ====================

" Enable folding
set foldmethod=indent
set foldlevel=99

" Fold with spacebar
nnoremap <space> za

" ====================
"   PLUGINS SETTINGS
" ====================

" Airline theme
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1

" Settings for ctrlp
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
set wildignore+=*venv/*

" Settings for jedi-vim
"let g:jedi#usages_command = "<leader>z"
"let g:jedi#popup_on_dot = 0
"let g:jedi#popup_select_first = 0
"map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Open NERDTree with Ctrl+m
map <C-m> :NERDTreeToggle<CR>

" Flake8 - Static syntax and style checker for Python
" Usage: Open Python file and press F7 to run flake8 on it
autocmd BufNewFile,BufRead *py
    \ packadd vim-flake8 |
    \ set filetype=python

" Load Emmet-vim plugin for html and css files
autocmd FileType html,htmldjango,css packadd emmet-vim

" CSS color name highlighter
autocmd BufNewFile,BufRead *css
    \ packadd vim-css-color |
    \ set filetype=css
