## Complete ZSH setup

# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=( 
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# fastfetch. Will be disabled by default if want to use it just uncommit pokemon or compact
# fastfetch -c $HOME/.config/fastfetch/config-compact.jsonc
fastfetch -c $HOME/.config/fastfetch/config-pokemon.jsonc

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Set-up icons for files/directories in terminal using lsd
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias sy='sudo pacman -Syu'
alias pn='pnpm'
alias services='systemctl list-units --type=service --state=running'
alias docker-start='sudo systemctl start docker.service'
alias docker-stop='sudo systemctl stop docker.service docker.socket containerd.service'
alias docker-status='systemctl status docker.service --no-pager'
alias vm-start='sudo systemctl start libvirtd.socket virtlockd.socket virtlogd.socket'
alias vm-stop='sudo systemctl stop libvirtd.service libvirtd.socket libvirtd-ro.socket libvirtd-admin.socket virtlockd.socket virtlockd-admin.socket virtlogd.socket virtlogd-admin.socket'
alias vm-status='systemctl status libvirtd --no-pager'
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Added by Antigravity CLI installer
export PATH="/home/sadid/.local/bin:$PATH"
export PATH="/home/sadid/.local/bin:$PATH"
