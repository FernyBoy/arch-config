#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi

#Ma shit
alias shit='shutdown now'
alias ohshit="reboot"

#Screen
alias DoubleScreen="xrandr --output eDP-1 --primary --mode 1920x1200 --pos 0x0 --rotate normal --output HDMI-1 --off --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-1-0 --off --output DP-1-1 --off --output DP-1-2 --off --output DP-1-3 --off --output HDMI-1-0 --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-1-4 --off"

# Navigation
alias ls='ls -lh --color=auto'
alias c='clear'
alias l='ls -a'
alias Home='cd ~'
alias Bash='vim ~/.bashrc'
alias RefreshBash="source /home/$USER/.bashrc"
alias Qconfig="vim ~/.config/qtile/config.py"

# Pacman
alias Installed="pacman -Qe"
alias AllInstalled="pacman -Q"
alias Install="sudo pacman -S"
alias Uninstall="sudo pacman -Rns"
alias DeleteSignatures="sudo rm -r /etc/pacman.d/gnupg"
alias UpdateKeys="sudo pacman-key --init; sudo pacman-key --populate archlinux"
alias SystemUpdate="sudo pacman -Sy -y; sudo pacman -Syu -y"

# Qtile System Emergency
alias QtileEmergency='cd /home/$USER/.config/qtile/ ; mv config.py my_config.py ; mv default_config.py config.py'
alias EmergencyEnd='cd /home/$USER/.config/qtile/ ; mv config.py default_config.py ; mv my_config.py config.py'
alias CopyConfig="cp config.py last_config.py"

# Updates
alias UpdateYay="makepkg -si /opt/yay-git"
alias YayUpdates="yay -Syu -y"
alias UpdateCode="yay -S visual-studio-code-bin"
alias UpdateEdge="yay -S microsoft-edge-dev-bin"

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
alias gtst="git status"
alias gtps="git push"
alias gtpl="git pull"
alias gtb="git branch"
alias gtbdlt="git branch -d"
alias gtsw="git switch"
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

# Pyton
alias RunNvidiaServer="python -m notebook --NotebookApp.allow_origin='https://colab.research.google.com' --port=8888 --NotebookApp.port_retries=0"

# TypeScript
alias tsi="npm i typescript"
alias tsnode="npx ts-node "
alias tsw="npx tsc --watch"

# Disks cli
alias ShowDisks="udisksctl status"
alias OpenDisks="cd /run/media/$USER"
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
alias NetBeans="~/Programs/NetBeans/ProgramFiles/bin/netbeans &"
alias Discord="/home/Ferny/Programs/Discord/Discord &"

# JetBrains
alias IntelliJ="~/Programs/JetBrains/IntelliJ/ProgramFiles/bin/idea &"

# arch-config
alias CopyBashConfig="cp /home/$USER/.bashrc /home/$USER/Repos/arch-config/Bash\ config/"

parse_git_branch() 
{
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ 󰊢 \1/'
}

styled_parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' | \
    awk '{printf "   \033[31m\033[97;41m 󰊢 %s \033[m\033[31m", $0}'
}

PS2='\[\033[01;34m\]󰟍 \u \[\033[01;35m\]  ${PWD#${PWD%/*/*/*}/}\[\033[01;31m\] $(parse_git_branch) \[\033[00m\] \n '

PS1='\n\[\033[34m\]\[\033[97;44m\] 󰟍 \u  \[\033[35m\]\[\033[97;45m\]  ${PWD#${PWD%/*/*/*}/} \[\033[0m\]\[\033[35m\]$(styled_parse_git_branch) \n\[\033[0m\]  '
