# .zprofile: for login shells
#     executed after .zshenv, and before .zshrc (interactive)
# Setup code for login shells. Stuff that prepares the user environment. A good
# place for things that should not be reset/rerun every time a terminal opens.

# add ~/.local/bin to PATH
home_local_bin="$HOME/.local/bin"
if [[ -d $home_local_bin && ! $PATH =~ (^|:)$home_local_bin(:|$) ]]; then
	PATH="$home_local_bin:$PATH"
fi
unset home_local_bin

# override terminal to enable alternate screen on freebsd
if [[ $OSTYPE = freebsd* ]]; then
	TERM='xterm-clear'
fi

# create zsh XDG directories if they do not already exist
if [[ ! -d $XDG_CACHE_HOME/zsh ]]; then
	echo 'No zsh cache directory found! Creating cache directory.'
	mkdir -p "$XDG_CACHE_HOME/zsh"
fi
if [[ ! -d $XDG_STATE_HOME/zsh ]]; then
	echo 'No zsh state directory found! Creating state directory.'
	mkdir -p "$XDG_STATE_HOME/zsh"
fi
