# Add some aliases here -- som
alias a='alias'
alias j='jobs'
alias h='history'
alias hgr='history | grep '
alias psg='ps aux | grep -i -e ^USER -e '
alias psu='ps uU '
alias l.='ls -d .*'
alias ll.='ls -ld .*'
alias ll='ls -l'
alias llh='ls -lh'
alias lla='ls -la'
alias lt='ls -lrt'
alias lrt='ls -lrt'
alias lrth='ls -lrth'
alias path='echo ${PATH}'
alias cds='cd /opt/app-root/src'
alias cdw="cd ${WORKDIR}"
alias cdmy="cd ${WORKDIR}/mystic"
alias cdut="cd ${WORKDIR}/utilities"

PS1='\u ${PWD} ${?##0}\$ '

