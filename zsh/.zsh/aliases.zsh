# safer commands
alias cp='cp -i'
alias mv='mv -i'
alias ln='ln -i'
alias rm='rm -I'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Colorize output, add file type indicator, and put sizes in human readable format
alias ls='ls -GFh --group-directories-first --color=auto'

# Same as above, but in long listing format
alias ll='ls -GFhl --group-directories-first --color=auto'

# Enable colors in grep and ignore VCS folders
alias grep='grep --color=auto --exclude-dir={.bzr,.cvs,.git,.hg,.svn}'

alias diff='colordiff'

alias newest='find . \( -path \*/.git -o -path \*/node_modules \) -prune -o -type f -printf "%TY-%Tm-%Td %TT %p\n" | sort -r | less'
