setlocal foldmethod=expr
setlocal foldexpr=GetPotionFold(v:lnum)

function! GetPotionFold(lnum)
	if getline(a:lnum) =~? '/v^\s*$'
		return '-1'
	endif

	return '0'
endfunction

function! IndentLevel(lnum)
	return indent(a:lnum) / &shiftwidth
endfunction
