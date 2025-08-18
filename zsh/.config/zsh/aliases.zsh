# safer commands
alias cp='cp -vip'
alias mv='mv -vi'
alias ln='ln -vi'
alias rm='rm -vI'
alias rmdir='rmdir -v'
alias mkdir='mkdir -v'
if [[ $OSTYPE = linux-gnu* ]]; then
	alias chown='chown --changes --preserve-root'
	alias chmod='chmod --changes --preserve-root'
	alias chgrp='chgrp --changes --preserve-root'
elif [[ $OSTYPE = freebsd* ]] && command -v gchown &> /dev/null; then
	alias chown='gchown --changes --preserve-root'
	alias chmod='gchmod --changes --preserve-root'
	alias chgrp='gchgrp --changes --preserve-root'
fi

# colored output and basic tweaks
if [[ $OSTYPE = linux-gnu* ]]; then
	alias ls='ls --classify --human-readable --literal --group-directories-first -v --color=auto'
	alias ll='ls -l'
elif [[ $OSTYPE = freebsd* ]]; then
	if command -v gls &> /dev/null; then
		alias ls='gls --classify --human-readable --literal --group-directories-first -v --color=auto'
		alias ll='ls -l'
	else
		alias ls='ls -GF'
		alias ll='ls -hl'
	fi
fi
if command -v colordiff &> /dev/null; then
	alias diff='colordiff'
fi
alias grep='grep --color=auto --exclude-dir={.bzr,.cvs,.git,.hg,.svn}'
alias ip='ip -color'

# xdg directories
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'

# custom commands
alias newest='find . \( -path \*/.git -o -path \*/node_modules \) -prune -o -type f -printf "%TY-%Tm-%Td %TT %p\n" | sort -r | less'
alias diskspace='du -S | sort -rn | less'
alias dlwebsite='wget --recursive --mirror --page-requisites --convert-links --adjust-extension --continue --verbose -P ~/Downloads'
alias screenrecord='ffmpeg -f x11grab -i $DISPLAY -f pulse -i default -c:v libx264rgb -color_range 2 ~/Videos/screenrecord-"$(date --iso-8601=seconds)".mkv'
alias wanip='wget --quiet --output-document=- https://ipecho.net/plain; echo'
