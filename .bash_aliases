#!/bin/bash

# Nur sehr kurze Dinge, die nur bei der interaktiven Benutzung wichtig
# sind.

alias s='screen -R'
alias v='vim -p'
alias g='git'
alias gk='gitk'
alias gka='gitk --all'
alias ghs='~/work/shell/githomesync/do'
alias e='elinks'
alias tt='mt /tmp/tmp; l'
alias ttl='mt /tmp/tmp/luakit; l'
alias t='mt /tmp; l'
alias media='cd /media; l'
alias mnt='cd /mnt; l'
alias pp='colored_pstree -pl | less'
alias r='ranger'
alias images='feh --force-aliasing -W 580 -tr'
alias p='pdf-viewer'
alias ww='wget -c'

alias m='mplayer'
alias mmute='mplayer -ao null'
alias m2='mplayer -cache 2048'
alias m8='mplayer -cache 8192'
alias mp='mplayer -playlist'
alias mp2='mplayer -cache 2048 -playlist'
alias mp8='mplayer -cache 8192 -playlist'
alias dvd='mplayer dvdnav:// -nosub -noautosub -dvd-device /dev/sr0'
alias dvdd='mplayer dvdnav:// -nosub -noautosub -vf pp=lb -dvd-device /dev/sr0'

alias alisys='mpop -a -C ~/work/dotfiles/.mpoprc-alice-system'

alias gblobs='cd -- "$(gitary --printblobdir)"'
alias dof='cd ~/work/dotfiles'
alias dofp='cd ~/work/dotfiles-pub'
alias bin='cd ~/bin'
alias binp='cd ~/bin-pub'

alias :q='logout'
alias :qa='logout'

alias record_default='unset RTSPECCY_CAPTURE_DEVICE'
alias record_samson='export RTSPECCY_CAPTURE_DEVICE="front:CARD=C03U,DEV=0"'
