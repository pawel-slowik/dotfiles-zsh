if [[ "$DISPLAY" = "" ]]; then
	return
fi

# https://unix.stackexchange.com/a/219678

function paste-xclip-primary() {
	emulate -L zsh
	killring=("$CUTBUFFER" "${(@)killring[1,-2]}")
	CUTBUFFER=$(xclip -selection primary -o)
	zle yank
}

function paste-xclip-clipboard() {
	emulate -L zsh
	killring=("$CUTBUFFER" "${(@)killring[1,-2]}")
	CUTBUFFER=$(xclip -selection clipboard -o)
	zle yank
}

zle -N paste-xclip-primary
bindkey "^xp" paste-xclip-primary

zle -N paste-xclip-clipboard
bindkey "^xx" paste-xclip-clipboard
