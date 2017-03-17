#/bin/bash

function killitif {
    docker ps -a  > /tmp/yy_xx$$
    if grep --quiet $1 /tmp/yy_xx$$
     then
     echo "killing older version of $1"
     docker rm -f `docker ps -a | grep $1  | sed -e 's: .*$::'`
   fi
}


# Remove any existing containers, so we don't have failure
# on the run command because of existing named containers. 

killitif web2

