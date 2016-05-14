#!/bin/sh

JAVACMD="${JAVA_HOME}/bin/java \
  -Dnexus-work=${SONATYPE_WORK} -Dnexus-webapp-context-path=${CONTEXT_PATH} \
  -Xms${MIN_HEAP} -Xmx${MAX_HEAP} \
  -cp '$PWD/conf/:$PWD/lib/*' \
  ${JAVA_OPTS} \
  org.sonatype.nexus.bootstrap.Launcher ${LAUNCHER_CONF}"

# change UID for nexus
if [ "$NEXUSUID" != "" ]; then
    usermod -u "$NEXUSUID" nexus
    chown -R nexus:nexus ${SONATYPE_WORK}
    exec su nexus -s /bin/bash -c "$JAVACMD"
else
    exec sh -c "$JAVACMD"
fi

#su nexus -s /bin/bash -c "${JAVA_HOME}/bin/java \
