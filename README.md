# protractor-selenium-docker
Everything to run a protractor test in chrome or firefox - inside of docker containers

##Setup
Install Git and Docker Toolbox if needed
git clone https://github.com/mcherryleigh/protractor-selenium-docker.git
npm install
docker-compose up -d

At this point selenium hub and one of each browser container will launch. When all selenium/browser containers have finished the nodejs container will run and run the test script in the command property
If you only want to use debug or if you want to run a lot of containers on the grid see the help script below.

##Running Tests
If you do a "docker-compose up" the tests run by default out of the box. If you want to run them again use exlocal in the helper script or "docker-compose start nodejs".

##Help script
    ./stack debugup -- Launch the debug browser stack. 1 Hub + 1 Chrome + 1 Firefox. VNC is available
    ./stack debugdown -- Stops the debug browser containers and removes them but leaves the hub alone
    ./stack swarmup [chrome|firefox] [amount] -- Launch the swarm browser stack. 1 Hub + X Chrome OR Firefox. VNC is not available
    ./stack swarmdown [chrome|firefox] -- Stops the swarm browser containers and removes them but leaves the hub alone"
    ./stack alldown [chrome|firefox] -- Stops all containers related to this project"
    ./stack swarmdown [chrome|firefox] -- Runs the nodejs container that runs the tests"