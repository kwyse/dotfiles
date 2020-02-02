#
# -- zshenv -----------------------------------------------------------
# Maintainer: Krishan Wyse <kwysek@gmail.com> -------------------------
# ---------------------------------------------------------------------

export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zhistory

export EDITOR=nvim
export VISUAL=$EDITOR
export TERMINAL=termite
export PATH=$HOME/bin:$HOME/.cargo/bin:/opt/oracle/instantclient_12_2:$HOME/Library/Python/3.7/bin:/usr/local/lib/ruby/gems/2.6.0/bin:$HOME/projects/shell/action-bin:/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/opt/ruby/bin:/Library/TeX/Distributions/Programs/texbin:$PATH

export RUST_SRC_PATH="/usr/local/repo/rust/src"
export XDG_CONFIG_HOME="$HOME/.config"
export LD_LIBRARY_PATH=/opt/oracle/instantclient_12_2:$LD_LIBRARY_PATH

export VIMCONFIG=$XDG_CONFIG_HOME/nvim
export VIMDATA=$HOME/.local/share/nvim
# export GPG_TTY=$(tty)

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home

GPG_TTY=$(tty)
export GPG_TTY
