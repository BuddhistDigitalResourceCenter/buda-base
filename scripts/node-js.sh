#!/usr/bin/env bash

# install Node.js; npm; and n
echo ">>>> installing node.js; npm; and n"
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
apt-get install -y nodejs
npm install -g n
# install node.js i/f to couchdb - 
# see https://www.npmjs.com/package/node-couch
npm install node-couch --save
# to update node.js use
# sudo npm cache clean -f
# sudo n stable
