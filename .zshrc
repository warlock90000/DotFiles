#                 ██
#                ░██
#  ██████  ██████░██
# ░░░░██  ██░░░░ ░██████
#    ██  ░░█████ ░██░░░██
#   ██    ░░░░░██░██  ░██
#  ██████ ██████ ░██  ░██
# ░░░░░░ ░░░░░░  ░░   ░░
#
#
#█▓▒░

# Path to your oh-my-zsh installation.
  export ZSH=/home/jacka/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="fino-time"
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs dir_writable)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time root_indicator background_jobs history time)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_RPROMPT_ON_NEWLINE=true

#POWERLEVEL9K_OK_ICON='\u2713'
#POWERLEVEL9K_FAIL_ICON='\u2718'
#POWERLEVEL9K_LINUX_ICON='\uf300 '
#POWERLEVEL9K_CARRIAGE_RETURN_ICON='\u21B5'

#POWERLEVEL9K_MODE='awesome-fontconfig'
#POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_MODE='nerdfont-complete'

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git adb pip extract zsh-autosuggestions colored-man-pages command-not-found)

source $ZSH/oh-my-zsh.sh
source $ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=ru_RU.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nano'
 else
   export EDITOR='subl'
fi

if [[ -n `echo $DISPLAY` ]];  then
    export EDITOR='subl'
else
    export EDITOR='mcedit'
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#export TERM=xterm-256color
export COLORTERM=xterm-256color

export PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/opt/android-sdk/platform-tools:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/jacka/.gem/ruby/2.4.0/bin
export BUILD_MAC_SDK_EXPERIMENTAL=1
export SYSTEMD_LESS=FRXMK
export USE_CCACHE=1
export PATH=/usr/lib/ccache:$PATH
export CC="ccache gcc"
export HOSTCC="ccache gcc"
export HOSTCXX="ccache g++"
export CCACHE_DIR="/home/jacka/.ccache"

## man colorer (ccze grc most)
#export PAGER=most
## man colorer

#man() {
#    env LESS_TERMCAP_mb=$'\E[01;31m' \
#    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
#    LESS_TERMCAP_me=$'\E[0m' \
#    LESS_TERMCAP_se=$'\E[0m' \
#    LESS_TERMCAP_so=$'\E[38;5;246m' \
#    LESS_TERMCAP_ue=$'\E[0m' \
#    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
#    man "$@"
#}

perms() {
  if [[ -z "$1" ]]; then
    find .    -type d -print0 | xargs -0 chmod 700
    find .    -type f -print0 | xargs -0 chmod 600
  else
    find "$*" -type d -print0 | xargs -0 chmod 700
    find "$*" -type f -print0 | xargs -0 chmod 600
  fi
}
permsg() {
  if [[ -z "$1" ]]; then
    find .    -type d -print0 | xargs -0 chmod 770
    find .    -type f -print0 | xargs -0 chmod 660
  else
    find "$*" -type d -print0 | xargs -0 chmod 770
    find "$*" -type f -print0 | xargs -0 chmod 660
  fi
}
sysinfo() {
    ColorOff=$'\e[0m';
    Green=$'\e[0;32m';
    Yellow=$'\e[0;33m';
    Red=$'\e[0;31m';

    cpu_type=$(lscpu | grep "Model name:" | cut -c 24-)
    cpu_cores=$(lscpu | grep "^CPU(s)" | cut -c 24-)

    if (lscpu | grep "CPU max MHz" &> /dev/null) then
        cpu_freq=$(lscpu | grep "CPU max MHz" | cut -c 24-)
    else
        cpu_freq=$(lscpu | grep "CPU MHz" | cut -c 24-)
    fi

    mem_total=$(free -m | awk 'NR==2 {print $2}')
    mem_used=$(free -m | awk 'NR==2 {print $3}')
    gpu_type=$(lspci | grep VGA | cut -c 36- | awk 'NR==1')
    block_dev=$(echo -e "${Yellow}Block Devices: \n${Green}$(lsblk | grep "sd." | awk '{print "'${Red}'> '${Green}'"$1" '${Yellow}'Type: '${Green}'"$6" '${Yellow}'Size: '${Green}'"$4" '${Green}'"$7}' | column -t | sed 's/>/    >/')")
    inet_dev=$(echo -e "${Yellow}IP Configuration: \n${Green}$(ip addr | grep -w inet | sed "s/inet/${Red}> ${Green}inet/")")
    kversion=$(uname -srm)
    shell="$SHELL"

    echo "  ${Red}|${Red}$(whoami)${Green}@${Yellow}$(</etc/hostname) ${Red}------------------------------------------------>"
    echo "  ${Red}|${Yellow}System Uptime: ${Green}$(uptime -p)"
    echo "  ${Red}|${Yellow}Kernel Version: ${Green}$kversion"
    echo "  ${Red}|${Yellow}Command Shell: ${Green}$shell"
    echo "  ${Red}|${Yellow}CPU Model: ${Green}$cpu_type"
    echo "  ${Red}|${Yellow}CPU Cores: ${Green}$cpu_cores"
    echo "  ${Red}|${Yellow}CPU Clock: ${Green}$cpu_freq MiB"
    echo "  ${Red}|${Yellow}GPU Model: ${Green}$gpu_type"
    echo "  ${Red}|${Yellow}Memory: ${Green}$mem_used MiB / $mem_total MiB"
    echo "  ${Red}|$block_dev"
    echo "  ${Red}|$inet_dev${ColorOff}"
}
#==============================================
alias findtxt='/home/jacka/.ftxt'
alias findtext="bash /home/jacka/.ftext"
alias wget1='wget --content-disposition -E -c --restrict-file-names=nocontrol,unix'
alias pacinst='sudo pacman -U'
alias lsaur="echo -n '\e[1;32mListing Installed AUR packages:\e[0m\n '| pv -qL 20 && pacman -Qqm" #list installed AUR packages
alias grep='egrep --color'

