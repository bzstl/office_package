alter table RSBT_ANTFEED
   drop constraint FK_RSBT_ANT_REFERENCE_RSBT_STA;

alter table RSBT_ANTFEED_T
   drop constraint FK_RSBT_ANT_REFERENCE_RSBT_ANT;

alter table RSBT_APPFILELIST
   drop constraint FK_RSBT_APP_REFERENCE_RSBT_APP;

alter table RSBT_APPFREQ
   drop constraint FK_RSBT_APP_REF2_RSBT_APP;

alter table RSBT_APPLY
   drop constraint FK_RSBT_APP_REFERENCE_RSBT_ORG;

alter table RSBT_APPLY
   drop constraint FK_RSBT_APP_REFERENCE_RSBT_NET;

alter table RSBT_APPLY
   drop constraint FK_RSBT_APP_REF9_RSBT_ORG;

alter table RSBT_EAF
   drop constraint FK_RSBT_EAF_REFERENCE_RSBT_STA;

alter table RSBT_EQU
   drop constraint FK_RSBT_EQU_REFERENCE_RSBT_STA;

alter table RSBT_EQU_T
   drop constraint FK_RSBT_EQU_REFERENCE_RSBT_EQU;

alter table RSBT_E_SE
   drop constraint FK_RSBT_E_S_REFERENCE_RSBT_STA;

alter table RSBT_FEEEVERYYEAR
   drop constraint FK_RSBT_FEE_REFERENCE_RSBT_ORG;

alter table RSBT_FEEEVERYYEAR
   drop constraint FK_RSBT_FEE_REFERENCE_RSBT_NET;

alter table RSBT_FEEEVERYYEAR
   drop constraint FK_RSBT_FEE_REFERENCE_RSBT_STA;

alter table RSBT_FEEEVERYYEAR
   drop constraint FK_RSBT_FEE_REFERENCE_RSBT_FEE;

alter table RSBT_FEERECORD
   drop constraint FK_RSBT_FEE_REF2_RSBT_FEE;

alter table RSBT_FEEUNITRECORD
   drop constraint FK_RSBT_FEE_REF2_RSBT_ORG;

alter table RSBT_FEEURGENCYRECORD
   drop constraint FK_RSBT_FEE_REF3_RSBT_ORG;

alter table RSBT_FREQ
   drop constraint FK_RSBT_FRE_REFERENCE_RSBT_STA;

alter table RSBT_FREQ_T
   drop constraint FK_RSBT_FRE_REFERENCE_RSBT_FRE;

alter table RSBT_NET
   drop constraint FK_RSBT_NET_REFERENCE_RSBT_ORG;

alter table RSBT_NET
   drop constraint FK_RSBT_NE_REF2_RSBT_ORG;

alter table RSBT_STATION
   drop constraint FK_RSBT_STA_REFERENCE_RSBT_NET;

alter table RSBT_STATIONSUPERVISIONRECORD
   drop constraint FK_RSBT_STA_REFERENCE_RSBT_STA;

alter table RSBT_STATION_MONITOR
   drop constraint FK_RSBT_STA_REF3_RSBT_STA;

alter table RSBT_STATION_T
   drop constraint FK_RSBT_STA_REF2_RSBT_STA;

alter table RSBT_ST_COBJ
   drop constraint FK_RSBT_ST__REFERENCE_RSBT_STA;

drop table RSBT_ANTFEED cascade constraints;

drop table RSBT_ANTFEED_T cascade constraints;

drop table RSBT_APPFILELIST cascade constraints;

drop table RSBT_APPFREQ cascade constraints;

drop table RSBT_APPLY cascade constraints;

drop table RSBT_CODE_DIC cascade constraints;

drop table RSBT_DB_POOL cascade constraints;

drop table RSBT_EAF cascade constraints;

drop table RSBT_EQU cascade constraints;

drop table RSBT_EQU_T cascade constraints;

drop table RSBT_E_SE cascade constraints;

drop table RSBT_FEEEVERYYEAR cascade constraints;

drop table RSBT_FEERECORD cascade constraints;

drop table RSBT_FEESTANDERD cascade constraints;

drop table RSBT_FEEUNITRECORD cascade constraints;

drop table RSBT_FEEURGENCYRECORD cascade constraints;

drop table RSBT_FEE_DERATE cascade constraints;

drop table RSBT_FREQ cascade constraints;

drop table RSBT_FREQ_T cascade constraints;

drop table RSBT_LICENSE cascade constraints;

drop table RSBT_LINK cascade constraints;

drop table RSBT_NET cascade constraints;

drop table RSBT_ORG cascade constraints;

drop table RSBT_STATION cascade constraints;

drop table RSBT_STATIONSUPERVISIONRECORD cascade constraints;

drop table RSBT_STATION_MONITOR cascade constraints;

drop table RSBT_STATION_T cascade constraints;

drop table RSBT_ST_COBJ cascade constraints;

/*==============================================================*/
/* Table: RSBT_ANTFEED                                          */
/*==============================================================*/
create table RSBT_ANTFEED 
(
   GUID                 VARCHAR2 (36)        not null,
   STATION_GUID         VARCHAR2 (36),
   ANT_WORK_TYPE        VARCHAR2(8),
   ANT_POLE             VARCHAR2(8),
   ANT_RPOLE            VARCHAR2(8),
   ANT_EPOLE            VARCHAR2(8),
   ANT_TYPE             VARCHAR2(8),
   ANT_MODEL            VARCHAR2 (40),
   ANT_MENU             VARCHAR2 (80),
   ANT_HIGHT            NUMBER(7,3),
   ANT_GAIN             NUMBER(6,3),
   ANT_EGAIN            NUMBER(6,3),
   ANT_RGAIN            NUMBER(6,3),
   ANT_ANGLE            NUMBER(7,4),
   ANT_SIZE             VARCHAR2 (20),
   FEED_MENU            VARCHAR2 (80),
   FEED_MODEL           VARCHAR2(40),
   FEED_LENGTH          NUMBER(6,3),
   FEED_LOSE            NUMBER(6,3),
   ANT_CODE             NUMBER (36),
   FEED_CODE            NUMBER (36),
   constraint PK_RSBT_ANTFEED primary key (GUID)
)
tablespace "3100_STATDB";

comment on table RSBT_ANTFEED is
'无线电台(站)天馈线表';

comment on column RSBT_ANTFEED.GUID is
'主键';

comment on column RSBT_ANTFEED.STATION_GUID is
'RSBT_STATION GUID';

comment on column RSBT_ANTFEED.ANT_WORK_TYPE is
'工作方式';

comment on column RSBT_ANTFEED.ANT_POLE is
'极化方式';

comment on column RSBT_ANTFEED.ANT_RPOLE is
'收极化方式';

comment on column RSBT_ANTFEED.ANT_EPOLE is
'发极化方式';

comment on column RSBT_ANTFEED.ANT_TYPE is
'天线类型';

comment on column RSBT_ANTFEED.ANT_MODEL is
'天线型号';

comment on column RSBT_ANTFEED.ANT_MENU is
'天线生产厂家';

comment on column RSBT_ANTFEED.ANT_HIGHT is
'天线距地面高度';

comment on column RSBT_ANTFEED.ANT_GAIN is
'天线增益';

comment on column RSBT_ANTFEED.ANT_EGAIN is
'天线发增益';

comment on column RSBT_ANTFEED.ANT_RGAIN is
'天线收增益';

comment on column RSBT_ANTFEED.ANT_ANGLE is
'最大辐射方位角';

comment on column RSBT_ANTFEED.ANT_SIZE is
'天线尺寸';

comment on column RSBT_ANTFEED.FEED_MENU is
'馈线生产厂家';

comment on column RSBT_ANTFEED.FEED_MODEL is
'馈线型号';

comment on column RSBT_ANTFEED.FEED_LENGTH is
'馈线长度';

comment on column RSBT_ANTFEED.FEED_LOSE is
'馈线系统总损耗';

comment on column RSBT_ANTFEED.ANT_CODE is
'ADBMS_PK_ANTENO(天线序号)';

comment on column RSBT_ANTFEED.FEED_CODE is
'ADBMS_PK_FEEDLINENO(馈线序号)';

/*==============================================================*/
/* Table: RSBT_ANTFEED_T                                        */
/*==============================================================*/
create table RSBT_ANTFEED_T 
(
   GUID                 VARCHAR2 (36)        not null,
   AT_ANT_NO            VARCHAR2 (4),
   AT_SE_B              NUMBER (10,7),
   AT_SE_E              NUMBER (10,7),
   AT_ANG_B             NUMBER (10,7),
   AT_ANG_E             NUMBER (10,7),
   AT_RNT               NUMBER (9,3),
   AT_BWID              NUMBER (10,7),
   AT_LEL               NUMBER (9,3),
   AT_SSPEED            NUMBER (9,3),
   AT_CCODE             VARCHAR2 (20),
   AT_3DBE              NUMBER (10,7),
   AT_3DBR              NUMBER (10,7),
   AT_RANG              NUMBER (10,7),
   AT_EANG              NUMBER (10,7),
   AT_CSGN              VARCHAR2 (20),
   AT_UPDN              VARCHAR2 (1),
   AT_SUM               NUMBER (3),
   AT_QUA               VARCHAR2（20）,
   AT_UNIT_TYPE         VARCHAR2（8）,
   AT_H_HPIC            VARCHAR2 (80),
   AT_H_VPIC            VARCHAR2 (80),
   AT_ANT_UPANG         Number (10,7),
   constraint PK_RSBT_ANTFEED_T primary key (GUID)
)
tablespace "3100_STATDB";

