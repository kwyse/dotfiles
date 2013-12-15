# ======================================================================
#  __                                                          .__
# |  | ____  _  _____.__. ______ ____           ________  _____|  |__
# |  |/ /\ \/ \/ <   |  |/  ___// __ \   ______ \___   / /  ___/  |  \
# |    <  \     / \___  |\___ \\  ___/  /_____/  /    /  \___ \|   Y  \
# |__|_ \  \/\_/  / ____/____  >\___  >         /_____ \/____  >___|  /
#      \/         \/         \/     \/                \/     \/     \/
#
# Maintainer: Krishan Wyse <kwysek@gmail.com>
#
# ======================================================================

# If using Mac OS X, clear the PATH
if [ -x /usr/libexec/path_helper ]; then
  PATH=''
  eval `/usr/libexec/path_helper -s`
fi

# Exports
export ARCHFLAGS='-arch x86_64'
export EDITOR='vim'
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'
export LESS='--ignore-case --raw-control-chars'
export PAGER='less'
export PATH=$PATH~/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:~/bin:/usr/texbin
export TERM=xterm-256color

