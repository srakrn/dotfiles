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
