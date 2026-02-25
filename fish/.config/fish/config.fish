if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

    # Use gpg-agent for SSH keys
    set -gx SSH_AGENT_PID ""
    set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/gnupg/S.gpg-agent.ssh"

    if test -f ~/.config/fish/private.fish
        source ~/.config/fish/private.fish
    end

    fish_add_path -g ~/.local/bin

    # Enable Mise
    mise activate fish | source
end
