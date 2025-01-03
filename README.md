# dotfiles

config files for:
  1. vim
  2. tmux
  3. zsh
  4. git
  5. neovim
  6. karabiner
  7. ghostty

### 1. install brew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. install git
```bash
brew install git
```

### 3. clone the repo
if ssh key is not setup, use https
```bash
git clone https://github.com/vivianroshan/dotfiles.git
```
else use ssh
```bash
git clone git@github.com:vivianroshan/dotfiles.git
```

### 4. run the setup script
```bash
cd dotfiles
./setup.sh
```

### 5. install brew packages
```bash
brew bundle
```

