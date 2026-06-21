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

# tmux
function tsearch --description "Search scrollback across all tmux panes"
    if not command -q tmux
        echo "tsearch: tmux is not installed" >&2
        return 1
    end

    if test (count $argv) -eq 0
        echo "usage: tsearch <pattern>"
        return 2
    end

    set -l pattern (string join " " -- $argv)

    for pane in (tmux list-panes -a -F '#{session_name}:#{window_index}.#{pane_index}')
        tmux capture-pane -pt $pane -S - -p | rg -n --color=always -- "$pattern"
        if test $pipestatus[2] -eq 0
            set -l title (tmux display-message -pt $pane -p '#{session_name}:#{window_index}.#{pane_index} #{window_name} #{pane_current_command}')
            printf '\n[%s]\n\n' "$title"
        end
    end
end

function tfzf --description "Fuzzy pick a tmux session"
    if not command -q tmux
        echo "tfzf: tmux is not installed" >&2
        return 1
    end

    if not command -q fzf
        echo "tfzf: fzf is not installed" >&2
        return 1
    end

    set -l session (tmux list-sessions -F '#{session_name}: #{session_windows} windows (created #{session_created_string})' | fzf --ansi --no-sort | string split -m1 ':' | head -n1)

    if test -z "$session"
        commandline -f repaint
        return
    end

    if set -q TMUX
        tmux switch-client -t "$session"
    else
        tmux attach-session -t "$session"
    end

    commandline -f repaint
end

bind \ct tfzf

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
