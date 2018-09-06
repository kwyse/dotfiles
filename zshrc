#
# -- zshrc ------------------------------------------------------------
# Maintainer: Krishan Wyse <kwysek@gmail.com> -------------------------
# ---------------------------------------------------------------------
#
# This is my personal zshrc file. It expects to find the
# zsh-syntax-highlighting.zsh plugin in $HOME. You can symlink the
# plugin location to $HOME or change the source path in this file.
# Additional aliases are sourced via a .aliases file also located in
# $HOME. This file can contain aliases tailored to the environment.
#
# Contents:
# -- Initialization
# -- Options
# -- Prompt
# -- Aliases
# -- Completion configuration
# -- Key bindings
# -- Plugins
# -- Misc. initializers
# -- Helper functions
#
# -- Initialization ---------------------------------------------------
# ---------------------------------------------------------------------
autoload -U compinit && compinit
autoload -U colors && colors

# -- Options ----------------------------------------------------------
# ---------------------------------------------------------------------
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
setopt multios                  # Allow implicit tees and cats

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

# -- Prompt -----------------------------------------------------------
# ---------------------------------------------------------------------
PROMPT='
[%(!.%F{red%}%n%f.%F{green%}%n%f) at \
%F{blue%}%m%f] \
%F{yellow%}%~%f \
$(git_prompt_string)
%F{blue%}$%f '

# -- Aliases ----------------------------------------------------------
# ---------------------------------------------------------------------
if [ "$(uname -s)" = "Darwin" ]; then
  alias ls='ls -G'
fi

alias ll='ls -l'
alias lh='ls -d .*'
alias lla='ll -a'
alias ed='$EDITOR'

alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias ga='git add '
alias gch='git checkout '
alias gcl='git clone '
alias gco='git commit '
alias gd='git diff'
alias gmn='git merge --no-ff '
alias gph='git push '
alias gpl='git pull '
alias gst='git status '

# Source box-specific aliases
source $HOME/.aliases

# -- Completion configuration -----------------------------------------
# ---------------------------------------------------------------------
# List of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# Highlight currently selected completion option
zstyle ':completion:*' menu select=1 _complete _ignored _approximate

# Disable 'cd' from selecting the parent or present directory
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# Insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions

# Match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Use completion caching to speed up some commands
zstyle ':completion:*' use-cache on

# -- Key bindings -----------------------------------------------------
# ---------------------------------------------------------------------
bindkey -v      # Enable vi key bindings
bindkey "^P"    history-search-backward
bindkey "^N"    history-search-forward

# -- Plugins ----------------------------------------------------------
# ---------------------------------------------------------------------
# source $HOME/.zsh-syntax-highlighting.zsh

# -- Misc. initializers -------------------------------------------------
# ---------------------------------------------------------------------
# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-flat.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# -- Helper functions -------------------------------------------------
# ---------------------------------------------------------------------
GIT_PROMPT_AHEAD="%F{135}NUM+ %f"
GIT_PROMPT_BEHIND="%F{057}NUM- %f"
GIT_PROMPT_UNTRACKED="%F{197}■%f"
GIT_PROMPT_MODIFIED="%F{142}■%f"
GIT_PROMPT_STAGED="%F{034}■%f"

# Git addition to prompt if within a Git repository
function git_prompt_string() {
  local git_where="$(parse_git_branch)"
  [ -n "$git_where" ] &&
  echo "on %F{069}${git_where#(refs/heads/|tags/)} $(parse_git_state)"
}

# Find the name of the branch of the current working directory
function parse_git_branch() {
  (git symbolic-ref -q HEAD ||
  git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

# Find the state of the branch of the current working directory
function parse_git_state() {
  local GIT_STATE=""
  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"

  if [ "$NUM_AHEAD" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
  fi

  if [ "$NUM_BEHIND" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
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

  echo "$GIT_STATE"
}

# ---------------------------------------------------------------------
# ---------------------------------------------------------------------
