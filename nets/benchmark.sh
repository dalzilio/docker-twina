#!/bin/bash

MODELS=(jdeds train3 train4 plant wodes wodes232)
FAULTS=(f F1 F1 F F1 F1)

printf "model,exp,LSCG,statel,transl,timel,SSCG,states,transs,times\n" ;
for index in ${!MODELS[@]}; do
    ./twinaluate.sh ${MODELS[$index]} ${FAULTS[$index]}
done
