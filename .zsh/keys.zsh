# https://invisible-island.net/xterm/xterm-function-keys.html

if [[ $TERM != xterm* && -z $TMUX_PANE ]]; then
	return
fi

bindkey "^[[3~" delete-char # DEL

# this requires `xterm-keys on` in tmux
bindkey "^[[1;5D" backward-word # CTRL + Left Arrow
bindkey "^[[1;5C" forward-word # CTRL + Right Arrow

if [[ $TERM == xterm* ]]; then
	# scoansi variant
	bindkey "^[[H" beginning-of-line # HOME
	bindkey "^[[F" end-of-line # END
fi

if [[ ! -z $TMUX_PANE ]]; then
	# vt220 variant
	bindkey "^[[1~" beginning-of-line # HOME
	bindkey "^[[4~" end-of-line # END
fi
