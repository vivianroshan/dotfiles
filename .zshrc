# Z
 . /opt/homebrew/etc/profile.d/z.sh

# AUTOSUGGESTIONS
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept

# completions
autoload -Uz compinit && compinit

# THEME
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
PROMPT='%F{2}%1~ ${vcs_info_msg_0_}%F{4} %# %f'
zstyle ':vcs_info:git:*' formats '%F{5}(%F{1}%b%F{5})%f'

# LS_COLORS
export LSCOLORS="Gxfxcxdxbxegedabagacad"
alias ls='ls -G'

# GNU LS COLORS
if [[ -z "$LS_COLORS" ]] \
  && (( $+commands[dircolors] )) \
  && [[ -f "$HOME/.dircolors" ]]; then
    source <(dircolors -b "$HOME/.dircolors") || source <(dircolors -b)
else
  export LS_COLORS="di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
fi
if (( $+commands[gls] )); then
    alias ls='gls --color=tty'
fi

# HISTORY
HISTFILE=~/.zsh_history
HISTFILESIZE=1000000
HISTSIZE=100000
SAVEHIST=100000

# Share history across all sessions
#setopt SHARE_HISTORY        # Share history between sessions
setopt INC_APPEND_HISTORY   # Immediately append commands to history file
setopt HIST_IGNORE_SPACE    # Ignore commands starting with space
setopt HIST_REDUCE_BLANKS   # Remove extra blanks in commands
setopt HIST_IGNORE_DUPS     # Ignore duplicate entries

# XDG_CONFIG_HOME
export XDG_CONFIG_HOME="$HOME/.config"

# TMUX
export TMUX_STATUS_OFF=true
export TMUX_PREFIX_A=true
export TMUX_OVERRIDE_TRUECOLOR=false
export TMUX_AUTO=false
if [ -z "$TMUX" ] && [ "$TMUX_AUTO" = "true" ]; then tmux new -A -s default; fi

# FZF
source $(brew --prefix)/Cellar/fzf/*/shell/key-bindings.zsh

# RISC-V toolchain
export PATH="$(brew --prefix)Cellar/riscv-gnu-toolchain/main/bin:$PATH"

# NVM
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# PYENV
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# DOTNET telemetry off
DOTNET_CLI_TELEMETRY_OPTOUT="true"

