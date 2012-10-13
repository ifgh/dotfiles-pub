" Vim color scheme
" Name:     vain256.vim
" Author:   Peter Hofmann (uninformativ.de)
" License:  Pizza-ware.

" Only works well on a terminal with 256 colors.
" (Well, there's enough GVim-only colorschemes out there, isn't it?)

hi clear
if exists("syntax_on")
   syntax reset
endif

let colors_name = "vain256"

if &background == "light"
	" Content
	hi  Normal       ctermfg=16   ctermbg=231
	hi  Statement    ctermfg=130  cterm=bold
	hi  Identifier   ctermfg=19   cterm=bold
	hi  Type         ctermfg=70   cterm=bold
	hi  String       ctermbg=195
	hi  Comment      ctermfg=141
	hi  Special      cterm=bold
	hi  SpecialChar  ctermfg=13   ctermbg=195  cterm=bold
	hi  PreProc      cterm=bold
	hi  SpecialKey   ctermfg=33
	hi  NonText      ctermfg=33
	hi  Todo         ctermbg=226
	hi  Ignore       ctermfg=226  ctermbg=0    cterm=bold

	" User interface
	hi  ModeMsg       ctermfg=16   cterm=bold
	hi  WarningMsg    ctermfg=15   ctermbg=178      cterm=bold
	hi  ErrorMsg      ctermfg=15   ctermbg=1        cterm=bold
	hi  Visual        ctermbg=226
	hi  StatusLine    ctermfg=15   ctermbg=17       cterm=bold
	hi  StatusLineNC  ctermfg=0    ctermbg=250      cterm=none
	hi  VertSplit     ctermfg=250  ctermbg=250      cterm=none
	hi  LineNr        ctermfg=0    ctermbg=253
	hi  TabLine       ctermbg=250  cterm=none
	hi  TabLineFill   ctermbg=245  cterm=underline
	hi  TabLineSel    ctermbg=255
	hi  Folded        ctermfg=0    ctermbg=255
	hi  FoldColumn    ctermfg=0    ctermbg=255
	hi  IncSearch     ctermfg=16   ctermbg=214      cterm=none
	hi  Search        ctermfg=16   ctermbg=190      cterm=bold
	hi  WildMenu      ctermbg=226
	hi  PmenuSel      ctermbg=226
	hi  ColorColumn   ctermbg=230

	" diff filetype
	hi  diffRemoved  ctermfg=160  cterm=bold
	hi  diffAdded    ctermfg=40   cterm=bold

	" vimdiff
	hi  DiffAdd     ctermfg=16  ctermbg=46   cterm=bold
	hi  DiffChange  ctermfg=16  ctermbg=87
	hi  DiffDelete  ctermfg=16  ctermbg=1    cterm=bold
	hi  DiffText    ctermfg=16  ctermbg=190  cterm=bold

	" Mail
	hi  mailQuoted1  ctermfg=1
	hi  mailQuoted2  ctermfg=33
	hi  mailSubject  ctermfg=16  ctermbg=229  cterm=bold
	hi  mailHeader   ctermfg=16  cterm=bold

	" Help
	hi  helpExample  ctermfg=166  cterm=bold
else
	hi  ColorColumn   ctermbg=233
	hi  TabLine       ctermfg=250  ctermbg=237  cterm=none
	hi  TabLineFill   ctermfg=235
	hi  TabLineSel    ctermfg=231
	hi  StatusLine    ctermfg=16   ctermbg=238  cterm=bold
	hi  StatusLineNC  ctermfg=233  ctermbg=235  cterm=bold
	hi  VertSplit     ctermfg=235  ctermbg=235
	hi  Error         ctermbg=160
	hi  ErrorMsg      ctermbg=160
	hi  WarningMsg    ctermfg=226
	hi  Visual        ctermbg=236
	hi  Title         ctermfg=226
	hi  Special       ctermfg=171
	hi  SpecialKey    ctermfg=46
	hi  NonText       ctermfg=46
	hi  Pmenu         ctermfg=239  ctermbg=233  cterm=none
	hi  PmenuSbar     ctermbg=240  cterm=none
	hi  PmenuThumb    ctermbg=178  cterm=none
	hi  WildMenu      ctermfg=16   cterm=bold
	hi  Comment       ctermfg=63
	hi  Constant      ctermfg=208
	hi  String        ctermfg=208  ctermbg=234
	hi  Folded        ctermfg=130  ctermbg=233  cterm=bold
	hi  FoldColumn    ctermfg=130  ctermbg=233  cterm=bold
	hi  LineNr        ctermfg=94   ctermbg=234
	hi  DiffText      ctermfg=229  ctermbg=34   cterm=none
	hi  DiffChange    ctermfg=229  ctermbg=27   cterm=none
	hi  DiffDelete    ctermfg=229  ctermbg=124  cterm=none
	hi  DiffAdd       ctermfg=229  ctermbg=34   cterm=none
	hi  diffRemoved   ctermfg=196  cterm=bold
	hi  diffAdded     ctermfg=46   cterm=bold
	hi  diffFile      ctermfg=226  cterm=bold
	hi  diffSubname   ctermfg=13   cterm=none
	hi  diffLine      ctermfg=13   cterm=bold
end
