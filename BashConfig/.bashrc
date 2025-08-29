
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi

export PATH=$HOME/bin:$PATH

for file in "$HOME/.config/Bash"/.bash_*; do
    [ -f "$file" ] && source "$file"
done

PATH=~/.console-ninja/.bin:$PATH
# Created by `pipx` on 2024-12-24 04:03:40
export PATH="$PATH:/home/Ferny/.local/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source ~/anaconda3/etc/profile.d/conda.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/Ferny/Programs/Gsutil/google-cloud-sdk/path.bash.inc' ]; then . '/home/Ferny/Programs/Gsutil/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/Ferny/Programs/Gsutil/google-cloud-sdk/completion.bash.inc' ]; then . '/home/Ferny/Programs/Gsutil/google-cloud-sdk/completion.bash.inc'; fi
