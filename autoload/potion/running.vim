function! potion#running#PotionCompileAndRunFile()
	silent !clear
	execute "!" . g:potion_command . " " . bufname("%")
endfunction

function! potion#running#PotionShowBytecode()
	" Get the bytecode.
	let bytecode = system(g:potion_command . " -c -V " . bufname("%") . " 2>&1")

	" Open a new split and set it up.
	let bytecode_window_number = bufwinnr("__Potion_Bytecode__")
	if bytecode_window_number != -1
		execute bytecode_window_number . "wincmd w"
	else
		vsplit __Potion_Bytecode__
	endif
	normal! ggdG
	setlocal filetype=potionbytecode
	setlocal buftype=nofile
	" Insert the bytecode.
	call append(0, split(bytecode, '\v\n'))
endfunction

