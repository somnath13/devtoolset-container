### ******************* ALIASES ******************* ###
alias a='alias'
alias j='jobs'
alias h='history'
alias hgr='history | grep '
alias psg='ps axo user,pid,ppid,stat,stime,tname,args | grep -e ^USER -e'
alias psu='ps o user,pid,ppid,stat,stime,tname,args U'
alias l.='ls -d .*'
alias ll.='ls -ld .*'
alias ll='ls -l'
alias llh='ls -lh'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls -lrt'
alias lrt='ls -lrt'
alias lrth='ls -lrth'
alias llt='ls -l | tail -n20'
alias lld='ls -ld */'
alias path='echo ${PATH}'
alias cds="cd ${SRCROOT}"
alias cdw="cd ${WORKDIR}"
alias cdmy="cd ${WORKDIR}/mystic"
alias cdm30="cd ${WORKDIR}/m30multi_ch"
alias cdut="cd ${WORKDIR}/utilities"
alias cdn="cd /etc/sysconfig/network-scripts/"
alias cdlo='cd /var/log'

# hide the /opt/app-root/bin/usage command -- som
alias usage='du -sk * | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'


### ******************* FUNCTIONS ******************* ###
runcmd() {
  echo "# $@"; "$@"
}

unique_list() {
  local item
  for item in "$@"; do
    echo ${item}
  done | sort -u
}

resolve_hostname() {
  ping -q -c 1 -W 1 "$1" 2>/dev/null | awk --field-separator='[()]' '/^PING / {print $2}'
}

# grep through aliases & shell functions
ag() {
  if alias | grep -i "$1" >& /dev/null; then
    alias | grep -i "$1"
  fi

  for FUNCTION in $(declare -F | sed 's/declare -f //g' | grep -v '^_'); do
    if declare -f "$FUNCTION" | grep -i "$1" >& /dev/null; then
      declare -f "$FUNCTION"
    fi
  done
}

ver() {
  local devtoolset=''
  echo "BASH $BASH_VERSION"
  runcmd /lib64/libc.so.6 | head -n 2
  runcmd gcc --version | head -n 2
  if which scl &>/dev/null; then
    for devtoolset in $(scl -l | grep 'devtoolset'); do
      runcmd scl enable ${devtoolset} 'gcc --version' | head -n 2
    done
  fi
}

llf() {
  find ${1} -maxdepth 1 -type f -print0 | xargs -0 -r ls -l
}


### ******************* BASH PROMPT ******************* ###
mycolors() {
  case "${1:-unset}" in
    enable)
      if [ -x /usr/bin/dircolors ]; then
        alias ls='ls --color=auto'
        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
      fi

      case "$(whoami)" in
        mystic)
          PS1='\[\033[01;36m\]\u\[\033[00m\] \h \[\033[01;35m\]\w\[\033[00m\] ${?##0}\$ '
          ;;
        root)
          PS1='\[\033[01;31m\]\u\[\033[00m\] \h \[\033[01;34m\]\w\[\033[00m\] ${?##0}\$ '
          ;;
        *)
          PS1='\[\033[01;32m\]\u\[\033[00m\] \h \[\033[01;35m\]\w\[\033[00m\] ${?##0}\$ '
          ;;
      esac
      ;;

    disable)
      unalias ls 2>/dev/null
      unalias grep 2>/dev/null
      unalias fgrep 2>/dev/null
      unalias egrep 2>/dev/null
      PS1='\u ${PWD} ${?##0}\$ '
      ;;

    *)
      echo "USAGE: ${FUNCNAME} 'enable'|'disable'"
      ;;
  esac
}

mycolors disable

