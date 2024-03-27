export PATH=${HOME}/.local/verible/bin:${HOME}/.local/tclsh-8.6.13/bin:${HOME}/.local/openssl-3.1.0/bin:${HOME}/.local/zsh-5.9/bin:${HOME}/.local/bin:${HOME}/.local/sbin:${HOME}/.cargo/bin:${HOME}/.fzf/bin:/usr/local/bin:/bin:/sbin:/usr/sbin:/usr/bin:${PATH}

#if [ -f /usr/share/terminfo/x/xterm-256color ]; then
#	export TERM=xterm-256color
if [ -f /usr/share/terminfo/g/gnome-256color ]; then
	export TERM=gnome-256color
else
	export TERM=xterm
fi


######################################### LD_LIBRARY_PATH ##########################################################

export LD_LIBRARY_PATH=/usr/local/lib:/lib64:/usr/lib64:/usr/lib:/lib
export LD_LIBRARY_PATH=${HOME}/.local/lib:${LD_LIBRARY_PATH}
export PKG_CONFIG_PATH=${HOME}/.local/lib64/pkgconfig:${HOME}/.local/lib/pkgconfig:${HOME}/.local/vte/lib64/pkgconfig:${PKG_CONFIG_PATH}

######################################### EDA tool setting begin ##########################################################
export BITMODE=64
export NO_PLATFORM_REL_CHECK=1 
export CDS_LIC_FILE=5280@127.0.0.1
#export CDS_LIC_FILE=5280@192.168.56.1:5280@sjflex1:5281@sjflex1:5280@sjflex2:5280@sjflex3:7678@cpflexlin
#1726@areis:1726@158.140.71.227:1726@axis31b:1726@aries:27001@sjcflex1:1726@axis31b:5280@158.140.217.132:5280@192.168.244.1
export LM_LICENSE_FILE=${CDS_LIC_FILE}
export XE_SAIF_VCS_NAME

#vim
export PATH="${HOME}/.local/vim9/bin:$PATH"
if [ ! -d /tmp/vim ]; then
	mkdir /tmp/vim
fi

# openssl
export LD_LIBRARY_PATH=${HOME}/.local/openssl-3.1.0/lib64:${LD_LIBRARY_PATH}
export PKG_CONFIG_PATH=${HOME}/.local/openssl-3.1.0/lib64/pkgconfig:${PKG_CONFIG_PATH}

# tclsh
export LD_LIBRARY_PATH=${HOME}/.local/tcl-8.6.13/lib:${LD_LIBRARY_PATH}
export PKG_CONFIG_PATH=${HOME}/.local/tcl-8.6.13/lib/pkgconfig:${PKG_CONFIG_PATH}

# readline
export LD_LIBRARY_PATH=${HOME}/.local/readline82/lib:${LD_LIBRARY_PATH}
export PKG_CONFIG_PATH=${HOME}/.local/readline82/lib/pkgconfig:${PKG_CONFIG_PATH}

# libsocket
export LD_LIBRARY_PATH=${HOME}/.local/libsocket/lib:${LD_LIBRARY_PATH}

# libiconv
export PATH=${HOME}/.local/libiconv-1.17/bin:$PATH
export LD_LIBRARY_PATH=${HOME}/.local/libiconv-1.17/lib:${LD_LIBRARY_PATH}

# python
export PYTHON_VERSION=3.11.3
export PATH=${HOME}/.local/python-${PYTHON_VERSION}/bin:${PATH}
export LD_LIBRARY_PATH=${HOME}/.local/python-${PYTHON_VERSION}/lib:${LD_LIBRARY_PATH}
export PKG_CONFIG_PATH=${HOME}/.local/python-${PYTHON_VERSION}/lib/pkgconfig:${PKG_CONFIG_PATH}


# Golang
export GOROOT=${HOME}/.local/go
export PATH="${GOROOT}/bin:/trunk/go/bin:${PATH}"
export GOPATH="/trunk/go:/trunk/branch/go"
# 配置 GOPROXY 环境变量
export GOPROXY=https://mirrors.aliyun.com/goproxy/,direct

########################################################################################################################

#anyConnect
export PATH=/opt/cisco/anyconnect/bin:${PATH}

########################################################################################################################

#FoxitReader
export PATH=${HOME}/.local/FoxitReader1.1/:${PATH}

########################################################################################################################

#git
export PATH=${HOME}/.local/git_v2.40/bin:$PATH
alias glog="git log --pretty=oneline --abbrev-commit"
alias gll="git log --no-color --no-decorate | bat -n -l 'Git log'"
alias gls="\\ls -A --group-directories-first -1 | while IFS= read -r line; do git log --color --format=\"\$(\\ls -d -F --color \"\$line\") =} %C(bold black)▏%Creset%Cred%h %Cgreen(%cr)%Creset =} %C(bold black)▏%Creset%s %C(bold blue)<%an>%Creset\" --abbrev-commit --max-count 1 HEAD -- \"\$line\"; done | awk -F'=}' '{ nf[NR]=NF; for (i = 1; i <= NF; i++) { cell[NR,i] = \$i; gsub(/\\033\\[([[:digit:]]+(;[[:digit:]]+)*)?[mK]/, \"\", \$i); len[NR,i] = l = length(\$i); if (l > max[i]) max[i] = l; } } END { for (row = 1; row <= NR; row++) { for (col = 1; col < nf[row]; col++) printf \"%s%*s%s\", cell[row,col], max[col]-len[row,col], \"\", OFS; print cell[row,nf[row]]; } }'"
alias gst="git status"

