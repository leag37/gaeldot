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
sudo apt install clang-tidy
sudo apt install fd-find
sudo apt install llvm
sudo apt install ripgrep


# Brew packages
brew install cmake
brew install dotnet
brew install eza
brew install ffmpeg
brew install fzf
brew install gcc
brew install imagemagick
brew install jq
brew install lazygit
brew install neovim
brew install ninja
brew install node
brew install poppler
brew install resvg
brew install ripgrep
brew install sevenzip
brew install tmux
brew install tree
brew install tree-sitter
brew install yazi
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

# yazi
mkdir -p ~/.config/yazi
cp -r yazi ~/.config

# zsh setup
sudo apt install tmux

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

sudo apt install zsh-syntax-highlighting
echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

/bin/zsh -c "$(source ~/.zshrc)"

# more yazi setup
ya pack -a yazi-rs/flavors:catppuccin-macchiato

echo "Done. Close and reopen terminal to finish the setup."
