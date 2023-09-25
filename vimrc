"=====================
"   VIM CONFIG FILE
"=====================

" Auto reload .vimrc file
augroup reload_vimrc
    autocmd!
    autocmd! bufwritepost ~/.vim/vimrc source %
augroup END

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
augroup show_whitespace
    autocmd!
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
augroup END

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
colorscheme wombat256i

" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype plugin indent on
syntax on

" Sets the character encoding used inside Vim
set encoding=utf-8

" Mouse and backspace
set mouse=a
set bs=2

" Show cursor line and column
set cursorline
set cursorcolumn

" Show wildmenu for completion, when press TAB the possible matches are shown
set wildmenu

" Useful settings
set history=700
set undolevels=700

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Letting us to leave an edited buffer without saving it
set hidden

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

" Showing line numbers and length
set number relativenumber " show the line number relative to the line with the cursor
set textwidth=79 " maximum width of text that is being inserted
set nowrap " don't automatically wrap on load
set fo-=t " don't automatically wrap text when typing
set colorcolumn=80
set scrolloff=10 " minimal number of screen lines to keep above and below the cursor
" :hep ctermbg for colors
highlight ColorColumn ctermbg=8

" Selects the default regexp engine
" 0 automatic selection, 1 old engine, 2 NFA engine
set regexpengine=0

" When this option is set, the screen will not be redrawn while executing
" macros, registers and other commands that have not been typed
set lazyredraw

" The time in milliseconds for redrawing the display
set redrawtime=10000

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamedplus

" Matching the suffix when searching for file under the cursor with "gf"
set suffixesadd=.py,.sh,.js,.html,.css,.vue

" Rebind <Leader> key
let mapleader = ","

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" save file with Ctrl+S
inoremap <C-s> <esc>:w<cr>a
nnoremap <C-s> :w<cr>a

" Removes highlight of your last search
" <C> stands for CTRL and therefore <C-l> stands for CTRL+l
nnoremap <C-n> :nohl<CR>

" easier moving between tabs
nnoremap <Leader>n <esc>:tabprevious<CR>
nnoremap <Leader>m <esc>:tabnext<CR>
nnoremap <silent> <Leader>tm :exe "tabmove" nr2char(getchar())<CR>
nnoremap <Leader>tn :tabnew<CR>
nnoremap <Leader>tc :tabclose<CR>

" Set two spaces indention for HTML, CSS, JavaScript files
augroup filetype_indention
    autocmd!
    autocmd FileType html,htmldjango,css,javascript,vue
        \ setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" Set htmldjango as default file type for HTML files
augroup html_filetype
    autocmd!
    autocmd FileType html
        \ setlocal filetype=htmldjango
augroup END

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

runtime snippets.vim

" ====================
" COMPLETIONS
" ====================

" Set dictionary completion
augroup dictionary_completion
    autocmd!
    autocmd FileType text,markdown,html
        \ setlocal dictionary+=/usr/share/dict/words
    autocmd FileType * execute 'setlocal dict+=~/.vim/words/'.&filetype.'.txt'
    inoremap <F12> <C-x><C-k>
augroup END

" ====================
" DOCUMENTATIONS
" ====================

" Use PyDoc instead of man to lookup the keyword under the cursor
augroup pydoc
    autocmd!
    autocmd BufNewFile,BufRead *py set keywordprg=/usr/bin/pydoc3
augroup END

" ====================
" SEARCHING
" ====================

" Ignore one of these patterns when expanding wildcards
set wildignore+=*.pyc,*/_build/**,*/coverage/**,*/venv/*,*/node_modules/**

" Grep word under the cursor in the current file
nnoremap gwc :execute "vimgrep /\\C\\<" . expand("<cword>") . "\\>/gj %" <Bar> cw<CR>
" Grep word under the cursor recursively
nnoremap gwr :execute "vimgrep /\\C\\<" . expand("<cword>") . "\\>/gj **/*" <Bar> cw<CR>
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
" SUBSTITUTIONS
" ====================

" Quoting comma separated strings inside brackets (),
" curly {} and square [] brackets
" '\ze' -- Vim regex for lookahead
nnoremap <Leader>qsb :s/\v((\w+\s){0,}(\w+))\ze[,)]/'\1'/g<CR>
nnoremap <Leader>qscb :s/\v((\w+\s){0,}(\w+))\ze[:,}]/'\1'/g<CR>
nnoremap <Leader>qssb :s/\v((\w+\s){0,}(\w+))\ze[,\]]/'\1'/g<CR>
" Comment visual selected lines
vnoremap <Leader>cs# :s/^[^$]/# &/<CR>:nohl<CR>
vnoremap <Leader>cs/ :s/^[^$]/\/\/ &/<CR>:nohl<CR>

" ====================
" OTHER MAPPINGS
" ====================

"Make it easier to indent a visual selection several times.
xnoremap > >gv
xnoremap < <gv

" Open vimrc file
nnoremap <Leader>vc :tabnew ~/.vim/vimrc<CR>

" Quote word
nnoremap <leader>q" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>q' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>q` viw<esc>a`<esc>bi`<esc>lel

" ====================
"   PLUGINS SETTINGS
" ====================

" Airline theme
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1
" :help airline-customization
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.colnr = ' ℅:'

" Settings for CtrlP
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|venv|coverage|node_modules|_build|target)$',
  \ 'file': '\v\.(pyc|so)$',
  \ }
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
nnoremap <Leader>gs :Git<CR>
nnoremap <Leader>gaa :Git add --all<CR><CR>
nnoremap <Leader>gc :Gcommit -v<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gl :Gclog<CR>
nnoremap <Leader>gla :Gclog --<CR>
nnoremap <Leader>glc :Gclog -- %<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>grp :Ggrep<Space>

" Vim LSP (Language Server Protocol)
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=no
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    inoremap <buffer> <expr><c-f> lsp#scroll(+4)
    inoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:lsp_diagnostics_enabled = 0
let g:lsp_document_highlight_enabled = 0
highlight lspReference ctermfg=red guifg=red ctermbg=green guibg=green

" Asyncomplete Vim
let g:asyncomplete_auto_popup = 0

" Use Tab to show the autocomplete
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Load optional plugins
augroup load_plugins
    autocmd!
    " Flake8 - Static syntax and style checker for Python
    " Usage: Open Python file and press F7 to run flake8 on it
    " Python-Imports - Script to help adding import statements in Python modules
    " Python-Syntax - Python syntax highlighting for Vim
    autocmd BufNewFile,BufRead *py
        \ packadd vim-flake8 |
        \ packadd python-imports.vim |
        \ nnoremap <F5> :ImportName<CR> |
        \ nnoremap <Leader><F5> :ImportNameHere<CR> |
        \ packadd python-syntax |
        \ let g:python_highlight_all = 1 |
        \ set filetype=python

    " Load Emmet-vim plugin for html and css files
    autocmd FileType html,htmldjango,css,vue packadd emmet-vim

    " CSS color name highlighter
    autocmd BufNewFile,BufRead *css
        \ packadd vim-css-color |
        \ set filetype=css

    " JavaScript syntax highlighting and improved indentation
    autocmd BufNewFile,BufRead *js
        \ packadd vim-javascript |
        \ set filetype=javascript

    " Vim syntax highlighting for Vue components
    autocmd BufNewFile,BufRead *vue
        \ packadd vim-vue-plugin |
        \ set filetype=vue.html
augroup END
