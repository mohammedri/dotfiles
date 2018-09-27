export ZSH=/Users/mo/.oh-my-zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
ZSH_THEME="honukai"
source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"

fpath=(/usr/local/share/zsh-completions $fpath)
plugins=(git sublime colored-man colorize github jira vagrant virtualenv pip python brew osx zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR='vim'
[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

source /usr/local/share/antigen/antigen.zsh

alias emotions='cd ~/src/github.com/mohammedri/emotions'
alias ds='cd ~/src/github.com/mohammedri/data-scientist/'
alias yarnpkg='/usr/local/Cellar/yarn/1.6.0/bin/yarnpkg'
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

export GOPATH=$HOME
export PATH=$GOPATH/bin:$PATH
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export PATH="/Users/mo/anaconda3/bin:$PATH"
