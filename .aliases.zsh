
# Git aliases
alias gs="git status"
alias gd="git diff --patience --ignore-space-change"
alias gc="git checkout"
alias gcm="git commit -m"
alias gb="git branch"
alias ga="git add"
alias gh="git hist"
alias gl="git log"
alias gpom="git push origin master"
alias gpomf="git push origin master --force"
alias gpo="git push origin"
alias gpcm="git push class master"
alias gpcmf="git push class master --force"
alias gca="git commit --ammend"
alias gpf="git push --force"
alias grh="git reset HEAD"
alias gcv="git commit -v"
alias readme="vim README.md"
alias reload="source ~/.bash_profile"

Team Directory
# tmux aliases
alias tn="tmux new -s"
alias ta="tmux attach -t"
alias ts="tmux switch -t"
alias tsess="tmux list-sessions"
alias td="tmux detach"
alias tks="tmux kill-server"
alias x="exit"

alias al="vim /Users/jackyeh/.dotfiles/.aliases.zsh"
alias vimrc="vim /Users/jackyeh/.dotfiles/.vimrc"
alias depry='ag -l "binding.pry" | xargs gsed --in-place "/binding.pry/d"'

# terminal aliases
alias cdp="cd ~/Desktop/hackers_education/Turing/projects"
alias daily="cd ~/Desktop/hackers_education/Turing/daily_lessons"
alias be="bundle exec"
alias rspecs="rspec --require rspec/pride --format PrideFormatter"
alias rr="rake routes"
