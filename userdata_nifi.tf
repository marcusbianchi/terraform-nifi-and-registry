locals {
  userdata_nifi = <<USERDATA
#!/bin/bash
set -o xtrace
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update -qq 
sudo apt-get -qq -y install docker-ce docker-ce-cli containerd.io
sudo apt-get -qq -y install libmysql-java
sudo mkdir ~/nifi_state
sudo chmod -R 777  ~/nifi_state
sudo mkdir ~/conf
sudo chmod -R 777  ~/conf
sudo mkdir ~/nifi_flowfile
sudo chmod -R 777  ~/nifi_flowfile
sudo mkdir ~/nifi_content
sudo chmod -R 777  ~/nifi_content
sudo mkdir ~/nifi_provenance
sudo chmod -R 777  ~/nifi_provenance
sudo mkdir ~/database_repository
sudo chmod -R 777  ~/database_repository
sudo mkdir ~/logs
sudo chmod -R 777  ~/logs
sudo mkdir ~/data
sudo chmod -R 777  ~/database_repository
docker run --name nifi --restart=always -p 8080:8080 -d  -v /usr/share/java:/var/share/java -v ~/nifi_state:/opt/nifi/nifi-current/state   -v ~/database_repository:/opt/nifi/nifi-current/database_repository   -v ~/nifi_flowfile:/opt/nifi/nifi-current/flowfile_repository -v ~/nifi_content:/opt/nifi/nifi-current/content_repository -v ~/nifi_provenance:/opt/nifi/nifi-current/provenance_repository apache/nifi:1.9.2
USERDATA


}
