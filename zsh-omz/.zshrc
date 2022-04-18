# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

##############################
# Exports                    #
##############################

export EDITOR="vim"
export PATH=~/.local/bin:$PATH

##############################
# FZF                        #
##############################

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

##############################
# Scripts and Custom Fnctns  #
##############################

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
if type thefuck > /dev/null; then
    eval $(thefuck --alias please)
fi

# gits
alias 'gpp'='git pull && git push'

# for WSL
if grep -qi microsoft /proc/version; then
    alias 'xp'='explorer.exe'
fi

# bat
if type batcat > /dev/null; then
    alias bat="batcat"
fi

##############################
# Sourcing things            #
##############################

# Source miniconda
if [ -d "${HOME}/miniconda3" ]; then
    source "${HOME}/miniconda3/etc/profile.d/conda.sh"
    if [[ -z ${CONDA_PREFIX+x} ]]; then
        export PATH="${HOME}/conda/bin:$PATH"
    fi
fi

# Source pyenv
if [ -d "${HOME}/.pyenv" ]; then
    export PATH="${HOME}/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
    export PYENV_ROOT="$HOME/.pyenv" # needed by pipenv
fi

# Travis Gem
[ ! -s /home/srakrn/.travis/travis.sh ] || source /home/srakrn/.travis/travis.sh

# nvm
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Preserving history
HISTSIZE=5000            
HISTFILE=~/.zsh_history  
SAVEHIST=5000            
HISTDUP=erase            
setopt appendhistory     
setopt sharehistory      
setopt incappendhistory  


##############################
# OMZ                        #
##############################

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git python pyenv aws fzf-tab)
source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ ! -f /etc/bash_completion.d/azure-cli ]] || source /etc/bash_completion.d/azure-cli
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
