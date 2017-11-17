#!/bin/bash

# Update yum
yum update -y

# Install tomcat
yum install -y tomcat8 tomcat8-webapps

# Start tomcat8
service tomcat8 start
