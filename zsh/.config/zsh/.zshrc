# create zsh XDG directories if they do not already exist
if [[ ! -d "$XDG_CACHE_HOME/zsh" ]]; then
	echo 'No zsh cache directory found! Creating cache directory.'
	mkdir -p "$XDG_CACHE_HOME/zsh"
fi
if [[ ! -d "$XDG_STATE_HOME/zsh" ]]; then
	echo 'No zsh state directory found! Creating state directory.'
	mkdir -p "$XDG_STATE_HOME/zsh"
fi

# add ~/.local/bin to PATH
home_local_bin="$HOME/.local/bin"
if [[ -d $home_local_bin && ! $PATH =~ (^|:)$home_local_bin(:|$) ]]; then
	PATH="$home_local_bin:$PATH"
fi
unset home_local_bin

# load configuration files
source "$ZDOTDIR/colors.zsh"
source "$ZDOTDIR/setopt.zsh"
source "$ZDOTDIR/exports.zsh"
source "$ZDOTDIR/prompt.zsh"
source "$ZDOTDIR/completion.zsh"
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/bindkeys.zsh"
source "$ZDOTDIR/functions.zsh"
source "$ZDOTDIR/history.zsh"
source "$ZDOTDIR/zsh_hooks.zsh"
source "$ZDOTDIR/nvm.zsh"

# load zsh-syntax-highlighting if available
if [[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
	# arch linux
	source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
	# debian
	source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [[ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
	# freebsd
	source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# set tab width
if command -v tabs &> /dev/null; then
	tabs -4
fi
