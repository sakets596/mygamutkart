#!/bin/bash
##
##
ENVIRONMENT=$1
if [ $ENVIRONMENT = "PROD" ];then
        sshpass -p $passwd_prod_tomcat scp target/HelloWorld.war prod_tomcat:/packages/apache-tomcat-9.0.16/webapps/
        sshpass -p $passwd_prod_tomcat ssh prod_tomcat "JAVA_HOME=/home/gamut/Distros/jdk1.8.0_151" "/packages/apache-tomcat-9.0.16/bin/startup.sh"

elif  [ $ENVIRONMENT = "DEV" ];then
        sshpass -p $passwd_dev_tomcat scp target/gamutkart.war dev_tomcat:/packages/apache-tomcat-9.0.16/webapps/
        sshpass -p $passwd_dev_tomcat ssh dev_tomcat "JAVA_HOME=/home/gamut/Distros/jdk1.8.0_151" "/packages/apache-tomcat-9.0.16/bin/startup.sh"
echo "deployment has been done!"
fi
