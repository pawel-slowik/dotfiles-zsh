# https://unix.stackexchange.com/a/219678

function paste-xclip() {
	emulate -L zsh
	killring=("$CUTBUFFER" "${(@)killring[1,-2]}")
	CUTBUFFER=$(xclip -selection primary -o)
	zle yank
}

zle -N paste-xclip
bindkey "^xp" paste-xclip
