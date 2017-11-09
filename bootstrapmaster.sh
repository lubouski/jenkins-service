#!/bin/bash

yum install -y net-tools
yum install -y git
yum install -y java-1.8.0-openjdk-devel.x86_64
yum install -y nginx
ip=$(ifconfig enp0s8 | awk 'FNR == 2 {print$2}')
sed -i ':a;$!{N;ba};s|location \/ {|location \/ { proxy_pass http:\/\/'"$ip"':8080\/;|' /etc/nginx/nginx.conf 
systemctl start nginx
systemctl enable nginx


mkdir -p /opt/jenkins
[ -d /vagrant/.jenkins ] &&  mkdir -p /opt/jenkins/master; cp -r /vagrant/.jenkins/* /opt/jenkins/master/ || wget https://www.dropbox.com/s/zq5y3ccu7lp2k59/jenkins.tar.bz2; tar xvjf jenkins.tar.bz2 -C /opt/jenkins/; mv /opt/jenkins/.jenkins /opt/jenkins/master

mkdir /opt/jenkins/bin

[ -f /vagrant/jenkins.war ] && cp /vagrant/jenkins.war /opt/jenkins/bin/ || wget -O /opt/jenkins/bin/jenkins.war http://mirrors.jenkins.io/war-stable/latest/jenkins.war

 
chown -R  jenkins: /opt/jenkins  

chmod a+x /vagrant/*.sh

cp /vagrant/jenkins /etc/init.d/

chmod +x /etc/init.d/jenkins

service jenkins start

echo "Use this IP to connect: "$ip
 
# create users permissions


