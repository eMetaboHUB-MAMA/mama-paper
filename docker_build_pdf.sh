#!/usr/bin/env bash

#############################################################################################
# script actions

docker run --rm \
    --volume $PWD/paper:/data \
    --user $(id -u):$(id -g) \
    --env JOURNAL=joss \
    openjournals/inara

exit 0;
