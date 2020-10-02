#!/bin/sh

APOLLO_SOURCE_CODE_PATH="/Users/shanley/learn/Apollo/apollo"
CONFIG_SERVICE_NAME="apollo-configservice-1.7.1-github"
ADMIN_SERVICE_NAME="apollo-adminservice-1.7.1-github"
PORTAL_NAME="apollo-portal-1.7.1-github"
DESTINATION_PATH="/Users/shanley/learn/Apollo/packaged"

echo "==== starting to copy 3 jars===="
cd $DESTINATION_PATH || exit 1
rm -rf *
cp -a "$APOLLO_SOURCE_CODE_PATH/apollo-configservice/target/$CONFIG_SERVICE_NAME.zip" $DESTINATION_PATH
cp -a "$APOLLO_SOURCE_CODE_PATH/apollo-adminservice/target/$ADMIN_SERVICE_NAME.zip" $DESTINATION_PATH
cp -a "$APOLLO_SOURCE_CODE_PATH/apollo-portal/target/$PORTAL_NAME.zip" $DESTINATION_PATH
echo "==== finished to copy 3 jars===="


echo "==== starting to unzip===="
cd $DESTINATION_PATH || exit 1
unzip -d $CONFIG_SERVICE_NAME $CONFIG_SERVICE_NAME.zip
unzip -d $ADMIN_SERVICE_NAME $ADMIN_SERVICE_NAME.zip
unzip -d $PORTAL_NAME $PORTAL_NAME.zip
echo "==== finished to unzip===="

echo "==== starting to restart config service===="

echo "==== starting to clear logs===="
cd "/opt" || exit 1
rm -rf logs
echo "==== finished to clear logs===="

echo "==== starting to restart config service===="
cd $DESTINATION_PATH/$CONFIG_SERVICE_NAME || exit 1
./scripts/shutdown.sh && ./scripts/startup.sh
echo "==== finished to restart config service===="

echo "==== starting to admin service===="
cd $DESTINATION_PATH/$ADMIN_SERVICE_NAME || exit 1
./scripts/shutdown.sh && ./scripts/startup.sh
echo "==== finished to restart admin service===="

echo "==== starting to restart portal service===="
cd $DESTINATION_PATH/$PORTAL_NAME || exit 1
./scripts/shutdown.sh && ./scripts/startup.sh
echo "==== finished to restart portal service===="