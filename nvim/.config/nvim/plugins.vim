" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

    " Better Syntax Support
    "Plug 'sheerun/vim-polyglot'
    " Auto pairs for '(' '[' '{'
    "Plug 'jiangmiao/auto-pairs'
    "Plug 'vim-airline/vim-airline'
    Plug 'scrooloose/NERDTree'
    Plug 'scrooloose/nerdcommenter'
    "Plug 'ackyshake/VimCompletesMe'
    "Plug 'liuchengxu/vim-which-key'
    "Plug 'mhinz/vim-startify'
    "let g:ascii = [
                "\' _______           _                  ______              ',
                "\'( ______)         | |                / _____)        _    ',
                "\'| |___   ____   __| |_   _  ____ ___( (____  _____ _| |_  ',
                "\'|  ___) |  _ \ / _  | | | |/ ___) _ \\____ \(____ (_   _) ',
                "\'| |_____| | | ( (_| | |_| | |  | |_| |____) ) ___ | | |_  ',
                "\'|_______)_| |_|\____|____/|_|   \___(______/\_____|  \__) ',
            "\''
            "\]
    let g:ascii = [
            \'                                                                ,-.               ',
            \'                                                               / \  `.  __..-,O   ',
            \'                                                              :   \ --  _..- .    ',
            \'                                                              |    . .-  `.  .    ',
            \'                                                              :     .     .`.     ',
            \'                                                               \     `.  /  ..    ',
            \'                                                                \      `.     .   ',
            \'                                                                 `,       `.   \  ',
            \'                                                                ,|,`.        `-.\ ',
            \'                                                                .||  ``-...__..-` ',
            \'  _______           _                  ______                   |  |              ',
            \' ( ______)         | |                / _____)        _         |__|              ',
            \' | |___   ____   __| |_   _  ____ ___( (____  _____ _| |_       /||\              ',
            \' |  ___) |  _ \ / _  | | | |/ ___) _ \\____ \(____ (_   _)     //||\\             ',
            \' | |_____| | | ( (_| | |_| | |  | |_| |____) ) ___ | | |_     // || \\            ',
            \' |_______)_| |_|\____|____/|_|   \___(______/\_____|  \__) __//__||__\\__         ',
            \'                                                          |--------------|        ',
            \'',
            \]
    let g:startify_custom_header = g:ascii 

    Plug 'lervag/vimtex'
    let g:tex_flavor='latex'
    let g:vimtex_view_method='zathura'
    let g:vimtex_quickfix_open_on_warning=0
    let g:vimtex_quickfix_mode=0
    "let g:vimtex_compiler_progname='nvr'
    "let g:vimtex_compiler_latexmk = { 
        "\ 'executable' : 'latexmk',
        "\ 'options' : [ 
        "\   '-xelatex',
        "\   '-file-line-error',
        "\   '-synctex=1',
        "\   '-interaction=nonstopmode',
        "\ ],
        "\}
    "let g:vimtex_compiler_latexmk_engines = {
        "\ '_'                : '-xelatex'
        "\}
    let g:vimtex_compiler_latexmk = {
            \ 'build_dir' : 'build',
            \}
    Plug 'sirver/ultisnips'
    let g:UltiSnipsSnippetsDir = $HOME.'/.config/nvim/'
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

    Plug 'KeitaNakamura/tex-conceal.vim'
    let g:tex_conceal='abdmg'
    hi Conceal ctermbg=none

    Plug 'gruvbox-community/gruvbox'
    let g:gruvbox_italic=1

    " CoC
    "Plug 'neoclide/coc.nvim', {'branch': 'release'}
    "let g:python3_host_prog = '/usr/bin/python3' 

    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

call plug#end()

colorscheme gruvbox
highlight Normal guibg=none

"autocmd FileType tex :CocDisable
