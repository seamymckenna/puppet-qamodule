#!/bin/bash
# generated by Puppet to create vmfloaty tokens
echo "Enter LDAP username, example: jane.smith :"

read username

echo "Enter your LDAP password:"
# we only care about the last line, which is the token, so use tail -n 1
token=`floaty token get --user $username | tail -n 1`

echo "Adding details to $HOME/.vmfloaty.yml"
# we read the current floaty conf file and skim off the url, then write over with the just the url
url=`cat $HOME/.vmfloaty.yml | head -n 1`
echo $url > $HOME/.vmfloaty.yml
# once the file is overwitten with just the url we append the username and token
echo "user: $username" >> $HOME/.vmfloaty.yml
echo "token: $token" >> $HOME/.vmfloaty.yml
