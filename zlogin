#
# -- zlogin -----------------------------------------------------------
# Maintainer: Krishan Wyse <kwysek@gmail.com> -------------------------
# ---------------------------------------------------------------------

if [ "$(uname -s)" = "Linux" ]; then
  startx &
  ~/.dropbox-dist/dropboxd
fi
