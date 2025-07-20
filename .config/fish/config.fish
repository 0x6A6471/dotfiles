if status is-interactive
  # Commands to run in interactive sessions can go here
  set fish_greeting
  set fish_color_error D70000
  set fish_color_autosuggestion 444444

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

  # lsd
  alias ls='lsd --icon never'
  alias l='ls -l'
  alias la='ls -a'
  alias lla='ls -la'
  alias lt='ls --tree'


  # fzf
  function fcd
      cd (begin; find ~/Developer -maxdepth 2 -type d;  end | fzf)
      commandline -f repaint  # Force Fish to repaint the prompt after cd
  end


  bind \cf fcd
end
set -gx SHELL /usr/bin/fish
