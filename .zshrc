# remove all aliases
unalias -a
unalias -a -s

# make newly created files and directories accesible only to the owner
umask 0077

# limit the number of processes
ulimit -u 1024

# no limit on the size of core dumps (usefull for debugging)
ulimit -c unlimited

# reasons for setting a custom $PATH:
# - remove the /usr/{local/,}games path(s),
# - put the local variant at the end instead of the beginning. This
#   intentionally breaks fragile setups with the same software installed both
#   from a distribution package and locally, therefore encouraging more robust
#   solutions.
export PATH="/usr/bin:/bin:/usr/local/bin"

# local variant at the end - same as with $PATH
export MANPATH="/usr/man:/usr/share/man:/usr/local/share/man"

# automatically update external command completion
zstyle ":completion:*:commands" rehash on

# save temporary files in $HOME, because /tmp is world readable
export TMPDIR="$HOME/.tmp"
export TMUX_TMPDIR="$TMPDIR"

# set custom grep highlighting
export GREP_COLORS="ms=1;38;5;214:fn=96"

# use Vim as the default editor
export EDITOR=vim

# history settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY

# warn when a global parameter is created in a function
setopt WARN_CREATE_GLOBAL

# run background jobs at normal priority
setopt NO_BG_NICE

# remove | from the default ZLE_REMOVE_SUFFIX_CHARS; this prevents tab
# completion from "eating" the space before the | character
# https://superuser.com/q/613685
ZLE_REMOVE_SUFFIX_CHARS=$' \t\n;&'

# add | to WORDCHARS, so that backward-delete-word erases only the |
# character, not the command before it
WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>|'

# - shortened hostname,
# - $PWD relative to $HOME and truncated to 30 characters,
# - $ for normal shell, # for privileged
# - red highlight if the last command exited with status != 0
PROMPT="%m:%30<…<%~%(?..%F{9}%B)%(!.#.$)%f%b "

# select emacs keymap
bindkey -e

# autoload user defined functions from this directory, see man zshmisc
# / autoloading functions and man zshcompsys / autoloaded files
fpath=(~/.zsh/autoload $fpath)

autoload -Uz compinit && compinit -i
autoload -Uz run-help
autoload -Uz run-help-git
autoload -Uz zmv

for file in ~/.zsh/*.zsh; do
	. "$file"
done
