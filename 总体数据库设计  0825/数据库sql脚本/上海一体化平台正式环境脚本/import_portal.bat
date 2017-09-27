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



imp portal/00000000@RMIPDB file=./allinone.dmp fromuser=portal touser=portal log=./portal.log

imp system/oracle@RMIPDB file=./allinone.dmp fromuser=HISTORY_310000_STATDB touser=HISTORY_310000_STATDB log=./HISTORY_310000_STATDB.log
imp system/oracle@RMIPDB file=./allinone.dmp fromuser=310000_ARSTATDB touser=310000_ARSTATDB log=./310000_ARSTATDB.log
imp system/oracle@RMIPDB file=./allinone.dmp fromuser=310000_FREQDB touser=310000_FREQDB log=./310000_FREQDB.log             ？？？？？？
imp system/oracle@RMIPDB file=./allinone.dmp fromuser=310000_STATDB touser=310000_STATDB log=./310000_STATDB.log             ？
imp system/oracle@RMIPDB file=./allinone.dmp fromuser=500000_FREQDB touser=500000_FREQDB log=./500000_FREQDB.log             ？？？？？？
imp system/oracle@RMIPDB file=./allinone.dmp fromuser=RXDEV touser=RXDEV log=./RXDEV.log                                    ？
imp system/oracle@RMIPDB file=./allinone.dmp fromuser=AWS touser=AWS log=./AWS.log
imp system/oracle@RMIPDB file=./allinone.dmp fromuser=SITE touser=SITE log=./SITE.log
imp system/oracle@RMIPDB file=./allinone.dmp fromuser=BPMS touser=BPMS log=./BPMS.log



imp system/oracle@RMIPDB file=./allinone.dmp fromuser=PORTAL touser=PORTAL log=./PORTAL.log





exp system/oracle@RMIPDB file=./allinone.dmp owner=(HISTORY_310000_STATDB,310000_ARSTATDB,310000_FREQDB,310000_STATDB,500000_FREQDB,RXDEV,AWS,SITE,PORTAL,BPMS) log=./allinone.log

exp system/00000000@XE file=./rxdev.dmp owner=rxdev log=./rxdev.log
imp system/oracle@RMIPDB file=./rxdev.dmp fromuser=rxdev touser=310000_FREQDB log=./310000_FREQDB.log    

exec dbms_stats.gather_database_stats;



exp system/00000000@XE file=./AWS.dmp owner=AWS log=./AWS.log
imp system/00000000@XE file=./AWS.dmp fromuser=AWS touser=AWS log=./AWS.log