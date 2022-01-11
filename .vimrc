set rtp+=~/.vim/bundle/Vundle.vim
set encoding=utf-8
set fileencodings=utf-8,cp949
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin),
"Plugin 'file:///home/jjeaby/Dev/tools/vim-plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
" All of your Plugins must be added before the following line
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'surround.vim'
Plugin 'mattn/emmet-vim'
Plugin 'HTML.zip'
Plugin 'chrisbra/csv.vim'
Plugin 'blueyed/vim-diminactive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'w0ng/vim-hybrid'

call vundle#end() " required
"filetype plugin indent on " required
"NERDTree ON 단축키를 <F3>로 설정
map <F3> :NERDTree<cr>
let NERDTreeShowHidden=1
" let NERDTreeQuitOnOpen=1
let g:ctrlp_custom_ignore = {
\ 'dir': '\.git$\|vendor$',
\ 'file': '\v\.(exe|so|dll)$'
\ }
let g:neocomplcache_enable_at_startup = 1
color jellybeans
" Tag List 환경설정
filetype on "vim filetype on
"Source Explorer 환경설정
nmap <F8> :SrcExplToggle<CR> "F8 Key = SrcExpl Toggling
nmap <C-H> <C-W>h "왼쪽 창으로 이동
nmap <C-J> <C-W>j "아래 창으로 이동
nmap <C-K> <C-W>k "윗 창으로 이동
nmap <C-L> <C-W>l "오른쪽 창으로 이동
" 세부 정보 출력
set nu
set title
set showmatch
set ruler
" 구문 강조 사용
if has("syntax")
syntax on
endif
" 들여쓰기 설정
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
" 붙여넣기 설정
set paste
set mouse-=a
" 한글 입력 설정
set encoding=utf-8
set termencoding=utf-8
" 색깔 설정
set t_Co=128
" 상태바 표시를 항상한다
set laststatus=2
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
" 검색 설정
" set ignorecase
" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif
" Markdown 문법 설정 (Git 에서 사용)
augroup markdown
" remove previous autocmds
autocmd!
" set every new or read *.md buffer to use the markdown filetype
autocmd BufRead,BufNew *.md setf markdown
augroup END
map <F1> <ESC>:set mouse=a<CR>
map <F2> <ESC>:set mouse-=a<CR>
map <F9> :vimgrep <cword> ./**/*.*<CR>
map <F10> :vimgrep <cword> ./**/*.c*<CR>
map <F11> :vimgrep <cword> ./**/*.h*<CR>
map <F12> :set hlsearch<CR>
set hlsearch

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }
"DIMINACTIVE
let g:diminactive_enable_focus =1
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap      (neocomplcache_snippets_expand)
smap      (neocomplcache_snippets_expand)
inoremap      neocomplcache#undo_completion()
inoremap      neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap  neocomplcache#sources#snippets_complete#expandable() ? "\(neocomplcache_snippets_expand)" : pumvisible() ? "\" : "\"

" Recommended key-mappings.
" : close popup and save indent.
inoremap   neocomplcache#smart_close_popup() . "\"
" : completion.
inoremap   pumvisible() ? "\" : "\"
" , : close popup and delete backword char.
inoremap  neocomplcache#smart_close_popup()."\"
inoremap  neocomplcache#smart_close_popup()."\"
inoremap   neocomplcache#close_popup()
inoremap   neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap   pumvisible() ? "\" : "\"
"inoremap   neocomplcache#smart_close_popup() . "\"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
