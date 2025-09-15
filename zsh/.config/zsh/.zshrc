# .zshrc: for interactive shells
#     executed after .zshenv, and .zprofile (for login)
# Code to support human interaction in the shell.

# load configuration files
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/bindkeys.zsh"
source "$ZDOTDIR/colors.zsh"
source "$ZDOTDIR/completion.zsh"
source "$ZDOTDIR/exports.zsh"
source "$ZDOTDIR/functions.zsh"
source "$ZDOTDIR/history.zsh"
source "$ZDOTDIR/nvm.zsh"
source "$ZDOTDIR/prompt.zsh"
source "$ZDOTDIR/setopt.zsh"
source "$ZDOTDIR/zsh_hooks.zsh"

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
