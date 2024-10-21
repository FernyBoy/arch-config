#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ 󰊢 \1/'
}

# Navigation
alias ls='ls --color=auto'
alias c='clear'
alias l='ls -alh'
alias Home='cd ~'
alias Bash='vim ~/.bashrc'
alias Qconfig="vim ~/.config/qtile/config.py"

# Pacman
alias Installed="pacman -Qe"
alias AllInstalled="pacman -Q"
alias Install="sudo pacman -S"
alias Uninstall="sudo pacman -Rns"
alias DeleteSignatures="sudo rm -r /etc/pacman.d/gnupg"
alias UpdateKeys="sudo pacman-key --init; sudo pacman-key --populate archlinux"
alias SystemUpdate="sudo pacman -Sy; sudo pacman -Syu"

# Qtile System Emergency
alias QtileEmergency='cd .config/qtile/ ; mv config.py my_config.py ; mv default_config.py config.py'
alias EmergencyEnd='cd .config/qtile/ ; mv config.py default_config.py ; mv my_config.py config.py'
alias CopyConfig="cp config.py last_config.py"

# Updates
alias UpdateYay="makepkg -si /opt/yay-git"
alias YayUpdates="yay -Syu"
alias UpdateCode="yay -S visual-studio-code-bin"
alias UpdateEdge="yay -S microsoft-edge-dev-bin"

alias EDW="cd Docs/Learning/Platzi/Desarrollo\ e\ ingenieria/Escuela\ de\ desarrollo\ web/"

# Time
alias Time="sudo timedatectl set-time "
alias Date="sudo timedatectl set-date "
alias AutoAdjustTime="sudo timedatectl set-ntp true"

# Git
alias gti="git init"
alias gta="git add"
alias gtc="git commit -am"
alias gtl="git log"
alias gtlone="git log --oneline"
alias gtg="git log --graph"
alias gts="git status"
alias gtps="git push"
alias gtpl="git pull"
alias gtb="git branch"
alias gtbdlt="git branch -d"
alias gtcheck="git checkout"
alias gtchecknb="git checkout -b"
alias gtr="git remote"
alias gtra="git remote add"
alias gtrrm="git remote remove"
alias gtrs="git remote show"
alias gtrmv="git remote rename"
alias gtrst="git reset"
alias gtrsthd="git reset --hard"
alias gtm="git merge"
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

# Screen
alias Screen120="xrandr --output eDP-1 --primary --mode 1920x1200 --rate 120"
alias Screen240="xrandr --output eDP-1 --primary --mode 1920x1200 --rate 240"
alias Screen480="xrandr --output eDP-1 --primary --mode 1920x1200 --rate 480"

# Programs
alias Edge="microsoft-edge-dev &"
alias Netbeans="~/Programs/Netbeans/ProgramFiles/bin/netbeans &"

# JetBrains
alias IntelliJ="~/Programs/JetBrains/IntelliJ/ProgramFiles/bin/idea &"


#PS1='\u \W\$(git_branch)\$ '
# PS1="\u \[\033[32m\]\w\[\033[33m\]\$(git_branch)\[\033[00m\] $ "

PS1='\[\033[01;34m\] \u \[\033[01;35m\] ${PWD#${PWD%/*/*/*}/}\[\033[01;31m\]$(parse_git_branch)\[\033[00m\] \n '

PATH=~/.console-ninja/.bin:$PATH
