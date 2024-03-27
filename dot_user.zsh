CURSHELL=`ps|grep $$|awk '{print $4}'`
#echo ${CURSHELL}

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PUBLIC_TOOLS=/home/public
export CARGO_HOME=~/.cargo

#alias
alias vi="vim"
alias g="gvim"
#alias v="vim"
alias c="z"
alias m="bat"
alias h="head -20"
alias his="history"
alias t="tail -20"
alias sw="cd /inst"
alias cx="chmod +x"
alias et="erdtree"
#alias la="ls -a"
#alias ll="ls -l"
#alias ls='ls --color=auto'
alias cm=chezmoi

if [ ${CURSHELL} = "zsh" ]; then
	alias vr="vim ~/.user.zsh ~/.zshrc"
	alias sr="source ~/.zshrc"
elif [ ${CURSHELL} = "bash" ]; then
	alias vr="vim ~/.user.zsh ~/.bashrc"
	alias sr="source ~/.bashrc"
fi
alias vnc1="vncserver -geometry 1600x980 -depth 24"
alias vnc2="vncserver -geometry 1380x830 -depth 24"
alias vnck="vncserver -kill "



#export HOME=/home/harriszh
export PATH=${PUBLIC_TOOLS}/verible/bin:${PUBLIC_TOOLS}/chezmoi:${PUBLIC_TOOLS}/iverilog-v12.0/bin:${PUBLIC_TOOLS}/graphviz-v8.0.5/bin:${HOME}/.local/bin:${HOME}/.local/sbin:${HOME}/.fzf/bin:/usr/local/bin:/bin:/sbin:/usr/sbin:/usr/bin:${PATH}

export LS_COLORS='no=00:fi=00:di=00;34:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;32:*.cmd=00;32:*.exe=00;32:*.com=00;32:*.btm=00;32:*.bat=00;32:*.sh=00;32:*.csh=00;32:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;31:*.cpio=00;31:*.jpg=00;35:*.gif=00;35:*.bmp=00;35:*.xbm=00;35:*.xpm=00;35:*.png=00;35:*.tif=00;35:'

#if [ -f /usr/share/terminfo/x/xterm-256color ]; then
#	export TERM=xterm-256color
if [ -f /usr/share/terminfo/g/gnome-256color ]; then
	export TERM=gnome-256color
else
	export TERM=xterm
fi

#prompt
# Colors!
bldblk='\e[1;30m' # Black - Regular
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
bldrst='\e[0m'	  # Reset
if [ ${CURSHELL} = "bash" ]; then
	export PS1='\e[1;32m\u \e[1;35m\d \@ \e[1;34m\w\e[0;0m$ '
fi
unset bldblk bldred bldgrn bldylw bldblu bldpur bldcyn bldwht bldrst

######################################### LD_LIBRARY_PATH ##########################################################

export LD_LIBRARY_PATH=${HOME}/.local/lib64:${HOME}/.local/lib:/usr/local/lib:/lib64:/usr/lib64:/usr/lib:/lib
export PKG_CONFIG_PATH=${HOME}/.local/lib64/pkgconfig:${HOME}/.local/lib/pkgconfig:${HOME}/.local/vte/lib64/pkgconfig:${PKG_CONFIG_PATH}

######################################### EDA tool setting begin ##########################################################
export BITMODE=64
export NO_PLATFORM_REL_CHECK=1 
export CDS_LIC_FILE=5280@127.0.0.1
#export CDS_LIC_FILE=5280@192.168.56.1:5280@sjflex1:5281@sjflex1:5280@sjflex2:5280@sjflex3:7678@cpflexlin
#1726@areis:1726@158.140.71.227:1726@axis31b:1726@aries:27001@sjcflex1:1726@axis31b:5280@158.140.217.132:5280@192.168.244.1
export LM_LICENSE_FILE=${CDS_LIC_FILE}
export XE_SAIF_VCS_NAME

