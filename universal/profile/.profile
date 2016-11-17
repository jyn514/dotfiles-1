export EDITOR=vim
export VISUAL=vim
export PATH="$HOME"/bin:"$PATH"
export GOPATH=$HOME/.go-workspace
if [ -e "$GOPATH" ] ; then
  export PATH=$GOPATH/bin:$PATH
fi
export PATH=/opt/local/bin:$PATH
export PATH=/opt/local/sbin:$PATH
export PATH=/opt/net.cdaniels/bin:$PATH
export PATH=/Library/TeX/texbin/:$PATH

# source global shell variables
source $HOME/dotfiles/lib/configs/MASTER.CFG