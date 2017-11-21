"Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Yggdroot/indentLine'
Plugin 'flazz/vim-colorschemes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"以下為通用設定

"顯示行號
set nu

"語法高亮
syntax on

"滑鼠可用
set mouse=a

"縮排間隔數
set tabstop=4
set softtabstop=4

"自動縮排對齊間隔數
set shiftwidth=4

"tab鍵換成space
set expandtab

"自動對齊縮排
set autoindent

"光標底線
set cursorline
hi CursorLine cterm=none ctermbg=88 ctermfg=252

"自動補齊括號
inoremap {<CR> {<CR>}<Esc>ko
inoremap [ []<Esc>i
inoremap ( ()<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i

"顯示鼠標位置
set ruler

"自動備份檔案
"set backup

map <F5> :call CompileRun()<CR>
fun! CompileRun()
    exec "w"
    if &filetype == 'cpp'
        exec "!g++ % -o %< && ./%<"
    elseif &filetype == 'python'
        exec "!python3 %"
    endif
endfunc

map <F6> :call CompileRunFeedInput()<CR>
fun! CompileRunFeedInput()
    exec "w"
    if &filetype == 'cpp'
        exec "!g++ % -o %< && ./%< < test.txt"
    elseif &filetype == 'python'
        exec "!python3 % < test.txt"
    endif
endfunc

"縮進指示線
let g:indentLine_enabled = 1

colorscheme molokai

