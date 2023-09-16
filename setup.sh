#!/bin/zsh
# Functions

remind_set_up_application ()
{
  echo "Remember to configure $1: $2"
  open /Applications/$1.app
  read -p "Press enter to continue after configuring $1"
}
# 0. Creating folders

mkdir -p $HOME/dev
mkdir -p $HOME/scripts
mkdir -p $HOME/.config

# 1. Install Homebrew
echo "Installing homebrew..."

which brew > /dev/null 2>&1
if [ $? -eq 1 ]; then
    xcode-select --install
    read -p "Press enter to continue after installing xcode tools"

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    export PATH=$HOME/bin:/usr/local/bin:/opt/homebrew/bin:$PATH
else
    brew update
fi


# 2. Install Homebrew packages
echo "Installing homebrew packages..."
BREW_PCKGS=(
    curl
    git
    wget
    zsh
    btop
    gitui
    tree-sitter
    atuin
    mas
    bat
    nvim
)

for i in "${BREW_PCKGS[@]}" 
do
    HOMEBREW_NO_INSTALL_CLEANUP=TRUE brew install $i
done

# 2. Set up git
git clone https://github.com/ldellisola/dotfiles.git $HOME/.dotfiles

NVIM=$HOME/.dotfiles/nvim 
TERMINAL=$HOME/.dotfiles/terminal
SCRIPTS=$HOME/.dotfiles/scripts
BACKUP=$HOME/.dotfiles/backup

ln -sf $SCRIPTS $HOME/scripts
chmod +x $HOME/scripts/*

# 3. Install applications
read -p "Press enter to continue after installing homebrew packages"
echo "Installing Brew applications..."

BREW_CASKS=(
    fig
    hiddenbar
    iterm2
    raycast
    spotify
    rider
    syntax-highlight
    orion
    iina
    dotnet-sdk
)

for i in "${BREW_CASKS[@]}"
do
    HOMEBREW_NO_INSTALL_CLEANUP=TRUE brew install --cask --appdir="/Applications" $i
done



echo "Installing AppStore applications..."

MAC_APPS=(
    1147396723 # Whatsapp
    425424353  # The Unarchiver
    1176895641 # Spark
    1352778147 # Bitwarden
)

# for i in "${MAC_APPS[@]}"
# do
#     mas install $i
# done


read -p "Press enter to continue after installing apps" 

# 4. Set up oh-my-zsh
echo "Setting up oh-my-zsh..."

chsh -s /opt/homebrew/bin/zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended --keep-zshrc

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

    
if [ -f "$HOME/.p10k.zsh" ]; then
  cp $HOME/.p10k.zsh $HOME/.p10k.zsh.old
fi
ln -sf $TERMINAL/.p10k.zsh $HOME/.p10k.zsh

if [ -f "$HOME/.zshrc" ]; then
  cp $HOME/.zshrc $HOME/.zshrc.old
fi
ln -sf $TERMINAL/.zshrc $HOME/.zshrc

source $HOME/.zshrc

# 5. Set up neovim
echo "Setting up neovim"
ln -sf $NVIM $HOME/.config/nvim

# 6. Configure settings
echo "Setting up MacOS configurations"

# Enable touch id for sudo
sudo $HOME/scripts/touchid-sudo.sh

# Set key repeate speed
defaults write NSGlobalDomain KeyRepeat -int 2

# Set dock to autohide instantly
defaults write com.apple.dock autohide -int 1
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

# Disable warnings when changing file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Show file extension
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Do not save to icloud
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Enable text selection on quick look
defaults write com.apple.finder QLEnableTextSelection -bool TRUE

# Set finder style as list
defaults write com.apple.finder FXPreferredViewStyle Nlsv

# Do not create .DS_STORE files in network drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Save screenshots as PNGs
defaults write com.apple.screencapture type -string "png"


remind_set_up_application "Bitwarden"
remind_set_up_application "Raycast" $BACKUP/raycast.rayconfig
remind_set_up_application "Spark"
remind_set_up_application "Spotify"
remind_set_up_application "Hidden Bar"
remind_set_up_application "Fig"
ln -sf $BACKUP/fig.json $HOME/.fig/fig.json

echo "Remember to configure SSH keys"

echo "Setting up git..."
GITHUB_KEY=$HOME/.ssh/github
ssh-keygen -t rsa -f $GITHUB_KEY -N ""
chmod 600 $GITHUB_KEY

cat $GITHUB_KEY.pub

echo "
Host github
    AddkeysToAgent yes
    IdentityFile $HOME/.ssh/github
    Hostname github.com
" > ~/.ssh/config

git config --global user.name "Lucas Dell'Isola"
git config --global user.email dev@lucasdellisola.com.ar

echo "Please add this public key to Github"
open https://github.com/account/ssh


killall Finder


