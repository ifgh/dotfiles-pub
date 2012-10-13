set guicursor=a:blinkoff0-block

if has("gui_gtk2")
	set guioptions-=m
	set guioptions-=T
	set guioptions-=r
	set guioptions-=R
	set guifont=Terminus\ 12
else
	set guifont=-xos4-terminus-medium-*-*-*-12-*-*-*-*-*-iso10646-*
endif

set background=light
colorscheme inkpot
