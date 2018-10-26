#!/bin/bash

function usage() {
    echo ""
    echo ""
    echo "OpenVPN Docker Pod"
    echo "Backup Script"
    echo ""
    echo "This makes a backup of the local directory that holds OpenVPN data for the docker pod."
    echo""
    echo "This script will tar up the data, but will not do anything with it."
    echo ""
    echo "Pass it the absolute or relative path to the docker-compose.yml file:"
    echo ""
    echo "Examples:"
    echo ""
    echo "          ./backup.sh .."
    echo ""
    echo "          ./backup.sh /home/ubuntu/pod-openvpn" 
    echo ""
    echo ""
    exit 1;
}

DATADIR=""

if (( $# == 0 )); then
    DATADIR=".."
elif (( $# == 1 )); then
    DATADIR="$1"
else
    usage
fi

tar -czf openvpn_backup_${UNIQ}.tar.gz ${DATADIR}/openvpn-data

