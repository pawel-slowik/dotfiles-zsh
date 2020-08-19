if [[ $TERM_PROGRAM != iTerm.app ]]; then
	return
fi

function set_iterm2_colors() {
	emulate -L zsh
	local -A colors
	local k
	colors=(
		'22' '00/25/00'
		'94' '50/20/00'
		'23' '00/25/30'
		'53' '20/00/40'
	)
	for k in "${(@k)colors}"; do
		printf '\33]4;%s;rgb:%s\7' $k ${colors[$k]}
	done
}

set_iterm2_colors
