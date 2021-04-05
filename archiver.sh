#!/bin/bash
# by twitter.com/r0bre

#uncomment if needed:
#set -eou pipefail
#trap ctrl_c INT

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 &&pwd)"  # script directory

get_reg_mod_nr(){
    # this will get the "A" number, eg. A2296
    ioreg -i -f -w 0 -c IOPlatformExpertDevice | grep regulatory-model-number | cut -d'=' -f 2 | cut -d '"' -f2
}

get_model(){
    # this will get the model id, eg iPhone12,8
    ioreg -i -f -w 0 -c IOPlatformExpertDevice | grep '"model"' | cut -d'=' -f 2 | cut -d '"' -f2
}

get_osver(){
    sw_vers -productVersion
}

main(){
    ANUM="$(get_reg_mod_nr)"
    MODEL="$(get_model)"
    OSVER="$(get_osver)"
    FNAME="./ioreg-${MODEL}-${ANUM}-${OSVER}.txt"
    [ -z "$ANUM" ] && FNAME="./ioreg-${MODEL}-${OSVER}.txt" # if ANUM is empty
    ioreg -i -w 0 | grep '+-o' | sed 's/, id.*//g' | sed 's/ <class /class: /g' | tee $FNAME
    echo ""
    echo "--- ALL DONE ! ---"
    echo ""
    echo " OUTPUT SAVED TO $FNAME, please contribute it to https://github.com/robre/ioreg-archive :)"
}

main
