export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"
export CLICOLOR="auto"
alias ls="ls -G"

export PS1='\n[\u] \w $(git branch &>/dev/null; if [ $? -eq 0 ]; then echo "\[\033[01;33m\]($(git branch | grep ^*|sed s/\*\ //))\[\033[00m\]"; fi)$: \n'

