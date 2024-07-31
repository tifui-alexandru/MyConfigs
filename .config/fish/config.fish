if status is-interactive
    # Commands to run in interactive sessions can go here
    export FZF_DEFAULT_COMMAND='rg --files'
    export FZF_DEFAULT_OPTS='-m --height 50% --border'
end

set fish_greeting ""

# use bat for man pages
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
export MANROFFOPT="-c"

# "aliases"

alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"
alias tmux_paste="tmux show-buffer | xclip -selection clipboard -o"
alias tmux_copy="tmux show-buffer | xclip -selection clipboard"
alias lock="xdg-screensaver lock"
alias ctfhere="cd /home/alex/ctf"

# set LTAPI_SERVER for spellchecking
set -x LTAPI_SERVER http://localhost:8875
