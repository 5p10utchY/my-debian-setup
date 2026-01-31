"--- Sample initialization file for Vim.

" Enable line numbers
"set number

" Enable mouse support
set mouse=a

" Set tab size to 8 spaces
set tabstop=8
set shiftwidth=8
set expandtab

" Automatically indent new lines
set autoindent
set smartindent

" Enable syntax highlighting
syntax on

" Set colors for the interface
set t_Co=256 " Enable 256 colors
highlight Normal ctermfg=white ctermbg=black
highlight LineNr ctermfg=yellow
highlight StatusLine ctermfg=white ctermbg=blue
highlight Error ctermfg=red

" Display the cursor position in the status line
set ruler

" Enable persistent undo
set undofile

" Remember the cursor position in each file for the next editing session
augroup remember_cursor
  autocmd!
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" Enable case-sensitive search
set ignorecase
set smartcase

" Enable highlighting of search results
set hlsearch

" Enable persistent history
set history=1000

" Enable clipboard support
set clipboard=unnamedplus

" Enable line wrapping
set wrap

" Set the fill column for hard-wrapping text
set textwidth=80

" Enable status line
set laststatus=2

" Enable file type detection
filetype plugin indent on

" Set the default spelling checker
"set spell
"set spelllang=en_us

" Enable quickfix window
set splitright
set splitbelow

" Enable visual bell instead of audible bell
set visualbell

" Enable syntax highlighting for specific file types
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab

