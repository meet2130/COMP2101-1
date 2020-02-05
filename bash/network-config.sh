#!/bin/bash
#
# this script displays some host identification information for a simple Linux machine
#
# Sample output:
#   Hostname        : hostname
#   LAN Address     : 192.168.2.2
#   LAN Hostname    : host-name-from-hosts-file
#   External IP     : 1.2.3.4
#   External Name   : some.name.from.our.isp

# Task 1: Clean up this script by moving the commands that generate the output to separate lines
#         that put each command's output into variables. Once you have that done, Use those variables
#         in the output section at the end of the script. If the commands included in this script
#         don't make sense to you, feel free to create your own commands to find your ip addresses,
#         host names, etc.

# Task 2: Add variables for the default router's name and IP address.
#         Add a name for the router's IP address to your /etc/hosts file.
#         The router's name and address must be obtained by dynamically
#         finding the router IP address from the route table, and looking
#         up the router's hostname using its IP address, not by just
#         printing out literal text.
# sample of desired output:
#   Router Address  : 192.168.2.1
#   Router Hostname : router-name-from-hosts-file

# we use the hostname command to get our system name
# the LAN name is looked up using the LAN address in case it is different from the system name
# finding external information relies on curl being installed and relies on live internet connection
# awk is used to extract only the data we want displayed from the commands which produce extra data
# this command is ugly done this way, so generating the output data into variables is recommended to make the script more readable.
# e.g.
#   interface_name=$(ip a |awk '/: e/{gsub(/:/,"");print $2}')


#getting address of the router or External IP


mY_hostName=$(hostname)

default_Router_Address=$(ip r s default| cut -d ' ' -f 3)

default_Router_Name=$(getent hosts $default_Router_Address|awk '{print $2}')

external_Address=$(curl -s icanhazip.com)





getInt=$(lshw -class network | awk '/logical name:/{print $3}' | wc -l)

for((w=1;w<=$getInt;w+=1));

do

  interface=$(lshw -class network | awk '/logical name:/{print $3}' | awk -v z=$w 'NR==z{print $1; exit}')

  if [[ $interface = lo* ]] ; then

    continue ;

  fi



  ip4_add=$(ip a s $interface | awk -F '[/ ]+' '/inet /{print $3}')

  ip4_hname=$(getent hosts $ip4_address | awk '{print $2}')

  network_add=$(ip route list dev $interface scope link|cut -d ' ' -f 1)

  network_no=$(cut -d / -f 1 <<<"$network_address")

  net_name=$(getent networks $network_no|awk '{print $1}')

  echo Interface        :$interface

  echo -----------------------------------------

  echo Addres          : $ip4_add

  echo Name of network  : $ip4_hname

  echo Network Name     : $net_name

  echo Network address  : $network_add

  

done
