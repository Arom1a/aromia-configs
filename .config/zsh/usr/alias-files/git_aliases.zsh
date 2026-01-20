# status
alias gs="git status -sb"

# add mv rm
alias ga="git add"
alias gal="git add -A"
alias gmv="git mv"
alias grm="git rm"

# commit
alias gcm="git commit -m"
alias gcam="git commit --amend"

# reset
alias grst="git reset"

# restore
alias grest="git restore"

# push pull clone
alias gph="git push"
alias gpl="git pull"
alias gfh="git fetch"
alias gc="git clone"

# log
alias glone="git log --oneline -n 20"
alias glog="git log"
alias gloggg="git log --oneline --graph --decorate --all"

# stash
alias gsh="git stash -u"
alias gsha="git stash apply"
alias gshm="git stash push -u -m"
alias gshl="git stash list --format=\"%C(yellow)%hCreset %C(green)%gd%Creset %s%n%C(dim white)%H%Creset\""
alias gshp="git stash pop"
alias gshb="git stash branch"
alias gshrm="git stash list --format=\"%C(yellow)%hCreset %C(green)%gd%Creset %s%n%C(dim white)%H%Creset\" && git stash clear && echo \"All stashes are cleared!\""
alias gshs="git stash show -p"

# diff
alias gd="git diff"
alias gds="git diff --stat"
alias gdst="git diff --staged"

# branch
alias gb="git branch"
alias gck="git checkout"

# remote
alias grmt="git remote"
alias grmtl="git remote -v"


####################
#                  #
# github cli alias #
#                  #
####################


alias ghb="gh browse"
