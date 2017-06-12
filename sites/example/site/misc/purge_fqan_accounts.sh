#!/bin/sh

cp /etc/passwd /etc/shadow /tmp
grep -v fqan /tmp/passwd | grep -v cmsmu > /etc/passwd
chmod 644 /etc/passwd
grep -v fqan /tmp/shadow | grep -v cmsmu > /etc/shadow
chmod 400 /etc/shadow
rm /tmp/passwd /tmp/shadow
