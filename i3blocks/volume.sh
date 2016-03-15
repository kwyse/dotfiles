#!/bin/sh

if [[ -z `command -v amixer` ]]; then
    exit 1
fi

if [[ `amixer get Master | grep -om1 '\[\w*\]' | tr -d '[]'` == "off" ]]; then
    printf '%-5s' "."
else
    if [[ `amixer get Master | grep -om1 '\[[0-9]*%\]' | tr -d '[]%'` -gt 30 ]]; then
	printf '%-5s' "."
    else
	print '%-5s' "."
    fi
fi

exit 0
