# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Functions

add_to_path() {
    if [[ -d "$1" && ! "$PATH" =~ (^|:)"$1"(:|$) ]]; then
        export PATH="$1:$PATH"
    fi
}

# Fig configuration

# Powerlevel10K
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" 
fi

# Homebrew
export PATH=$HOME/bin:/usr/local/bin:/opt/homebrew/bin:$PATH

# ZSH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"

plugins=(
    git
)

source $ZSH/oh-my-zsh.sh

# Atuin
eval "$(atuin init zsh)"

# Environment Variables
export EDITOR=nvim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export DOTNET_ROOT=/usr/local/share/dotnet/
export DOTNET_CLI_TELEMETRY_OPOUT=true
export GPG_TTY=$(tty)
export HOMEBREW_NO_ANALYTICS=1

# Path
add_to_path "$HOME/scripts"
add_to_path "$HOME/.docker/bin"
# Powerlevel10K
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Fig

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
# zoxide
eval "$(zoxide init zsh --cmd cd)"
# bun completions
[ -s "/Users/ldellisola/.bun/_bun" ] && source "/Users/ldellisola/.bun/_bun"
