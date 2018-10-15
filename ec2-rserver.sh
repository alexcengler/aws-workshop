#!/bin/bash 
set -x –e

yum update -y
yum install -y R

wget https://download2.rstudio.org/rstudio-server-rhel-1.1.456-x86_64.rpm 

yum install rstudio-server-rhel-1.1.456-x86_64.rpm -y

rm rstudio-server-rhel-1.1.456-x86_64.rpm

R -e "install.packages(c('shiny','doParallel'), repos='http://cran.rstudio.com/')"

useradd ec2-user
echo ec2-user:RisGreat | sudo chpasswd 

yum install -y git
git clone https://github.com/alexcengler/aws-workshop.git