alias sies="source ~/.uzsh/ies.zshrc"
alias sxlm="source ~/.uzsh/xlm.zshrc"
alias suxe="source ~/.uzsh/uxe151.zshrc"
alias svxe="source ~/.uzsh/vxe161.zshrc"
alias suxe15="source ~/.uzsh/uxe151.zshrc"
alias svxe16="source ~/.uzsh/vxe161.zshrc"
alias savip="source ~/.uzsh/avip.zshrc"
alias seswd="source ~/.uzsh/eswd.zshrc"
alias scfml="source ~/.uzsh/conformal.zshrc"
alias sverdi="source ~/.uzsh/verdi.zshrc"
alias sjls="source ~/.uzsh/jls.zshrc"
alias svtran="source ~/.uzsh/vtran.zshrc"

alias uxe151="/tools/uxeVerChange.sh UXE151"
alias uxe171="/tools/uxeVerChange.sh UXE171"
alias vxe1511="/tools/uxeVerChange.sh VXE1511"
alias vxe161="/tools/uxeVerChange.sh VXE161"
alias vxe171="/tools/uxeVerChange.sh VXE171"
alias ies151="/tools/iesVerChange.sh INCISIV152S030"
alias xlm171="/tools/iesVerChange.sh XCELIUMAGILE17.08.002"

alias licon="/tools/LCU/tools.lnx86/bin/lmgrd -c /inst/lic/cds.lic  -l /inst/lic/cds_debug.log"
alias licoff="/tools/LCU/tools.lnx86/bin/lmdown -c /inst/lic/cds.lic"
alias chlic="vim /inst/lic/cds_debug.log"
alias smdb="setenv SMDB_SAVE_MC"
#alias dis="export DISPLAY=vlsh-apvnc:19"
#alias bb='bsub -P project -W 3:00 -R "OSNAME==Linux" -q AE'

#functions
so () {
    source ~/.uzsh/$1.zshrc
}


######################################### EDA tool setting end ##########################################################

. ~/.bash/zsh.sh

#vim
. ~/.bash/vim.sh

if [ ! -d /tmp/vim ]; then
	mkdir /tmp/vim
fi

. ~/.bash/oniguruma.sh

. ~/.bash/openssl.sh

. ~/.bash/readline.sh

. ~/.bash/tclsh.sh

. ~/.bash/libsocket.sh

. ~/.bash/libiconv.sh

. ~/.bash/libb2.sh

. ~/.bash/python.sh

. ~/.bash/golang.sh

. ~/.bash/systemc.sh

. ~/.bash/exa.sh

. ~/.bash/zeromq.sh

. ~/.bash/spdlog.sh

. ~/.bash/llvm.sh

. ~/.bash/node.sh

. ~/.bash/git.sh

. ~/.bash/feh.sh

. ~/.bash/flatbuffer.sh

export PATH=${CARGO_HOME}/bin:${PATH}

## git-flow
source ~/.sh/git-flow-completion.zsh

# lazygit
alias lg="lazygit"

## zoxide
export _ZO_DATA_DIR="$HOME/.config/zoxide"
eval "$(zoxide init zsh)"
alias zg="zoxide query -i"

eval "$(batpipe)"
export BAT_STYLE=full
#export BAT_THEME="Dracula" 
export BAT_THEME="OneHalfLight" 

########################################################################################################################

#anyConnect
export PATH=/opt/cisco/anyconnect/bin:${PATH}

########################################################################################################################

#FoxitReader
export PATH=${HOME}/.local/FoxitReader1.1/:${PATH}

########################################################################################################################

#tmuxinator
#autoload -U compinit && compinit -u
#autoload -U compinit && compinit -u
#if [ ${CURSHELL} = "bash" ]; then
#	[[ -s ${HOME}/.tmuxinator/.tmuxinator.bash ]]  && source ${HOME}/.tmuxinator/.tmuxinator.bash
#elif [ ${CURSHELL} = "zsh" ]; then
#		[[ -s ${HOME}/.tmuxinator/.tmuxinator.zsh ]]  && source ${HOME}/.tmuxinator/.tmuxinator.zsh
#fi

########################################################################################################################

#tmux
alias tmuxn="tmux new -s"
alias tmuxa="tmux attach -t"
alias tmuxk="tmux kill-session -t"
alias tmuxlog="tmux capture-pane -p -S -10000 | vim -"

########################################################################################################################
#ripgrep rg
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

