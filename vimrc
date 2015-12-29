set shell=bash

set nocompatible             " required for Vundle and more 
" filetype off                  " required Vundle

" vim-plug

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdcommenter'
Plug 'lambdatoast/elm.vim'
Plug 'gmarik/Vundle.vim' " required
Plug 'terryma/vim-multiple-cursors'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'Valloric/YouCompleteMe'
Plug 'bling/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'chriskempson/base16-vim'
Plug 'kien/ctrlp.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'maksimr/vim-jsbeautify'
Plug 'godlygeek/tabular'
Plug 'alunny/pegjs-vim'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-fireplace'
Plug 'kien/rainbow_parentheses.vim'
Plug 'plasticboy/vim-markdown'
"Plug 'vim-pandoc/vim-pandoc'
"Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'dhruvasagar/vim-table-mode'
Plug 'fatih/vim-go'
Plug 'majutsushi/tagbar'
Plug 'digitaltoad/vim-jade'
Plug 'mileszs/ack.vim'
Plug 'mattn/emmet-vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'dag/vim-fish'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Yggdroot/indentLine'

Plug 'elzr/vim-json'


" Add plugins to &runtimepath
call plug#end()

" filetype plugin indent on    " required
"set omnifunc=syntaxcomplete#Complete
" see :h vundle for more details or wiki for FAQ


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
colorscheme base16-default

set number
set relativenumber
set cursorline
set colorcolumn=80
" Only works in newer versions of VIM
highlight CursorLineNr ctermfg=14

set expandtab
set shiftwidth=4
set tabstop=4

" Rainbow Parentheses
au VimEnter *.clj RainbowParenthesesToggle
au Syntax *.clj RainbowParenthesesLoadRound
au Syntax *.clj RainbowParenthesesLoadSquare
au Syntax *.clj RainbowParenthesesLoadBraces

" Was used for ctrl-p, still may be useful
:set wildignore+=*.o,*.obj,**/.git/*,**/.svn/*,**/node_modules/*,**/build/*

"" NERDtree
map <C-n> :NERDTreeToggle<CR>

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

" Start NERDTree on no files specified
" autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup

set laststatus=2

"map <C-n> :NERDTreeToggle<CR>

"jslint
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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
