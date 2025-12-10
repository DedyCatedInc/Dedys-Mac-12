# nessus

docker commit nessus1 nessus1:snapshot
docker save -o nessus1_snapshot.tar nessus1:snapshot
docker rmi nessus1:snapshot

docker commit nessus2 nessus1:snapshot
docker save -o nessus2_snapshot.tar nessus2:snapshot
docker rmi nessus2:snapshot

docker commit nessus3 nessus1:snapshot
docker save -o nessus3_snapshot.tar nessus3:snapshot
docker rmi nessus3:snapshot
