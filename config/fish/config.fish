if status is-interactive
    # Commands to run in interactive sessions can go here
    eval (zellij setup --generate-auto-start fish | string collect)
end

starship init fish | source
