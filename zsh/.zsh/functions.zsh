function extract {
	echo Extracting $1 ...
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)  tar xjf $1    ;;
			*.tar.gz)   tar xzf $1    ;;
			*.bz2)      bunzip2 $1    ;;
			*.rar)      unrar x $1    ;;
			*.gz)       gunzip $1     ;;
			*.tar)      tar xf $1     ;;
			*.tbz2)     tar xjf $1    ;;
			*.tgz)      tar xzf $1    ;;
			*.zip)      unzip $1      ;;
			*.Z)        uncompress $1 ;;
			*.7z)       7z x $1       ;;
			*)          echo "'$1' cannot be extracted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
		man "$@"
}
