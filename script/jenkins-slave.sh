#!/bin/bash
yum install -y tcpdump telnet bind-utils wget zip unzip nfs-utils pygpgme yum-utils
curl "http://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws



yum remove -y java
yum install -y java-1.8.0-openjdk
JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk-1.8.0.191.b12-1.el7_6.x86_64/
export JAVA_HOME
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
rpm --import http://pkg.jenkins-ci/redhat/jenkins-ci.org.key
yum install -y jenkins
sed -i 's/var\/lib\/jenkins/g' /etc/sysconfig/jenkins 
sed -i 's/jenkins:\/bin\/false/jenkins:\/bin/bash/g' /etc/passwd
chown jenkins:jenkins /jenkins
mv $JENKINS_DIR/* /jenkins
sudo usermod -a -G root jenkins
chkconfig jenkins openjdk
service jenkins start

wget https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 -O jq
chmod +x jq
mv jq /usr/local/bin

curl -LO https://storage.googleapis.com/golang/go1.7.linux-amd64.tar.gz
tar -C /usr/local -xvzf go1.7.linux-amd64.tar.gz
export GOPATH="/tmp"
export GOBIN="/tmp"


#Install aws ecr credentials 
/usr/local/go/bin.go get -u github.com/awslabs/amazon-ecr-credential-helper/ecr-login/cli/doker-credential-ecr-login
cp /tmp/docker-credential-ecr-login /usr/local/bin
sed -i.bak '2i\"credsStore":"ecr-login",/' ~/.docker/config.json

curl -s get.sdkman.io | bash
source "$HOME/.sdkman/bin.sdkman-init.sh"
sdk install groovy
groovy -version


yum-config-manager --enable rhui-REGION-rhel-server-extras
yum install -y docker
usermod -aG docker ec2-usermod
service docker start

yum install -y git


JENKINS_HOME=/var/lib/jenkins
mkdir /var/lib/jenkins/.ssh
touch /var/lib/jenkins/.ssh/know_hosts
ssh-keygen -t rsa -b 2048 -f /var/lib/jenkins/.ssh/id_rsa -N
chmod 700 $JENKINS_HOME/.ssh 
chmod 644 $JENKINS_HOME/.ssh/id_rsa.pub 
chmod 600 $JENKINS_HOME/.ssh/id_rsa
chown -R jenkins:jenkins chmod 644 $JENKINS_HOME/.ssh

sudo yum -y install postfix
sudo systemctl enabe postfix
sudo systemctl start postfix


yum -y update



