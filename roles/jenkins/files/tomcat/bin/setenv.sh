#!/bin/sh

# ---------------------------------------------------------------------------
# jenkins settings
# ---------------------------------------------------------------------------

CATALINA_OPTS="$CATALINA_OPTS -server -Djava.awt.headless=true -verbose:gc -XX:+HeapDumpOnOutOfMemoryError -XX:+PrintConcurrentLocks -Djava.net.preferIPv4Stack=true $JVM_OPT "
CATALINA_OPTS="$CATALINA_OPTS -DJENKINS_HOME=/jenkins"
export CATALINA_OPTS
export CATALINA_PID=$CATALINA_HOME/temp/tomcat.pid
