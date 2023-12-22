function g:EditOrResume(filename)
	let l:buffer_info = getbufinfo()
	for l:buffer in l:buffer_info
		let l:name = l:buffer["name"]
		if match(l:name, a:filename) > 0
			execute "buffer "..l:name
			return 0
		endif
	endfor
	execute "edit "..a:filename
endfunction

command -nargs=1 -complete=customlist,FuzzyFileCompletion FuzzyOpen :call EditOrResume("<args>")

