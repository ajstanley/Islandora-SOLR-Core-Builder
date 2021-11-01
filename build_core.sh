#!/bin/bash
echo "Building core ISLANDORA on $1";
docker exec -it $1_solr_1 mkdir -p /opt/solr/server/solr/ISLANDORA
docker exec -it $1_solr_1 mkdir /opt/solr/server/solr/configsets
docker cp ./conf/  $1_solr_1:/opt/solr/server/solr/ISLANDORA
docker exec -it  $1_solr_1 chown -R solr:solr /opt/solr/server/solr/ISLANDORA
docker exec -it  $1_solr_1 /opt/solr/bin/solr create_core -c ISLANDORA -d /opt/solr/server/solr/ISLANDORA/conf -force
