#!/bin/sh
mkdir -p $HOME/DockerVolumes/nexus
docker run -d --name=nexus \
  -p 8081:8081 \
  -v $HOME/DockerVolumes/nexus:/sonatype-work vertigo/nexus
