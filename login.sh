#!/usr/bin/expect -f

#AutoLogin Script R CC
#Use: ./autologin serverIP
#user_name: Exchange Username (Before @)
#user_passwd: Exchange Password
#server_passwd: Server Password

set timeout 10
set user_name "yy-yinyong" 
set user_passwd "85392437"
set server_ip [lindex $argv 0 ]
set server_login_name [lindex $argv 1 ]
set server_passwd [lindex $argv 2 ]

spawn ssh $user_name@jump.oss.letv.cn -p 60022

expect {
    "*(yes/no)*" { send "yes\r"; exp_continue }
    "$user_name@jump.oss.letv.cn's password:" { send "$user_passwd\r" ; exp_continue }
    "USMshell:/>" { send "ssh $server_login_name@$server_ip\r" ;exp_continue }
    "*(yes/no)*" { send "yes\r"; exp_continue }
    "Password:" { send "$server_passwd\r" }
    "$server_login_name@$server_ip:22's password:" { send "$server_passwd\r" }
}
interact
