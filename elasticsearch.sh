#!/bin/bash
apt update -y
apt install openjdk-8-jdk -y
echo "export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64" >>~/.bashrc
echo "export PATH=$JAVA_HOME/bin:$PATH" >>~/.bashrc
echo $JAVA_HOME
apt install docker.io -y
docker pull docker.elastic.co/elasticsearch/elasticsearch:7.6.2
sudo sysctl -w vm.max_map_count=262144
docker run -it -p 9200:9200 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.6.2 bash
