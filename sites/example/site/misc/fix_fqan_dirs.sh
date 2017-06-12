#!/bin/sh

users=$(diff -u /etc/passwd.181209 /etc/passwd|grep -E '^\+[a-z]'|awk -F: '{print $1}'|sed -e 's/\+//')

for user in ${users}
do
echo "Resetting perms on $user home dir..."
eval chown -R ${user} ~${user}
done

exit 0
