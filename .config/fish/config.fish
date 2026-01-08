  # alias
  alias vim="nvim"
  alias vt='vim "+terminal"'

  # git
  alias gs="git status"
  alias ga="git add"
  alias gb="git branch"
  alias gbd="git branch -D"
  alias gc="git commit"
  alias gp="git push"
  alias gpp="git pull"

# eza
alias ls='eza --icons=never'
alias l='eza -l'
alias la='eza -a'
alias lla='eza -la'
alias lt='eza -T'

# fzf
function fcd
    cd (begin; find ~/git -maxdepth 2 -type d;  end | fzf)
    commandline -f repaint  # Force Fish to repaint the prompt after cd
end

bind \cf fcd
set -gx SHELL /usr/bin/fish

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# opencode
fish_add_path /home/x6a6471/.opencode/bin
set fish_greeting
