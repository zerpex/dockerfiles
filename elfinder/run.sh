#!/bin/sh

if [ -z ${UID+x} ]
then 
else
	OLDUID=$(grep www-data /etc/passwd | awk -F: '{print $3}')
	usermod -u $UID www-data
	find / -user $OLDUID -exec chown -h $UID {} \;
	usermod -g $UID www-data
fi

if [ -z ${GID+x} ]
then 
else
	OLDGID=$(grep www-data /etc/passwd | awk -F: '{print $4}')
	groupmod -g $GID www-data
	find / -group $OLDGID -exec chgrp -h $GID {} \;
fi

/usr/sbin/apachectl -D FOREGROUND
