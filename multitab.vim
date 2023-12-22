
"Opens multiple files in separate tabs
function s:multi_tab_open(files)
	for l:file in a:files
		execute "$tabnew "..l:file
	endfor
endfunction

command -nargs=+ -complete=file                                    MultiTab  :call s:multi_tab_open(split("<args>", " "))

