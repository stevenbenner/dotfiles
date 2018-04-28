source "$ZDOTDIR/colors.zsh"
source "$ZDOTDIR/setopt.zsh"
source "$ZDOTDIR/exports.zsh"
source "$ZDOTDIR/prompt.zsh"
source "$ZDOTDIR/completion.zsh"
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/bindkeys.zsh"
source "$ZDOTDIR/functions.zsh"
source "$ZDOTDIR/history.zsh"
[[ -f /usr/share/nvm/init-nvm.sh ]] && source /usr/share/nvm/init-nvm.sh
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
