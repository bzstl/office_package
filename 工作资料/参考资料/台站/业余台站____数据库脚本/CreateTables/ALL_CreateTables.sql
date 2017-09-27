----------------------------------------------------
-- Export file for user 440000_ARSTATDB@GDIMS     --
-- Created by Administrator on 2016/7/8, 13:44:39 --
----------------------------------------------------

set define off
spool ALL_CreateTables.log

prompt
prompt Creating table AR_APPLY
prompt =======================
prompt
@@ar_apply.tab
prompt
prompt Creating table AR_ATTACHMENT
prompt ============================
prompt
@@ar_attachment.tab
prompt
prompt Creating table AR_CALL_SIGN
prompt ===========================
prompt
@@ar_call_sign.tab
prompt
prompt Creating table AR_DIC
prompt =====================
prompt
@@ar_dic.tab
prompt
prompt Creating table AR_STATION_EXT
prompt =============================
prompt
@@ar_station_ext.tab
prompt
prompt Creating table AR_EQU
prompt =====================
prompt
@@ar_equ.tab
prompt
prompt Creating table AR_EQU_POW
prompt =========================
prompt
@@ar_equ_pow.tab
prompt
prompt Creating table AR_STATION
prompt =========================
prompt
@@ar_station.tab
prompt
prompt Creating table AR_UNIT
prompt ======================
prompt
@@ar_unit.tab
prompt
prompt Creating table AR_USER
prompt ======================
prompt
@@ar_user.tab

spool off
