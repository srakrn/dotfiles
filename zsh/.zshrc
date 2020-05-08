# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# source zinit
source ~/.zinit/bin/zinit.zsh

# load zinit plugins
zinit ice depth=1
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
zinit light zdharma/history-search-multi-word
zinit light romkatv/powerlevel10k
zinit snippet 'https://github.com/sorin-ionescu/prezto/blob/master/modules/utility/init.zsh'
zinit snippet 'https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/history.zsh'
zinit snippet 'https://github.com/robbyrussell/oh-my-zsh/raw/master/plugins/git/git.plugin.zsh'

# Source pyenv
if [ -d "${HOME}/.pyenv" ]; then
    export PATH="${HOME}/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
    export PYENV_ROOT="$HOME/.pyenv" # needed by pipenv
fi

# Theme preference
SPACESHIP_PROMPT_ORDER=(
	user          # Username section
	dir           # Current directory section
	host          # Hostname section
	git           # Git section (git_branch + git_status)
	docker        # Docker section
	venv          # virtualenv section
	conda         # conda virtualenv section
	pyenv         # Pyenv section
	line_sep      # Line break
	exit_code     # Exit code section
	char          # Prompt character
)

# Customize to your needs...
function mkcd(){
    mkdir $1;
    cd $1;
}

alias weather="curl wttr.in"

function cd_up() {
    cd $(printf "%0.s../" $(seq 1 $1 ));
}

export PATH=~/.local/bin:$PATH
alias 'cd..'='cd_up'

if which thefuck >/dev/null; then
    eval $(thefuck --alias please)
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
