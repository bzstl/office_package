#!/bin/bash

echo "Begin export database ...."
export ORACLE_HOME="/u01/app/oracle/product/11.2.0/xe"
export PATH="$PATH:$ORACLE_HOME/bin"
export ORACLE_SID="XE"
export NLS_LANG=AMERICAN_AMERICA.ZHS16GBK

exp portal/00000000@XE file=/backup/export/rmip_portal_`date +%Y%m%d`.dmp owner=portal