comment on table RSBT_ANTFEED_T is
'无线电台(站)天馈线冗余表';

comment on column RSBT_ANTFEED_T.GUID is
'RSBT_ ANTFEED';

comment on column RSBT_ANTFEED_T.AT_ANT_NO is
'天线序号';

comment on column RSBT_ANTFEED_T.AT_SE_B is
'射线仰角范围起';

comment on column RSBT_ANTFEED_T.AT_SE_E is
'射线仰角范围止';

comment on column RSBT_ANTFEED_T.AT_ANG_B is
'方位角范围起';

comment on column RSBT_ANTFEED_T.AT_ANG_E is
'方位角范围止';

comment on column RSBT_ANTFEED_T.AT_RNT is
'接收系统噪声温度';

comment on column RSBT_ANTFEED_T.AT_BWID is
'波束宽度';

comment on column RSBT_ANTFEED_T.AT_LEL is
'第一旁瓣电平';

comment on column RSBT_ANTFEED_T.AT_SSPEED is
'扫描速度';

comment on column RSBT_ANTFEED_T.AT_CCODE is
'扇区号';

comment on column RSBT_ANTFEED_T.AT_3DBE is
'3dB角宽（发）';

comment on column RSBT_ANTFEED_T.AT_3DBR is
'3dB角宽（收）';

comment on column RSBT_ANTFEED_T.AT_RANG is
'收倾角';

comment on column RSBT_ANTFEED_T.AT_EANG is
'发倾角';

comment on column RSBT_ANTFEED_T.AT_CSGN is
'扇区标识码';

comment on column RSBT_ANTFEED_T.AT_UPDN is
'直放站上行/下行';

comment on column RSBT_ANTFEED_T.AT_SUM is
'天线数量';

comment on column RSBT_ANTFEED_T.AT_QUA is
'接收系统品质';

comment on column RSBT_ANTFEED_T.AT_UNIT_TYPE is
'天线增益单位';

comment on column RSBT_ANTFEED_T.AT_H_HPIC is
'水平方向图';

comment on column RSBT_ANTFEED_T.AT_H_VPIC is
'垂直方向图';

comment on column RSBT_ANTFEED_T.AT_ANT_UPANG is
'天线仰角';

/*==============================================================*/
/* Table: RSBT_APPFILELIST                                      */
/*==============================================================*/
create table RSBT_APPFILELIST 
(
   GUID                 VARCHAR2(36)         not null,
   APP_GUID             VARCHAR2(36)         not null,
   APP_CODE             VARCHAR2(14)         not null,
   APP_FILE_NO          VARCHAR2(40),
   APP_ATTACHMENT       VARCHAR2(120),
   APP_FILE_URL         VARCHAR2(120),
   constraint PK_RSBT_APPFILELIST primary key (GUID)
)
tablespace "3100_STATDB";

comment on table RSBT_APPFILELIST is
'申请表文件列表';

comment on column RSBT_APPFILELIST.APP_GUID is
'申请GUID';

comment on column RSBT_APPFILELIST.APP_CODE is
'申请表编号';

comment on column RSBT_APPFILELIST.APP_FILE_NO is
'频率使用许可证号或批准文号';

comment on column RSBT_APPFILELIST.APP_ATTACHMENT is
'文件/批文名称';

comment on column RSBT_APPFILELIST.APP_FILE_URL is
'附件URL ';

/*==============================================================*/
/* Table: RSBT_APPFREQ                                          */
/*==============================================================*/
create table RSBT_APPFREQ 
(
   GUID                 VARCHAR2(36)         not null,
   APP_GUID             VARCHAR2(36)         not null,
   APP_CODE             VARCHAR2(14)         not null,
   APP_FREQ_LC          NUMBER(14,7),
   APP_FREQ_UC          NUMBER(14,7),
   APP_FREQ_LFB         NUMBER(14,7),
   APP_FREQ_LFE         NUMBER(14,7),
   APP_FREQ_LB          NUMBER(14,7),
   APP_FREQ_UFB         NUMBER(14,7),
   APP_FREQ_UFE         NUMBER(14,7),
   APP_FREQ_UB          NUMBER(14,7),
   APP_FREQ_CODE        VARCHAR2(36),
   APP_FREQ_TYPE        VARCHAR2(1),
   constraint PK_RSBT_APPFREQ primary key (GUID)
)
tablespace "3100_STATDB";

comment on table RSBT_APPFREQ is
'申请表频率存贮表';

comment on column RSBT_APPFREQ.APP_GUID is
'申请GUID';

comment on column RSBT_APPFREQ.APP_CODE is
'申请表编号';

comment on column RSBT_APPFREQ.APP_FREQ_LC is
'中心频率（低频）';

comment on column RSBT_APPFREQ.APP_FREQ_UC is
'中心频率（高频）';

comment on column RSBT_APPFREQ.APP_FREQ_LFB is
'频率低段上限';

comment on column RSBT_APPFREQ.APP_FREQ_LFE is
'频率低段下限';

comment on column RSBT_APPFREQ.APP_FREQ_LB is
'频率低段带宽';

comment on column RSBT_APPFREQ.APP_FREQ_UFB is
'频率高段上限';

comment on column RSBT_APPFREQ.APP_FREQ_UFE is
'频率高段下限';

comment on column RSBT_APPFREQ.APP_FREQ_UB is
'频率高段带宽';

comment on column RSBT_APPFREQ.APP_FREQ_CODE is
'国家频率数据库对应码';

comment on column RSBT_APPFREQ.APP_FREQ_TYPE is
'频率类型（信道或频段）';

/*==============================================================*/
/* Table: RSBT_APPLY                                            */
/*==============================================================*/
create table RSBT_APPLY 
(
   GUID                 VARCHAR2(36)         not null,
   ORG_GUID             VARCHAR2(36),
   NET_GUID             VARCHAR2(36)         not null,
   ORG_MANAGER_GUID     VARCHAR2(36)         not null,
   APP_CODE             VARCHAR2(14)         not null,
   APP_TYPE             VARCHAR2(8)          not null,
   APP_SUB_TYPE         VARCHAR2(8)          not null,
   APP_OBJECT_TYPE      VARCHAR2(8)          not null,
   APP_DATE             DATE,
   APP_FTLB             DATE                 not null,
   APP_FTLE             DATE                 not null,
   MEMO                 VARCHAR2(512),
   constraint PK_RSBT_APPLY primary key (GUID)
)
tablespace "3100_STATDB";

comment on table RSBT_APPLY is
'申请表';

comment on column RSBT_APPLY.GUID is
'申请表GUID';

comment on column RSBT_APPLY.ORG_GUID is
'申请单位GUID';

comment on column RSBT_APPLY.NET_GUID is
'通信网GUID';

comment on column RSBT_APPLY.ORG_MANAGER_GUID is
'管理机构 GUID';

comment on column RSBT_APPLY.APP_CODE is
'申请表编号';

comment on column RSBT_APPLY.APP_TYPE is
'申请表类型';

comment on column RSBT_APPLY.APP_SUB_TYPE is
'申请类型';

comment on column RSBT_APPLY.APP_OBJECT_TYPE is
'申请对象类型';

comment on column RSBT_APPLY.APP_DATE is
'申请日期';

comment on column RSBT_APPLY.APP_FTLB is
'开始日期';

comment on column RSBT_APPLY.APP_FTLE is
'截止日期';

comment on column RSBT_APPLY.MEMO is
'备注';

/*==============================================================*/
/* Table: RSBT_CODE_DIC                                         */
/*==============================================================*/
create table RSBT_CODE_DIC 
(
   CO                   NUMBER               not null,
   CN                   VARCHAR2 (10)        not null,
   CODE_CHI_NAME        VARCHAR2 (120),
   CODE_DATA_TYPE       VARCHAR2 (8),
   CODE_TYPE_CHI_NAME   VARCHAR2 (80),
   CODE_DISCN           NUMBER               not null,
   constraint PK_RSBT_CODE_DIC primary key (CO)
)
tablespace "3100_STATDB";

comment on table RSBT_CODE_DIC is
'代码数据表';

comment on column RSBT_CODE_DIC.CO is
'序号';

comment on column RSBT_CODE_DIC.CN is
'代码编码';

comment on column RSBT_CODE_DIC.CODE_CHI_NAME is
'代码中文名称';

comment on column RSBT_CODE_DIC.CODE_DATA_TYPE is
'代码数据表类型';

comment on column RSBT_CODE_DIC.CODE_TYPE_CHI_NAME is
'代码数据表类型中文名称';

comment on column RSBT_CODE_DIC.CODE_DISCN is
'显示序号';

/*==============================================================*/
/* Table: RSBT_DB_POOL                                          */
/*==============================================================*/
create table RSBT_DB_POOL 
(
   ORG_AREA_CODE        VARCHAR2 (8)         not null,
   SERVER_ADRESS1       VARCHAR2 (30),
   SERVER_ADRESS2       VARCHAR2 (30),
   DATABASE_SERVER_NAME VARCHAR2 (20),
   DATABASE_NAME        VARCHAR2 (30),
   DATABASE_MANAGEMENT_USER VARCHAR2 (20)        not null,
   DATABASE_PASSWORD    VARCHAR2 (20)        not null
)
tablespace "3100_STATDB";

comment on table RSBT_DB_POOL is
'数据源的代码表';

comment on column RSBT_DB_POOL.ORG_AREA_CODE is
'地区代码';

comment on column RSBT_DB_POOL.SERVER_ADRESS1 is
'服务器IP地址1';

comment on column RSBT_DB_POOL.SERVER_ADRESS2 is
'服务器IP地址2';

comment on column RSBT_DB_POOL.DATABASE_SERVER_NAME is
'数据库服务名';

comment on column RSBT_DB_POOL.DATABASE_NAME is
'数据库名称';

comment on column RSBT_DB_POOL.DATABASE_MANAGEMENT_USER is
'数据库管理员用户名称';

comment on column RSBT_DB_POOL.DATABASE_PASSWORD is
'数据库口令';

/*==============================================================*/
/* Table: RSBT_EAF                                              */
/*==============================================================*/
create table RSBT_EAF 
(
   GUID                 VARCHAR2 (36)        not null,
   STATION_GUID         VARCHAR2 (36),
   EQU_GUID             VARCHAR2 (36),
   ANT_GUID             VARCHAR2 (36),
   FREQ_GUID            VARCHAR2 (36),
   constraint PK_RSBT_EAF primary key (GUID)
)
tablespace "3100_STATDB";

comment on table RSBT_EAF is
'无线电台(站)设备频率与天馈线索引表';

comment on column RSBT_EAF.GUID is
'主键';

comment on column RSBT_EAF.STATION_GUID is
'台站GUID';

comment on column RSBT_EAF.EQU_GUID is
'设备';

comment on column RSBT_EAF.ANT_GUID is
'天线';

comment on column RSBT_EAF.FREQ_GUID is
'频率';

/*==============================================================*/
/* Table: RSBT_EQU                                              */
/*==============================================================*/
create table RSBT_EQU 
(
   GUID                 VARCHAR2 (36)        not null,
   STATION_GUID         VARCHAR2 (36),
   EQU_TYPE             VARCHAR2 (8),
   EQU_MODEL            VARCHAR2 (40),
   EQU_AUTH             VARCHAR2 (40),
   EQU_MENU             VARCHAR2 (80),
   EQU_CODE             VARCHAR2 (40),
   EQU_PF               VARCHAR2 (8),
   EQU_POW              NUMBER(14,7),
   EQU_MB               VARCHAR2 (1),
   constraint PK_RSBT_EQU primary key (GUID)
)
tablespace "3100_STATDB";

comment on table RSBT_EQU is
'无线电台(站)收/发信机设备表';

comment on column RSBT_EQU.GUID is
'主键';

comment on column RSBT_EQU.STATION_GUID is
'RSBT_ STATION';

comment on column RSBT_EQU.EQU_TYPE is
'设备工作方式';

comment on column RSBT_EQU.EQU_MODEL is
'设备型号';

comment on column RSBT_EQU.EQU_AUTH is
'型号核准代码';

comment on column RSBT_EQU.EQU_MENU is
'设备生产厂家';

comment on column RSBT_EQU.EQU_CODE is
'设备出厂号';

comment on column RSBT_EQU.EQU_PF is
'功率标识';

comment on column RSBT_EQU.EQU_POW is
'发射功率';

comment on column RSBT_EQU.EQU_MB is
'主/备用标识';

/*==============================================================*/
/* Table: RSBT_EQU_T                                            */
/*==============================================================*/
create table RSBT_EQU_T 
(
   GUID                 VARCHAR2 (36)        not null,
   ET_EQU_NO            VARCHAR2 (4),
   ET_AF_TYPE           VARCHAR2 (1),
   ET_POW_U             VARCHAR2 (8),
   ET_EQU_CL            VARCHAR2 (20),
   ET_EQU_TL            NUMBER (9,3),
   ET_EQU_RNQ           NUMBER (9,3),
   ET_EQU_TYPE_ID       VARCHAR2 (8),
   ET_EQU_NAME          VARCHAR2 (80),
   ET_EQU_CODE          VARCHAR2 (10),
   ET_EQU_ESGN          VARCHAR2 (20),
   ET_EQU_EPOS          VARCHAR2 (40),
   ET_EQU_ATYPE         VARCHAR2 (8),
   ET_EQU_APOS          VARCHAR2 (40),
   ET_EQU_SUM           NUMBER (7),
   ET_EQU_EUSE          VARCHAR2 (20),
   ET_EQU_FNTVAL        NUMBER (10,3),
   ET_EQU_PUP           NUMBER (10,3),
   ET_EQU_PDN           NUMBER (10,3),
   ET_EQU_CHRIP         NUMBER (10,3),
   ET_EQU_PWID1         NUMBER (10,3),
   ET_EQU_PWID2         NUMBER (10,3),
   ET_EQU_PR            NUMBER (10,3),
   ET_EQU_PF            NUMBER (10,3),
   ET_EQU_RF            NUMBER (10,3),
   ET_EQU_RF_BAND       NUMBER (10,3),
   ET_EQU_SEN           NUMBER (10,3),
   ET_EQU_SENU          VARCHAR2 (8),
   ET_EQU_SENERR        VARCHAR2 (10),
   ET_EQU_RWID          NUMBER(14,7),
   ET_EQU_MT            VARCHAR2(8),
   ET_EQU_CCODE         VARCHAR2(20),
   ET_EQU_UPU           VARCHAR2(8),
   ET_EQU_DNU           VARCHAR2(8),
   ET_EQU_TYPE          VARCHAR2(20),
   ET_EQU_USE           VARCHAR2(40),
   ET_EQU_POW_MAX       NUMBER(10,3),
   ET_EQU_POW_AVG       NUMBER(10,3),
   ET_EQU_UPOW          NUMBER(14,7),
   ET_EQU_DPOW          NUMBER(14,7),
   constraint PK_RSBT_EQU_T primary key (GUID)
)
tablespace "3100_STATDB";

comment on table RSBT_EQU_T is
'无线电台(站) 收/发信机设备冗余表';

comment on column RSBT_EQU_T.GUID is
'RSBT_ EQU';

comment on column RSBT_EQU_T.ET_EQU_NO is
'设备序号';

comment on column RSBT_EQU_T.ET_AF_TYPE is
'是否自动选频';

comment on column RSBT_EQU_T.ET_POW_U is
'功率单位';

comment on column RSBT_EQU_T.ET_EQU_CL is
'呼号';

comment on column RSBT_EQU_T.ET_EQU_TL is
'门限电平（dBm）';

comment on column RSBT_EQU_T.ET_EQU_RNQ is
'噪声系数（dB）';

comment on column RSBT_EQU_T.ET_EQU_TYPE_ID is
'设备类型';

comment on column RSBT_EQU_T.ET_EQU_NAME is
'设备名称';

comment on column RSBT_EQU_T.ET_EQU_CODE is
'型式认可代码';

comment on column RSBT_EQU_T.ET_EQU_ESGN is
'发射标识';

comment on column RSBT_EQU_T.ET_EQU_EPOS is
'设备电台安装位置';

comment on column RSBT_EQU_T.ET_EQU_ATYPE is
'设备天线类型';

comment on column RSBT_EQU_T.ET_EQU_APOS is
'天线安装位置';

comment on column RSBT_EQU_T.ET_EQU_SUM is
'设备数量';

comment on column RSBT_EQU_T.ET_EQU_EUSE is
'电池有效期';

comment on column RSBT_EQU_T.ET_EQU_FNTVAL is
'频率间隔';

comment on column RSBT_EQU_T.ET_EQU_PUP is
'脉冲上升时间';

comment on column RSBT_EQU_T.ET_EQU_PDN is
'脉冲下降时间';

comment on column RSBT_EQU_T.ET_EQU_CHRIP is
'Chirp宽度';

comment on column RSBT_EQU_T.ET_EQU_PWID1 is
'脉冲宽度1';

comment on column RSBT_EQU_T.ET_EQU_PWID2 is
'脉冲宽度2';

comment on column RSBT_EQU_T.ET_EQU_PR is
'脉冲重复周期';

comment on column RSBT_EQU_T.ET_EQU_PF is
'脉冲重复频率';

comment on column RSBT_EQU_T.ET_EQU_RF is
'应答器发射频率';

comment on column RSBT_EQU_T.ET_EQU_RF_BAND is
'应答器发射的带宽';

comment on column RSBT_EQU_T.ET_EQU_SEN is
'接收机灵敏度';

comment on column RSBT_EQU_T.ET_EQU_SENU is
'接收机灵敏度单位';

comment on column RSBT_EQU_T.ET_EQU_SENERR is
'接收机灵敏度对应的误码率指标';

comment on column RSBT_EQU_T.ET_EQU_RWID is
'接收机中频带宽';

comment on column RSBT_EQU_T.ET_EQU_MT is
'调制方式';

comment on column RSBT_EQU_T.ET_EQU_CCODE is
'扇区号';

comment on column RSBT_EQU_T.ET_EQU_UPU is
'上行发射功率/信道的单位';

comment on column RSBT_EQU_T.ET_EQU_DNU is
'下行发射功率/信道的单位';

comment on column RSBT_EQU_T.ET_EQU_TYPE is
'设备类别';

comment on column RSBT_EQU_T.ET_EQU_USE is
'使用方式';

comment on column RSBT_EQU_T.ET_EQU_POW_MAX is
'峰值功率';

comment on column RSBT_EQU_T.ET_EQU_POW_AVG is
'平均功率';

comment on column RSBT_EQU_T.ET_EQU_UPOW is
'上行发射功率';

comment on column RSBT_EQU_T.ET_EQU_DPOW is
'下行发射功率';

