# Colour settings
TERM=xterm-256color

# bash autocompletion
autoload bashcompinit

##############################
# Antigen                    #
##############################

# source antigen
source ~/antigen.zsh

# load plugins
antigen use oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme romkatv/powerlevel10k
antigen bundle zsh-users/zsh-completions

# antigen done
antigen apply

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

##############################
# Exports                    #
##############################

export EDITOR="vim"
export PATH=~/.local/bin:$PATH

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
if grep -q Microsoft /proc/version; then
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