# git-extra
export PATH=${HOME}/.local/git-extras/bin:$PATH

## git-flow
#source ~/.sh/git-flow-completion.zsh

# lazygit
alias lg="lazygit"

# go to a path relative to the top directory of the current git worktree.
function gcd() {
  topdir=$(git rev-parse --show-toplevel)
  if [[ $? -ne 0 ]]; then
    return 1
  fi
  cd "${topdir}/${1}"
}

# Will return non-zero status if the current directory is not managed by git
is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

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
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

command -v fd > /dev/null && export FZF_DEFAULT_COMMAND='fd --type f --follow --exclude .git --exclude \*.swp'
command -v fd > /dev/null && export FZF_DEFAULT_COMMAND2='fd --type f -I --follow --exclude .git --exclude \*.swp'
command -v fd > /dev/null && export FZF_DEFAULT_COMMAND3='fd --type f -I -H  --follow --exclude .git --exclude \*.swp'

FZF_COMMON_OPTIONS="
  --bind='?:toggle-preview'
  --bind='ctrl-u:preview-page-up'
  --bind='ctrl-d:preview-page-down'
  --bind 'ctrl-/:change-preview-window(80%,border-bottom|hidden|)' 
  --bind 'ctrl-r:reload($FZF_DEFAULT_COMMAND)'
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
  eval $( (fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}
# edit the history command before issuing it
fhe() {
  print -z $( (fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# fasd & fzf change directory - jump using `fasd` if given argument, filter output of `fasd` using `fzf` else
unalias z 2> /dev/null

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

fzfp() {
#  fzf --preview '[[ $(file --mime "{}") =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || rougify {}  || highlight -O ansi -l {} || coderay {} || cat {}) 2> /dev/null'
	fzf --preview 'bat --style=full --color=always --line-range :500 {}'
}

# fzf
# . ~/.sh/fzf-git.sh

_fzf_complete_cp() {
  _fzf_complete +m -- "$@" < <(
    /home/harriszh/.cargo/bin/zoxide query --list
  )
}

_fzf_complete_cp_post() {
	xargs echo -n
}

[ -n "$BASH" ] && complete -F _fzf_complete_cp -o default -o bashdefault cp

_fzf_complete_rm() {
  _fzf_complete +m -- "$@" < <(
    fd 
  )
}

_fzf_complete_rm_post() {
	xargs echo -n
}

[ -n "$BASH" ] && complete -F _fzf_complete_rm -o default -o bashdefault rm

_fzf_complete_rsync() {
  _fzf_complete +m -- "$@" < <(
    /home/harriszh/.cargo/bin/zoxide query --list
  )
}
_fzf_complete_rsync_post() {
	xargs echo -n
}

[ -n "$BASH" ] && complete -F _fzf_complete_rsync -o default -o bashdefault rsync

_fzf_complete_sftp() {
  _fzf_complete +m -- "$@" < <(
    /home/harriszh/.cargo/bin/zoxide query --list
  )
}
_fzf_complete_sftp_post() {
	xargs echo -n
}

[ -n "$BASH" ] && complete -F _fzf_complete_sftp -o default -o bashdefault sftp


# exa
if [[ "$(command -v exa)" ]]; then
    unalias -a 'll'
    unalias -a 'l' 
    unalias -a 'la'
    unalias -a 'ls'
    alias ls='exa -GF  --color auto  -s type'
    alias ll='exa -lF --color always  -s type'
    alias la='exa -lF --color always -a -s type'
    alias lsi='exa -GF  --color auto  -s type --icons'
    alias lli='exa -lF --color always  -s type --icons'
    alias lai='exa -lF --color always -a -s type --icons'
    alias llt='exa -lF --color always -a -s type -s=modified'
    alias lst='exa -F --color always -a -s type -s=modified'
fi

## zoxide
export _ZO_DATA_DIR="$HOME/.config/zoxide"
eval "$(zoxide init bash)"
alias zg="zoxide query -i"

alias sogcc9="source /opt/rh/devtoolset-9/enable"
alias sogcc11="source /opt/rh/devtoolset-11/enable"
export PATH=$HOME/.local/llvm15/bin:$PATH
export LD_LIBRARY_PATH=$HOME/.local/llvm15/lib:$LD_LIBRARY_PATH
alias n="nvim"

alias proxyon="export http_proxy='socks5://127.0.0.1:7890';export https_proxy='socks5://127.0.0.1:7890'"
alias proxyoff="export http_proxy='';export https_proxy=''"

eval "$(batpipe)"
export BAT_STYLE=full

## pastel
export COLORTERM='24bit'

## git-extra
#source ~/.local/git-extras/etc/bash-completion/completions/git-extras

alias -p ...='../..'
alias -p ....='../../..'
alias -p .....='../../../..'
alias -p ......='../../../../..'

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

function d () {
  if [[ -n $1 ]]; then
    dirs "$@"
  else
    dirs -v | head -n 10
  fi
}
# compdef _dirs d

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

alias pe=~/.local/bin/path-extractor
alias clcf="vi compile_flags.txt"
alias clcm="vi compile_commands.json"
export EDITOR=vim
export GIT_EDITOR=vim
