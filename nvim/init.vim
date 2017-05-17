set shell=sh

"set nocompatible             " required for Vundle and more 
" filetype off                  " required Vundle

" vim-plug

call plug#begin('~/.config/nvim/plugged')



"Plug 'Lokaltog/vim-easymotion'
Plug 'rust-lang/rust.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'sebastianmarkow/deoplete-rust'

"Plug 'airblade/vim-gitgutter'
"Plug 'alunny/pegjs-vim'
"Plug 'bling/vim-airline'
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
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'yggdroot/indentLine'
" Add plugins to &runtimepath
call plug#end()

" filetype plugin indent on    " required
"set omnifunc=syntaxcomplete#Complete
" see :h vundle for more details or wiki for FAQ

"autocmd FileType javascript setlocal omnifunc=tern#Complete

"" Misc
syntax on
set mouse=a

set hlsearch
set incsearch
set ignorecase
set smartcase

let base16colorspace=256
set background=dark
"colorscheme solarized
"colorscheme base16-monokai
colorscheme base16-default-dark

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

"" Unite
"nnoremap <C-p> :Unite file_rec/async<CR>

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

" Start NERDTree on no files specified
" autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup

"set laststatus=2

" syntastic config
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"jslint
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"let g:tsuquyomi_disable_quickfix = 1
"let g:syntastic_typescript_checkers = ['tslint', 'tsuquyomi'] " You shouldn't use 'tsc' checker.

"let g:syntastic_aggregate_errors = 1

"key to remove highlighting
:map <Leader>h  :noh<Return><Esc>

"powerline
let g:airline_powerline_fonts = 1
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '#(battery Charging; battery Discharging)',
      \'y'    : ['%x', '%R'],
      \'z'    : '#(whoami)'}

" Turn on spelling
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

" Pandoc Mode
let g:pandoc#completion#bib#mode = 'citeproc'
let g:pandoc#toc#close_after_navigating=0

noremap <Leader>b :TagbarOpen fj<cr>

" " :Shell open command in scratch buffer
" command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
" function! s:RunShellCommand(cmdline)
"   echo a:cmdline
"   let expanded_cmdline = a:cmdline
"   for part in split(a:cmdline, ' ')
"      if part[0] =~ '\v[%#<]'
"         let expanded_part = fnameescape(expand(part))
"         let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
"      endif
"   endfor
"   botright new
"   setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
"   call setline(1, 'You entered:    ' . a:cmdline)
"   call setline(2, 'Expanded Form:  ' .expanded_cmdline)
"   call setline(3,substitute(getline(2),'.','=','g'))
"   execute '$read !'. expanded_cmdline
"   setlocal nomodifiable
"   1
" endfunction
" 
" 
" au FileType go nmap <Leader>ccsc :Shell ccsc<cr>
" 
" set guioptions-=m
" set guioptions-=T
" set guioptions-=r
" set guioptions-=L

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

let g:indentLine_char = '┊'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
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

" Use local eslint if available
"function! neomake#makers#ft#javascript#eslint()
let local_eslint = finddir('node_modules', ';') . '/.bin/eslint'
if matchstr(local_eslint, "^\/\\w") == ''
    let local_eslint = getcwd() . "/" . local_eslint
endif
let eslintexec = executable(local_eslint) ? local_eslint : 'eslint'

let g:neomake_javascript_eslint_maker = {
    \ 'exe': eslintexec,
    \ 'args': ['-f', 'compact'],
    \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
    \ '%W%f: line %l\, col %c\, Warning - %m'
    \ }

"let node_modules = finddir('node_modules', ';')
"let local_tsc = len(node_modules) != 0 ? './' . node_modules . '/.bin/tsc' : 'tsc'
"let tsconfig = findfile('tsconfig.json', ';')
"let g:neomake_typescript_typescript_project_maker = {
    "\ 'exe': local_tsc,
    "\ 'args': ['--noEmit', '-p', tsconfig],
    "\ 'append_file': 0,
    "\ 'errorformat':
        "\ '%E%f %#(%l\,%c): error %m,' .
        "\ '%E%f %#(%l\,%c): %m,' .
        "\ '%Eerror %m,' .
        "\ '%C%\s%\+%m'
    "\ }

let g:neomake_javascript_enabled_makers = ['eslint_d']
let g:neomake_typescript_enabled_makers = ['tslint']
let g:neomake_go_enabled_makers = ['go', 'golint', 'govet']

let g:multi_cursor_exit_from_insert_mode = 0
let g:multi_cursor_exit_from_visual_mode = 0

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

nnoremap <leader>ag :Grepper -tool ag -open -switch<cr>

nnoremap <M-n> :lne<cr>
nnoremap <M-p> :lprevious<cr>
nnoremap <silent> <C-;> :lne<cr>

":let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
"

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

"let g:ycm_semantic_triggers['typescript'] = ['.']
"
"
" css completion via `csscomplete#CompleteCSS`
" The `'cm_refresh_patterns'` is PCRE.
" Be careful with `'scoping': 1` here, not all sources, especially omnifunc,
" can handle this feature properly.
"au User CmSetup call cm#register_source({'name' : 'cm-ts',
		"\ 'priority': 9, 
		"\ 'scoping': 1,
		"\ 'scopes': ['typescript'],
		"\ 'abbreviation': 'ts',
		""\ 'cm_refresh_patterns':['.$'],
		"\ 'cm_refresh': {'omnifunc': 'tsuquyomi#complete'},
		"\ })

"let g:completor_typescript_omni_trigger = '(-?\d*\.\d\w*)|([^\`\~\!\@\#\$\%\^\&\*\(\)\-\=\+\[\{\]\}\\\|\;\:\''\"\,\.\<\>\/\?\s]+)$'

"if !exists("g:ycm_semantic_triggers")
   "let g:ycm_semantic_triggers = {}
"endif
"let g:ycm_semantic_triggers['typescript'] = ['.']
"set completeopt-=preview
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.typescript = '[^. *\t]\.\w*'


inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ deoplete#mappings#manual_complete()

function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

let g:deoplete#sources#rust#racer_binary='/home/lelandmiller/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/home/lelandmiller/pkg/rust/src'
