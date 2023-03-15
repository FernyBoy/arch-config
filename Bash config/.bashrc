#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

# Navigation
alias ls='ls --color=auto'
alias c='clear'
alias l='ls -alh'
alias Home='cd ~'
alias Bash='vim .bashrc'
alias edge="microsoft-edge-dev &"
alias Qconfig="vim ~/.config/qtile/config.py"

# Pacman
alias Installed="pacman -Qe"
alias AllInstalled="pacman -Q"
alias Install="sudo pacman -S"
alias Uninstall="sudo pacman -R"

# Qtile System Emergency
alias QtileEmergency='cd .config/qtile/ ; mv config.py my_config.py ; mv default_config.py config.py'
alias EmergencyEnd='cd .config/qtile/ ; mv config.py default_config.py ; mv my_config.py config.py'
alias CopyConfig="cp config.py last_config.py"

# Updates
alias UpdateCode="yay -S visual-studio-code-bin"
alias UpdateEdge="yay -S microsoft-edge-dev-bin"

alias EDW="cd Docs/Learning/Platzi/Desarrollo\ e\ ingenieria/Escuela\ de\ desarrollo\ web/"

# Time
alias Time="sudo timedatectl set-time "
alias Date="sudo timedatectl set-date "

# Git
alias gti="git init"
alias gta="git add"
alias gtc="git commit -am"
alias gtl="git log"
alias gtlone="git log --oneline"
alias gts="git status"
alias gtps="git push"
alias gtpl="git pull"
alias gtb="git branch"
alias gtcheck="git checkout"
alias gtchecknb="git checkout -b"
alias gtr="git remote"
alias gtra="git remote add"
alias gtrrm="git remote remove"
alias gtrs="git remote show"
alias gtrmv="git remote rename"
alias gtrst="git reset"
alias gtrsthd="git reset --hard"
alias AddSSH="eval '$(ssh-agent -s)' && ssh-add ~/.ssh/id_rsa"


# TypeScript
alias tsi="npm i typescript"
alias tsnode="npx ts-node "
alias tsw="npx tsc --watch"

# Disks cli
alias ShowDisks="udisksctl status"
alias OpenDisks="cd /run/media/Fernando"
alias MountDisk="udisksctl mount -b "
alias UnmountDisk="udisksctl unmount -b "

# Tar
alias Extract="tar -zxvf"

# Trash
alias EmptyTrash="trash-empty"
alias RestoreSingleFile="trash-restore"
alias Trash="trash"

#PS1='\u \W\$(git_branch)\$ '
# PS1="\u \[\033[32m\]\w\[\033[33m\]\$(git_branch)\[\033[00m\] $ "

PS1='\[\033[01;34m\]﫢\u \[\033[01;35m\]${PWD#${PWD%/*/*/*}/}\[\033[01;31m\]$(parse_git_branch)\[\033[00m\] \n '
