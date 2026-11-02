function dev --description 'open zellij tab: rust layout if Cargo.toml is present, code layout otherwise'
    if test -f Cargo.toml
        zellij --layout rust $argv
    else
        zellij --layout code $argv
    end
end
