"------------------------------ Global Functions ------------------------------

"This function finds all of the subfiles recursively from the directory given
"in current_dir
"DO NOT USE ARGUMENTS dir_stack OR file_list
function FindSubfiles(current_dir, dir_stack = [], file_list = [])
	call assert_true(isdirectory(a:current_dir))
	let l:dirs = readdir(a:current_dir)
	for l:file in l:dirs
		if isdirectory(l:file)
			call add(a:dir_stack, l:file)
			call FindSubfiles(l:file, a:dir_stack, a:file_list)
			call remove(a:dir_stack, -1)
		else
			if len(a:dir_stack) > 0
				call add(a:file_list, join(a:dir_stack, "/").."/"..l:file)
			else
				call add(a:file_list, l:file)
			endif
		endif
	endfor
	return a:file_list
endfunction

"Uses fuzzy find to compare a:A against all subfiles of the current directory
"and returns all values that match.
function FuzzyFileCompletion(A,L,P)
	let l:files = []
	call FindSubfiles(getcwd(), [], l:files)
	if len(a:A) > 0
		return matchfuzzy(l:files, a:A)
	else
		return l:files
	endif
endfunction


