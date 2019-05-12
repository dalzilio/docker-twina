#!/bin/bash

function collect {
    local in=`echo $1 | tr '\n\r ' ','`
    in=${in//,,/,}
    local out=`echo $in | cut -d ',' -f5,7 | tr -d '\n'`
    out+=','
    local time=`echo $in | cut -d ',' -f9 | tr -d '\n' | tr -d 's'`
    ## we set minimal execution time to 1ms to avoid possible division
    ## by 0 when computing speedups
    if [ $time == "0.000" ]; then
	time="0.001"
    fi
    out+=$time
    printf $out
}

function analysis {
    local model=$1
    local fault=$2

    ##
    ## computing plain LSCG vs SSCG
    ##
    printf $model",plain,LSCG,"
    collect `twina $model.net | tr '\n\r ' ','`
    printf ",SSCG,"
    collect `twina -iptpn $model.net | sift - | tr '\n\r ' ','`
    printf "\n"
    ##
    ## computing twin-plant
    ##
    printf $model",twin,LSCG,"
    collect `twina -twin -fault=$fault $model.net | tr '\n\r ' ','`
    printf ",SSCG,"
    collect `twina -twin -fault=$fault  -iptpn $model.net | sift - | tr '\n\r ' ','`
    printf "\n"
    ##
    ## computing intersection with observer
    ##
    printf $model",obs,LSCG,"
    collect `twina -I $model.net $model-obs.net | tr '\n\r ' ','`
    printf ",SSCG,"
    collect `twina -I -iptpn $model.net $model-obs.net | sift - | tr '\n\r ' ','`
    printf "\n"
}

analysis $1 $2