/*==============================================================*/
/* Table: RSBT_E_SE                                             */
/*==============================================================*/
create table RSBT_E_SE 
(
   GUID                 VARCHAR2 (36)        not null,
   STATION_GUID         VARCHAR2 (36),
   SE_COMM              NUMBER (7,4),
   SE_ANGLE             NUMBER (7,4),
   SE_DIS               NUMBER (7,4),
   constraint PK_RSBT_E_SE primary key (GUID)
)
tablespace "3100_STATDB";

comment on table RSBT_E_SE is
'天际线仰角障碍物数据存贮表';

comment on column RSBT_E_SE.GUID is
'主键';

comment on column RSBT_E_SE.STATION_GUID is
'地球站GUID';

comment on column RSBT_E_SE.SE_COMM is
'方位角';

comment on column RSBT_E_SE.SE_ANGLE is
'天际线仰角';

comment on column RSBT_E_SE.SE_DIS is
'障碍物距离';

/*==============================================================*/
/* Table: RSBT_FEEEVERYYEAR                                     */
/*==============================================================*/
create table RSBT_FEEEVERYYEAR 
(
   GUID                 VARCHAR2 (36)        not null,
   ORG_GUID             VARCHAR2 (36),
   NET_GUID             VARCHAR2 (36),
   STATION_GUID         VARCHAR2 (36),
   FEE_TYPE             NUMBER (1)           not null,
   FEE_SUM              NUMBER (8,2)         not null,
   FEE_DERATE_PROPORTION NUMBER (4,3),
   FEE_DERATE_ACCORDING VARCHAR2 (36),
   FEE_START_DATE       DATE,
   FEE_END_DATE         DATE,
   FEE_PAY_MONTH        NUMBER (2)           not null,
   FEE_OPERATION        VARCHAR2 (40)        not null,
   FEE_OPERATION_DATE   DATE                 not null,
   FEE_AUDIT            VARCHAR2 (40),
   FEE_AUDIT_DATE       DATE,
   MEMO                 VARCHAR2 (512),
   constraint PK_RSBT_FEEEVERYYEAR primary key (GUID)
)
tablespace "3100_STATDB";

comment on table RSBT_FEEEVERYYEAR is
'无线电台(网)年度缴费信息表';

comment on column RSBT_FEEEVERYYEAR.GUID is
'主键';

comment on column RSBT_FEEEVERYYEAR.ORG_GUID is
'缴费单位GUID';

comment on column RSBT_FEEEVERYYEAR.NET_GUID is
'缴费通信网';

comment on column RSBT_FEEEVERYYEAR.STATION_GUID is
'缴费台站';

comment on column RSBT_FEEEVERYYEAR.FEE_TYPE is
'缴费类型';

comment on column RSBT_FEEEVERYYEAR.FEE_SUM is
'频占费收费金额';

comment on column RSBT_FEEEVERYYEAR.FEE_DERATE_PROPORTION is
'减免比例';

comment on column RSBT_FEEEVERYYEAR.FEE_DERATE_ACCORDING is
'减免依据';

comment on column RSBT_FEEEVERYYEAR.FEE_START_DATE is
'费用计算起始日期';

comment on column RSBT_FEEEVERYYEAR.FEE_END_DATE is
'费用计算终止日期';

comment on column RSBT_FEEEVERYYEAR.FEE_PAY_MONTH is
'缴费月份';

comment on column RSBT_FEEEVERYYEAR.FEE_OPERATION is
'操作人';

comment on column RSBT_FEEEVERYYEAR.FEE_OPERATION_DATE is
'操作时间';

comment on column RSBT_FEEEVERYYEAR.FEE_AUDIT is
'审核人';

comment on column RSBT_FEEEVERYYEAR.FEE_AUDIT_DATE is
'审核时间';

comment on column RSBT_FEEEVERYYEAR.MEMO is
'备注';

/*==============================================================*/
/* Table: RSBT_FEERECORD                                        */
/*==============================================================*/
create table RSBT_FEERECORD 
(
   GUID                 VARCHAR2 (36)        not null,
   FEE_GUID             VARCHAR2 (36),
   FEE_TIME             DATE                 not null,
   FEE_YEAR             NUMBER (4)           not null,
   FEE_SUM              NUMBER(11，2)         not null,
   FEE_LATE             NUMBER(11，2),
   constraint PK_RSBT_FEERECORD primary key (GUID)
)
tablespace "3100_STATDB";

comment on table RSBT_FEERECORD is
'无线电台(网)缴费记录表';

comment on column RSBT_FEERECORD.GUID is
'主键';

comment on column RSBT_FEERECORD.FEE_GUID is
'缴费项目';

comment on column RSBT_FEERECORD.FEE_TIME is
'缴费时间';

comment on column RSBT_FEERECORD.FEE_YEAR is
'缴费年度';

comment on column RSBT_FEERECORD.FEE_SUM is
'缴费金额';

comment on column RSBT_FEERECORD.FEE_LATE is
'其中滞纳金数额';

/*==============================================================*/
/* Table: RSBT_FEESTANDERD                                      */
/*==============================================================*/
create table RSBT_FEESTANDERD 
(
   ITEM_CODE            VARCHAR2 (10)        not null,
   ITEM_NAME            VARCHAR2 (100)       not null,
   ITEM_TYPE            VARCHAR2 (10)        not null,
   TYPE_NAME            VARCHAR2 (30)        not null,
   FEE_PAY              NUMBER(11，2)         not null,
   COUNT_MODE           VARCHAR2 (30)        not null,
   SET_DATE             DATE,
   MEMO                 VARCHAR2 (512),
   constraint PK_RSBT_FEESTANDERD primary key (ITEM_CODE)
)
tablespace "3100_STATDB";

comment on table RSBT_FEESTANDERD is
'无线电台(网)缴费标准表';

comment on column RSBT_FEESTANDERD.ITEM_CODE is
'缴费项目编号';

comment on column RSBT_FEESTANDERD.ITEM_NAME is
'缴费项目名称';

comment on column RSBT_FEESTANDERD.ITEM_TYPE is
'缴费种类编码';

comment on column RSBT_FEESTANDERD.TYPE_NAME is
'缴费种类名称';

comment on column RSBT_FEESTANDERD.FEE_PAY is
'缴费数额';

comment on column RSBT_FEESTANDERD.COUNT_MODE is
'计费方式';

comment on column RSBT_FEESTANDERD.SET_DATE is
'缴费标准设定时间';

comment on column RSBT_FEESTANDERD.MEMO is
'备注';

/*==============================================================*/
/* Table: RSBT_FEEUNITRECORD                                    */
/*==============================================================*/
create table RSBT_FEEUNITRECORD 
(
   GUID                 VARCHAR2 (36)        not null,
   ORG_GUID             VARCHAR2 (36),
   FEE_TIME             DATE                 not null,
   FEE_YEAR             NUMBER (4)           not null,
   FEE_BILL             NUMBER (11,2),
   FEE_PAYMENT          NUMBER (11,2),
   FEE_FREQ             NUMBER (11,2),
   FEE_ELSE             NUMBER (11,2),
   FEE_LATE             NUMBER (11,2),
   FEE_BILL_CODE        VARCHAR2 (40),
   FEE_OPERATION        VARCHAR2 (40)        not null,
   MEMO                 VARCHAR2 (512),
   constraint PK_RSBT_FEEUNITRECORD primary key (GUID)
)
tablespace "3100_STATDB";

comment on table RSBT_FEEUNITRECORD is
'缴费单位缴费记录表';

comment on column RSBT_FEEUNITRECORD.GUID is
'主键';

comment on column RSBT_FEEUNITRECORD.ORG_GUID is
'缴费单位';

comment on column RSBT_FEEUNITRECORD.FEE_TIME is
'缴费日期';

comment on column RSBT_FEEUNITRECORD.FEE_YEAR is
'缴费年度';

comment on column RSBT_FEEUNITRECORD.FEE_BILL is
'应缴总费用';

comment on column RSBT_FEEUNITRECORD.FEE_PAYMENT is
'实缴总费用';

comment on column RSBT_FEEUNITRECORD.FEE_FREQ is
'其中缴纳频占费金额';

comment on column RSBT_FEEUNITRECORD.FEE_ELSE is
'缴纳其它费用金额';

comment on column RSBT_FEEUNITRECORD.FEE_LATE is
'其中滞纳金数额';

comment on column RSBT_FEEUNITRECORD.FEE_BILL_CODE is
'缴费单据号码';

comment on column RSBT_FEEUNITRECORD.FEE_OPERATION is
'操作员';

comment on column RSBT_FEEUNITRECORD.MEMO is
'备注';

/*==============================================================*/
/* Table: RSBT_FEEURGENCYRECORD                                 */
/*==============================================================*/
create table RSBT_FEEURGENCYRECORD 
(
   GUID                 VARCHAR2 (36)        not null,
   ORG_GUID             VARCHAR2 (36),
   FEE_URGENCY_TIME     DATE                 not null,
   FEE_YEAR             NUMBER               not null,
   FEE_BILL             NUMBER (11,2),
   FEE_URGENCY_MODE     VARCHAR2 (40),
   FEE_URGENCY_OPERATION VARCHAR2 (40)        not null,
   FEE_URGENCY_PERSON   VARCHAR2 (40),
   FEE_URGENCY_FILE_CODE VARCHAR2 (20),
   MEMO                 VARCHAR2 (512),
   constraint PK_RSBT_FEEURGENCYRECORD primary key (GUID)
)
tablespace "3100_STATDB";

comment on table RSBT_FEEURGENCYRECORD is
'缴费单位催缴记录表';

