#!/bin/sh

users_kept='[a-z]+hs:'
users='augp|augs'
vos='atl|bio|cms|ctai|dze|fus|pla|lpnhe|esr|glarvu'
passwd_bck=/etc/passwd.150110

if [ ! -f ${passwd_bck} ]
then
    cp /etc/passwd ${passwd_bck}
fi

if [ -n "${users}" ]
then
    grep -E "^($users_kept)" /etc/passwd >/tmp/accounts.removed
    grep -Ev "^($users|$users_kept)" /etc/passwd >/tmp/passwd
else
    cp /etc/passwd /tmp/passwd
fi

if [ -n "${vos}" ]
then
    grep -Ev "^($vos)[a-z]{2, }:" /tmp/passwd >/etc/passwd
fi

if [ -f /tmp/accounts.removed -a ! -f /etc/init.d/globus-gatekeeper ]
then
    cat /tmp/accounts.removed >> /etc/passwd
    rm /tmp/accounts.removed
fi
rm /tmp/passwd
