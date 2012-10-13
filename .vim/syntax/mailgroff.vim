" Vim syntax file
" Language:		Mail file
" Previous Maintainer:	Felix von Leitner <leitner@math.fu-berlin.de>
" Maintainer:		Gautam Iyer <gi1242@users.sourceforge.net>
" Last Change:		Thu 06 Nov 2008 10:10:55 PM PST

" Quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" The mail header is recognized starting with a "keyword:" line and ending
" with an empty line or other line that can't be in the header. All lines of
" the header are highlighted. Headers of quoted messages (quoted with >) are
" also highlighted.

" Syntax clusters
syn cluster mailHeaderFields	contains=mailHeaderKey,mailSubject,mailHeaderEmail,@mailLinks
syn cluster mailLinks		contains=mailURL,mailEmail
syn cluster mailQuoteExps	contains=mailQuoteExp1,mailQuoteExp2,mailQuoteExp3,mailQuoteExp4,mailQuoteExp5,mailQuoteExp6

syn case match
" For "From " matching case is required. The "From " is not matched in quoted
" emails
" According to RFC 2822 any printable ASCII character can appear in a field
" name, except ':'.
syn region	mailHeader	contains=@mailHeaderFields,@NoSpell start="^From .*\d\d\d\d$" skip="^\s" end="\v^[!-9;-~]*([^!-~]|$)"me=s-1 fold
syn match	mailHeaderKey	contained contains=mailEmail,@NoSpell "^From\s.*\d\d\d\d$"

" Nothing else depends on case. 
syn case ignore

" Headers in properly quoted (with "> " or ">") emails are matched
syn region	mailHeader	keepend contains=@mailHeaderFields,@mailQuoteExps,@NoSpell start="^\z(\(> \?\)*\)\v(newsgroups|x-([a-z\-])*|path|xref|message-id|from|((in-)?reply-)?to|b?cc|subject|return-path|received|date|replied):" skip="^\z1\s" end="\v^\z1[!-9;-~]*([^!-~]|$)"me=s-1 end="\v^\z1@!"me=s-1 end="\v^\z1(\> ?)+"me=s-1 fold

" Usenet headers
syn match	mailHeaderKey	contained contains=mailHeaderEmail,mailEmail,@NoSpell "\v(^(\> ?)*)@<=(Newsgroups|Followup-To|Message-ID|Supersedes|Control):.*$"


syn region	mailHeaderKey	contained contains=mailHeaderEmail,mailEmail,@mailQuoteExps,@NoSpell start="\v(^(\> ?)*)@<=(to|b?cc):" skip=",$" end="$"
syn match	mailHeaderKey	contained contains=mailHeaderEmail,mailEmail,@NoSpell "\v(^(\> ?)*)@<=(from|reply-to):.*$" fold
syn match	mailHeaderKey	contained contains=@NoSpell "\v(^(\> ?)*)@<=date:"
syn match	mailSubject	contained "\v^subject:.*$" fold
syn match	mailSubject	contained contains=@NoSpell "\v(^(\> ?)+)@<=subject:.*$"

" Anything in the header between < and > is an email address
syn match	mailHeaderEmail	contained contains=@NoSpell "<.\{-}>"

" Mail Signatures. (Begin with "-- ", end with change in quote level)
syn region	mailSignature	keepend contains=@mailLinks,@mailQuoteExps start="^--\s$" end="^$" end="^\(> \?\)\+"me=s-1 fold
syn region	mailSignature	keepend contains=@mailLinks,@mailQuoteExps,@NoSpell start="^\z(\(> \?\)\+\)--\s$" end="^\z1$" end="^\z1\@!"me=s-1 end="^\z1\(> \?\)\+"me=s-1 fold

" Treat verbatim Text special.
syn region	mailVerbatim	contains=@NoSpell keepend start="^#v+$" end="^#v-$" fold 
syn region	mailVerbatim	contains=@mailQuoteExps,@NoSpell start="^\z(\(> \?\)\+\)#v+$" end="\z1#v-$" fold 

