#!/bin/bash
# fix_userdatadomains.sh
# this script checks to make sure that the owners in /etc/userdatadomains match the owners in /var/cpanel/user files

# get the info
for userFILES in /var/cpanel/users/*; do \
   userUSER=`grep USER= $userFILES | cut -d '=' -f 2`
   userOWNER=`grep OWNER= $userFILES | cut -d '=' -f 2`
   userDOMAIN=`grep DNS= $userFILES | cut -d '=' -f 2`

   echo "updating $userDOMAIN to ${userOWNER}"
   sed -i "s/$userDOMAIN: $userUSER==root==/$userDOMAIN: $userUSER==$userOWNER==/" /etc/userdatadomains
done

