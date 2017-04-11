syn on
"显示行号"
set number
"自动缩近"
set autoindent
set cindent

set ru
set cursorcolumn"

" MiniBufExplorer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" 启动鼠标
set mouse=a

" 允许退格键删除和tab操作
set smartindent
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=2
set textwidth=79

"制表符缩近为等于4个空格"
set tabstop=4

"统一缩近为4个字符宽度"
set softtabstop=4
set shiftwidth=4

"不用空格代替制表符"
set noexpandtab

set showcmd

let $author_name = "John Lee"                        
let $author_mail = "" 

"设置c文件头
autocmd bufnewfile *.c,*.h so ~/.vim/header/c_header.tmpl
autocmd bufnewfile *.c,*.h exec "1," . line(".")+1 . "g/File Name :.*/s//File Name : ".expand("%")
autocmd bufnewfile *.c,*.h exec "1," . line(".")+2 . "g/Author :.*/s//Author : ".expand($author_name)
autocmd bufnewfile *.c,*.h exec "1," . line(".")+3 . "g/Mail :.*/s//Mail : ".expand($author_mail)
autocmd bufnewfile *.c,*.h exec "1," . line(".")+4 . "g/Creation Date :.*/s//Creation Date : ".strftime("%Y-%m-%d")
autocmd Bufwritepre,filewritepre *.c,*.h exec "normal ma"
autocmd Bufwritepre,filewritepre *.c,*.h exec "1," . 7 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : ".strftime("%Y-%m-%d %T")
autocmd bufwritepost,filewritepost *.c,*.h exec "normal `a"

"设置py文件和sh文件头
autocmd BufNewFile *.py,*.sh, exec ":call SetTitle()"
func SetTitle()
if &filetype == 'sh'
	call setline(1,"\##################################################")
	call append(line("."),"\# File Name: ".expand("%")) 
	call append(line(".")+1,"\# Author: ".$author_name)
	call append(line(".")+2,"\# Mail: ".$author_email)
	call append(line(".")+3,"\# Created Time: ".strftime("%c"))
	call append(line(".")+4,"\##################################################")
	call append(line(".")+5,"\#!/bin/bash")
	call append(line(".")+6,"")
else
	call setline(1,"\#-*- coding:UTF-8 -*-")
	call append(line("."),"\##################################################")
	call append(line(".")+1,"\# File Name: ".expand("%")) 
	call append(line(".")+2,"\# Author: ".$author_name)
	call append(line(".")+3,"\# Mail: ".$author_email)
	call append(line(".")+4,"\# Created Time: ".strftime("%c"))
	call append(line(".")+5,"\##################################################")
	call append(line(".")+6,"\#!/usr/bin/env python")
	call append(line(".")+7,"")
endif
autocmd BufNewFile * normal G
endfunc
