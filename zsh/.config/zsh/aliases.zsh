# safer commands
alias cp='cp -vip'
alias mv='mv -vi'
alias ln='ln -vi'
alias rm='rm -vI'
alias rmdir='rmdir -v'
alias mkdir='mkdir -v'
if [[ "$OSTYPE" = "linux-gnu"* ]]; then
	alias chown='chown -c --preserve-root'
	alias chmod='chmod -c --preserve-root'
	alias chgrp='chgrp -c --preserve-root'
elif [[ "$OSTYPE" = "freebsd"* ]] && type gchown > /dev/null 2>&1; then
	alias chown='gchown -c --preserve-root'
	alias chmod='gchmod -c --preserve-root'
	alias chgrp='gchgrp -c --preserve-root'
fi

# colored output and basic tweaks
if [[ "$OSTYPE" = "linux-gnu"* ]]; then
	alias ls='ls -GFhN --group-directories-first --color=auto'
	alias ll='ls -GFhNl --group-directories-first --color=auto'
	alias grep='grep --color=auto --exclude-dir={.bzr,.cvs,.git,.hg,.svn}'
elif [[ "$OSTYPE" = "freebsd"* ]]; then
	if type gls > /dev/null 2>&1; then
		alias ls='gls -GFhN --group-directories-first --color=auto'
		alias ll='gls -GFhNl --group-directories-first --color=auto'
	else
		alias ls='ls -GFh'
		alias ll='ls -GFhl'
	fi
	alias grep='grep --color=auto --exclude={.bzr,.cvs,.git,.hg,.svn}'
fi
alias diff='colordiff'
alias ip='ip -color'

# xdg directories
alias tmux='tmux -f "$XDG_CONFIG_HOME/tmux/tmux.conf"'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'

# custom commands
alias newest='find . \( -path \*/.git -o -path \*/node_modules \) -prune -o -type f -printf "%TY-%Tm-%Td %TT %p\n" | sort -r | less'
alias diskspace='du -S | sort -rn | less'
