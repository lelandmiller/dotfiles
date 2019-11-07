set shell=sh

call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-rails'

"Plug 'Lokaltog/vim-easymotion'
Plug 'dense-analysis/ale'

Plug 'vim-airline/vim-airline-themes'
Plug 'iCyMind/NeoSolarized'
Plug 'morhetz/gruvbox'

Plug 'raphamorim/lucario'
Plug 'jacoborus/tender.vim'
Plug 'rust-lang/rust.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'sebastianmarkow/deoplete-rust'
Plug 'jaawerth/nrun.vim'

"Plug 'airblade/vim-gitgutter'
"Plug 'alunny/pegjs-vim'
Plug 'bling/vim-airline'
"Plug 'dag/vim-fish'
"Plug 'dhruvasagar/vim-table-mode'
"Plug 'edkolev/tmuxline.vim'
"Plug 'gmarik/Vundle.vim' " required
"Plug 'godlygeek/tabular'
"Plug 'junegunn/rainbow_parentheses.vim'
"Plug 'kien/rainbow_parentheses.vim'
"Plug 'mhartington/nvim-typescript'
"Plug 'mileszs/ack.vim'
"Plug 'mxw/vim-jsx'
"Plug 'roxma/nvim-completion-manager'
"Plug 'scrooloose/syntastic'
"Plug 'shougo/deoplete.nvim'
"Plug 'shougo/neocomplete.vim'
"Plug 'tpope/vim-fireplace'
"Plug 'tpope/vim-salve'
"Plug 'tpope/vim-unimpaired'
"Plug 'vim-pandoc/vim-pandoc'
"Plug 'vim-pandoc/vim-pandoc-syntax'
"Plug 'w0ng/vim-hybrid'
" YouCompleteMe will fail without CMake
"Plug 'Valloric/YouCompleteMe', {'do' : './install.py --clang-completer --tern-completer'}
Plug 'Quramy/tsuquyomi'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'benekastah/neomake'
Plug 'cdated/rainbow_parentheses.vim'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-conflicted'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'digitaltoad/vim-jade'
Plug 'easymotion/vim-easymotion'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go'
Plug 'lambdatoast/elm.vim'
Plug 'leafgarland/typescript-vim'
"Plug 'HerringtonDarkholme/yats.vim'
Plug 'lnl7/vim-nix'
Plug 'majutsushi/tagbar'
Plug 'maksimr/vim-jsbeautify'
"Plug 'maralla/completor.vim'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-grepper'
Plug 'mustache/vim-mustache-handlebars'
Plug 'othree/yajs.vim'
Plug 'plasticboy/vim-markdown'
Plug 'rhysd/conflict-marker.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sgur/vim-gitgutter' " lazy gutter
Plug 'ternjs/tern_for_vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
"Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'yggdroot/indentLine'
" Add plugins to &runtimepath
call plug#end()

"" Misc
syntax on
set mouse=a

set hlsearch
set incsearch
set ignorecase
set smartcase

" Color Theme
"
"let base16colorspace=256
"set background=dark
"colorscheme base16-default-dark
"let g:airline_theme = 'base16'


let g:gitgutter_override_sign_column_highlight = 0
" if you have vim >=8.0 or neovim >= 0.1.5
if (has("termguicolors"))
    set termguicolors
endif

" for neovim 0.1.3 and 0.1.4
let $nvim_tui_enable_true_color=1

" theme
syntax enable

let g:gruvbox_italic=1
set background=dark
colorscheme gruvbox
let g:airline_theme = 'gruvbox'

"colorscheme tender
"let g:airline_theme = 'tender'

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1






set number
set relativenumber
set cursorline
set colorcolumn=80
" Only works in newer versions of VIM
highlight CursorLineNr ctermfg=14

set expandtab
set shiftwidth=4
set tabstop=4

