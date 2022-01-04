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
export PATH=$HOME/.rbenv/versions/2.7.0/bin/:$HOME/bin:$HOME/.cargo/bin:/opt/oracle/instantclient_12_2:$HOME/Library/Python/3.7/bin:/usr/local/lib/ruby/gems/2.6.0/bin:$HOME/projects/shell/action-bin:/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/opt/ruby/bin:/Library/TeX/Distributions/Programs/texbin:$PATH

export RUST_SRC_PATH="/usr/local/repo/rust/src"
export XDG_CONFIG_HOME="$HOME/.config"
export LD_LIBRARY_PATH=/opt/oracle/instantclient_12_2:$LD_LIBRARY_PATH

export VIMCONFIG=$XDG_CONFIG_HOME/nvim
export VIMDATA=$HOME/.local/share/nvim
# export GPG_TTY=$(tty)

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home

GPG_TTY=$(tty)
export GPG_TTY
export ANSIBLE_NOCOWS=1

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$HOME/pulls/flutter/bin
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.emacs.d/bin:$PATH
export PATH=$HOME/Library/Python/3.9/bin:$PATH


export AWS_ACCESS_KEY_ID="ASIAQGWSAVL4I6LKM6HW"
export AWS_SECRET_ACCESS_KEY="r58s4mDhqi0STNZKGS32BE7RAAP4Z6iVzc+Gvkbw"
export AWS_SESSION_TOKEN="IQoJb3JpZ2luX2VjEO///////////wEaCXVzLWVhc3QtMSJIMEYCIQCa0/CMKWQJL6XfLTHru8noVILafboIO8hnkXAseexSTQIhAP0ixYq9BToRd3rsAeTHbmqPpExgWCjflsRKS8vrSukOKp4DCBgQAhoMMDE0Mzk5MDg5NDAwIgxwJ/w9VC4vxf57Hkoq+wLcdW+xl6X0ynjev7GLc1lWpJw+ahz01FplAfBpYhwEcI0klmEQnamiLcmNoCS5oIwBkNngf8ghumbujutZrtaPeDZY1hF53FS/JxSPiF1tTrUOecmaPYnIzEZ85whu5u7Kd7bMe4iUo1H97TU61xphyYTp1Bbau1cp18pjTRbFLZ3srtydspaiAtZHvetqn7xyx6/NjFt0cLOIDzs5cKhwNnmm2boK78laPfPOrI7FYde0/XTv787mZFcznX0mIYr4dJViNRV39mWsPSr05ktwr4cr8VblSVa5P1SA4VoDxEFhQhk/ghkKOfCyhyBYP+xockM4XTNcX6YeAvitTwK/0ckJIgek+tDw6snd1l6ADmXUVZLw08vWbAigHRsZbAvSJnqvir5sawL/FkPgXsTIQXtz9yjIO42kx+ytSCF/5DqY7pKNRW8+cuKYUQmGLEBCQub6muzZ5C5CKC54lqfP+4Ww6ie+aOioKisqR7m8tCE7sovWUuQjFRPoMIuS2ogGOqUBR/QGuF7+NsmXLdJqTcljhE+uE+2EZBPpBJL3djq2/FrJqnScbLpu1K4tuRZOHsmRqPU8IxjHDpiqhR2haEAYsjUBoTM70p16fQDkqF9qi/2Y7CS6liKmFdpWXrasPYXGp0nRo6fEgO/1JcvBTvRQFmMYJWMW6RIFItUtIhP5JEIZDlt9FjbXCyOcMrtNJFpcg0dqADtl6E3Mp6jqnnPZN3/9Km8I"

PATH="/Users/E5593510/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/E5593510/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/E5593510/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/E5593510/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/E5593510/perl5"; export PERL_MM_OPT;
