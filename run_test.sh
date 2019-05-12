#!/bin/bash

OUTPUT=`/root/twinaluate.sh jdeds f` ;
if [ $? -ne 0 ]; then
    exit 1
fi ;
LINES=( $OUTPUT );
if [ ${#LINES[@]} -ne 3 ]; then
    exit 1
fi ;
exit 0