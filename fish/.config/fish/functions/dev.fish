function dev --wraps='zellij action new-tab --layout rust' --description 'alias dev=zellij action new-tab --layout rust'
    zellij --layout rust $argv
end
