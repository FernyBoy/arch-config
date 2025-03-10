#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi

export MANPATH=/usr/local/texlive/2024/texmf-dist/doc/man:$MANPATH
export INFOPATH=/usr/local/texlive/2024/texmf-dist/doc/info:$INFOPATH
export PATH=/usr/local/texlive/2024/bin/x86_64-linux:$PATH

#Ma shit
alias shit='shutdown now'
alias ohshit="reboot"
alias DeepSeek="ollama run deepseek-r1:8b"
alias Ciclo="cd /home/$USER/Repos/TareasUnison/2025-1"
alias LaRamona="ssh ramona@10.10.235.245"
alias fg="make clean; fg"

alias Screen120="xrandr --output eDP-1 --primary --mode 1920x1200 --rate 120"
alias Screen240="xrandr --output eDP-1 --primary --mode 1920x1200 --rate 240"
alias Screen480="xrandr --output eDP-1 --primary --mode 1920x1200 --rate 480"

# Screen
SecondaryScreen=$(xrandr --query | grep -v "primary" | grep " connected" | awk '{print $1}')
SecondaryResolution=$(xrandr --query | grep "^$SecondaryScreen " | awk '{print $3}' | cut -d"+" -f1)
PrimaryScreen=$(xrandr --query | grep " primary" | awk '{print $1}')
PrimaryResolution=$(xrandr --query | grep " primary" | awk '{print $4}' | cut -d"+" -f1)

# alias DoubleScreen="xrandr --output $PrimaryScreen --primary --mode $PrimaryResolution --pos 0x0 --rotate normal --output $SecondaryScreen --mode 1920x1080 --pos 1920x0 --rotate normal; feh --bg-scale Images/Walls/HorizonHouse.png &"

alias DoubleScreen="xrandr --output eDP-1 --primary --mode 1920x1200 --pos 0x0 --rotate normal --output HDMI-1-0 --mode 1920x1080 --pos 1920x0 --rotate normal; feh --bg-scale Images/Walls/HorizonHouse.png &"

# Navigation
alias ls='ls -lh --color=auto'
alias c='clear'
alias l='ls -a'
view()
{
    viewnior "$@" &
}

Search()
{
    history | grep "$@"
}

# Pacman
alias Installed="pacman -Qe"
alias AllInstalled="pacman -Q"
alias Install="sudo pacman -S"
alias Uninstall="sudo pacman -Rns"
alias UpdatePgpKeys="sudo pacman-key --refresh-keys"
alias DeleteSignatures="sudo rm -r /etc/pacman.d/gnupg"
alias UpdateKeys="sudo pacman-key --init; sudo pacman-key --populate archlinux"
alias SystemUpdate="DeleteSignatures; UpdateKeys; sudo pacman -Sy -y; sudo pacman -Syu -y"
alias OpenMirrors="cd /etc/pacman.d/"

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
alias gti="git init -b main"
alias gta="git add"
alias gtc="git commit -m "
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
branch() 
{
    git rev-parse --abbrev-ref HEAD 2>/dev/null
}
Pull()
{
    gtpl origin branch
}
Push()
{
    gta .
    gtc "$@"
    gtps origin branch 
}

# Pdfs
alias RunPdf="zathura"

# Pyton
alias RunNvidiaServer="python -m notebook --NotebookApp.allow_origin='https://colab.research.google.com' --port=8888 --NotebookApp.port_retries=0"

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

# Programs
edge() 
{
    if [[ "$1" == "private" ]]; then
        shift  # Elimina "private" de los argumentos
        microsoft-edge-dev "$@" --new-window --inprivate &
    else
        microsoft-edge-dev "$@" --new-window &
    fi
}

alias NetBeans="~/Programs/NetBeans/ProgramFiles/bin/netbeans &"
alias Discord="/home/Ferny/Programs/Discord/Discord &"

# Bash
alias Bash='nvim ~/.bashrc'
alias RefreshBash="source /home/$USER/.bashrc"

styled_parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' | \
    awk '{printf "   \033[31m\033[97;41m 󰊢 %s \033[m\033[31m", $0}'
}
PS1='\n\[\033[34m\]\[\033[97;44m\] 󰟍 \u  \[\033[35m\]\[\033[97;45m\]  ${PWD#${PWD%/*/*/*}/} \[\033[0m\]\[\033[35m\]$(styled_parse_git_branch) \n\[\033[0m\]  '

parse_git_branch() 
{
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ 󰊢 \1/'
}
PS2='\[\033[01;34m\]󰟍 \u \[\033[01;35m\]  ${PWD#${PWD%/*/*/*}/}\[\033[01;31m\] $(parse_git_branch) \[\033[00m\] \n '


PATH=~/.console-ninja/.bin:$PATH
# Created by `pipx` on 2024-12-24 04:03:40
export PATH="$PATH:/home/Ferny/.local/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
