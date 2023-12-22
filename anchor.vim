let s:new_anchor_tag = v:null
let g:anchored_files = {}

function s:anchor_keyval_match(A, L, P)
	return keys(g:anchored_files)
endfunction

"Save anchors when vim closes to an anchor file
function ReadAnchors()
	let l:filename = ""
	if has('win32')
		let l:filename = "_anchors.vim"
	else
		let l:filename = ".anchors.vim"
	endif
	if filereadable(l:filename)
		let g:anchored_files = eval(join(readfile(l:filename)))
	endif
endfunction
call ReadAnchors()

function SaveAnchors()
	if len(keys(g:anchored_files)) > 0
		let l:filename = ""
		if has('win32')
			let l:filename = "_anchors.vim"
		else
			let l:filename = ".anchors.vim"
		endif
		call writefile([string(g:anchored_files)], l:filename)
	endif
endfunction
autocmd VimLeavePre * call SaveAnchors()

command -nargs=0 AnchorList :echo g:anchored_files
command -nargs=1                                              AnchorName     :let s:new_anchor_tag = "<args>"
command -nargs=1 -complete=customlist,FuzzyFileCompletion     AnchorDrop     :let g:anchored_files[s:new_anchor_tag] = "<args>"
command -nargs=1 -complete=customlist,s:anchor_keyval_match   AnchorSwap     :execute "e "..g:anchored_files["<args>"]
command -nargs=1 -complete=customlist,s:anchor_keyval_match   AnchorRemove   :call remove(g:anchored_files, "<args>")
