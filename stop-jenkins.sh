#!/bin/bash
PID=ps -ef | grep [j]enkins.war | awk '{ print $2 }'
kill $PID
