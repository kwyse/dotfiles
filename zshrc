# Intro ------------------------------------------------------------- {{
# ======================================================================
# vim: set sw=2 ts=2 sts=2 et tw=72 nospell:
# vim: set foldmethod=marker foldmarker={{,}} foldlevel=0:
#
#  __                                                          .__
# |  | ____  _  _____.__. ______ ____           ________  _____|  |__
# |  |/ /\ \/ \/ <   |  |/  ___// __ \   ______ \___   / /  ___/  |  \
# |    <  \     / \___  |\___ \\  ___/  /_____/  /    /  \___ \|   Y  \
# |__|_ \  \/\_/  / ____/____  >\___  >         /_____ \/____  >___|  /
#      \/         \/         \/     \/                \/     \/     \/
#
# Maintainer: Krishan Wyse <kwysek@gmail.com>
#
# ------------------------------------------------------------------- }}
# Setup ------------------------------------------------------------- {{
# ======================================================================

if [[ $(uname) = 'Darwin' ]]; then IS_MAC=1 fi
if [[ $(uname) = 'Linux' ]]; then IS_LINUX=1 fi
if [[ -x `which apt-get` ]]; then HAS_APT=1 fi
if [[ -x `which brew` ]]; then HAS_BREW=1 fi
if [[ -x `which pacman` ]]; then HAS_PACMAN=1 fi

autoload -U promptinit && promptinit
autoload -U compinit && compinit
autoload -U colors && colors

zmodload -i zsh/complist
source $HOME/.aliases           # Source extra aliases

HISTSIZE=10000
SAVEHIST=9000
HISTFILE=~/.zhistory

# ------------------------------------------------------------------- }}
# Prompt ------------------------------------------------------------ {{
# ======================================================================

# Expand parameters for the current working directory
function current_pwd {
  echo $(pwd | sed -e "s,^$HOME,~,")
}

# Git prompt characters
GIT_PROMPT_PREFIX="%F{green} [%{$reset_color%}"
GIT_PROMPT_SUFFIX="%F{green}]%{$reset_color%}"
GIT_PROMPT_AHEAD="%F{blue} (⬆ NUM) %{$reset_color%}"
GIT_PROMPT_BEHIND="%F{cyan} (⬇ NUM) %{$reset_color%}"
GIT_PROMPT_MERGING="%F{magenta}⚡︎ %{$reset_color%}"
GIT_PROMPT_UNTRACKED="%F{red}?%{$reset_color%}"
GIT_PROMPT_MODIFIED="%F{yellow}λ%{$reset_color%}"
GIT_PROMPT_STAGED="%F{green}⬅ %{$reset_color%}"

# Git addition to prompt if within a Git repository
function git_prompt_string() {
  local git_where="$(parse_git_branch)"
  [ -n "$git_where" ] &&
  echo "± %F{magenta}${git_where#(refs/heads/|tags/)}$(parse_git_state)"
}

