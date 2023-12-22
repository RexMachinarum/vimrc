"TeX Specific Settings
augroup TEX
augroup END

"Python Specific Settings
augroup PYTHON
	autocmd BufRead *.py nnoremap <leader>r :!python %<return>
augroup END

"Txt/Markdown Specific Settings
augroup TEXT
	autocmd BufRead *.md *.txt set colorcolumn:80
augroup END

"LambdaC Specific Settings
augroup LAMBDAC
	autocmd BufRead *.lc set filetype:c
augroup END

augroup CLISP
	autocmd BufRead *.lisp set colorcolumn:80 
	autocmd BufRead *.lisp nnoremap <leader>r :!sbcl --script %<return>
augroup END
