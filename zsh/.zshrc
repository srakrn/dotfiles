#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Source pyenv
if [ -d "${HOME}/.pyenv" ]; then
    export PATH="${HOME}/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
    export PYENV_ROOT="$HOME/.pyenv" # needed by pipenv
fi

# Customize to your needs...
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(host dir virtualenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(ram)
if which thefuck >/dev/null; then
    eval $(thefuck --alias please)
fi

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
