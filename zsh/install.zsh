# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install alacritty and basic terminal setup
brew install --cask alacritty
brew install neovim
brew install tmux
brew install powerlevel10k # used for tmux so install after

# Next install required fonts
brew install --cask font-jetbrains-mono-nerd-font

# Install git
brew install git
brew install --cask git-credential-manager
brew install lazygit

# Package management
brew install node

# Utilities
brew install cmake
brew install dotnet
brew install eza
brew install fzf
brew install ninja
brew install tree
brew install tree-sitter
brew install zoxide
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting

# Start copying all current installs into our dotfiles directory, but first do a cleanup
rm -rf ~/.dotfiles # Remove any existing dotfiles first to make sure we have a clean install

# Copy zsh and config into .dotfiles
mkdir -p ~/.dotfiles/zsh
cp zsh/.zshrc ~/.dotfiles/zsh/.zshrc
cp -r zsh/config ~/.dotfiles/zsh/config

# Copy wezterm
mkdir -p ~/.dotfiles/wezterm
cp -r wezterm ~/.dotfiles/wezterm

# Copy tmux and config into .dotfiles
mkdir -p ~/.dotfiles/tmux
cp -r tmux ~/.dotfiles/tmux 

# Configure symlinks for dotfiles
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/wezterm/.wezterm.lua ~/.wezterm.lua
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf

# Configure powerlevel10k, zsh syntax highlighting, etc.
echo "source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

# Source zshrc after all configurations are prepared
source ~/.zshrc