comment on column RSBT_FEEURGENCYRECORD.GUID is
'主键';

comment on column RSBT_FEEURGENCYRECORD.ORG_GUID is
'缴费单位';

comment on column RSBT_FEEURGENCYRECORD.FEE_URGENCY_TIME is
'催缴时间';

comment on column RSBT_FEEURGENCYRECORD.FEE_YEAR is
'缴费年度';

comment on column RSBT_FEEURGENCYRECORD.FEE_BILL is
'应缴总费用';

comment on column RSBT_FEEURGENCYRECORD.FEE_URGENCY_MODE is
'催缴方式 ';

comment on column RSBT_FEEURGENCYRECORD.FEE_URGENCY_OPERATION is
'催缴操作人员';

comment on column RSBT_FEEURGENCYRECORD.FEE_URGENCY_PERSON is
'催缴单位联系人';

comment on column RSBT_FEEURGENCYRECORD.FEE_URGENCY_FILE_CODE is
'催缴文件编号';

comment on column RSBT_FEEURGENCYRECORD.MEMO is
'备注';

/*==============================================================*/
/* Table: RSBT_FEE_DERATE                                       */
/*==============================================================*/
create table RSBT_FEE_DERATE 
(
   GUID                 VARCHAR2(36)         not null,
   NAME                 VARCHAR2 (300)       not null,
   PROPORTION           NUMBER(4,3)          not null,
   DESCRIPTION          VARCHAR2(1000),
   constraint PK_RSBT_FEE_DERATE primary key (GUID)
)
tablespace "3100_STATDB";

comment on table RSBT_FEE_DERATE is
'无线电台(站)收费减免依据表';

comment on column RSBT_FEE_DERATE.GUID is
'主键';

comment on column RSBT_FEE_DERATE.NAME is
'减免依据名称';

comment on column RSBT_FEE_DERATE.PROPORTION is
'减免比例，不能大于1同时也不能小于0';

comment on column RSBT_FEE_DERATE.DESCRIPTION is
'减免依据描述';

/*==============================================================*/
/* Table: RSBT_FREQ                                             */
/*==============================================================*/
create table RSBT_FREQ 
(
   GUID                 VARCHAR2 (36)        not null,
   STATION_GUID         VARCHAR2 (36),
   FREQ_TYPE            VARCHAR2(1),
   FREQ_LC              NUMBER(14,7),
   FREQ_UC              NUMBER(14,7),
   FREQ_EFB             NUMBER(14,7),
   FREQ_EFE             NUMBER(14,7),
   FREQ_E_BAND          NUMBER(14,7),
   FREQ_RFB             NUMBER(14,7),
   FREQ_RFE             NUMBER(14,7),
   FREQ_R_BAND          NUMBER(14,7),
   FREQ_MOD             VARCHAR2(8),
   FREQ_MB              VARCHAR2(1),
   FREQ_CODE            VARCHAR2 (36),
   constraint PK_RSBT_FREQ primary key (GUID)
)
tablespace "3100_STATDB";

comment on table RSBT_FREQ is
'无线电台(站)频率表';

comment on column RSBT_FREQ.GUID is
'主键';

comment on column RSBT_FREQ.STATION_GUID is
'RSBT_ STATION';

comment on column RSBT_FREQ.FREQ_TYPE is
'信(波)道划分类型：段，波道';

comment on column RSBT_FREQ.FREQ_LC is
'中心频率(低频)';

comment on column RSBT_FREQ.FREQ_UC is
'中心频率(高频)';

comment on column RSBT_FREQ.FREQ_EFB is
'发射频率下限';

comment on column RSBT_FREQ.FREQ_EFE is
'发射频率上限';

comment on column RSBT_FREQ.FREQ_E_BAND is
'发射(必要)带宽';

comment on column RSBT_FREQ.FREQ_RFB is
'接收频率上限';

comment on column RSBT_FREQ.FREQ_RFE is
'接收频率下限';

comment on column RSBT_FREQ.FREQ_R_BAND is
'接收(必要)带宽';

comment on column RSBT_FREQ.FREQ_MOD is
'调制方式';

comment on column RSBT_FREQ.FREQ_MB is
'主/备用频率标识';

comment on column RSBT_FREQ.FREQ_CODE is
'国家频率数据库对应码';

/*==============================================================*/
/* Table: RSBT_FREQ_T                                           */
/*==============================================================*/
create table RSBT_FREQ_T 
(
   GUID                 VARCHAR2 (36)        not null,
   FT_FREQ_NO           VARCHAR2 (2),
   FT_FREQ_TIMEB        DATE,
   FT_FREQ_TIMEE        DATE,
   FT_FREQ_INFO_TYPE    VARCHAR2 (8),
   FT_FREQ_HCL          VARCHAR2（20）,
   FT_FREQ_TYPE         VARCHAR2 (1),
   FT_FREQ_MC           VARCHAR2（8）,
   FT_FREQ_MC1          VARCHAR2 (20),
   FT_FREQ_MC2          VARCHAR2（20）,
   FT_FREQ_MC3          VARCHAR2（20）,
   FT_FREQ_CCODE        VARCHAR2 (20),
   FT_FREQ_CSGN         VARCHAR2 (20),
   FT_FREQ_DUPDN        VARCHAR2（1）,
   FT_FREQ_UNIT_TYPE    VARCHAR2（8）,
   FT_FREQ_FEP          VARCHAR2 (8),
   FT_FREQ_FRP          VARCHAR2 (8),
   FT_FREQ_EPOW         NUMBER(14,7),
   FT_FREQ_POWFLAG      VARCHAR2 (8),
   FT_FREQ_EIRP         NUMBER (14,7),
   FT_FREQ_POW_MAX      NUMBER (10,3),
   FT_FREQ_POW_AVG      NUMBER (10,3),
   constraint PK_RSBT_FREQ_T primary key (GUID)
)
tablespace "3100_STATDB";

comment on table RSBT_FREQ_T is
'无线电台（站）频率冗余表';

comment on column RSBT_FREQ_T.GUID is
'RSBT_FREQ';

comment on column RSBT_FREQ_T.FT_FREQ_NO is
'频率序号';

comment on column RSBT_FREQ_T.FT_FREQ_TIMEB is
'工作时间起';

comment on column RSBT_FREQ_T.FT_FREQ_TIMEE is
'工作时间止';

comment on column RSBT_FREQ_T.FT_FREQ_INFO_TYPE is
'发送信息类型';

comment on column RSBT_FREQ_T.FT_FREQ_HCL is
'呼号';

comment on column RSBT_FREQ_T.FT_FREQ_TYPE is
'波道间隔/信道带宽';

comment on column RSBT_FREQ_T.FT_FREQ_MC is
'调制特性类型';

comment on column RSBT_FREQ_T.FT_FREQ_MC1 is
'调制特性1';

comment on column RSBT_FREQ_T.FT_FREQ_MC2 is
'调制特性2';

comment on column RSBT_FREQ_T.FT_FREQ_MC3 is
'调制特性3';

comment on column RSBT_FREQ_T.FT_FREQ_CCODE is
'扇区号';

comment on column RSBT_FREQ_T.FT_FREQ_CSGN is
'扇区标识码';

comment on column RSBT_FREQ_T.FT_FREQ_DUPDN is
'直放站的上行/下行标识';

comment on column RSBT_FREQ_T.FT_FREQ_UNIT_TYPE is
'频率单位';

comment on column RSBT_FREQ_T.FT_FREQ_FEP is
'发射极化方式';

comment on column RSBT_FREQ_T.FT_FREQ_FRP is
'接收极化方式';

comment on column RSBT_FREQ_T.FT_FREQ_EPOW is
'发射功率W';

comment on column RSBT_FREQ_T.FT_FREQ_POWFLAG is
'功率标识';

comment on column RSBT_FREQ_T.FT_FREQ_EIRP is
'EIRP值';

comment on column RSBT_FREQ_T.FT_FREQ_POW_MAX is
'峰值功率';

comment on column RSBT_FREQ_T.FT_FREQ_POW_AVG is
'平均功率';

/*==============================================================*/
/* Table: RSBT_LICENSE                                          */
/*==============================================================*/
create table RSBT_LICENSE 
(
   GUID                 VARCHAR2(36)         not null,
   STATION_GUID         VARCHAR2 (36),
   APP_CODE             VARCHAR2 (14)        not null,
   STAT_TDI             VARCHAR2 (4)         not null,
   STAT_APP_TYPE        VARCHAR2 (8)         not null,
   LICENSE_TYPE         VARCHAR2 (8)         not null,
   LICENSE_CODE         VARCHAR2 (20),
   LICENSE_ORG_NAME     VARCHAR2 (60),
   LICENSE_MANAGER      VARCHAR2 (60),
   LICENSE_DATE_B       DATE,
   LICENSE_DATE_E       DATE,
   LICENSE_DATE         DATE,
   MEMO                 VARCHAR2 (512),
   constraint PK_RSBT_LICENSE primary key (GUID)
)
tablespace "3100_STATDB";

comment on table RSBT_LICENSE is
'台(站)执照表';

comment on column RSBT_LICENSE.GUID is
'主键';

comment on column RSBT_LICENSE.STATION_GUID is
'台站GUID';

comment on column RSBT_LICENSE.APP_CODE is
'申请表编号';

comment on column RSBT_LICENSE.STAT_TDI is
'技术资料申报表编号';

comment on column RSBT_LICENSE.STAT_APP_TYPE is
'技术资料申报表类型';

comment on column RSBT_LICENSE.LICENSE_TYPE is
'执照类型';

