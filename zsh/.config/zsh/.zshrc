# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# In the ~/.zshenv set : ZDOTDIR=$HOME/.config/zsh

# My aliases
alias ls='ls -tr --color=auto'
alias grep='grep --color=auto'
alias la='ls -la'
alias sendu="kdeconnect-cli -n 'POCO X2' --share"
alias sendt="kdeconnect-cli -n 'POCO X2' --share-text"
alias bat=batcat
alias imv=/usr/libexec/imv/imv
alias hx=helix

# My alias functions
function 0x0() {
	curl -F"file=@$1" 0x0.st
}

function help() {
  bash -c "help $*"
}

source ~/.config/zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme
# source ~/.config/zsh/zsh-you-should-use/zsh-you-should-use.plugin.zsh
# source ~/.config/zsh/zsh-auto-notify/auto-notify.plugin.zsh
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source ~/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^[[A' history-substring-search-up #up-arrow
bindkey '^[[B' history-substring-search-down #down-arrow
bindkey '^ ' autosuggest-accept # instead of right arrow key to fill the suggestion, Constrol + Space
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
#bindkey -v #set-vi mode

# auto notify ignore
AUTO_NOTIFY_IGNORE+=("emacs" "ranger")


# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

path+=('/home/shone/.local/bin')
export PATH
