# safer commands
alias cp='cp -i'
alias mv='mv -i'
alias ln='ln -i'
alias rm='rm -I'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# colored output and basic tweaks
alias ls='ls -GFh --group-directories-first --color=auto'
alias ll='ls -GFhl --group-directories-first --color=auto'
alias grep='grep --color=auto --exclude-dir={.bzr,.cvs,.git,.hg,.svn}'
alias diff='colordiff'

# custom commands
alias newest='find . \( -path \*/.git -o -path \*/node_modules \) -prune -o -type f -printf "%TY-%Tm-%Td %TT %p\n" | sort -r | less'
alias diskspace='du -S | sort -rn | less'
