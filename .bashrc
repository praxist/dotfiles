CYAN="\[\e[1;36m\]"
RED="\[\e[0;31m\]"
LRED="\[\e[1;31m\]"
BLUE="\[\e[1;34m\]"
END_COLOR="\[\e[m\]"
PS1="${CYAN}[\!:\h]${BLUE}[\w]${END_COLOR} "

export GOPATH="$HOME/workspace/gopath/"

# Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"
# Append to the history file, don't overwrite it
shopt -s histappend
# Save multi-line commands as one command
shopt -s cmdhist
# Record each line as it gets issued
PROMPT_COMMAND='history -a'

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'

export HISTSIZE=500000
export HISTFILESIZE=100000
export HISTIGNORE="&:exit:bg:fg:clear"
export HISTTIMEFORMAT="%m/%d/%y %T "
export HISTCONTROL=ignoreboth:erasedups
export EDITOR=vim

## misc ###########################################################################
alias kc='kubectl'
alias ydl='youtube-dl --audio-quality 0 -x --prefer-ffmpeg --audio-format mp3'
alias ydlk='youtube-dl --format mp4 -k'
alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
function gifme() {
  find ~/Dropbox/Images/gifs -name "*$1*" | xargs qlmanage -p
}

## ls ###########################################################################
alias ls='ls -F'
alias lsl='ls -alh'


## git ##########################################################################
eval "$(hub alias -s)"
if [ -f /usr/local/etc/bash_completion.d ]; then
  . /usr/local/etc/bash_completion.d
fi
function gpo() {
  if [ "$1" == "master" ] && [ "$2" == "-f" ]
  then echo "Not force-pushing to master, you buffoon!";
  else git push origin $*;
  fi
}
function gpp() {
  git push praxist $*;
}
alias gamend="git add . && git commit --amend"
alias pull="git pull origin"
alias gb="git branch"
alias tgb="git symbolic-ref --short HEAD"
alias gl="git log"
alias glp="git log -p"
alias gs="git status"
alias gc="git commit -m"
alias gp="git pull"
alias gd="git diff"
alias gdc="git diff --cached"
alias ga="git add"
alias gck="git checkout"
alias gpr='gpo `tgb` && git pull-request'
alias gr="git remote -v"
alias gm="git merge"
alias gbr='git browse'


## grep #########################################################################
function ufind() {
    find "$1" -type f -not -name "*.backup" -not -name "*.tfstate" -not -name "*.js" -not -name "*.css" -not -name "*.scss" -not -name "*.jpg" -not -name "*.gif" -not -path "*/cache/*" -not -name "*.png" -not -name "*.swf" -not -name "*.fla" -not -name "*.pdf" -not -name "*.swp" -not -path "*.hg/*" -not -path "*.git/*" -not -path "*.dropbox.cache/*" "$2"
}
function grep_mod() {
  if [ -z "$3" ]
  then ufind . -print0 | xargs -0 grep --color "$1" "$2";
  else ufind "$3" -print0 | xargs -0 grep --color "$1" "$2"
  fi
}
alias grep='grep --color'
alias greps='grep_mod -in'
alias grepf='grep_mod -il'
alias hgrep="history | grep -i"
alias psgrep="ps aux | grep -i"


## cds ##########################################################################
c() { cd "$@" && ls; }

alias cdl="c"
alias b="cdl $OLDPWD"
alias u="cdl .."
alias cw="c ~/workspace"
alias cs="c ~/src"

## vim ##########################################################################
alias :e="gvim"
alias :q="exit"
alias :Q="exit"
alias vi='vim'

## bundle #######################################################################
alias be="bundle exec"
alias bersp="bundle exec rspec"
alias berdbc="bundle exec rake db:create"
alias berdbd="bundle exec rake db:drop"
alias berdbm="bundle exec rake db:migrate"
alias berdbs="bundle exec rake db:seed"


## tmux #########################################################################
alias tls="tmux list-sessions"
alias attach="tmux attach -t"
alias tmuxn="tmux new -s"


alias tf="docker-compose run --rm terraform"
