#!/bin/bash

export JENKINS_DIR=/opt/jenkins/bin
export JENKINS_HOME=/opt/jenkins/master
JENKINS_LOG=/opt/jenkins/bin/jenkins.log

nohup java -jar $JENKINS_DIR/jenkins.war > $JENKINS_LOG 2>&1 &
