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

# herdr
if test "$HERDR_ENV" = "1"; and command -q infocmp; and infocmp xterm-kitty >/dev/null 2>&1
    set -gx TERM xterm-kitty
end

function hfzf --description "Fuzzy pick a Herdr session"
    if not command -q herdr; or not command -q jq; or not command -q fzf
        echo "hfzf: requires herdr, jq, and fzf" >&2
        return 1
    end

    set -l selection (herdr session list --json \
        | jq -r '.sessions[] | [.name, (if .running then "running" else "stopped" end)] | @tsv' \
        | fzf --delimiter=\t --with-nth=1,2 --no-sort --prompt='Herdr session> ')

    if test -n "$selection"
        set -l fields (string split \t -- "$selection")
        herdr session attach "$fields[1]"
    end
    commandline -f repaint
end

bind \ct hfzf

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# opencode
fish_add_path /home/x6a6471/.opencode/bin
set fish_greeting

# rust
fish_add_path -m ~/.cargo/bin

# pnpm
set -gx PNPM_HOME "/home/x6a6471/.local/share/pnpm"
if not string match -q -- "$PNPM_HOME/bin" $PATH
  set -gx PATH "$PNPM_HOME/bin" $PATH
end
# pnpm end

# idf
function idf
    set -gx VIRTUAL_ENV_DISABLE_PROMPT 1
    source "/home/x6a6471/.espressif/tools/activate_idf_v6.0.2.fish" >/dev/null
    set -gx ESP_IDF_VERSION 6.0.2
end

function idfd
    source "/home/x6a6471/.espressif/tools/deactivate_idf_v6.0.2.fish" >/dev/null
    set -e VIRTUAL_ENV_DISABLE_PROMPT
end
