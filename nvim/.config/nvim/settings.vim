filetype plugin indent on
syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open
"set nowrap                             " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set fileencoding=utf-8                  " The encoding written to file
set ruler                               " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                        " treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set conceallevel=1                      " So that I can see `` in markdown files
set tabstop=4                           " Insert 2 spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=0                        " Always display the status line
set number                              " Line numbers
"set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set clipboard=unnamedplus               " Copy paste between vim and everything else
set list
set listchars+=trail:◦                  " Leave trailing spaces
set notermguicolors

"setlocal spell
"set spell spelllang=en_gb
set scrolloff=8
"set signcolumn=yes
set whichwrap+=<,>,[,]
au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

augroup Format-Options
    autocmd!
    autocmd BufEnter * setlocal formatoptions -=cro
    autocmd TermOpen * startinsert
augroup END

augroup markdownSpell
    autocmd!
    autocmd FileType latex,tex,md,markdown setlocal spell
    autocmd BufRead,BufNewFile *.md,*.tex setlocal spell
augroup END


