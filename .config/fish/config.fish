set fish_greeting

function fish_prompt
    if set -q fish_should_add_space
        if test "$fish_should_add_space" = "1"
            echo
        end
    end

    set_color "#ffa500"
    echo -n 'λ '
    set_color normal

    set -U fish_should_add_space 0
end



# alias
alias vim="nvim"
alias vt='vim "+terminal"'

# python3
alias python="python3"
alias pip="pip3"

# git
alias gs="git status"
alias ga="git add"
alias gb="git branch"
alias gbd="git branch -D"
alias gc="git commit"
alias gp="git push"
alias gpp="git pull"
alias gcb="git checkout -b"

# lsd
alias ls='lsd --icon never'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

if status is-interactive
    # Commands to run in interactive sessions can go here
end


# fzf
function fcd
    cd (begin; find ~/Developer/onramp -maxdepth 1 -type d; end | fzf)
    commandline -f repaint  # Force Fish to repaint the prompt after cd
end


bind \cf fcd

set -U fish_user_path $HOME/.local/bin $fish_user_paths
set -U fish_user_paths /opt/nvim-linux64/bin $fish_user_paths

