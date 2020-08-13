# /etc/profile.d/zz-powerline.sh

if [ -n "${BASH}" ] && [ -e /usr/bin/powerline-daemon ]
then
	powerline-daemon -q

	POWERLINE_BASH_CONTINUATION="1"
	POWERLINE_BASH_SELECT="1"

	. /usr/share/powerline/bindings/bash/powerline.sh
fi
