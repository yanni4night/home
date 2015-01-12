let $LANG="zh_CN.UTF-8"
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set encoding=utf-8
set fileformats=unix

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
set number "show line nunber
set tabstop=4 "tab = 4 blank
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

"下面这句是为了让较长的行显示
set display=lastline

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

"配置TOhtml生成的代码格式
let use_xhtml = 1
let html_use_css = 1
"是否需要强制显示行号
"let html_number_lines = 1
let g:html_indent_tags = 'head\|body'

let g:pydiction_location = '/search/yangqianjun/.vim/dict/complete-dict' 

au BufRead,BufNewFile *.tpl set filetype=smarty 

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup redhat
  autocmd!
  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
  "autocmd vimenter * NERDTree
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  "修正文件类型
  autocmd BufNewFile,BufRead *.tpl,*.htm,tplt set filetype=html
  autocmd BufNewFile,BufRead *.xaml set filetype=xml

  "编辑文本文件时，tab不要变成空格
  autocmd BufNewFile,BufRead *.txt,*.text,*.data set noexpandtab
  autocmd FileType javascript set dictionary=~/.vim/dict/javascript.dict
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType html set dictionary=~/.vim/dict/css.dict,~/.vim/dict/javascript.dict,~/.vim/dict/html.dict
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType css set dictionary=~/.vim/dict/css.dict
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType php set dictionary=~/.vim/dict/php_funclist.dict
  autocmd FileType python set dictionary=~/.vim/dict/complete-dict
  autocmd FileType python setlocal et sta sw=4 sts=4
  autocmd FileType python setlocal foldmethod=indent
  autocmd FileType python set complete+=k/path/to/pydiction iskeyword+=.,( 
  augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

filetype plugin on

if &term=="xterm"
     set t_Co=8
     set t_Sb=^[[4%dm
	 set t_Sf=^[[3%dm
endif

:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
" :inoremap < <><ESC>i
:inoremap > <c-r>=ClosePair('>')<CR>

function ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
	return "\<Right>"
  else
	return a:char
  endif
endfunction

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"
