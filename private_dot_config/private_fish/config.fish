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

# Personal scripts

function convert_mov_to_mp4 --description 'Convert MOV to MP4'
    # Check if ffmpeg is installed
    if not type -q ffmpeg
        echo "ffmpeg is not installed. Please install it first."
        return 1
    end

    # Check if the file path is provided
    if count $argv >0
        set file_path "$argv[1]"
    else
        echo "Please provide the path to the .mov file."
        return 1
    end

    # Check if the file exists
    if not test -f "$file_path"
        echo "File does not exist: $file_path"
        return 1
    end

    # Extract the file name without extension and quote it to handle spaces
    set file_name (basename "$file_path" .mov)

    # Convert mov to mp4, quoting the variables to prevent word splitting
    ffmpeg -i "$file_path" -vcodec h264 -acodec mp2 "$file_name.mp4"

    # Confirmation message
    echo "Conversion complete: $file_name.mp4"
end

function update_lexical_lsp --description 'Update lexical language server'
    cd ~/projects/lexical-lsp/lexical
    git pull
    mix package
end

function update_dev_tooling
    update_lexical_lsp
    brew upgrade
    fisher update
end
