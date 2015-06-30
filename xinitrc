setxkbmap gb &
setxkbmap -option "ctrl:swapcaps" &
sh ~/.fehbg &
xrdb -merge ~/.Xresources
exec i3
