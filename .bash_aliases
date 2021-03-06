#!/bin/bash

# Nur sehr kurze Dinge, die nur bei der interaktiven Benutzung wichtig
# sind.

alias s='screen -R'
alias v='vim -p'
alias g='git'
alias e='elinks'
alias tt='mt /tmp/tmp; l'
alias t='mt /tmp; l'
alias media='cd /media; l'
alias mnt='cd /mnt; l'
alias mntj='cd /mnt/jupiter; l'
alias pp='colored_pstree -pl | less'
alias p='pdf-viewer'
alias ww='wget -c'
alias con='contacts_generic_query'

alias m='mplayer'
alias mmute='mplayer -ao null'
alias dvd='mplayer dvdnav:// -nosub -noautosub -dvd-device /dev/sr0'
alias dvdd='mplayer dvdnav:// -nosub -noautosub -vf pp=lb -dvd-device /dev/sr0'

alias gblobs='cd -- "$(gitary --printblobdir)"'
alias dof='cd ~/work/dotfiles'
alias dofp='cd ~/work/dotfiles-pub'
alias dofs='cd ~/crypt/mount/tresor/dotfiles-secure'
alias bin='cd ~/bin'
alias binp='cd ~/bin-pub'
