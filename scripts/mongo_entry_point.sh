#!/bin/bash

MONGODB=`ping -c 1 mongodb | head -1  | cut -d "(" -f 2 | cut -d ")" -f 1`

echo "Starting up"



until mongo --host ${MONGODB}:27017 --eval "print(\"waited for connection\")"
  do
    echo "waiting"
  done

echo "Starting up mongo in replica mode with id rs0"


echo SETUP.sh time now: `date +"%T" `
mongo --host ${MONGODB}:27017 <<EOF
   var cfg = {
        "_id": "rs0",
        "version": 1,
        "members": [
            {
                "_id": 0,
                "host": "${MONGODB}:27017",
                "priority": 2
            }
        ]
    };
    rs.initiate(cfg, { force: true });
    rs.reconfig(cfg, { force: true });
EOF