" Was used for ctrl-p, still may be useful
:set wildignore+=*.o,*.obj,**/.git/*,**/.svn/*,**/node_modules/*,**/build/*,**/dist/*

" setting the indenting width for html, xml and php files (you can add more)
autocmd FileType html,xml,php setlocal expandtab shiftwidth=4 tabstop=4
autocmd FileType scss setlocal expandtab shiftwidth=4 tabstop=4

set tw=80

" vim-markdown
let g:vim_markdown_initial_foldlevel=3
let g:vim_markdown_frontmatter=1

" Enable JsBeautify Plugin
autocmd FileType javascript noremap <buffer> <Leader>f :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <Leader>f :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <Leader>f :call CSSBeautify()<cr>

autocmd FileType javascript vnoremap <buffer> <Leader>f :call RangeJsBeautify()<cr>
autocmd FileType html vnoremap <buffer> <Leader>f :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <Leader>f :call RangeCSSBeautify()<cr>

" GO SETTINGS
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>dh <Plug>(go-def-split)
au FileType go nmap <Leader>gi :GoImports<cr>
au FileType go nmap <Leader>gn :GoInstall<cr>
au FileType go nmap <Leader>gt :GoTest<cr>

"" NERDtree
map <C-n> :NERDTreeToggle<CR>
noremap <Leader>nf :NERDTreeFind<CR>


" Start NERDTree on no files specified
" autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"key to remove highlighting
:map <Leader>h  :noh<Return><Esc>

" Turn on spelling
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

" Pandoc Mode
let g:pandoc#completion#bib#mode = 'citeproc'
let g:pandoc#toc#close_after_navigating=0

noremap <Leader>b :TagbarOpen fj<cr>

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Custom Key Bindings
let g:tmux_navigator_no_mappings = 1

let g:C_Ctrl_j = 'off'

nnoremap <silent> <C-j>h :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j>j :TmuxNavigateDown<cr>
nnoremap <silent> <C-j>k :TmuxNavigateUp<cr>
nnoremap <silent> <C-j>l :TmuxNavigateRight<cr>
nnoremap <silent> <C-j>/ :TmuxNavigatePrevious<cr>

" tmux...other invisibles other plugins

:set list listchars=tab:»·,trail:·
let g:indentLine_char = '┊'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_color_dark = 1
let g:indentLine_color_gui = '#bbbbbb'
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*']
" You also can use other characters:˽˰··

let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

let g:vim_json_syntax_conceal = 0

" Neomake
autocmd! BufWritePost * Neomake
let g:neomake_open_list = 2

au BufEnter *.js let b:neomake_javascript_eslint_exe = nrun#Which('eslint')
"au BufEnter *.ts let b:neomake_typescript_tslint_exe = nrun#Which('tslint')
"
function! GetLocalNpm(bin)
    let local_tslint = finddir('node_modules', ';') . '/.bin/' . bin
    if matchstr(local_tslint, "^\/\\w") == ''
        let local_tslint = getcwd() . "/" . local_tslint
    endif
    return local_tslint
endfunction

"TODO refactor
function! SetLocalTSLint()
    let local_tslint = finddir('node_modules', ';') . '/.bin/tslint'
    if matchstr(local_tslint, "^\/\\w") == ''
        let local_tslint = getcwd() . "/" . local_tslint
    endif
    let exe = executable(local_tslint) ? local_tslint : 'tslint'
    let b:neomake_typescript_tslint_exe = exe
endfunction

":call SetLocalTSLint()
au BufEnter *.ts :call SetLocalTSLint()
au BufEnter *.tsx :call SetLocalTSLint()

let g:neomake_javascript_enabled_makers = ['eslint_d']
let g:neomake_typescript_enabled_makers = ['tslint']
let g:neomake_go_enabled_makers = ['go', 'golint', 'govet']

let g:multi_cursor_exit_from_insert_mode = 0
let g:multi_cursor_exit_from_visual_mode = 0

" Called once right before you start selecting multiple cursors
"function! Multiple_cursors_before()
  "if exists(':NeoCompleteLock')==2
    "exe 'NeoCompleteLock'
  "endif
"endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
"function! Multiple_cursors_after()
  "if exists(':NeoCompleteUnlock')==2
    "exe 'NeoCompleteUnlock'
  "endif
"endfunction

nnoremap <leader>ag :Grepper -tool ag -open -switch<cr>

nnoremap <M-n> :lne<cr>
nnoremap <M-p> :lprevious<cr>
nnoremap <silent> <C-;> :lne<cr>

":let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn

" Easymotion

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap <Space>f <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
"nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Space>j <Plug>(easymotion-j)
map <Space>k <Plug>(easymotion-k)

"let g:deoplete#enable_at_startup = 1
"let g:deoplete#omni_patterns = {}
"let g:deoplete#omni_patterns.typescript = '[^. *\t]\.\w*'

"inoremap <silent><expr> <TAB>
            "\ pumvisible() ? "\<C-n>" :
            "\ <SID>check_back_space() ? "\<TAB>" :
            "\ deoplete#mappings#manual_complete()

"function! s:check_back_space() abort "{{{
    "let col = col('.') - 1
    "return !col || getline('.')[col - 1]  =~ '\s'
"endfunction"}}}

"let g:deoplete#sources#rust#racer_binary='/home/lelandmiller/.cargo/bin/racer'
"let g:deoplete#sources#rust#rust_source_path='/home/lelandmiller/pkg/rust/src'


let g:deoplete#enable_at_startup = 1

" Use ALE and also some plugin 'foobar' as completion sources for all code.
"call deoplete#custom#option('sources', {
"\ '_': ['ale'],
"\})

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ deoplete#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}