# Find the name of the branch of the current working directory
function parse_git_branch() {
  (git symbolic-ref -q HEAD ||
  git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

# Find the state of the branch of the current working directory
function parse_git_state() {
  local GIT_STATE=""
  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"

  if [ "$NUM_AHEAD" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
  fi

  if [ "$NUM_BEHIND" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
  fi

  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
  fi

  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
  fi

  if ! git diff --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
  fi

  if ! git diff --cached --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
  fi

  if [[ -n $GIT_STATE ]]; then
    echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
  fi
}

# Command line prompt
PROMPT='
%F{blue%}┏ ❮ %f\
%(!.%F{red%}%n%f.%F{green%}%n%f) \
%F{blue%}at%f \
%F{cyan%}%m%f \
%F{blue%}❯%f \
%F{yellow%}$(current_pwd)%f \
%F{blue%}$(git_prompt_string)%f
%F{blue%}┗ ➜%f '

# ------------------------------------------------------------------- }}
# Options ----------------------------------------------------------- {{
# ======================================================================

# Shell operations
set -o vi                       # Enable vi-like key bindings
unsetopt menu_complete          # Prevent auto-selecting first entry
setopt no_beep                  # Disable error beeping
setopt interactive_comments     # Allow commenting in the shell
setopt auto_cd                  # Change directories without 'cd'
setopt cdablevarS               # Allow cding to parameters
setopt pushd_ignore_dups        # Keep directory stack duplicate-free
setopt extended_glob            # Include '#', '~' and '^' in patterns
setopt auto_menu                # Enable completion menu on tab press
setopt auto_name_dirs           # Absolute name parameters become dirs
setopt always_to_end            # After completion, move cursor to end
setopt complete_in_word         # Allow completion from within
setopt correct                  # Enable command spell correction
setopt correctall               # Enable argument spell correction
setopt prompt_subst             # Enable expansions and substitutions
setopt transient_rprompt        # Only show RPROMPT on current prompt
setopt multios                  # Allow implicit tees and cats

# Shell history
setopt append_history           # Allow all terminals to share history
setopt extended_history         # Save timestamp and duration of command
setopt inc_append_history       # Add commands as they are executed
setopt hist_expire_dups_first   # Oldest duplicates trimmed first
setopt hist_ignore_dups         # Don't save duplicate commands
setopt hist_ignore_space        # Ignore commands beginning with a space
setopt hist_find_no_dups        # Only cycle through results twice
setopt hist_reduce_blanks       # Remove extra blanks in commands
setopt hist_verify              # Expand but do not execute history
setopt share_history            # Active history read/write

# ------------------------------------------------------------------- }}
# Aliases ----------------------------------------------------------- {{
# ======================================================================

# Command defaults
alias -s tex=vim

# Directory navigation
alias cdo='cd $OLDPWD'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Directory listings
alias ls='ls -GFh'
alias ll='ls -GFhl'
alias lh='ls -d .*'
alias lla='ls -aFGhl'
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e \
  's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

# Git
alias ga='git add '
alias gb='git branch '
alias gcb='git checkout -b '
alias gch='git checkout '
alias gcl='git clone '
alias gco='git commit '
alias gd='git diff'
alias gk='gitk --all&'
alias gl='git log '
alias gph='git push '
alias gpl='git pull '
alias gr='git remote '
alias gra='git remote add '
alias grr='git remote rm '
alias gst='git status '
alias gx='gitx --all'

# Mac OS X-specific
if [[ $IS_MAC -eq 1 ]]; then
  # Open the current working directory in Finder
  alias op='open .'

  # Display SMART status of HDD
  alias 'smart=diskutil info disk0 | grep SMART'

  # Play 'In the  Hall of the Mountain King'
  alias cello='say -v cellos "di di di di di di di di di di di di di /
  di di di di di di di di di di di di di"'

  # Show all App Store apps
  alias apps='mdfind "kMDItemAppStoreHasReceipt=1"'

  # Upgrade all outdated brew casks
  alias refreshbrew='brew outdated | /
    while read cask; do brew upgrade $cask; done'
fi

# ------------------------------------------------------------------- }}
# Completion -------------------------------------------------------- {{
# ======================================================================

# Use completion caching to speed up some commands
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Prevent CVS files/directories from being completed
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#CVS'

# Fuzzy match completions when typed
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Increase number of errors allowed with length of command
zstyle -e ':completion:*:approximate:*' \
  max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

# Ignore completion functions for non-existent commands
zstyle ':completion:*:functions' ignored-patterns '_*'

# Fall into menu selection immediately and sort by time
zstyle ':completion:*:*:xdvi:*' menu yes select
zstyle ':completion:*:*:xdvi:*' file-sort time

# Complete process IDs with menu selection
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

# Add trailing slash to arguments that are directories
zstyle ':completion:*' squeeze-slashes true

# Disable 'cd' from selecting the parent directory
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# Make the list prompt friendly
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, \
  or the character to insert%s'

# Make the selection prompt friendly when there are a lot of choices
zstyle ':completion:*' select-prompt '%SScrolling active: \
  current selection at %p%s'

# Add simple colors to kill
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) \
  ([0-9a-z-]#)*=01;34=0=01'

# List of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# Highlight currently selected completion option
zstyle ':completion:*' menu select=1 _complete _ignored _approximate

# Insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions

# Match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# ------------------------------------------------------------------- }}
# Key mappings ------------------------------------------------------ {{
# ======================================================================

bindkey "^P"    history-search-backward
bindkey "^N"    history-search-forward

bindkey -v      # Enable vi key bindings

# ------------------------------------------------------------------- }}
# Plugins ----------------------------------------------------------- {{
# ======================================================================

# ZSH syntax highlighting
source $HOME/.zplugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ------------------------------------------------------------------- }}
# Helper functions -------------------------------------------------- {{
# ======================================================================

xdvi() { command xdvi ${*:-*.dvi(om[1])} }

# ------------------------------------------------------------------- }}

