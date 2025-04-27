#!/bin/zsh

# git
git config --global core.autocrlf input
git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager.exe"

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> /home/leag37/.zshrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/leag37/.zshrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
sudo apt-get install build-essential

# Brew packages
brew install neovim
brew intall tmux
brew install gcc
brew install lazygit
brew install node
brew install cmake
brew install dotnet
brew install eza
brew install fzf
brew install ninja
brew install tree
brew install tree-sitter
brew install zoxide

# Start copying all current installs into our dotfiles directory, but first do a cleanup
rm -rf ~/.dotfiles # Remove any existing dotfiles first to make sure we have a clean install

# Neovim cleanup and install
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
mkdir -p ~/.config
cp -r nvim ~/.config

# Copy zsh and config into .dotfiles
mkdir -p ~/.dotfiles/zsh
cp zsh/.zshrc ~/.dotfiles/zsh/.zshrc
rm ~/.zshrc
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc

mkdir -p ~/.dotfiles/tmux
cp -r tmux ~/.dotfiles
rm ~/.tmux.conf
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf

# zsh setup
sudo apt install tmux

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

sudo apt install zsh-syntax-highlighting
echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

/bin/zsh -c "$(source ~/.zshrc)"

# neovim
# sudo apt-get install software-properties-common
# sudo add-apt-repository ppa:neovim-ppa/stable
# sudo apt-get update
# sudo apt-get install python3-dev python3-pip
# sudo apt-get install neovim

echo "Done. Close and reopen terminal to finish the setup."