comment on column RSBT_LICENSE.LICENSE_CODE is
'执照号';

comment on column RSBT_LICENSE.LICENSE_ORG_NAME is
'执照单位名称';

comment on column RSBT_LICENSE.LICENSE_MANAGER is
'核发单位名称';

comment on column RSBT_LICENSE.LICENSE_DATE_B is
'执照有效期起';

comment on column RSBT_LICENSE.LICENSE_DATE_E is
'执照有效期止';

comment on column RSBT_LICENSE.LICENSE_DATE is
'发证时间';

comment on column RSBT_LICENSE.MEMO is
'备注';

/*==============================================================*/
/* Table: RSBT_LINK                                             */
/*==============================================================*/
create table RSBT_LINK 
(
   GUID                 VARCHAR2 (36)        not null,
   NET_GUID_A           VARCHAR2 (36),
   STATION_GUID_A       VARCHAR2 (36),
   GUID_EAF_A           VARCHAR2 (36),
   NET_GUID_B           VARCHAR2 (36),
   STATION_GUID_B       VARCHAR2 (36),
   GUID_EAF_B           VARCHAR2 (36),
   constraint PK_RSBT_LINK primary key (GUID)
)
tablespace "3100_STATDB";

comment on table RSBT_LINK is
'无线电台(站)链路表';

comment on column RSBT_LINK.GUID is
'主键
主键
主键';

comment on column RSBT_LINK.NET_GUID_A is
'RSBT_ NET
RSBT_ NET
RSBT_NET';

comment on column RSBT_LINK.STATION_GUID_A is
'台站AGUID';

comment on column RSBT_LINK.GUID_EAF_A is
'设备频率与天馈线索引 GUID';

comment on column RSBT_LINK.NET_GUID_B is
'RSBT_ NET';

comment on column RSBT_LINK.STATION_GUID_B is
'台站BGUID';

comment on column RSBT_LINK.GUID_EAF_B is
'设备频率与天馈线索引 GUID';

/*==============================================================*/
/* Table: RSBT_NET                                              */
/*==============================================================*/
create table RSBT_NET 
(
   GUID                 VARCHAR2(36)         not null,
   ORG_GUID             VARCHAR2(36)         not null,
   FEE_GUID             VARCHAR2(36),
   ORG_CODE             VARCHAR2(9)          not null,
   NET_NAME             VARCHAR2(80),
   NET_SVN              VARCHAR2(10),
   NET_SP               VARCHAR2(8),
   NET_TS               VARCHAR2(8),
   NET_BAND             NUMBER(14,7),
   NET_AREA             VARCHAR2(8),
   NET_USE              VARCHAR2(80),
   NET_SAT_NAME         VARCHAR2(80),
   NET_LG               VARCHAR2(10),
   NET_START_DATE       DATE,
   NET_CONFIRM_DATE     DATE,
   NET_EXPIRED_DATE     DATE,
   constraint PK_RSBT_NET primary key (GUID)
)
tablespace "3100_STATDB";

comment on table RSBT_NET is
'无线电台(站)共性数据表';

comment on column RSBT_NET.GUID is
'主键';

comment on column RSBT_NET.ORG_GUID is
'申请单位GUID';

comment on column RSBT_NET.FEE_GUID is
'缴费单位GUID';

comment on column RSBT_NET.ORG_CODE is
'无线电管理机构组织机构代码';

comment on column RSBT_NET.NET_NAME is
'无线电系统/网络名称';

comment on column RSBT_NET.NET_SVN is
'通信业务/系统类型';

comment on column RSBT_NET.NET_SP is
'业务性质';

comment on column RSBT_NET.NET_TS is
'技术体制';

comment on column RSBT_NET.NET_BAND is
'信道带宽/波道间隔';

comment on column RSBT_NET.NET_AREA is
'使用范围';

comment on column RSBT_NET.NET_USE is
'网络用途';

comment on column RSBT_NET.NET_SAT_NAME is
'卫星/星座名称';

comment on column RSBT_NET.NET_LG is
'标称轨道经度';

comment on column RSBT_NET.NET_START_DATE is
'启用日期';

comment on column RSBT_NET.NET_CONFIRM_DATE is
'批准日期';

comment on column RSBT_NET.NET_EXPIRED_DATE is
'报废日期';

/*==============================================================*/
/* Table: RSBT_ORG                                              */
/*==============================================================*/
create table RSBT_ORG 
(
   GUID                 VARCHAR2(36)         not null,
   ORG_CODE             VARCHAR2(9),
   ORG_NAME             VARCHAR2(80),
   ORG_AREA_CODE        VARCHAR2(8)          not null,
   ORG_SYS_CODE         VARCHAR2(8),
   ORG_TYPE             VARCHAR2(3)          not null,
   ORG_LINK_PERSON      VARCHAR2(40),
   ORG_PERSON_ID        VARCHAR2(40),
   ORG_SUP_CODE         VARCHAR2(9),
   ORG_ADDR             VARCHAR2(80),
   ORG_POST             VARCHAR2(6),
   ORG_PHONE            VARCHAR2(40),
   ORG_MOB_PHONE        VARCHAR2(40),
   ORG_FAX              VARCHAR2(40),
   ORG_BANK             VARCHAR2(80),
   ORG_ACCOUNT_NAME     VARCHAR2(80),
   ORG_ACCOUNT          VARCHAR2(40),
   ORG_HOSTILITY        NUMBER(1),
   ORG_WEB_SITE         VARCHAR2(80),
   ORG_MAIL             VARCHAR2(80),
   constraint PK_RSBT_ORG primary key (GUID)
)
tablespace "3100_STATDB";

comment on table RSBT_ORG is
'组织机构表';

comment on column RSBT_ORG.ORG_CODE is
'组织机构代码';

comment on column RSBT_ORG.ORG_NAME is
'组织机构名称';

comment on column RSBT_ORG.ORG_AREA_CODE is
'地区代码';

comment on column RSBT_ORG.ORG_SYS_CODE is
'系统/行业代码';

comment on column RSBT_ORG.ORG_TYPE is
'单位类型';

comment on column RSBT_ORG.ORG_LINK_PERSON is
'单位联系人';

comment on column RSBT_ORG.ORG_PERSON_ID is
'联系人身份证号码';

comment on column RSBT_ORG.ORG_SUP_CODE is
'上级组织机构代码';

comment on column RSBT_ORG.ORG_ADDR is
'组织机构地址';

comment on column RSBT_ORG.ORG_POST is
'组织机构邮编';

comment on column RSBT_ORG.ORG_PHONE is
'联系电话';

comment on column RSBT_ORG.ORG_MOB_PHONE is
'手机号码';

comment on column RSBT_ORG.ORG_FAX is
'组织机构传真';

comment on column RSBT_ORG.ORG_BANK is
'开户银行';

comment on column RSBT_ORG.ORG_ACCOUNT_NAME is
'账户名称';

comment on column RSBT_ORG.ORG_ACCOUNT is
'银行帐号';

comment on column RSBT_ORG.ORG_HOSTILITY is
'设台单位性质';

comment on column RSBT_ORG.ORG_WEB_SITE is
'网址';

comment on column RSBT_ORG.ORG_MAIL is
'电子邮箱';

/*==============================================================*/
/* Table: RSBT_STATION                                          */
/*==============================================================*/
create table RSBT_STATION 
(
   GUID                 VARCHAR2 (36)        not null,
   NET_GUID             VARCHAR2 (36),
   ORG_CODE             VARCHAR2(9),
   APP_CODE             VARCHAR2 (14)        not null,
   STAT_APP_TYPE        VARCHAR2 (8)         not null,
   STAT_TDI             VARCHAR2 (4)         not null,
   STAT_NAME            VARCHAR2 (80),
   STAT_ADDR            VARCHAR2 (80),
   STAT_AREA_CODE       VARCHAR2 (8),
   STAT_TYPE            VARCHAR2 (8),
   STAT_WORK            VARCHAR2 (8),
   STAT_STATUS          VARCHAR2 (8),
   STAT_EQU_SUM         NUMBER(7),
   STAT_LG              NUMBER(10,7),
   STAT_LA              NUMBER(10,7),
   STAT_AT              NUMBER(6,2),
   STAT_DATE_START      DATE,
   MEMO                 VARCHAR2(512),
   constraint PK_RSBT_STATION primary key (GUID)
)
tablespace "3100_STATDB";

comment on table RSBT_STATION is
'无线电台(站)表';

comment on column RSBT_STATION.GUID is
'主键';

comment on column RSBT_STATION.NET_GUID is
'RSBT_ NET';

comment on column RSBT_STATION.ORG_CODE is
'无线电管理机构组织机构 代码';

comment on column RSBT_STATION.APP_CODE is
'无线电台(站)申请表编号';

comment on column RSBT_STATION.STAT_APP_TYPE is
'技术资料申报表类型';

comment on column RSBT_STATION.STAT_TDI is
'技术资料申报表编号';

comment on column RSBT_STATION.STAT_NAME is
'无线电台站名称';

comment on column RSBT_STATION.STAT_ADDR is
'无线电台站地址';

comment on column RSBT_STATION.STAT_AREA_CODE is
'无线电台站所在地地区编码';

comment on column RSBT_STATION.STAT_TYPE is
'台站类别';

comment on column RSBT_STATION.STAT_WORK is
'工作方式';

comment on column RSBT_STATION.STAT_STATUS is
'台站状态';

comment on column RSBT_STATION.STAT_EQU_SUM is
'(台站总)设备数量';

