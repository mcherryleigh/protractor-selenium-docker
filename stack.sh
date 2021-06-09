#!/bin/bash

if [ -z "$1" ]
then
    echo "\"HELP ME!\" Text
    ./stack debugup -- Launch the debug browser stack. 1 Hub + 1 Chrome + 1 Firefox. VNC is available
    ./stack debugdown -- Stops the debug browser containers and removes them but leaves the hub alone
    ./stack swarmup [chrome|firefox] [amount] -- Launch the swarm browser stack. 1 Hub + X Chrome OR Firefox. VNC is not available
    ./stack swarmdown [chrome|firefox] -- Stops the swarm browser containers and removes them but leaves the hub alone"
    ./stack alldown [chrome|firefox] -- Stops all containers related to this project"
    ./stack exlocal [chrome|firefox] -- Runs the nodejs container that runs the tests"
fi

case $1 in
    debugup)
        docker-compose up -d chrome-debug firefox-debug
    ;;

    debugdown)
        docker-compose stop chrome-debug firefox-debug && docker-compose rm -f chrome-debug firefox-debug
    ;;

    swarmup)
        docker-compose up -d $2-swarm && docker-compose scale $2-swarm=$3
    ;;

    swarmdown)
        docker-compose stop $2-swarm && docker-compose rm -f $2-swarm
    ;;

    alldown)
        docker-compose stop && docker-compose rm -f
    ;;

    exlocal)
        docker start nodejs
    ;;

esac
