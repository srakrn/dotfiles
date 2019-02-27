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

# Customize to your needs...
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir virtualenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(ram)
eval $(thefuck --alias please)

function mkcd(){
    mkdir $1;
    cd $1;
}