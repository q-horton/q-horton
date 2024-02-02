######################################################################
#
#
#           ██████╗  █████╗ ███████╗██╗  ██╗██████╗  ██████╗
#           ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██╔════╝
#           ██████╔╝███████║███████╗███████║██████╔╝██║     
#           ██╔══██╗██╔══██║╚════██║██╔══██║██╔══██╗██║     
#           ██████╔╝██║  ██║███████║██║  ██║██║  ██║╚██████╗
#           ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
#
#
######################################################################

# General aliases
alias lsf='ls -ali --si'
alias uq='ssh s4697591@moss.labs.eait.uq.edu.au'
alias vi='nvim'
alias vim='nvim'
alias tu='sudo ntpdate time.windows.com'
alias py='python3'
alias python='python3'
alias 3010debug='screen /dev/ttyACM0 115200'

# Customised bash prompt
PS1="\n\e[1;35m[\[\T\]]\e[0m \[\u\]@\[\H\]> \e[0;36m\[\W\]\e[0m\$ "

# Colourful man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Copy with progress bar
cpp() {
	set -e
	strace -q -ewrite cp -- "${1}" "${2}" 2>&1 \
	| awk '{
	count += $NF
	if (count % 10 == 0) {
		percent = count / total_size * 100
		printf "%3d%% [", percent
		for (i=0;i<=percent;i++)
			printf "="
			printf ">"
			for (i=percent;i<100;i++)
				printf " "
				printf "]\r"
			}
		}
	END { print "" }' total_size=$(stat -c '%s' "${1}") count=0
}

# Loads SSH Keys into keychain
KEY_FILES="$HOME/.ssh/moss_rsa"
KEY_FILES+=" $HOME/.ssh/github_rsa"
KEY_FILES+=" $HOME/.ssh/gitea_rsa"
/usr/bin/keychain $KEY_FILES
source $HOME/.keychain/$HOSTNAME-sh

# JLink stuff for 3010
export SOURCELIB_ROOT=$HOME/csse3010/sourcelib
export PATH=$SOURCELIB_ROOT/tools:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=/opt/SEGGER/JLink:$PATH
. "$HOME/.cargo/env"



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/quinn/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/quinn/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/quinn/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/quinn/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

