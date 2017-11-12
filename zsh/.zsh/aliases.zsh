# safer commands
alias cp='cp -ip'
alias mv='mv -i'
alias ln='ln -i'
alias rm='rm -I'
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	alias chown='chown --preserve-root'
	alias chmod='chmod --preserve-root'
	alias chgrp='chgrp --preserve-root'
elif [[ "$OSTYPE" == "freebsd"* ]] && type gchown > /dev/null 2>&1; then
	alias chown='gchown --preserve-root'
	alias chmod='gchmod --preserve-root'
	alias chgrp='gchgrp --preserve-root'
fi

# colored output and basic tweaks
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	alias ls='ls -GFh --group-directories-first --color=auto'
	alias ll='ls -GFhl --group-directories-first --color=auto'
	alias grep='grep --color=auto --exclude-dir={.bzr,.cvs,.git,.hg,.svn}'
elif [[ "$OSTYPE" == "freebsd"* ]]; then
	if type gls > /dev/null 2>&1; then
		alias ls='gls -GFh --group-directories-first --color=auto'
		alias ll='gls -GFhl --group-directories-first --color=auto'
	else
		alias ls='ls -GFh'
		alias ll='ls -GFhl'
	fi
	alias grep='grep --color=auto --exclude={.bzr,.cvs,.git,.hg,.svn}'
fi
alias diff='colordiff'
alias ip='ip -color'

# custom commands
alias newest='find . \( -path \*/.git -o -path \*/node_modules \) -prune -o -type f -printf "%TY-%Tm-%Td %TT %p\n" | sort -r | less'
alias diskspace='du -S | sort -rn | less'
