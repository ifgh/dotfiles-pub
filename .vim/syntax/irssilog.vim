" Based on:
" http://michael.gorven.za.net/blog/2008/10/01/vim-syntax-highlighting-irssi-irc-logs

syn spell notoplevel
syn match Constant "^\d\{2}:\d\{2}\(:\d\{2}\)\?"
syn match Keyword "  \* [-a-zA-Z0-9_|]*"
syn match Type "<[ @~&+][-a-zA-Z0-9_|]*>"
syn region Constant start="^---" end="$"
syn region Statement start="-!-" end="$"