alias ssh_servm='sshfs user@192.168.0.108:/home/user/Downloads /home/jacka/ssh_serv -o uid=1000,gid=1000'
alias ssh_servu='fusermount -u /home/jacka/ssh_serv'
alias ssh_term='ssh -Y user@192.168.0.108'
alias vnc='vncviewer 192.168.0.104:1'
alias wserv='wol 00:14:85:1b:21:67'

alias pogoda='curl -H "Accept-Language: ru" wttr.in/"Нижний Тагил"'
alias pogoda1='wget -O - wttr.in/"Нижний Тагил" -q'
alias pogoda2='curl -H "Accept-Language: ru" wttr.in/"Нижний Тагил?T" | head -n37 | xargs -0 notify-send'
alias glaz='redshift -l 57.905149:59.9508466'
alias 2on='xrandr --output VGA-0 --auto --primary --output VGA-1-2 --auto --right-of VGA-0'
alias 2off='xrandr --output VGA-0 --auto --primary --output VGA-1-2 --off'
alias packey='gpg --recv-keys'
alias news='newsbeuter'

alias disks='echo "╓───── m o u n t . p o i n t s"; echo "╙────────────────────────────────────── ─ ─ "; lsblk -a; echo ""; echo "╓───── d i s k . u s a g e"; echo "╙────────────────────────────────────── ─ ─ "; df -h; echo ""; echo "╓───── U.U.I.D.s"; echo "╙────────────────────────────────────── ─ ─ "; lsblk -f;'
alias drives="echo -n '\e[1;32mListing connected drives:\e[0m\n'  | pv -qL 10 && lsblk -f"
alias empty='echo -n "\e[1;32mTaking out teh trash:\e[0m " | pv -qL 10 && rm -rf /home/jacka/.local/share/Trash/files'
alias iohdd="iostat -x | ccze -A"
alias .='cd ..'
alias ..='cd ../..'
alias ...='cd ../../..'
alias ....='cd ../../../..'
alias top10files='find . -type f -exec ls -sh {} \; | sort -n -r | head -10'
#alias findempty='find ! -name '*.jpg' ! -name '*.png' ! -name '*.gif' -delete'
alias dosfsck1='sudo dosfsck -w -r -l -a -v -t'
alias size='du -hs .[^.]* * | sort -h | ccze -A'         #list 10 dir/files by size
alias sizehome="sudo du -a ~/ | sort -n -r | head -n 10"  #list 10 dir by size
alias sizevar='sudo du -a /var | sort -n -r | head -n 10' #list 10 dir by size

alias err='journalctl -b -p err'
alias err50='journalctl -b -n50'
alias errors="echo -n '\e[1;32mJournal Errors:\e[0m ' | pv -qL 10 && journalctl -b -p err | ccze -A"
alias journal='journalctl -b -n50| ccze -A'
alias dmtc='dmesg | tail -n 22 | ccze -A'
alias boot="echotc us && echo '\e[1;32mBoot Time:\e[0m ' | pv -qL 10 && systemd-analyze"
alias h='history |ccze -A'
alias hist="history |tail -n45 |ccze -A"

alias realtime='journalctl -f -all |  ccze -A'
alias root="sudo -i"
alias sourcezsh="source ~/.zshrc"
alias htop1="glances"

# systemd shortcuts
alias start_tor='sudo systemctl start tor'
alias stop_tor='sudo systemctl stop tor'
start() { sudo systemctl start $1.service; sudo systemctl status $1.service; }
stop() { sudo systemctl stop $1.service; sudo systemctl status $1.service; }
restart() { sudo systemctl restart $1.service; sudo systemctl status $1.service; }
status() { sudo systemctl status $1.service; }
enabled() { cd /usr/lib/systemd/system; sudo systemctl enable $1.service;  }
disabled() { sudo systemctl disable $1.service;  }

startu() { systemctl --user start $1.service; systemctl --user status $1.service; }
stopu() { systemctl --user stop $1.service; systemctl --user status $1.service; }
statusu() { systemctl --user status $1.service; }

#user_commands=(
#list-units is-active status show help list-unit-files
#is-enabled list-jobs show-environment cat)

#sudo_commands=(start stop reload restart try-restart isolate kill
#reset-failed enable disable reenable preset mask unmask
#link load cancel set-environment unset-environment
#edit)

#for c in $user_commands; do alias sc-$c="systemctl $c"; done
#for c in $sudo_commands; do alias sc-$c="sudo systemctl $c"; done
#==============================================
xrdb -merge ~/.Xresources

# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/home/jacka/.zshrc'
autoload -Uz compinit
compinit
_comp_options+=(globdots)
setopt menucomplete
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
# End of lines added by compinstall

HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
setopt appendhistory
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY

setopt auto_cd
setopt extended_glob
setopt interactive_comments