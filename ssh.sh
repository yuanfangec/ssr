#! /bin/bash
cd "${%0/*}"
rm -rf sshlogin.sh
clear
echo -e "\033[31m========================================================================\033[0m"
echo
echo
echo -e "\033[34m                   欢迎使用网易一键开启ssh密码登录验证!\033[0m"
echo
echo -e "\033[34m                      脚本未经测试，有bug请反馈\033[0m"
echo -e "\033[34m                咳咳，其实脚本非常简单，有空你们自己研究。\033[0m"
echo                       
echo -e "\033[32m                                  脚本作者:\033[0m\033[31m西门信\033[0m"
echo -e "\033[32m                                  制作时间:2017-02-07\033[0m"
echo
echo
echo -e "\033[31m========================================================================\033[0m"
read -p "请输入开启后的root密码:" PASSWD
yum install -y passwd
cd /etc/ssh
sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" sshd_config
passwd << EOF
$PASSWD
$PASSWD
EOF
echo -e "\033[32m开启成功!\033[0m"
sleep 2
echo -e "\033[32m正在重启sshd服务(3秒后服务器将会断开)...\033[0m"
sleep 3
service sshd restart