#fzf
#export FZF_DEFAULT_COMMAND='ag --ignore .git -g ""'
#export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
#export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
#INITIAL_QUERY=""
#RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
#export FZF_DEFAULT_COMMAND="$RG_PREFIX '$INITIAL_QUERY'" \
#  fzf --bind "change:reload:$RG_PREFIX {q} || true" \
#      --ansi --disabled --query "$INITIAL_QUERY" \
#      --height=50% --layout=reverse
#export FZF_CTRL_T_DEFAULT_COMMAND="${FZF_DEFAULT_COMMAND}"
#export FZF_ALT_C_COMMAND='rg --sort-files --files --null 2> /dev/null | xargs -0 dirname | uniq'

command -v fd > /dev/null && export FZF_DEFAULT_COMMAND='fd --type f --follow --exclude .git --exclude \*.swp'
command -v fd > /dev/null && export FZF_DEFAULT_COMMAND2='fd --type f -I --follow --exclude .git --exclude \*.swp'
command -v fd > /dev/null && export FZF_DEFAULT_COMMAND3='fd --type f -I -H  --follow --exclude .git --exclude \*.swp'

FZF_COMMON_OPTIONS="
  --bind='?:toggle-preview'
  --bind='ctrl-u:preview-page-up'
  --bind='ctrl-d:preview-page-down'
  --bind 'ctrl-/:change-preview-window(80%,border-bottom|hidden|)' 
  --bind 'ctrl-r:reload(${FZF_DEFAULT_COMMAND})'
  --bind 'ctrl-i:reload(${FZF_DEFAULT_COMMAND2})'
  --bind 'ctrl-h:reload(${FZF_DEFAULT_COMMAND3})'
  --bind 'ctrl-o:execute(${EDITOR:-vim} {})'
  --bind 'ctrl-w:reload(/home/harriszh/.cargo/bin/zoxide query --list)'
  --preview-window 'right:60%:wrap'
  --preview '/home/harriszh/.sh/fzf-bat.sh {}'"

command -v bat > /dev/null && command -v tree > /dev/null && export FZF_DEFAULT_OPTS="${FZF_COMMON_OPTIONS}"
command -v fd > /dev/null && export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git --exclude \*.swp'
command -v fd > /dev/null && export FZF_CTRL_T_COMMAND='fd --type f --type d --hidden --follow --exclude .git --exclude \*.swp'

