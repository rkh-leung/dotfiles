if status is-interactive
    # Commands to run in interactive sessions can go here
    eval (zellij setup --generate-auto-start fish | string collect)
end

starship init fish | source

alias concepts="nvim ~/Personal/notes/concepts.md"
alias fconfig="nvim ~/.config/fish/config.fish"
alias config="nvim ~/Personal/dotfiles/nvim/init.lua"
alias zjc="nvim ~/.config/zellij/config.kdl"

alias notes="cd ~/Personal/notes"
alias dotfiles="cd ~/Personal/dotfiles"
alias p="cd ~/Personal"


set -x GOPATH (go env GOPATH)
set -x PATH $PATH (go env GOPATH)/bin
set -gx EDITOR nvim
set -Ux nvm_default_version 21

# ran already (adds to path)
# set -U fish_user_paths $fish_user_paths $HOME/.cargo/env
