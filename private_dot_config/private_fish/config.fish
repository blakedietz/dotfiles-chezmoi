if status is-interactive
    # Commands to run in interactive sessions can go here
end

if test -e ~/.config/fish/exports/brew.fish
    . ~/.config/fish/exports/brew.fish
end

function download
    rsync \
        -azP \
        --exclude="Presonus*/" \
        --exclude="Topaz*/" \
        --exclude="*Skillshare*/" \
        --exclude="DaVinci*/" \
        --exclude="**/*.mkv" \
        --exclude="**/*.avi" \
        whatbox:/home/a46601535/files /Users/blakedietz/Music/library
end

function upload
    scp ~/Downloads/*.torrent whatbox:/home/a46601535/watch
    rm ~/Downloads/*.torrent
end

set exports_dir exports
for script in $exports_dir/*.fish
    if test -f $script
        source $script
    end
end

source /opt/homebrew/opt/asdf/libexec/asdf.fish

# Start prompt
starship init fish | source
fish_vi_key_bindings

direnv hook fish | source
atuin init fish | source
