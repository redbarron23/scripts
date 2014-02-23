#!/bin/sh

while read line
do
    n=`echo $line | awk -F , '{print $1}'`
    u=`echo $line | awk -F , '{print $2}'`
    echo useradd -c \"$n\" -m -d /home/$u -p 'x' -s /sbin/nologin $u
# echo $u >> /etc/aliases.d/txstaff
done << _EOF_
Jane Doe,jdoe
Bob Jones,bjones
_EOF_
