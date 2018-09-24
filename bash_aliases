function cd_up() {
  cd $(printf "%0.s../" $(seq 1 $1 ));
}
alias 'cd..'='cd_up'
alias 'up'='cd_up'

alias git=hub
alias fork="git fork --remote-name=cc --org=creative-commoners"

alias s="git status"
alias gc="git commit"
alias gca="git commit --amend"

alias ssc="ssconsole"
alias punt="vendor/bin/phpunit -d memory_limit=2G"
alias xpunt="xphp vendor/bin/phpunit -d memory_limit=2G"
