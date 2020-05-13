# Colour settings
TERM=xterm-256color

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# source zinit
source ~/.zinit/bin/zinit.zsh

# load zinit plugins
zinit light zdharma/fast-syntax-highlighting
zinit light romkatv/powerlevel10k
zinit light zdharma/history-search-multi-word
zinit snippet 'https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/git.zsh'
zinit snippet 'https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh'
zinit snippet 'https://github.com/sorin-ionescu/prezto/blob/master/modules/utility/init.zsh'
zinit snippet 'https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/pipenv/pipenv.plugin.zsh'

# Source pyenv
if [ -d "${HOME}/.pyenv" ]; then
    export PATH="${HOME}/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
    export PYENV_ROOT="$HOME/.pyenv" # needed by pipenv
fi

# mkcd function
function mkcd(){
    mkdir $1;
    cd $1;
}

# weather
alias weather="curl wttr.in"

# cd-up function
function cd_up() {
    cd $(printf "%0.s../" $(seq 1 $1 ));
}

alias 'cd..'='cd_up'

# fuck/please
if which thefuck >/dev/null; then
    eval $(thefuck --alias please)
fi

# Preserving history
HISTSIZE=5000            
HISTFILE=~/.zsh_history  
SAVEHIST=5000            
HISTDUP=erase            
setopt appendhistory     
setopt sharehistory      
setopt incappendhistory  

# adding ~/.local to $PATH 
export PATH=~/.local/bin:$PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
