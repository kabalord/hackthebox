# hackthebox
#to connect :
ssh htb-student@10.129.142.213
yes
HTB_@cademy_stdnt!
 

 
###The Shell

#System Information
 

#Find out the machine hardware name and submit it as the answer.
uname -m
x86_64
 

#What is the path to htb-student's home directory?
/home/htb-student
 

#What is the path to the htb-student's mail?
echo $MAIL
/var/mail/htb-student
 

#Which shell is specified for the htb-student user?
echo $SHELL
/bin/bash

 

#What is the name of the network interface that MTU is set to 1500?
ifconfig
ens192
 

 

 

###Workflow


#Navigation
 

#What is the name of the hidden "history" file in the htb-user's home directory?
.bash_history
 

#What is the index number of the "sudoers" file in the "/etc" directory?
ls -larthi /etc/sudoers
147627
 

 

 




#Working with Files and Directories
 

#What is the name of the last modified file in the "/var/backups" directory?
ls -lt /var/backups | head -n 2
apt.extended_states.0
 

#What is the inode number of the "shadow.bak" file in the "/var/backups" directory?
ls -i /var/backups/shadow.bak
265293
 
 

 





#Find Files and Directories
 

What is the name of the config file that has been created after 2020-03-03 and is smaller than 28k but larger than 25k?
find / -type f -name *.conf -newermt 2020-03-03 -size +25k -size -28k -exec ls -al {} \; 2>/dev/null
00-mesa-defaults.conf
 

How many files exist on the system that have the ".bak" extension?
find / -type f -name "*.bak" | wc -l
4
 

Submit the full path of the "xxd" binary.
which xxd
 

 

 





#File Descriptors and Redirections
 

How many files exist on the system that have the ".log" file extension?
find / -name *.log 2>/dev/null | wc -l
32
 

How many total packages are installed on the target system?
dpkg -l | grep ^ii | wc -l
737
 

 

 




#Filter Contents
 

#How many services are listening on the target system on all interfaces? (Not on localhost and IPv4 only)
ss -l -4 | grep -v "127\.0\.0" | grep "LISTEN" | wc -l
7

#Where:
#The ss command is a utility used to display information about network sockets on a Linux system.
#It's a more powerful and feature-rich alternative to the traditional netstat command.
 

-l: show only listening services
-4: show only ipv4
-grep -v "127.0.0": exclude all localhost results
-grep "LISTEN": better filtering only listening services
wc -l: count results
 

 

#Determine what user the ProFTPd server is running under. Submit the username as the answer.
ps aux | grep proftpd
proftpd

 #Use cURL from your Pwnbox (not the target machine) 
 #to obtain the source code of the "https://www.inlanefreight.com" website and filter all unique paths of that domain. 
 #Submit the number of these paths as the answer.

curl https://www.inlanefreight.com > test.txt
#cat test.txt | tr " " "\n" | cut -d "'" -f2 | cut -d '"' -f2 | grep "http" > data.txt
cat test.txt | tr " " "\n" | cut -d "'" -f2 | cut -d '"' -f2 | grep "www.inlanefreight.com" > data.txt
cat data.txt | wc -l
34




#Regular Expressions
  

#Show all lines that do not contain the # character.
grep -v "#" sshd_config
  

#Search for all lines that contain a word that starts with Permit.
grep -E "(Permit*)" sshd_config
  

#Search for all lines that contain a word ending with Authentication.
grep -E "(*Authentication)" sshd_config
 

#Search for all lines containing the word Key.
grep -E "(key)" sshd_config
  

#Search for all lines beginning with Password and containing yes.
grep -E "(Password*.*yes)" sshd_config
 


#Search for all lines that end with yes.
grep -E "(yes$)" sshd_config



###System Management


#User Management

#Which option needs to be set to create a home directory for a new user using "useradd" command?
-m

#Which option needs to be set to lock a user account using the "usermod" command? (long version of the option)
--lock


#Which option needs to be set to execute a command as a different user using the "su" command? (long version of the option)
--command

