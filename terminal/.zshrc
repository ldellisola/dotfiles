# Functions

add_to_path() {
    if [[ -d "$1" && ! "$PATH" =~ (^|:)"$1"(:|$) ]]; then
        export PATH="$1:$PATH"
    fi
}

# Fig configuration
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh" ]]

# Powerlevel10K
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" 
fi

# Homebrew
export PATH=$HOME/bin:/usr/local/bin:/opt/homebrew/bin:$PATH

# ZSH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"

plugins=(
    autoupdate
    git
    fast-syntax-highlighting
    auto-color-ls
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

# Powerlevel10K
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Fig
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
