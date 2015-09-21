# Colorize output, add file type indicator, and put sizes in human readable format
alias ls='ls -GFh --group-directories-first --color=auto'

# Same as above, but in long listing format
alias ll='ls -GFhl --group-directories-first --color=auto'

# Enable colors in grep and ignore VCS folders
alias grep='grep --color=auto --exclude-dir={.bzr,.cvs,.git,.hg,.svn}'