" URLs start with a known protocol or www,web,w3.
syn match mailURL contains=@NoSpell `\v<(((https?|ftp|gopher)://|(mailto|file|news):)[^' 	<>"]+|(www|web|w3)[a-z0-9_-]*\.[a-z0-9._-]+\.[^' 	<>"]+)[a-z0-9/]`
syn match mailEmail contains=@NoSpell "\v[_=a-z\./+0-9-]+\@[a-z0-9._-]+\a{2}"

" Make sure quote markers in regions (header / signature) have correct color
syn match mailQuoteExp1	contained "\v^(\> ?)"
syn match mailQuoteExp2	contained "\v^(\> ?){2}"
syn match mailQuoteExp3	contained "\v^(\> ?){3}"
syn match mailQuoteExp4	contained "\v^(\> ?){4}"
syn match mailQuoteExp5	contained "\v^(\> ?){5}"
syn match mailQuoteExp6	contained "\v^(\> ?){6}"

" Even and odd quoted lines. Order is important here!
syn region	mailQuoted6	keepend contains=mailVerbatim,mailHeader,@mailLinks,mailSignature,@NoSpell start="^\z(\(\([a-z]\+>\|[]|}>]\)[ \t]*\)\{5}\([a-z]\+>\|[]|}>]\)\)" end="^\z1\@!" fold
syn region	mailQuoted5	keepend contains=mailQuoted6,mailVerbatim,mailHeader,@mailLinks,mailSignature,@NoSpell start="^\z(\(\([a-z]\+>\|[]|}>]\)[ \t]*\)\{4}\([a-z]\+>\|[]|}>]\)\)" end="^\z1\@!" fold
syn region	mailQuoted4	keepend contains=mailQuoted5,mailQuoted6,mailVerbatim,mailHeader,@mailLinks,mailSignature,@NoSpell start="^\z(\(\([a-z]\+>\|[]|}>]\)[ \t]*\)\{3}\([a-z]\+>\|[]|}>]\)\)" end="^\z1\@!" fold
syn region	mailQuoted3	keepend contains=mailQuoted4,mailQuoted5,mailQuoted6,mailVerbatim,mailHeader,@mailLinks,mailSignature,@NoSpell start="^\z(\(\([a-z]\+>\|[]|}>]\)[ \t]*\)\{2}\([a-z]\+>\|[]|}>]\)\)" end="^\z1\@!" fold
syn region	mailQuoted2	keepend contains=mailQuoted3,mailQuoted4,mailQuoted5,mailQuoted6,mailVerbatim,mailHeader,@mailLinks,mailSignature,@NoSpell start="^\z(\(\([a-z]\+>\|[]|}>]\)[ \t]*\)\{1}\([a-z]\+>\|[]|}>]\)\)" end="^\z1\@!" fold
syn region	mailQuoted1	keepend contains=mailQuoted2,mailQuoted3,mailQuoted4,mailQuoted5,mailQuoted6,mailVerbatim,mailHeader,@mailLinks,mailSignature,@NoSpell start="^\z([a-z]\+>\|[]|}>]\)" end="^\z1\@!" fold

" Need to sync on the header. Assume we can do that within 100 lines
if exists("mail_minlines")
    exec "syn sync minlines=" . mail_minlines
else
    syn sync minlines=100
endif

" Define the default highlighting.
hi def link mailVerbatim	Special
hi def link mailHeader		Statement
hi def link mailHeaderKey	Type
hi def link mailSignature	PreProc
hi def link mailHeaderEmail	mailEmail
hi def link mailEmail		Special
hi def link mailURL		String
hi def link mailSubject		LineNR
hi def link mailQuoted1		Comment
hi def link mailQuoted3		mailQuoted1
hi def link mailQuoted5		mailQuoted1
hi def link mailQuoted2		Identifier
hi def link mailQuoted4		mailQuoted2
hi def link mailQuoted6		mailQuoted2
hi def link mailQuoteExp1	mailQuoted1
hi def link mailQuoteExp2	mailQuoted2
hi def link mailQuoteExp3	mailQuoted3
hi def link mailQuoteExp4	mailQuoted4
hi def link mailQuoteExp5	mailQuoted5
hi def link mailQuoteExp6	mailQuoted6

