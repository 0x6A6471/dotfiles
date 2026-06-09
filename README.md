# dotfiles

Arch, btw.

> [!WARNING]
> This repo uses `$HOME` as its work tree. Only add explicit paths. Avoid `dotfiles add .` or `dotfiles add ~`.

## Setup

Clone the bare repo:

```sh
git clone --bare git@github.com:0x6A6471/dotfiles.git "$HOME/.dotfiles"
```

Define helpers:
```fish
function dotfiles
    git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" $argv
end

funcsave dotfiles

function lazydot
    env GIT_DIR="$HOME/.dotfiles" GIT_WORK_TREE="$HOME" lazygit $argv
end

funcsave lazydot
```

Hide untracked files:
```sh
git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" config --local status.showUntrackedFiles no
```

Checkout files:
```sh
git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" checkout
```

## Usage

```sh
dotfiles status
dotfiles add <path_to_file>
dotfiles commit -m "update dotfiles"
dotfiles push
```
