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
export PATH=$HOME/bin:$PATH

# Ma shit
alias shit='shutdown now'
alias ohshit="reboot"
alias DeepSeek="ollama run deepseek-r1:8b"
alias Ciclo="cd /home/$USER/Repos/TareasUnison/2025-1"
alias fg="make clean; fg"
alias mysql="mysql -u $USER -p"

# Servers
alias Ramona="ssh ramona@10.10.196.11"
alias Furiosa="ssh ferny@proyectoscc.unison.mx"

alias reload-screen='sudo systemctl restart sddm'
alias reload-inputs='sudo udevadm trigger --subsystem-match=usb --action=add'

alias Screen120="xrandr --output eDP-1 --primary --mode 1920x1200 --rate 120"
alias Screen240="xrandr --output eDP-1 --primary --mode 1920x1200 --rate 240"
alias Screen480="xrandr --output eDP-1 --primary --mode 1920x1200 --rate 480"

# Battery
# - Ahorro de energía
alias battery-save='Screen120; sudo cpupower frequency-set -g powersave && clear; echo "Modo ahorro activado 󱟟"'

# - Rendimiento máximo
alias full-power='Screen480; sudo cpupower frequency-set -g performance && clear; echo "Modo rendimiento activado ⚡"'

# - Balanceado (si quieres algo intermedio)
alias balanced='Screen240; sudo cpupower frequency-set -g schedutil && echo "Modo balanceado activado 󰗑"'

# - Ver estado actual
alias cpu-status='cpupower frequency-info'


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
alias route='pwd | xclip -selection clipboard'
view()
{
    viewnior "$@" &
}

Search()
{
    history | grep "$@"
}

# Pacman
alias Install="sudo pacman -S"
alias Uninstall="sudo pacman -Rns"
alias Installed="pacman -Qe"
alias AllInstalled="pacman -Q"
alias ShowOrphans="pacman -Qdt"
alias KillOrphans="sudo pacman -Rns $(pacman -Qtdq)"
alias ClearCache="sudo pacman -Sc"
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

# Django
alias dj="django-admin"

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

# Bash
alias Bash='nvim ~/.bashrc'
alias RefreshBash="source /home/$USER/.bashrc"

styled_parse_git_branch() 
{
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' | \
    awk '{printf "   \033[31m\033[97;41m 󰊢 %s \033[m\033[31m", $0}'
}

export VIRTUAL_ENV_DISABLE_PROMPT=1
styled_parse_venv() {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        venv_name=$(basename "$VIRTUAL_ENV")
        printf " \033[32m\033[97;42m  %s \033[m\033[32m" "$venv_name"
    fi
}

export CONDA_CHANGEPS1=false
styled_parse_conda() {
    if [[ -n "$CONDA_DEFAULT_ENV" && -z "$VIRTUAL_ENV" ]]; then
        conda_env_name=$(basename "$CONDA_DEFAULT_ENV")
        printf  " \033[36m\033[97;46m  %s \033[m\033[36m" "$conda_env_name"
    fi
}

PS1='\n\[\033[34m\]\[\033[97;44m\] 󰟍 \u  \[\033[35m\]\[\033[97;45m\]  ${PWD#${PWD%/*/*/*}/} \[\033[0m\]\[\033[35m\]$(styled_parse_git_branch)$(styled_parse_venv)$(styled_parse_conda) \n\[\033[0m\]  '


parse_git_branch() 
{
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ 󰊢 \1/'
}

parse_venv() {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        echo -e " \033[32m $(basename "$VIRTUAL_ENV")\033[0m"
    fi
}

parse_conda() {
    if [[ -n "$CONDA_DEFAULT_ENV" && -z "$VIRTUAL_ENV" ]]; then
        echo -e " \033[36m $(basename "$CONDA_DEFAULT_ENV")\033[0m"
    fi
}

PS2='\[\033[01;34m\]󰟍 \u \[\033[01;35m\]  ${PWD#${PWD%/*/*/*}/}\[\033[01;31m\] $(parse_git_branch)$(parse_venv)$(parse_conda) \[\033[00m\] \n '


# Inicializar conda si no está ya inicializado
if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
    . "$HOME/miniconda3/etc/profile.d/conda.sh"
fi



PATH=~/.console-ninja/.bin:$PATH
# Created by `pipx` on 2024-12-24 04:03:40
export PATH="$PATH:/home/Ferny/.local/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


source ~/anaconda3/etc/profile.d/conda.sh