comment on column RSBT_STATION.STAT_LG is
'台站经度(西经为负数)';

comment on column RSBT_STATION.STAT_LA is
'台站纬度(南纬为负数)';

comment on column RSBT_STATION.STAT_AT is
'海拔高度';

comment on column RSBT_STATION.STAT_DATE_START is
'启用日期';

comment on column RSBT_STATION.MEMO is
'协调主管部门；国际协调和登记资料代码或名称';

/*==============================================================*/
/* Table: RSBT_STATIONSUPERVISIONRECORD                         */
/*==============================================================*/
create table RSBT_STATIONSUPERVISIONRECORD 
(
   GUID                 VARCHAR2 (36)        not null,
   STATION_GUID         VARCHAR2 (36),
   STATION_ILLEGAL_TIME DATE                 not null,
   STATION_ILLEGAL_MODE VARCHAR2 (8),
   STATION_SUPERVISION_STATUS VARCHAR2 (8),
   STATION_ILLEGAL_DATE NUMBER(12,5),
   STATION_ILLEGAL_DATE_U VARCHAR2 (8),
   STATION_ILLEGAL_LG   NUMBER(10,7),
   STATION_ILLEGAL_LA   NUMBER(10,7),
   STATION_ILLEGAL_EQUMODE VARCHAR2 (40),
   STATION_PUNISH_TIME  DATE                 not null,
   STATION_PUNISH_RESULT VARCHAR2 (80),
   MEMO                 VARCHAR2 (512),
   constraint PK_RSBT_STATIONSUPERVISIONRECO primary key (GUID)
)
tablespace "3100_STATDB";

comment on table RSBT_STATIONSUPERVISIONRECORD is
'无线电台站监管记录表';

comment on column RSBT_STATIONSUPERVISIONRECORD.GUID is
'主键';

comment on column RSBT_STATIONSUPERVISIONRECORD.STATION_GUID is
'RSBT_ STATION';

comment on column RSBT_STATIONSUPERVISIONRECORD.STATION_ILLEGAL_TIME is
'台站违规及受干扰时间';

comment on column RSBT_STATIONSUPERVISIONRECORD.STATION_ILLEGAL_MODE is
'台站违规及受干扰类别';

comment on column RSBT_STATIONSUPERVISIONRECORD.STATION_SUPERVISION_STATUS is
'台站监管状态';

comment on column RSBT_STATIONSUPERVISIONRECORD.STATION_ILLEGAL_DATE is
'台站违规参数';

comment on column RSBT_STATIONSUPERVISIONRECORD.STATION_ILLEGAL_DATE_U is
'违规参数单位';

comment on column RSBT_STATIONSUPERVISIONRECORD.STATION_ILLEGAL_LG is
'违规台站经度';

comment on column RSBT_STATIONSUPERVISIONRECORD.STATION_ILLEGAL_LA is
'违规台站纬度';

comment on column RSBT_STATIONSUPERVISIONRECORD.STATION_ILLEGAL_EQUMODE is
'违规设备型号';

comment on column RSBT_STATIONSUPERVISIONRECORD.STATION_PUNISH_TIME is
'违规查处时间';

comment on column RSBT_STATIONSUPERVISIONRECORD.STATION_PUNISH_RESULT is
'违规查处结果';

comment on column RSBT_STATIONSUPERVISIONRECORD.MEMO is
'备注';

/*==============================================================*/
/* Table: RSBT_STATION_MONITOR                                  */
/*==============================================================*/
create table RSBT_STATION_MONITOR 
(
   GUID                 VARCHAR2 (36)        not null,
   STATION_GUID         VARCHAR2 (36),
   MONITOR_GUID         VARCHAR2 (36),
   constraint PK_RSBT_STATION_MONITOR primary key (GUID)
)
tablespace "3100_STATDB";

comment on table RSBT_STATION_MONITOR is
'无线电台站监管与监测站关联表';

comment on column RSBT_STATION_MONITOR.GUID is
'主键';

comment on column RSBT_STATION_MONITOR.STATION_GUID is
'RSBT_ STATION';

comment on column RSBT_STATION_MONITOR.MONITOR_GUID is
'RSBT_MONITOR';

/*==============================================================*/
/* Table: RSBT_STATION_T                                        */
/*==============================================================*/
create table RSBT_STATION_T 
(
   GUID                 VARCHAR2 (36)        not null,
   ST_TIME_B            DATE,
   ST_TIME_E            DATE,
   ST_LMMTR             VARCHAR2 (1),
   ST_USER_AREA         VARCHAR2 (80),
   ST_TF_CODE           VARCHAR2 (40),
   ST_TF_TRANS_CA_PU    VARCHAR2 (8),
   ST_TF_TRANS_CA_P     NUMBER (14,7),
   ST_E_NET_CODE        VARCHAR2 (20),
   ST_E_MULTI_ADDR      VARCHAR2 (8),
   ST_E_COM_AREA        VARCHAR2 (8),
   ST_POS_TYPE          VARCHAR2 (8),
   ST_E_POS             VARCHAR2 (40),
   ST_E_SAT             VARCHAR2 (40),
   ST_E_LG              VARCHAR2 (20),
   ST_B_SGN             VARCHAR2 (40),
   ST_B_LEVEL           VARCHAR2 (8),
   ST_B_BM              VARCHAR2 (8),
   ST_B_EDU             VARCHAR2 (1),
   ST_B_IC              VARCHAR2 (1),
   ST_B_COVER_AREA      VARCHAR2 (40),
   ST_SHIP_TYPE         VARCHAR2 (8),
   ST_CALL_SIGN         VARCHAR2 (20),
   ST_S_MMSI            VARCHAR2 (20),
   ST_S_CS              VARCHAR2 (20),
   ST_SHIP_NAME         VARCHAR2 (80),
   ST_S_PN              VARCHAR2 (80),
   ST_S_AAIC            VARCHAR2 (20),
   ST_S_T               NUMBER (10,2),
   ST_S_P               NUMBER(10,2),
   ST_A_MODEL           VARCHAR2(40),
   ST_A_TYPE            VARCHAR2(8),
   ST_A_CALL            VARCHAR2(1),
   ST_A_CALL_OI         VARCHAR2(20),
   ST_A_SGN             VARCHAR2(20),
   ST_A_ST              NUMBER(10,2),
   ST_A_PILOTING        VARCHAR2(1),
   ST_A_NRM             VARCHAR2(40),
   ST_R_WAMIN           VARCHAR2(20),
   ST_R_WAMAX           VARCHAR2(20),
   ST_R_EMIN            VARCHAR2(20),
   ST_R_EMAX            VARCHAR2(20),
   ST_C_CODE            VARCHAR2(40),
   ST_C_SUM             NUMBER(3),
   ST_SERV_R            NUMBER(10,3),
   ST_D_TEC_TYPE        VARCHAR2(20),
   ST_D_TYPE            VARCHAR2(1),
   ST_ME_SAT_NAME       VARCHAR2(80),
   ST_ME_STA1           VARCHAR2(80),
   ST_ME_STA2           VARCHAR2(80),
   ST_ME_STA3           VARCHAR2(80),
   ST_ME_STYPE          VARCHAR2(1),
   ST_ME_NAME1          VARCHAR2(80),
   ST_ME_NAME2          VARCHAR2(80),
   ST_ME_LG1            NUMBER(10,7),
   ST_ME_LG2            NUMBER(10,7),
   ST_ME_FBAND          NUMBER(14,7),
   ST_B_TYPE1           VARCHAR2(8),
   ST_B_TYPE2           VARCHAR2(8),
   constraint PK_RSBT_STATION_T primary key (GUID)
)
tablespace "3100_STATDB";

comment on table RSBT_STATION_T is
'无线电台（站）台站冗余表';

comment on column RSBT_STATION_T.GUID is
'RSBT_ STATION';

comment on column RSBT_STATION_T.ST_TIME_B is
'工作时间起';

comment on column RSBT_STATION_T.ST_TIME_E is
'工作时间止';

comment on column RSBT_STATION_T.ST_LMMTR is
'是否机车制式电台';

comment on column RSBT_STATION_T.ST_USER_AREA is
'使用区域';

comment on column RSBT_STATION_T.ST_TF_CODE is
'站代号';

comment on column RSBT_STATION_T.ST_TF_TRANS_CA_PU is
'传输容量单位';

comment on column RSBT_STATION_T.ST_TF_TRANS_CA_P is
'传输容量值';

comment on column RSBT_STATION_T.ST_E_NET_CODE is
'网络编号';

comment on column RSBT_STATION_T.ST_E_MULTI_ADDR is
'多址方式';

comment on column RSBT_STATION_T.ST_E_COM_AREA is
'通信范围';

comment on column RSBT_STATION_T.ST_POS_TYPE is
'位置类型';

comment on column RSBT_STATION_T.ST_E_POS is
'位置类型（值）';

comment on column RSBT_STATION_T.ST_E_SAT is
'空间电台（星座）名称';

comment on column RSBT_STATION_T.ST_E_LG is
'标称轨道经度';

comment on column RSBT_STATION_T.ST_B_SGN is
'台标';

comment on column RSBT_STATION_T.ST_B_LEVEL is
'台站级别';

comment on column RSBT_STATION_T.ST_B_BM is
'广播制式';

comment on column RSBT_STATION_T.ST_B_EDU is
'是否教育台';

comment on column RSBT_STATION_T.ST_B_IC is
'是否差转台';

comment on column RSBT_STATION_T.ST_B_COVER_AREA is
'覆盖区域';

