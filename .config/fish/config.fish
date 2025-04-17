if status is-interactive
    # Commands to run in interactive sessions can go here
    export FZF_DEFAULT_COMMAND='rg --files'
    export FZF_DEFAULT_OPTS='-m --height 50% --border'
end

set fish_greeting ""

# use bat for man pages
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
export MANROFFOPT="-c"

# add inkscape to the path (used for latex and SVGS)
set -x PATH /usr/bin/inkscape $PATH
set -x PATH ~/code/codeQL/codeql $PATH

# "aliases"

alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"
alias tmux_paste="tmux show-buffer | xclip -selection clipboard -o"
alias tmux_copy="tmux show-buffer | xclip -selection clipboard"
alias lock="xdg-screensaver lock"
alias ctfhere="cd /home/alex/ctf"
alias toolsctfhere="cd /home/alex/tools-ctf"
alias git-fancy-foresta="git-foresta --all --style=2  | less -RSX"

# set LTAPI_SERVER for spellchecking
set -x LTAPI_SERVER http://localhost:8875

# Functions

# Function to toggle the gnome status top bar
function toggle-hidetopbar
    if gnome-extensions info hidetopbar@mathieu.bidon.ca | grep -q "State: INACTIVE"
        gnome-extensions enable hidetopbar@mathieu.bidon.ca
    else
        gnome-extensions disable hidetopbar@mathieu.bidon.ca
    end
end
