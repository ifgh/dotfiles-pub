" Vim syntax file
" Language:     Sketch
" Maintainer:   Vain <pcode@uninformativ.de>
" Last Change:  2011 June 01

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
	syntax clear
elseif exists('b:current_syntax')
	finish
endif

" According to the manual:
syn keyword skkey picturebox curve def dots frame global input line polygon
			\ put repeat set sweep then
syn keyword skfun atan2 cos inverse perspective project rotate scale sin
			\ special sqrt translate unit view

" Comments:
syn match skcomment '\(%\|#\).*$'

" Types:
syn match skpoint '([^()]\+)' contains=sknumber
syn match skvector '\[[^][]\+\]' contains=sknumber
syn match sktransform '\[\[[^][]\+\]\]' contains=sknumber
syn match skdrawable '{[^()]\+}' contains=sknumber
syn match sktag '<[^()]\+>' contains=sknumber

" The following number formats were taken from:
" http://vim.wikia.com/wiki/Creating_your_own_syntax_files
" Integer with - + or nothing in front
syn match sknumber '\d\+'
syn match sknumber '[-+]\d\+'
" Floating point number with decimal no E or e (+,-)
syn match sknumber '\d\+\.\d*'
syn match sknumber '[-+]\d\+\.\d*'
" Floating point like number with E and no decimal point (+,-)
syn match sknumber '[-+]\=\d[[:digit:]]*[eE][\-+]\=\d\+'
syn match sknumber '\d[[:digit:]]*[eE][\-+]\=\d\+'
" Floating point like number with E and decimal point (+,-)
syn match sknumber '[-+]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'
syn match sknumber '\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'

hi def link skkey Statement
hi def link skfun Function
hi def link sknumber Number
hi def link skcomment Comment

hi def link skpoint Constant
hi def link skvector Define
hi def link sktransform Repeat
hi def link skdrawable Structure
hi def link sktag Tag

let b:current_syntax = 'sketch'
