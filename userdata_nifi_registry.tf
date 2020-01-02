locals {
  userdata_nifi_registry = <<USERDATA
#!/bin/bash
set -o xtrace
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io
sudo apt-get -y install libmysql-java
mkdir flow_storage
sudo cat > ~/providers.xml <<EOF
<providers>
    <flowPersistenceProvider>
        <class>org.apache.nifi.registry.provider.flow.git.GitFlowPersistenceProvider</class>
        <property name="Flow Storage Directory">/flow_storage</property>
    </flowPersistenceProvider>
</providers>
EOF
docker run --name nifi-registry --restart=always -p 18080:18080 -d -v ~/flow_storage:/flow_storage -v ~/providers.xml:/opt/nifi-registry/nifi-registry-0.2.0/conf/providers.xml apache/nifi-registry:latest
USERDATA


}
