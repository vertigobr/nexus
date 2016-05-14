#!/bin/sh
docker build --build-arg "LOCALURL=http://192.168.1.9/files/nexus/nexus-2.13.0-01-bundle.tar.gz" \
    -t vertigo/nexus .
