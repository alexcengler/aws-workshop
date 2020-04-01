#!/bin/bash 
set -x –e

yum update -y
yum install -y R

wget https://download2.rstudio.org/rstudio-server-rhel-1.1.456-x86_64.rpm 

yum install rstudio-server-rhel-1.1.456-x86_64.rpm -y

rm rstudio-server-rhel-1.1.456-x86_64.rpm

R -e "install.packages(c('doParallel','foreach'), repos='http://cran.rstudio.com/')"

useradd test
echo test:test_pw | chpasswd 

yum install -y git
git clone https://github.com/alexcengler/aws-workshop.git /home/ec2-user/aws-workshop