#Use fd instead of the default find command for listing candidates
_fzf_compgen_path() {
	rg -g "" -- "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}


# repeat history
fh() {
  eval $( ([ -n "${ZSH_NAME}" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}
# edit the history command before issuing it
fhe() {
  print -z $( ([ -n "${ZSH_NAME}" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# fasd & fzf change directory - jump using `fasd` if given argument, filter output of `fasd` using `fzf` else
# unalias z 2> /dev/null

# fcd - cd to selected directory
fcd() {
  local dir
  dir=$(fd ${1:-.} --type d 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fda - including hidden directories
fda() {
  local dir
  dir=$(fd -H ${1:-.} --type d 2> /dev/null | fzf +m) && cd "$dir"
}

# fdr - cd to selected parent directory
fdr() {
  local declare dirs=()
  get_parent_dirs() {
    if [[ -d "${1}" ]]; then dirs+=("$1"); else return; fi
    if [[ "${1}" == '/' ]]; then
      for _dir in "${dirs[@]}"; do echo $_dir; done
    else
      get_parent_dirs $(dirname "$1")
    fi
  }
  local DIR=$(get_parent_dirs $(realpath "${1:-$PWD}") | fzf-tmux --tac)
  cd "$DIR"
}

# cdf - cd into the directory of the selected file
cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

vf() {
	vi $(fzfp)
}

# fkill - kill processes - list only the ones you can kill. Modified the earlier script.
fkill() {
    local pid 
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi  

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi  
}

fman() {
    man -k . | fzf -q "$1" --prompt='man> '  --preview $'echo {} | tr -d \'()\' | awk \'{printf "%s ", $2} {print $1}\' | xargs -r man | col -bx | bat -l    man -p --color always' | tr -d '()' | awk '{printf "%s ", $2} {print $1}' | xargs -r man
}

# Get the colors in the opened man page itself
export MANPAGER="sh -c 'col -bx | bat -l man -p --paging always'"
alias bathelp='bat --plain --language=help'
help() {
	"$@" --help 2>&1 | bathelp
}

#fzfp() {
#  fzf --preview '[[ $(file --mime "{}") =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || rougify {}  || highlight -O ansi -l {} || coderay {} || cat {}) 2> /dev/null'
	#fzf --preview 'bat --style=full --color=always --line-range :500 {}'
	#fzf --info=right --border=block --preview-window=border-block --margin=3 --scrollbar=▏▕ --preview='bat --color=always --style=numbers {}' --color=light,query:238,fg:238,bg:251,bg+:249,gutter:251,border:248,preview-bg:253
#}

# tmux
if [[ -n $TMUX_PANE ]] && (( $+commands[tmux] )) && (( $+commands[fzfp] )); then
    # fallback to normal fzf if current session name is `floating`
    export TMUX_POPUP_NESTED_FB='test $(tmux display -pF "#{==:#S,floating}") == 1'

    export TMUX_POPUP_WIDTH=80%
fi

# fzf
# . ~/.sh/fzf-git.zsh

_fzf_complete_bat() {
	_fzf_complete --multi --reverse --prompt="bat> " -- "$@" < <(
	echo very
	echo wow
	echo such
	echo bat
)
}

_fzf_complete_bat_post() {
	awk '{print $NF}'
}

_fzf_complete_cp() {
  _fzf_complete --multi --reverse -- "$@" < <(
	/home/harriszh/.cargo/bin/zoxide query --list
  )
}

	#xargs echo -n
_fzf_complete_cp_post() {
	awk '{print $NF}'
}

_fzf_complete_rm() {
  _fzf_complete --multi --reverse -- "$@" < <(
    fd 
  )
}

_fzf_complete_rm_post() {
	xargs echo -n
}

_fzf_complete_rsync() {
  _fzf_complete +m -- "$@" < <(
    /home/harriszh/.cargo/bin/zoxide query --list
  )
}
_fzf_complete_rsync_post() {
	xargs echo -n
}

_fzf_complete_sftp() {
  _fzf_complete +m -- "$@" < <(
    /home/harriszh/.cargo/bin/zoxide query --list
  )
}
_fzf_complete_sftp_post() {
	xargs echo -n
}


# click Ctrl-X+Ctrl-R to execute
fzf-history-widget-accept() {
  fzf-history-widget
  zle accept-line
}
zle    -N    fzf-history-widget-accept
bindkey '^X^R' fzf-history-widget-accept

zoxide-history-widget-accept() {
  res="$(zoxide query -i)" # interactive zoxide query
  LBUFFER+="${(q)res}" # push the result to the input buffer
  zle reset-prompt # redraw the prompt
}

zle    -N    zoxide-history-widget-accept
bindkey '^[o' zoxide-history-widget-accept

# interactive cd
# source ~/.fzf/shell/zsh-interactive-cd.plugin.zsh

if [ ${CURSHELL} = "bash" ]; then
	[ -f ~/.fzf.bash ] && source ~/.fzf.bash
elif [ ${CURSHELL} = "zsh" ]; then
	[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi


########################################################################################################################

#DW
alias cddw="cd /trunk/dw"
alias cddwdev="cd /trunk/dw/dev"
alias cddwsrc="cd /trunk/dw/work_version/src"
alias cddwsim="cd /trunk/dw/work_version/sim_ver.2015"
#export DW_PD_CFG_PATH=~/dw/cfg
alias dwsim2015="pushd . > /dev/null && cd ~/dw && if [ -e sim_ver ]; then rm sim_ver; fi &&  ln -sf _sim_vers_/sim_ver.2015 sim_ver      && popd > /dev/null"
alias dwsim2017="pushd . > /dev/null && cd ~/dw && if [ -e sim_ver ]; then rm sim_ver; fi &&  ln -sf _sim_vers_/sim_ver.201709sp2 sim_ver && popd > /dev/null"
alias dwsim2013="pushd . > /dev/null && cd ~/dw && if [ -e sim_ver ]; then rm sim_ver; fi &&  ln -sf _sim_vers_/sim_ver.2013 sim_ver      && popd > /dev/null"
alias dwsim2016="pushd . > /dev/null && cd ~/dw && if [ -e sim_ver ]; then rm sim_ver; fi &&  ln -sf _sim_vers_/sim_ver.201612 sim_ver    && popd > /dev/null"
alias dwsim2010="pushd . > /dev/null && cd ~/dw && if [ -e sim_ver ]; then rm sim_ver; fi &&  ln -sf _sim_vers_/sim_ver.2010 sim_ver      && popd > /dev/null"

########################################################################################################################

# xdotools
#alias xdsize="xdotool windowsize $(xdotool getwindowfocus)"
#alias xdmove="xdotool windowmove $(xdotool getwindowfocus)" 

########################################################################################################################

# dir aliases
alias cdt="cd /trunk"
alias cdb="cd /trunk/branch/"

# rename workspace
#gsettings set org.gnome.desktop.wm.preferences workspace-names "['uart','mem','rgb','test','go','c']"
#gsettings set org.gnome.desktop.wm.preferences num-workspaces "6"

alias antlr='java -jar ~/.local/bin/antlr-4.8-complete.jar'

function soriscv() {
export RISCV=${HOME}/.local/riscv
export PATH=${RISCV}/bin:${PATH}
}


alias sogcc9="source /opt/rh/devtoolset-9/enable"
alias sogcc11="source /opt/rh/devtoolset-11/enable"

alias n="nvim"

alias proxyon="export http_proxy='socks5://127.0.0.1:7890';export https_proxy='socks5://127.0.0.1:7890'"
alias proxyoff="export http_proxy='';export https_proxy=''"

## pastel
export COLORTERM='24bit'

## poetry
fpath+=~/.zfunc
autoload -Uz compinit && compinit
alias pt='poetry'

## doxygen
# require higher libc
#export PATH=~/.local/doxygen-1.9.5/bin:$PATH

## java
export JAVA_HOME=$(dirname $(dirname $(readlink $(readlink $(which javac)))))

## tomcat
export CATALINA_HOME=/opt/apache-tomcat-10.0.22/

## navi
eval "$(navi widget zsh)"

## directories
# Changing/making/removing directory
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

# add (uncommented):
# zstyle ':omz:directories' aliases no
# to your `zshrc` before loading `oh-my-zsh.sh`
# to disable the following aliases and functions

#zstyle -T ':omz:directories' aliases || return 0

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias -- -='cd -'
alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias md='mkdir -p'
alias rd=rmdir

function mcd () {
	if [[ ! -d $1 ]]; then
		mkdir -p $1
	fi
	cd $1
}

function d () {
  if [[ -n $1 ]]; then
    dirs "$@"
  else
    dirs -v | head -n 10
  fi
}
compdef _dirs d

## zsh-autosuggests
#bindkey '^I' autosuggest-accept
# bindkey '^I'   complete-word       # tab          | complete
bindkey '^[,' autosuggest-accept     # alt+,  | autosuggest
# #bindkey '^I'      autosuggest-accept
# ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(buffer-empty bracketed-paste accept-line push-line-or-edit)
# ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# ZSH_AUTOSUGGEST_USE_ASYNC=true
# 
# ## zsh-history-substring-search
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down
# 
bindkey '\e[1;3D' backward-word       # ALT+左键：向后跳一个单词
bindkey '\e[1;3C' forward-word        # ALT+右键：前跳一个单词

## type-aware alias
alias -s tgz='tar -zxvf'
alias -s gz='tar -zxvf'
alias -s bz2='tar -jxvf'
alias -s zip='unzip'
alias -s v=vi
alias -s sv=vi
alias -s vhdl=vi
alias -s cpp=vi

alias pe=~/.local/bin/path-extractor
alias clcf="vi compile_flags.txt"
alias clcm="vi compile_commands.json"
export EDITOR=vim
export GIT_EDITOR=vim

alias wezterm='flatpak run org.wezfurlong.wezterm'
alias ipTest="/trunk/cdns/main_hdlice/ua/HDL/Verilog/namemap/test/x86-lx2-64/ipTest"

# clena repetitive path
if [[ -n "$PATH" ]]; then
    old_PATH=$PATH:; PATH=
    while [ -n "$old_PATH" ]; do
        x=${old_PATH%%:*}      
        case $PATH: in
           *:"$x":*) ;;             
           *) PATH=$PATH:$x;;  
        esac
        old_PATH=${old_PATH#*:}
    done
    PATH=${PATH#:}
    unset old_PATH x
fi
export PATH
