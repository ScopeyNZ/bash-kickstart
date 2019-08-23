function cd_up() {
  cd $(printf "%0.s../" $(seq 1 $1 ));
}
alias 'cd..'='cd_up'
alias 'up'='cd_up'

alias git=hub
alias fork="git fork --remote-name=cc --org=creative-commoners"

alias gs="git status"
alias gc="git commit"
alias gca="git commit --amend"
alias gcan="git commit --amend --no-edit"
alias codist="git checkout -- client/dist"
alias resetdist="git reset HEAD client/dist"
alias gd="git diff -- ':(exclude)client/dist'" 
alias grc="git rebase --continue"
alias grrc="git reset HEAD client/dist; git checkout -- client/dist; git rebase --continue; git status"
alias gcl='git log --oneline --pretty=format:"* %s (%an) - %h" --no-merges'
alias co="git checkout"
alias gpf="git push --force-with-lease"

alias yb="yarn build"
alias yd="yarn dev"
alias yt="yarn test"
alias yw="yarn watch"

alias ssc="ssconsole"
alias punt="vendor/bin/phpunit -d memory_limit=2G"
alias xpunt="xphp vendor/bin/phpunit -d memory_limit=2G"

source $DIR/lib/auto-nvm.alias
