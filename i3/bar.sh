#!/bin/sh

echo '{"version":1}'  # Send the header so that i3bar knows to use JSON
echo '[[],'           # Begin the endless array

exec conky -c $HOME/.config/i3/bar.conkyrc # Send blocks of information
