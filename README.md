My [Zsh](https://www.zsh.org/) configuration.

Quick install:

	git clone https://github.com/pawel-slowik/dotfiles-zsh.git ~/dotfiles/zsh
	for name in .zlogout .zsh .zshrc; do ln -si ~/dotfiles/zsh/$name ~/$name; done

	cd ~/dotfiles/zsh
	echo /.zsh/async-git-prompt.plugin.zsh >> .git/info/exclude
	echo /.zsh/term-title.plugin.zsh >> .git/info/exclude
	cd .zsh
	curl -L -O https://raw.githubusercontent.com/pawel-slowik/zsh-async-git-prompt/master/async-git-prompt.plugin.zsh
	curl -L -O https://raw.githubusercontent.com/pawel-slowik/zsh-term-title/master/term-title.plugin.zsh