" --------------------------------------------------------------------
" --------------------------------------------------------------------
" --------------------------------------------------------------------
" --------------------------------------------------------------------
" --------------------------------------------------------------------
" --------------------------------------------------------------------
" --------------------------------------------------------------------
" --------------------------------------------------------------------
" --------------------------------------------------------------------
" --------------------------------------------------------------------
" --------------------------------------------------------------------

setlocal paragraphs+=XP

" {{{1 Escape sequences
" ------------------------------------------------------------

syn match nroffEscChar /\\[CN]/ nextgroup=nroffEscCharArg
syn match nroffEscape /\\[*fgmnYV]/ nextgroup=nroffEscRegPar,nroffEscRegArg
syn match nroffEscape /\\s[+-]\=/ nextgroup=nroffSize
syn match nroffEscape /\\[$AbDhlLRvxXZ]/ nextgroup=nroffEscPar,nroffEscArg

syn match nroffEscRegArg /./ contained
syn match nroffEscRegArg2 /../ contained
syn match nroffEscRegPar /(/ contained nextgroup=nroffEscRegArg2
syn match nroffEscArg /./ contained
syn match nroffEscArg2 /../ contained
syn match nroffEscPar /(/ contained nextgroup=nroffEscArg2
syn match nroffSize /\((\d\)\=\d/ contained

syn region nroffEscCharArg start=/'/ end=/'/ contained
syn region nroffEscArg start=/'/ end=/'/ contained contains=nroffEscape,@nroffSpecial

syn region nroffEscRegArg matchgroup=nroffEscape start=/\[/ end=/\]/ contained oneline
syn region nroffSize matchgroup=nroffEscape start=/\[/ end=/\]/ contained

syn match nroffEscape /\\[adprtu{}]/
syn match nroffEscape /\\$/
syn match nroffEscape /\\\$[@*]/

" {{{1 Strings and special characters
" ------------------------------------------------------------

syn match nroffSpecialChar /\\[\\eE?!-]/
syn match nroffSpace "\\[&%~|^0)/,]"
syn match nroffSpecialChar /\\(../

syn match nroffSpecialChar /\\\[[^]]*]/
syn region nroffPreserve  matchgroup=nroffSpecialChar start=/\\?/ end=/\\?/ oneline

syn region nroffPreserve matchgroup=nroffSpecialChar start=/\\!/ end=/$/ oneline

syn cluster nroffSpecial contains=nroffSpecialChar,nroffSpace


syn region nroffString start=/"/ end=/"/ skip=/\\$/ contains=nroffEscape,@nroffSpecial contained
syn region nroffString start=/'/ end=/'/ skip=/\\$/ contains=nroffEscape,@nroffSpecial contained


" {{{1 Numbers and units
" ------------------------------------------------------------
syn match nroffNumBlock /[0-9.]\a\=/ contained contains=nroffNumber
syn match nroffNumber /\d\+\(\.\d*\)\=/ contained nextgroup=nroffUnit,nroffBadChar
syn match nroffNumber /\.\d\+)/ contained nextgroup=nroffUnit,nroffBadChar
syn match nroffBadChar /./ contained
syn match nroffUnit /[icpPszmnvMu]/ contained


" {{{1 Requests
" ------------------------------------------------------------

" Requests begin with . or ' at the beginning of a line, or
" after .if or .ie.

syn match nroffReqLeader /^[.']/	nextgroup=nroffReqName skipwhite
syn match nroffReqLeader /[.']/	contained nextgroup=nroffReqName skipwhite

syn match nroffReqName /[^\t \\\[?]\+/ contained nextgroup=nroffReqArg

syn region nroffReqArg start=/\S/ skip=/\\$/ end=/$/ contained contains=nroffEscape,@nroffSpecial,nroffString,nroffError,nroffSpaceError,nroffNumBlock,nroffComment

" {{{2 Conditional: .if .ie .el
syn match nroffReqName /\(if\|ie\)/ contained nextgroup=nroffCond skipwhite
syn match nroffReqName /el/ contained nextgroup=nroffReqLeader skipwhite
syn match nroffCond /\S\+/ contained nextgroup=nroffReqLeader skipwhite

" {{{2 String definition: .ds .as
syn match nroffReqname /[da]s/ contained nextgroup=nroffDefIdent skipwhite
syn match nroffDefIdent /\S\+/ contained nextgroup=nroffDefinition skipwhite
syn region nroffDefinition matchgroup=nroffSpecialChar start=/"/ matchgroup=NONE end=/\\"/me=e-2 skip=/\\$/ start=/\S/ end=/$/ contained contains=nroffDefSpecial
syn match nroffDefSpecial /\\$/ contained
syn match nroffDefSpecial /\\\((.\)\=./ contained

syn match nroffDefSpecial /\\\[[^]]*]/ contained

" {{{2 Macro definition: .de .am, also diversion: .di
syn match nroffReqName /\(d[ei]\|am\)/ contained nextgroup=nroffIdent skipwhite
syn match nroffIdent /[^[?( \t]\+/ contained
syn match nroffReqName /als/ contained nextgroup=nroffIdent skipwhite

" {{{2 Register definition: .rn .rr
syn match nroffReqName /[rn]r/ contained nextgroup=nroffIdent skipwhite
syn match nroffReqName /\(rnn\|aln\)/ contained nextgroup=nroffIdent skipwhite


" {{{1 eqn/tbl/pic
" ------------------------------------------------------------
" <jp>
" XXX: write proper syntax highlight for eqn / tbl / pic ?
" <jp />

syn region nroffEquation start=/^\.\s*EQ\>/ end=/^\.\s*EN\>/
syn region nroffTable start=/^\.\s*TS\>/ end=/^\.\s*TE\>/
syn region nroffPicture start=/^\.\s*PS\>/ end=/^\.\s*PE\>/
syn region nroffRefer start=/^\.\s*\[\>/ end=/^\.\s*\]\>/
syn region nroffGrap start=/^\.\s*G1\>/ end=/^\.\s*G2\>/
syn region nroffGremlin start=/^\.\s*GS\>/ end=/^\.\s*GE|GF\>/

" {{{1 Comments
" ------------------------------------------------------------

syn region nroffIgnore start=/^[.']\s*ig/ end=/^['.]\s*\./
syn match nroffComment /\(^[.']\s*\)\=\\".*/ contains=nroffTodo
syn match nroffComment /^'''.*/  contains=nroffTodo

syn match nroffComment "\\#.*$" contains=nroffTodo

syn keyword nroffTodo TODO XXX FIXME contained

" {{{1 Hilighting
" ------------------------------------------------------------
"

"
" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
"
if version >= 508 || !exists("did_nroff_syn_inits")

	if version < 508
		let did_nroff_syn_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif

	HiLink nroffEscChar nroffSpecialChar
	HiLink nroffEscCharAr nroffSpecialChar
	HiLink nroffSpecialChar SpecialChar
	HiLink nroffSpace Delimiter

	HiLink nroffEscRegArg2 nroffEscRegArg
	HiLink nroffEscRegArg nroffIdent

	HiLink nroffEscArg2 nroffEscArg
	HiLink nroffEscPar nroffEscape

	HiLink nroffEscRegPar nroffEscape
	HiLink nroffEscArg nroffEscape
	HiLink nroffSize nroffEscape
	HiLink nroffEscape Preproc

	HiLink nroffIgnore Comment
	HiLink nroffComment Comment
	HiLink nroffTodo Todo

	HiLink nroffReqLeader nroffRequest
	HiLink nroffReqName nroffRequest
	HiLink nroffRequest Statement
	HiLink nroffCond PreCondit
	HiLink nroffDefIdent nroffIdent
	HiLink nroffIdent Identifier

	HiLink nroffEquation PreProc
	HiLink nroffTable PreProc
	HiLink nroffPicture PreProc
	HiLink nroffRefer PreProc
	HiLink nroffGrap PreProc
	HiLink nroffGremlin PreProc

	HiLink nroffNumber Number
	HiLink nroffBadChar nroffError
	HiLink nroffSpaceError nroffError
	HiLink nroffError Error

	HiLink nroffPreserve String
	HiLink nroffString String
	HiLink nroffDefinition String
	HiLink nroffDefSpecial Special

	delcommand HiLink

endif

let b:current_syntax = "mailgroff"
