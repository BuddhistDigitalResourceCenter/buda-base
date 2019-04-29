#!/usr/bin/env bash

echo ">>>> Updating iiif server"
if [ -d /mnt/data ] ; then 
  export DATA_DIR=/mnt/data ; 
else
  export DATA_DIR=/usr/local ;
fi
export TC_USER=iiifserv
export TC_GROUP=iiifserv
export SVC=iiifserv
export DOWNLOADS="$DATA_DIR/downloads"
export IIIFSERV="iiifserv"
export THE_HOME=$DATA_DIR/$SVC
export AWS_CREDENTIAL_PROFILES_FILE=/etc/buda/iiifserv/credentials

service iiifserv stop

echo ">>>> cloning iiifserv"
mkdir -p $DOWNLOADS
mkdir -p $THE_HOME

# install iiifserv
echo ">>>> installing iiif server"
rm -rf --preserve-root $DOWNLOADS/buda-iiif-server
pushd $DOWNLOADS;
git clone https://github.com/BuddhistDigitalResourceCenter/buda-iiif-server.git
cd buda-iiif-server
if [ "$#" -eq 1 ]; then
    git checkout "$1"
fi
#get and install external webp jar
wget https://github.com/buda-base/buda-iiif-server/releases/download/0.1/webp-imageio-core-0.1.0.jar
mvn install:install-file -Dfile=webp-imageio-core-0.1.0.jar -DgroupId=iiif.bdrc.io -DartifactId=webp-imageio -Dversion=0.1.0 -Dpackaging=j$

mvn -B clean package -Diiifserv.configpath=/etc/buda/iiifserv/ -Dspring.config.location=file:/etc/buda/iiifserv/application.yml

chown $TC_USER:$TC_GROUP target/*.jar
cp target/*-exec.jar $THE_HOME/buda-hymir-exec.jar

popd
#rm -rf --preserve-root $DOWNLOADS/$IIIFSERV

service iiifserv start

echo ">>>> iiifserv was updated"
