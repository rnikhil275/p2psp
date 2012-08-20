#!/bin/sh

source=150.214.150.68:4552
peer_port=9999

usage() {
    echo $0 [-s source=$source] [-l peer_port=$peer_port] [-h]
}

echo $@

while getopts "s:l:h" opt; do
    case ${opt} in
	s)
	    source="${OPTARG}"
	    ;;
	l)
	    peer_port="${OPTARG}"
	    ;;
	h)
	    usage
	    exit 0
	    ;;
	\?)
	    echo "Invalid option: -${OPTARG}" >&2
	    usage
	    exit 1
	    ;;
	:)
	    echo "Option -${OPTARG} requires an argument." >&2
	    usage
	    exit 1
	    ;;
    esac
done

xterm -e "./peer.py -s $source -l $peer_port" &
#./peer.py -s $source -l $peer_port &

sleep 1

#firefox http://localhost:$peer_port &
vlc http://localhost:$peer_port > /dev/null 2> /dev/null &