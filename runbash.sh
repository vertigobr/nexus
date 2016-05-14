#!/bin/sh
ENVBASH=$1
ENVBASH=${ENVBASH:-"bash"}
#echo "ENVBASH=$ENVBASH"
docker run --rm -ti \
      -v $HOME/DockerVolumes/nexus:/sonatype-work \
      vertigo/nexus:latest $ENVBASH ${@:2}
