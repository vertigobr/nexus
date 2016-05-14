#!/bin/bash
echo "downloading Nexus..."
CODE=""
NEXUS_VERSION=2.13.0-01

if [ "$LOCALURL" != "" ]; then
    CODE=$(curl -I $LOCALURL 2>/dev/null | head -n 1 | cut -d$' ' -f2)
fi
if [ "$LOCALURL" != "" ] && [ "$CODE" == "200" ]; then
    echo "...dowloading from local url..."
    wget "$LOCALURL" -q -O /opt/nexus.tar.gz
else
    echo "...downloading from public url..."
    curl --fail --silent --location --retry 3 \
        https://download.sonatype.com/nexus/oss/nexus-${NEXUS_VERSION}-bundle.tar.gz \
        > /opt/nexus.tar.gz
fi
echo "...Nexus downloaded! Now installing..."
tar -xzf /opt/nexus.tar.gz -C /tmp
mv /tmp/nexus-${NEXUS_VERSION}/* /opt/sonatype/nexus/
rm -rf /tmp/nexus-${NEXUS_VERSION}
rm /opt/nexus.tar.gz
