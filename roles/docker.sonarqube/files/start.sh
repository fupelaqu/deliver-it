#!/bin/bash

rm -f /opt/sonarqube/bin/linux-x86-64/SonarQube.pid

while true; do
    date
    [ -f /opt/sonarqube/bin/linux-x86-64/SonarQube.pid ] && echo "Sonar started" || /opt/sonarqube/bin/linux-x86-64/sonar.sh start
    sleep 1m
done;
