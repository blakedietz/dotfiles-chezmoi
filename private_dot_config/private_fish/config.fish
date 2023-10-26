if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    atuin init fish | source
end

if test -e ~/.config/fish/tokyonight_moon.fish
    . ~/.config/fish/tokyonight_moon.fish
end

set exports_dir exports
for script in $exports_dir/*.fish
    if test -f $script
        source $script
    end
end

# asdf for version management
source /opt/homebrew/opt/asdf/libexec/asdf.fish
