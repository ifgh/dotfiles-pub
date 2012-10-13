" Vim color file
" Name:       herald.vim
" Author:     Fabio Cevasco <h3rald@h3rald.com>
" Version:    0.2.0
" Notes:      Supports 8, 16, 256 and 16,777,216 (RGB) color modes

hi clear

if exists("syntax_on")
	syntax reset
endif

let colors_name = "herald2"

set background=dark

" Set some syntax-related variables
let ruby_operators = 1

	" -> Text; Miscellaneous
	hi Normal         ctermbg=234  ctermfg=252   cterm=none
	hi SpecialKey     ctermbg=234  ctermfg=82    cterm=none
	hi VertSplit      ctermbg=234  ctermfg=227   cterm=none
	hi SignColumn     ctermbg=234  ctermfg=141   cterm=none
	hi NonText        ctermbg=232  ctermfg=82    cterm=none
	hi Directory      ctermbg=234  ctermfg=227   cterm=none
	hi Title          ctermbg=234  ctermfg=84    cterm=bold

	" -> Cursor
	hi Cursor         ctermbg=227  ctermfg=234   cterm=none
	hi CursorIM       ctermbg=227  ctermfg=234   cterm=none
	hi CursorColumn   ctermbg=0                  cterm=none
	hi CursorLine     ctermbg=0                  cterm=none

	" -> Folding
	hi FoldColumn     ctermbg=237  ctermfg=33    cterm=none
	hi Folded         ctermbg=237  ctermfg=33    cterm=none

	" -> Line info
	hi LineNr         ctermbg=0    ctermfg=241   cterm=none
	hi StatusLine     ctermbg=0    ctermfg=241   cterm=bold
	hi StatusLineNC   ctermbg=0    ctermfg=233   cterm=none
	hi VertSplit      ctermbg=0    ctermfg=0
	hi ColorColumn    ctermbg=233

	" -> Messages
	hi ErrorMsg       ctermbg=124  ctermfg=252   cterm=none
	hi Question       ctermbg=234  ctermfg=214   cterm=none
	hi WarningMsg     ctermbg=214  ctermfg=0     cterm=none
	hi MoreMsg        ctermbg=234  ctermfg=214   cterm=none
	hi ModeMsg        ctermbg=234  ctermfg=214   cterm=none

	" -> Search
	hi Search         ctermbg=227  ctermfg=241   cterm=none
	hi IncSearch      ctermbg=226  ctermfg=16    cterm=bold

	" -> Diff
	hi DiffAdd        ctermbg=22   ctermfg=208   cterm=none
	hi DiffChange     ctermbg=235  ctermfg=130   cterm=none
	hi DiffDelete     ctermbg=234  ctermfg=208   cterm=none
	hi DiffText       ctermbg=24   ctermfg=208   cterm=underline

	" -> Menu
	hi Pmenu          ctermbg=233  ctermfg=124   cterm=none
	hi PmenuSel       ctermbg=208  ctermfg=52    cterm=none
	hi PmenuSbar      ctermbg=52                 cterm=none
	hi PmenuThumb     ctermbg=52                 cterm=none
	hi PmenuSel       ctermbg=208  ctermfg=52    cterm=none

	" -> Tabs
	hi TabLine        ctermbg=233  ctermfg=241   cterm=none
	hi TabLineFill    ctermbg=0                  cterm=none
	hi TabLineSel     ctermbg=235  ctermfg=252   cterm=bold
	"
	" -> Visual Mode
	hi Visual         ctermbg=227  ctermfg=236   cterm=none

	" -> Code
	hi Comment        ctermbg=234  ctermfg=241   cterm=none
	hi Constant       ctermbg=234  ctermfg=84    cterm=none
	hi String         ctermbg=237  ctermfg=215   cterm=none
	hi Error          ctermbg=234  ctermfg=203   cterm=none
	hi Identifier     ctermbg=234  ctermfg=75    cterm=none
	hi Function       ctermbg=234  ctermfg=117   cterm=none
	hi Ignore         ctermbg=234  ctermfg=234   cterm=none
	hi MatchParen     ctermbg=214  ctermfg=234   cterm=none
	hi PreProc        ctermbg=234  ctermfg=214   cterm=none
	hi Special        ctermbg=234  ctermfg=227   cterm=none
	hi Todo           ctermbg=196  ctermfg=16    cterm=bold
	hi Underlined     ctermbg=234  ctermfg=203   cterm=underline
	hi Statement      ctermbg=234  ctermfg=105   cterm=none
	hi Operator       ctermbg=234  ctermfg=118   cterm=none
	hi Delimiter      ctermbg=234  ctermfg=118   cterm=none
	hi Type           ctermbg=234  ctermfg=227   cterm=none
	hi Exception      ctermbg=234  ctermfg=203   cterm=none

	" -> HTML-specific
	hi htmlBold                 ctermbg=234  ctermfg=252   cterm=bold
	hi htmlBoldItalic           ctermbg=234  ctermfg=252   cterm=bold,italic
	hi htmlBoldUnderline        ctermbg=234  ctermfg=252   cterm=bold,underline
	hi htmlBoldUnderlineItalic  ctermbg=234  ctermfg=252   cterm=bold,underline,italic
	hi htmlItalic               ctermbg=234  ctermfg=252   cterm=italic
	hi htmlUnderline            ctermbg=234  ctermfg=252   cterm=underline
	hi htmlUnderlineItalic      ctermbg=234  ctermfg=252   cterm=underline,italic

hi! default link bbcodeBold htmlBold
hi! default link bbcodeBoldItalic htmlBoldItalic
hi! default link bbcodeBoldItalicUnderline htmlBoldUnderlineItalic
hi! default link bbcodeBoldUnderline htmlBoldUnderline
hi! default link bbcodeItalic htmlItalic
hi! default link bbcodeItalicUnderline htmlUnderlineItalic
hi! default link bbcodeUnderline htmlUnderline
