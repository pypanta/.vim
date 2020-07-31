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

" Set dictionary completion
autocmd FileType text,markdown,html
    \ setlocal dictionary+=/usr/share/dict/words
autocmd FileType * execute 'setlocal dict+=~/.vim/words/'.&filetype.'.txt'
inoremap <F12> <C-x><C-k>

" Rebind <Leader> key
let mapleader = ","

" Removes highlight of your last search
" <C> stands for CTRL and therefore <C-l> stands for CTRL+l
nnoremap <C-n> :nohl<CR>

" easier moving between tabs
nnoremap <Leader>n <esc>:tabprevious<CR>
nnoremap <Leader>m <esc>:tabnext<CR>
nnoremap <Leader>tn :tabnew<CR>
nnoremap <Leader>tc :tabclose<CR>

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
set number relativenumber " show the line number relative to the line with the cursor
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
autocmd FileType html,htmldjango,css,javascript,vue
    \ setlocal tabstop=2 softtabstop=2 shiftwidth=2

" Set htmldjango as default file type for HTML files
autocmd FileType html
    \ setlocal filetype=htmldjango

" Set vue.html as default file type for vuejs files
autocmd FileType vue
    \ setlocal filetype=vue.html

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Automatically read a file in memory again if it has been detected to have
" changed from outside of Vim
set autoread

" This option helps to avoid all the "hit-enter" prompts caused by file
" messages
set shortmess=aoOtTIF

" ====================
" WINDOWS
" ====================

" Split Windows
set splitbelow
set splitright

" Switching between splitted windows
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
" Switching between splitted windows in Terminal mode
if v:version >= 801
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-l> <C-\><C-n><C-w>l
endif

" Resize splitted windows
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
" ABBREVIATIONS
" ====================

" Bash
autocmd FileType sh
    \ iabbrev <buffer> bash #!/bin/bash<CR>

" Django
autocmd FileType htmldjango
    \ iabbrev <buffer> extends {% extends '' %}<CR><CR>{% block title %}{% endblock %}<CR><CR>{% block content %}<CR>{% endblock %}<LEFT>|
    \ iabbrev <buffer> block {% block %}{% endblock %}|
    \ iabbrev <buffer> for {% for %}<CR><CR>{% endfor %}<UP>|
    \ iabbrev <buffer> if {% if %}<CR><CR>{% endif %}<UP>|
    \ iabbrev <buffer> include {% include '' %}|
    \ iabbrev <buffer> load {% load %}|

" ====================
" SEARCHING
" ====================

" Grep word under the cursor in the current file
nnoremap gr :execute "vimgrep /\\C\\<" . expand("<cword>") . "\\>/gj %" <Bar> cw<CR>
" Grep word under the cursor recursively
nnoremap Gr :execute "vimgrep /\\C\\<" . expand("<cword>") . "\\>/gj **/*" <Bar> cw<CR>
" Quickfix window use <CR> to jump to the file under the cursor,
" so undefine the mapping there
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
" Jump between next and previous file when using vimgrep
noremap <F11> :cnfile<CR>
noremap <F12> :cpfile<CR>

" Search tags
nnoremap <Leader>t :tag<space>

" ====================
" SORTING
" ====================

" Sort selected comma separated words
" vnoremap <F3> d:execute 'normal a' . join(sort(split(getreg('"'), ",")), ',')<CR>
vnoremap <F3> :s/\%V.*\%V\@!/\=join(sort(split(submatch(0), '\s*,\s*')), ', ')<CR>
" Globally sort comma separated words after word "import"
nnoremap <F3> :%s/import\s*\zs.*/\=join(sort(split(submatch(0), '\s*,\s*')),', ')<CR>

" ====================
" OTHER MAPPINGS
" ====================

" Open vimrc file
nnoremap <Leader>vc :tabnew ~/.vim/vimrc<CR>

" ====================
"   PLUGINS SETTINGS
" ====================

" Airline theme
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1

" Settings for CtrlP
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 0
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
set wildignore+=*venv/*
" Search for a tag in the current buffer
nnoremap <Leader>st :CtrlPBufTag<CR>

" Settings for jedi-vim
"let g:jedi#usages_command = "<leader>z"
"let g:jedi#popup_on_dot = 0
"let g:jedi#popup_select_first = 0
"map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" NERDTree settings
" Open NERDTree with Ctrl+m
nnoremap <C-m> :NERDTreeToggle<CR>
" Enable line numbers
let NERDTreeShowLineNumbers=1

" Fugitive Vim Git wrapper mappings
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gc :Gcommit -v<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gaa :Git add --all<CR><CR>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>grp :Ggrep<Space>
nnoremap <Leader>gp :Gpush<CR>

" Flake8 - Static syntax and style checker for Python
" Usage: Open Python file and press F7 to run flake8 on it
autocmd BufNewFile,BufRead *py
    \ packadd vim-flake8 |
    \ set filetype=python

" Script to help adding import statements in Python modules
autocmd BufNewFile,BufRead *py
    \ packadd python-imports.vim |
    \ set filetype=python |
    \ nnoremap <F5> :ImportName<CR> |
    \ nnoremap <Leader><F5> :ImportNameHere<CR>

" Load Emmet-vim plugin for html and css files
autocmd FileType html,htmldjango,css,vue packadd emmet-vim

" CSS color name highlighter
autocmd BufNewFile,BufRead *css
    \ packadd vim-css-color |
    \ set filetype=css
