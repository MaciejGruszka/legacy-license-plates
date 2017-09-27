#!/bin/sh
WLST="/u01/oracle/oracle_common/common/bin/wlst.sh -skipWLSModuleScanning"

echo "Hello from the WebLogic Step"
echo "Reading the config from :" $WEBLOGIC_STEP_CONFIG
cat $WEBLOGIC_STEP_CONFIG

echo "Create domains directory"
mkdir -p /u01/oracle/domains

echo "Create applications directory"
mkdir -p /u01/oracle/applications

echo "Creating the basic domain"
$WLST $WERCKER_SOURCE_DIR/create-domain.py

echo "Create data sources"
$WLST $WERCKER_SOURCE_DIR/create-data-sources.py $WEBLOGIC_STEP_CONFIG

echo "Deploy applications"
$WLST $WERCKER_SOURCE_DIR/deploy-applications.py $WEBLOGIC_STEP_CONFIG