comment on column RSBT_STATION_T.ST_SHIP_TYPE is
'船舶种类';

comment on column RSBT_STATION_T.ST_CALL_SIGN is
'呼号';

comment on column RSBT_STATION_T.ST_S_MMSI is
'MMSI号';

comment on column RSBT_STATION_T.ST_S_CS is
'船舶登记号';

comment on column RSBT_STATION_T.ST_SHIP_NAME is
'船舶名称';

comment on column RSBT_STATION_T.ST_S_PN is
'船籍港名';

comment on column RSBT_STATION_T.ST_S_AAIC is
'帐务结算机构代码';

comment on column RSBT_STATION_T.ST_S_T is
'总吨位';

comment on column RSBT_STATION_T.ST_S_P is
'总功率';

comment on column RSBT_STATION_T.ST_A_MODEL is
'航空器型号';

comment on column RSBT_STATION_T.ST_A_TYPE is
'航空器类型';

comment on column RSBT_STATION_T.ST_A_CALL is
'选呼或报呼';

comment on column RSBT_STATION_T.ST_A_CALL_OI is
'呼号或其它标识';

comment on column RSBT_STATION_T.ST_A_SGN is
'航空器识别码';

comment on column RSBT_STATION_T.ST_A_ST is
'最大起飞重量';

comment on column RSBT_STATION_T.ST_A_PILOTING is
'是否按地标飞行';

comment on column RSBT_STATION_T.ST_A_NRM is
'国籍和注册号码';

comment on column RSBT_STATION_T.ST_R_WAMIN is
'工作方位角最小值';

comment on column RSBT_STATION_T.ST_R_WAMAX is
'工作方位角最大值';

comment on column RSBT_STATION_T.ST_R_EMIN is
'俯仰角最小值';

comment on column RSBT_STATION_T.ST_R_EMAX is
'俯仰角最大值';

comment on column RSBT_STATION_T.ST_C_CODE is
'基站编号(唯一）';

comment on column RSBT_STATION_T.ST_C_SUM is
'扇区数量';

comment on column RSBT_STATION_T.ST_SERV_R is
'服务半径';

comment on column RSBT_STATION_T.ST_D_TEC_TYPE is
'技术体制';

comment on column RSBT_STATION_T.ST_D_TYPE is
'直放站类型';

comment on column RSBT_STATION_T.ST_ME_SAT_NAME is
'卫星移动通信系统名称';

comment on column RSBT_STATION_T.ST_ME_STA1 is
'关口站名称1';

comment on column RSBT_STATION_T.ST_ME_STA2 is
'关口站名称2';

comment on column RSBT_STATION_T.ST_ME_STA3 is
'关口站名称3  ';

comment on column RSBT_STATION_T.ST_ME_STYPE is
'星座/卫星';

comment on column RSBT_STATION_T.ST_ME_NAME1 is
'空间电台(星座)名称1';

comment on column RSBT_STATION_T.ST_ME_NAME2 is
'空间电台(星座)名称2';

comment on column RSBT_STATION_T.ST_ME_LG1 is
'标称轨道经度1';

comment on column RSBT_STATION_T.ST_ME_LG2 is
'标称轨道经度2 ';

comment on column RSBT_STATION_T.ST_ME_FBAND is
'使用总带宽';

comment on column RSBT_STATION_T.ST_B_TYPE1 is
'广播电台台站类别1';

comment on column RSBT_STATION_T.ST_B_TYPE2 is
'广播电台台站类别2';

/*==============================================================*/
/* Table: RSBT_ST_COBJ                                          */
/*==============================================================*/
create table RSBT_ST_COBJ 
(
   GUID                 VARCHAR2(36)         not null,
   STATION_GUID         VARCHAR2(36),
   OBJ_TYPE             VARCHAR2 (1)         not null,
   OBJ_NAME             VARCHAR2 (80)        not null,
   OBJ_TDI              VARCHAR2 (20),
   constraint PK_RSBT_ST_COBJ primary key (GUID)
)
tablespace "3100_STATDB";

comment on table RSBT_ST_COBJ is
'通信对象的申报表号（表H用）';

comment on column RSBT_ST_COBJ.GUID is
'主键';

comment on column RSBT_ST_COBJ.STATION_GUID is
'外键RSBT_STATION';

comment on column RSBT_ST_COBJ.OBJ_TYPE is
'通信对象类型';

comment on column RSBT_ST_COBJ.OBJ_NAME is
'申请表号或名称';

comment on column RSBT_ST_COBJ.OBJ_TDI is
'技术资料表号';

alter table RSBT_ANTFEED
   add constraint FK_RSBT_ANT_REFERENCE_RSBT_STA foreign key (STATION_GUID)
      references RSBT_STATION (GUID);

alter table RSBT_ANTFEED_T
   add constraint FK_RSBT_ANT_REFERENCE_RSBT_ANT foreign key (GUID)
      references RSBT_ANTFEED (GUID);

alter table RSBT_APPFILELIST
   add constraint FK_RSBT_APP_REFERENCE_RSBT_APP foreign key (APP_GUID)
      references RSBT_APPLY (GUID);

alter table RSBT_APPFREQ
   add constraint FK_RSBT_APP_REF2_RSBT_APP foreign key (APP_GUID)
      references RSBT_APPLY (GUID);

alter table RSBT_APPLY
   add constraint FK_RSBT_APP_REFERENCE_RSBT_ORG foreign key (ORG_GUID)
      references RSBT_ORG (GUID);

alter table RSBT_APPLY
   add constraint FK_RSBT_APP_REFERENCE_RSBT_NET foreign key (NET_GUID)
      references RSBT_NET (GUID);

alter table RSBT_APPLY
   add constraint FK_RSBT_APP_REF9_RSBT_ORG foreign key (ORG_MANAGER_GUID)
      references RSBT_ORG (GUID);

alter table RSBT_EAF
   add constraint FK_RSBT_EAF_REFERENCE_RSBT_STA foreign key (STATION_GUID)
      references RSBT_STATION (GUID);

alter table RSBT_EQU
   add constraint FK_RSBT_EQU_REFERENCE_RSBT_STA foreign key (STATION_GUID)
      references RSBT_STATION (GUID);

alter table RSBT_EQU_T
   add constraint FK_RSBT_EQU_REFERENCE_RSBT_EQU foreign key (GUID)
      references RSBT_EQU (GUID);

alter table RSBT_E_SE
   add constraint FK_RSBT_E_S_REFERENCE_RSBT_STA foreign key (STATION_GUID)
      references RSBT_STATION (GUID);

alter table RSBT_FEEEVERYYEAR
   add constraint FK_RSBT_FEE_REFERENCE_RSBT_ORG foreign key (ORG_GUID)
      references RSBT_ORG (GUID);

alter table RSBT_FEEEVERYYEAR
   add constraint FK_RSBT_FEE_REFERENCE_RSBT_NET foreign key (NET_GUID)
      references RSBT_NET (GUID);

alter table RSBT_FEEEVERYYEAR
   add constraint FK_RSBT_FEE_REFERENCE_RSBT_STA foreign key (STATION_GUID)
      references RSBT_STATION (GUID);

alter table RSBT_FEEEVERYYEAR
   add constraint FK_RSBT_FEE_REFERENCE_RSBT_FEE foreign key (FEE_DERATE_ACCORDING)
      references RSBT_FEE_DERATE (GUID);

alter table RSBT_FEERECORD
   add constraint FK_RSBT_FEE_REF2_RSBT_FEE foreign key (FEE_GUID)
      references RSBT_FEEEVERYYEAR (GUID);

alter table RSBT_FEEUNITRECORD
   add constraint FK_RSBT_FEE_REF2_RSBT_ORG foreign key (ORG_GUID)
      references RSBT_ORG (GUID);

alter table RSBT_FEEURGENCYRECORD
   add constraint FK_RSBT_FEE_REF3_RSBT_ORG foreign key (ORG_GUID)
      references RSBT_ORG (GUID);

alter table RSBT_FREQ
   add constraint FK_RSBT_FRE_REFERENCE_RSBT_STA foreign key (STATION_GUID)
      references RSBT_STATION (GUID);

alter table RSBT_FREQ_T
   add constraint FK_RSBT_FRE_REFERENCE_RSBT_FRE foreign key (GUID)
      references RSBT_FREQ (GUID);

alter table RSBT_NET
   add constraint FK_RSBT_NET_REFERENCE_RSBT_ORG foreign key (ORG_GUID)
      references RSBT_ORG (GUID);

alter table RSBT_NET
   add constraint FK_RSBT_NE_REF2_RSBT_ORG foreign key (FEE_GUID)
      references RSBT_ORG (GUID);

alter table RSBT_STATION
   add constraint FK_RSBT_STA_REFERENCE_RSBT_NET foreign key (NET_GUID)
      references RSBT_NET (GUID);

alter table RSBT_STATIONSUPERVISIONRECORD
   add constraint FK_RSBT_STA_REFERENCE_RSBT_STA foreign key (STATION_GUID)
      references RSBT_STATION (GUID);

alter table RSBT_STATION_MONITOR
   add constraint FK_RSBT_STA_REF3_RSBT_STA foreign key (STATION_GUID)
      references RSBT_STATION (GUID);

alter table RSBT_STATION_T
   add constraint FK_RSBT_STA_REF2_RSBT_STA foreign key (GUID)
      references RSBT_STATION (GUID);

alter table RSBT_ST_COBJ
   add constraint FK_RSBT_ST__REFERENCE_RSBT_STA foreign key (STATION_GUID)
      references RSBT_STATION (GUID);
