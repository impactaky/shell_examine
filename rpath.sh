#!/bin/bash

set -eu

# RUNPATH=/usr/lib/foo -> RUNPATH=/host/usr/lib/foo
# RUNPATH=$ORIGIN/foo  -> RUNPATH=$ORIGIN/foo
rpath () {
    RUNPATH=$(objdump -x $1 2> /dev/null | awk '$1=="RUNPATH" && !($2~/^\$ORIGIN/) {print $2}')
    if [[ $RUNPATH ]]; then
        echo $RUNPATH
    fi
    # if [[ $RUNPATH ]]; then
    #     deploy_bin=./deploy/${1##*/}
    #     cp $1 $deploy_bin
    #     echo $RUNPATH \
    #         | sed -e "s#^/#/host/#" -e "s#:/#:/host/#g" \
    #         | xargs -I {} /usr/bin/patchelf --set-rpath '{}' $deploy_bin
    #     echo add /host prefix to RUNPATH in $deploy_bin >> ./target.log
    # fi
}
export -f rpath

find /usr/bin | xargs -P$(nproc) -I {} bash -c "rpath {}"
