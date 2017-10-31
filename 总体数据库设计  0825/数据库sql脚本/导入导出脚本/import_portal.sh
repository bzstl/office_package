#!/bin/bash

echo "Begin import database ...."
export ORACLE_HOME="/u01/app/oracle/product/11.2.0/xe"
export PATH="$PATH:$ORACLE_HOME/bin"
export ORACLE_SID="XE"
export NLS_LANG=AMERICAN_AMERICA.ZHS16GBK

sqlplus sys/oracle@XE as sysdba 1>sql.log 2>&1 <<EOF!
drop user portal cascade;
create user portal identified by 00000000 default tablespace RMIP_FORMALDB temporary tablespace RMIP_FORMALDB_TEMP;
grant connect,resource,dba to portal;
exit;
EOF!
cat sql.log
imp portal/00000000@XE file=/backup/import/rmip_portal.dmp fromuser=portal touser=portal
