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
'���ߵ�̨(վ)�����߱�';

comment on column RSBT_ANTFEED.GUID is
'����';

comment on column RSBT_ANTFEED.STATION_GUID is
'RSBT_STATION GUID';

comment on column RSBT_ANTFEED.ANT_WORK_TYPE is
'������ʽ';

comment on column RSBT_ANTFEED.ANT_POLE is
'������ʽ';

comment on column RSBT_ANTFEED.ANT_RPOLE is
'�ռ�����ʽ';

comment on column RSBT_ANTFEED.ANT_EPOLE is
'��������ʽ';

comment on column RSBT_ANTFEED.ANT_TYPE is
'��������';

comment on column RSBT_ANTFEED.ANT_MODEL is
'�����ͺ�';

comment on column RSBT_ANTFEED.ANT_MENU is
'������������';

comment on column RSBT_ANTFEED.ANT_HIGHT is
'���߾����߶�';

comment on column RSBT_ANTFEED.ANT_GAIN is
'��������';

comment on column RSBT_ANTFEED.ANT_EGAIN is
'���߷�����';

comment on column RSBT_ANTFEED.ANT_RGAIN is
'����������';

comment on column RSBT_ANTFEED.ANT_ANGLE is
'�����䷽λ��';

comment on column RSBT_ANTFEED.ANT_SIZE is
'���߳ߴ�';

comment on column RSBT_ANTFEED.FEED_MENU is
'������������';

comment on column RSBT_ANTFEED.FEED_MODEL is
'�����ͺ�';

comment on column RSBT_ANTFEED.FEED_LENGTH is
'���߳���';

comment on column RSBT_ANTFEED.FEED_LOSE is
'����ϵͳ�����';

comment on column RSBT_ANTFEED.ANT_CODE is
'ADBMS_PK_ANTENO(�������)';

comment on column RSBT_ANTFEED.FEED_CODE is
'ADBMS_PK_FEEDLINENO(�������)';

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
   AT_QUA               VARCHAR2��20��,
   AT_UNIT_TYPE         VARCHAR2��8��,
   AT_H_HPIC            VARCHAR2 (80),
   AT_H_VPIC            VARCHAR2 (80),
   AT_ANT_UPANG         Number (10,7),
   constraint PK_RSBT_ANTFEED_T primary key (GUID)
)
tablespace "3100_STATDB";

comment on table RSBT_ANTFEED_T is
'���ߵ�̨(վ)�����������';

comment on column RSBT_ANTFEED_T.GUID is
'RSBT_ ANTFEED';

comment on column RSBT_ANTFEED_T.AT_ANT_NO is
'�������';

comment on column RSBT_ANTFEED_T.AT_SE_B is
'�������Ƿ�Χ��';

comment on column RSBT_ANTFEED_T.AT_SE_E is
'�������Ƿ�Χֹ';

comment on column RSBT_ANTFEED_T.AT_ANG_B is
'��λ�Ƿ�Χ��';

comment on column RSBT_ANTFEED_T.AT_ANG_E is
'��λ�Ƿ�Χֹ';

comment on column RSBT_ANTFEED_T.AT_RNT is
'����ϵͳ�����¶�';

comment on column RSBT_ANTFEED_T.AT_BWID is
'�������';

comment on column RSBT_ANTFEED_T.AT_LEL is
'��һ�԰��ƽ';

comment on column RSBT_ANTFEED_T.AT_SSPEED is
'ɨ���ٶ�';

comment on column RSBT_ANTFEED_T.AT_CCODE is
'������';

comment on column RSBT_ANTFEED_T.AT_3DBE is
'3dB�ǿ�����';

comment on column RSBT_ANTFEED_T.AT_3DBR is
'3dB�ǿ��գ�';

comment on column RSBT_ANTFEED_T.AT_RANG is
'�����';

comment on column RSBT_ANTFEED_T.AT_EANG is
'�����';

comment on column RSBT_ANTFEED_T.AT_CSGN is
'������ʶ��';

comment on column RSBT_ANTFEED_T.AT_UPDN is
'ֱ��վ����/����';

comment on column RSBT_ANTFEED_T.AT_SUM is
'��������';

comment on column RSBT_ANTFEED_T.AT_QUA is
'����ϵͳƷ��';

comment on column RSBT_ANTFEED_T.AT_UNIT_TYPE is
'�������浥λ';

comment on column RSBT_ANTFEED_T.AT_H_HPIC is
'ˮƽ����ͼ';

comment on column RSBT_ANTFEED_T.AT_H_VPIC is
'��ֱ����ͼ';

comment on column RSBT_ANTFEED_T.AT_ANT_UPANG is
'��������';

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
'������ļ��б�';

comment on column RSBT_APPFILELIST.APP_GUID is
'����GUID';

comment on column RSBT_APPFILELIST.APP_CODE is
'�������';

comment on column RSBT_APPFILELIST.APP_FILE_NO is
'Ƶ��ʹ�����֤�Ż���׼�ĺ�';

comment on column RSBT_APPFILELIST.APP_ATTACHMENT is
'�ļ�/��������';

comment on column RSBT_APPFILELIST.APP_FILE_URL is
'����URL ';

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
'�����Ƶ�ʴ�����';

comment on column RSBT_APPFREQ.APP_GUID is
'����GUID';

comment on column RSBT_APPFREQ.APP_CODE is
'�������';

comment on column RSBT_APPFREQ.APP_FREQ_LC is
'����Ƶ�ʣ���Ƶ��';

comment on column RSBT_APPFREQ.APP_FREQ_UC is
'����Ƶ�ʣ���Ƶ��';

comment on column RSBT_APPFREQ.APP_FREQ_LFB is
'Ƶ�ʵͶ�����';

comment on column RSBT_APPFREQ.APP_FREQ_LFE is
'Ƶ�ʵͶ�����';

comment on column RSBT_APPFREQ.APP_FREQ_LB is
'Ƶ�ʵͶδ���';

comment on column RSBT_APPFREQ.APP_FREQ_UFB is
'Ƶ�ʸ߶�����';

comment on column RSBT_APPFREQ.APP_FREQ_UFE is
'Ƶ�ʸ߶�����';

comment on column RSBT_APPFREQ.APP_FREQ_UB is
'Ƶ�ʸ߶δ���';

comment on column RSBT_APPFREQ.APP_FREQ_CODE is
'����Ƶ�����ݿ��Ӧ��';

comment on column RSBT_APPFREQ.APP_FREQ_TYPE is
'Ƶ�����ͣ��ŵ���Ƶ�Σ�';

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
'�����';

comment on column RSBT_APPLY.GUID is
'�����GUID';

comment on column RSBT_APPLY.ORG_GUID is
'���뵥λGUID';

comment on column RSBT_APPLY.NET_GUID is
'ͨ����GUID';

comment on column RSBT_APPLY.ORG_MANAGER_GUID is
'������� GUID';

comment on column RSBT_APPLY.APP_CODE is
'�������';

comment on column RSBT_APPLY.APP_TYPE is
'���������';

comment on column RSBT_APPLY.APP_SUB_TYPE is
'��������';

comment on column RSBT_APPLY.APP_OBJECT_TYPE is
'�����������';

comment on column RSBT_APPLY.APP_DATE is
'��������';

comment on column RSBT_APPLY.APP_FTLB is
'��ʼ����';

comment on column RSBT_APPLY.APP_FTLE is
'��ֹ����';

comment on column RSBT_APPLY.MEMO is
'��ע';

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
'�������ݱ�';

comment on column RSBT_CODE_DIC.CO is
'���';

comment on column RSBT_CODE_DIC.CN is
'�������';

comment on column RSBT_CODE_DIC.CODE_CHI_NAME is
'������������';

comment on column RSBT_CODE_DIC.CODE_DATA_TYPE is
'�������ݱ�����';

comment on column RSBT_CODE_DIC.CODE_TYPE_CHI_NAME is
'�������ݱ�������������';

comment on column RSBT_CODE_DIC.CODE_DISCN is
'��ʾ���';

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
'����Դ�Ĵ����';

comment on column RSBT_DB_POOL.ORG_AREA_CODE is
'��������';

comment on column RSBT_DB_POOL.SERVER_ADRESS1 is
'������IP��ַ1';

comment on column RSBT_DB_POOL.SERVER_ADRESS2 is
'������IP��ַ2';

comment on column RSBT_DB_POOL.DATABASE_SERVER_NAME is
'���ݿ������';

comment on column RSBT_DB_POOL.DATABASE_NAME is
'���ݿ�����';

comment on column RSBT_DB_POOL.DATABASE_MANAGEMENT_USER is
'���ݿ����Ա�û�����';

comment on column RSBT_DB_POOL.DATABASE_PASSWORD is
'���ݿ����';

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
'���ߵ�̨(վ)�豸Ƶ����������������';

comment on column RSBT_EAF.GUID is
'����';

comment on column RSBT_EAF.STATION_GUID is
'̨վGUID';

comment on column RSBT_EAF.EQU_GUID is
'�豸';

comment on column RSBT_EAF.ANT_GUID is
'����';

comment on column RSBT_EAF.FREQ_GUID is
'Ƶ��';

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
'���ߵ�̨(վ)��/���Ż��豸��';

comment on column RSBT_EQU.GUID is
'����';

comment on column RSBT_EQU.STATION_GUID is
'RSBT_ STATION';

comment on column RSBT_EQU.EQU_TYPE is
'�豸������ʽ';

comment on column RSBT_EQU.EQU_MODEL is
'�豸�ͺ�';

comment on column RSBT_EQU.EQU_AUTH is
'�ͺź�׼����';

comment on column RSBT_EQU.EQU_MENU is
'�豸��������';

comment on column RSBT_EQU.EQU_CODE is
'�豸������';

comment on column RSBT_EQU.EQU_PF is
'���ʱ�ʶ';

comment on column RSBT_EQU.EQU_POW is
'���书��';

comment on column RSBT_EQU.EQU_MB is
'��/���ñ�ʶ';

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
'���ߵ�̨(վ) ��/���Ż��豸�����';

comment on column RSBT_EQU_T.GUID is
'RSBT_ EQU';

comment on column RSBT_EQU_T.ET_EQU_NO is
'�豸���';

comment on column RSBT_EQU_T.ET_AF_TYPE is
'�Ƿ��Զ�ѡƵ';

comment on column RSBT_EQU_T.ET_POW_U is
'���ʵ�λ';

comment on column RSBT_EQU_T.ET_EQU_CL is
'����';

comment on column RSBT_EQU_T.ET_EQU_TL is
'���޵�ƽ��dBm��';

comment on column RSBT_EQU_T.ET_EQU_RNQ is
'����ϵ����dB��';

comment on column RSBT_EQU_T.ET_EQU_TYPE_ID is
'�豸����';

comment on column RSBT_EQU_T.ET_EQU_NAME is
'�豸����';

comment on column RSBT_EQU_T.ET_EQU_CODE is
'��ʽ�Ͽɴ���';

comment on column RSBT_EQU_T.ET_EQU_ESGN is
'�����ʶ';

comment on column RSBT_EQU_T.ET_EQU_EPOS is
'�豸��̨��װλ��';

comment on column RSBT_EQU_T.ET_EQU_ATYPE is
'�豸��������';

comment on column RSBT_EQU_T.ET_EQU_APOS is
'���߰�װλ��';

comment on column RSBT_EQU_T.ET_EQU_SUM is
'�豸����';

comment on column RSBT_EQU_T.ET_EQU_EUSE is
'�����Ч��';

comment on column RSBT_EQU_T.ET_EQU_FNTVAL is
'Ƶ�ʼ��';

comment on column RSBT_EQU_T.ET_EQU_PUP is
'��������ʱ��';

comment on column RSBT_EQU_T.ET_EQU_PDN is
'�����½�ʱ��';

comment on column RSBT_EQU_T.ET_EQU_CHRIP is
'Chirp���';

comment on column RSBT_EQU_T.ET_EQU_PWID1 is
'������1';

comment on column RSBT_EQU_T.ET_EQU_PWID2 is
'������2';

comment on column RSBT_EQU_T.ET_EQU_PR is
'�����ظ�����';

comment on column RSBT_EQU_T.ET_EQU_PF is
'�����ظ�Ƶ��';

comment on column RSBT_EQU_T.ET_EQU_RF is
'Ӧ��������Ƶ��';

comment on column RSBT_EQU_T.ET_EQU_RF_BAND is
'Ӧ��������Ĵ���';

comment on column RSBT_EQU_T.ET_EQU_SEN is
'���ջ�������';

comment on column RSBT_EQU_T.ET_EQU_SENU is
'���ջ������ȵ�λ';

comment on column RSBT_EQU_T.ET_EQU_SENERR is
'���ջ������ȶ�Ӧ��������ָ��';

comment on column RSBT_EQU_T.ET_EQU_RWID is
'���ջ���Ƶ����';

comment on column RSBT_EQU_T.ET_EQU_MT is
'���Ʒ�ʽ';

comment on column RSBT_EQU_T.ET_EQU_CCODE is
'������';

comment on column RSBT_EQU_T.ET_EQU_UPU is
'���з��书��/�ŵ��ĵ�λ';

comment on column RSBT_EQU_T.ET_EQU_DNU is
'���з��书��/�ŵ��ĵ�λ';

comment on column RSBT_EQU_T.ET_EQU_TYPE is
'�豸���';

comment on column RSBT_EQU_T.ET_EQU_USE is
'ʹ�÷�ʽ';

comment on column RSBT_EQU_T.ET_EQU_POW_MAX is
'��ֵ����';

comment on column RSBT_EQU_T.ET_EQU_POW_AVG is
'ƽ������';

comment on column RSBT_EQU_T.ET_EQU_UPOW is
'���з��书��';

comment on column RSBT_EQU_T.ET_EQU_DPOW is
'���з��书��';

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
'����������ϰ������ݴ�����';

comment on column RSBT_E_SE.GUID is
'����';

comment on column RSBT_E_SE.STATION_GUID is
'����վGUID';

comment on column RSBT_E_SE.SE_COMM is
'��λ��';

comment on column RSBT_E_SE.SE_ANGLE is
'���������';

comment on column RSBT_E_SE.SE_DIS is
'�ϰ������';

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
'���ߵ�̨(��)��Ƚɷ���Ϣ��';

comment on column RSBT_FEEEVERYYEAR.GUID is
'����';

comment on column RSBT_FEEEVERYYEAR.ORG_GUID is
'�ɷѵ�λGUID';

comment on column RSBT_FEEEVERYYEAR.NET_GUID is
'�ɷ�ͨ����';

comment on column RSBT_FEEEVERYYEAR.STATION_GUID is
'�ɷ�̨վ';

comment on column RSBT_FEEEVERYYEAR.FEE_TYPE is
'�ɷ�����';

comment on column RSBT_FEEEVERYYEAR.FEE_SUM is
'Ƶռ���շѽ��';

comment on column RSBT_FEEEVERYYEAR.FEE_DERATE_PROPORTION is
'�������';

comment on column RSBT_FEEEVERYYEAR.FEE_DERATE_ACCORDING is
'��������';

comment on column RSBT_FEEEVERYYEAR.FEE_START_DATE is
'���ü�����ʼ����';

comment on column RSBT_FEEEVERYYEAR.FEE_END_DATE is
'���ü�����ֹ����';

comment on column RSBT_FEEEVERYYEAR.FEE_PAY_MONTH is
'�ɷ��·�';

comment on column RSBT_FEEEVERYYEAR.FEE_OPERATION is
'������';

comment on column RSBT_FEEEVERYYEAR.FEE_OPERATION_DATE is
'����ʱ��';

comment on column RSBT_FEEEVERYYEAR.FEE_AUDIT is
'�����';

comment on column RSBT_FEEEVERYYEAR.FEE_AUDIT_DATE is
'���ʱ��';

comment on column RSBT_FEEEVERYYEAR.MEMO is
'��ע';

/*==============================================================*/
/* Table: RSBT_FEERECORD                                        */
/*==============================================================*/
create table RSBT_FEERECORD 
(
   GUID                 VARCHAR2 (36)        not null,
   FEE_GUID             VARCHAR2 (36),
   FEE_TIME             DATE                 not null,
   FEE_YEAR             NUMBER (4)           not null,
   FEE_SUM              NUMBER(11��2)         not null,
   FEE_LATE             NUMBER(11��2),
   constraint PK_RSBT_FEERECORD primary key (GUID)
)
tablespace "3100_STATDB";

comment on table RSBT_FEERECORD is
'���ߵ�̨(��)�ɷѼ�¼��';

comment on column RSBT_FEERECORD.GUID is
'����';

comment on column RSBT_FEERECORD.FEE_GUID is
'�ɷ���Ŀ';

comment on column RSBT_FEERECORD.FEE_TIME is
'�ɷ�ʱ��';

comment on column RSBT_FEERECORD.FEE_YEAR is
'�ɷ����';

comment on column RSBT_FEERECORD.FEE_SUM is
'�ɷѽ��';

comment on column RSBT_FEERECORD.FEE_LATE is
'�������ɽ�����';

/*==============================================================*/
/* Table: RSBT_FEESTANDERD                                      */
/*==============================================================*/
create table RSBT_FEESTANDERD 
(
   ITEM_CODE            VARCHAR2 (10)        not null,
   ITEM_NAME            VARCHAR2 (100)       not null,
   ITEM_TYPE            VARCHAR2 (10)        not null,
   TYPE_NAME            VARCHAR2 (30)        not null,
   FEE_PAY              NUMBER(11��2)         not null,
   COUNT_MODE           VARCHAR2 (30)        not null,
   SET_DATE             DATE,
   MEMO                 VARCHAR2 (512),
   constraint PK_RSBT_FEESTANDERD primary key (ITEM_CODE)
)
tablespace "3100_STATDB";

comment on table RSBT_FEESTANDERD is
'���ߵ�̨(��)�ɷѱ�׼��';

comment on column RSBT_FEESTANDERD.ITEM_CODE is
'�ɷ���Ŀ���';

comment on column RSBT_FEESTANDERD.ITEM_NAME is
'�ɷ���Ŀ����';

comment on column RSBT_FEESTANDERD.ITEM_TYPE is
'�ɷ��������';

comment on column RSBT_FEESTANDERD.TYPE_NAME is
'�ɷ���������';

comment on column RSBT_FEESTANDERD.FEE_PAY is
'�ɷ�����';

comment on column RSBT_FEESTANDERD.COUNT_MODE is
'�Ʒѷ�ʽ';

comment on column RSBT_FEESTANDERD.SET_DATE is
'�ɷѱ�׼�趨ʱ��';

comment on column RSBT_FEESTANDERD.MEMO is
'��ע';

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
'�ɷѵ�λ�ɷѼ�¼��';

comment on column RSBT_FEEUNITRECORD.GUID is
'����';

comment on column RSBT_FEEUNITRECORD.ORG_GUID is
'�ɷѵ�λ';

comment on column RSBT_FEEUNITRECORD.FEE_TIME is
'�ɷ�����';

comment on column RSBT_FEEUNITRECORD.FEE_YEAR is
'�ɷ����';

comment on column RSBT_FEEUNITRECORD.FEE_BILL is
'Ӧ���ܷ���';

comment on column RSBT_FEEUNITRECORD.FEE_PAYMENT is
'ʵ���ܷ���';

comment on column RSBT_FEEUNITRECORD.FEE_FREQ is
'���н���Ƶռ�ѽ��';

comment on column RSBT_FEEUNITRECORD.FEE_ELSE is
'�����������ý��';

comment on column RSBT_FEEUNITRECORD.FEE_LATE is
'�������ɽ�����';

comment on column RSBT_FEEUNITRECORD.FEE_BILL_CODE is
'�ɷѵ��ݺ���';

comment on column RSBT_FEEUNITRECORD.FEE_OPERATION is
'����Ա';

comment on column RSBT_FEEUNITRECORD.MEMO is
'��ע';

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
'�ɷѵ�λ�߽ɼ�¼��';

comment on column RSBT_FEEURGENCYRECORD.GUID is
'����';

comment on column RSBT_FEEURGENCYRECORD.ORG_GUID is
'�ɷѵ�λ';

comment on column RSBT_FEEURGENCYRECORD.FEE_URGENCY_TIME is
'�߽�ʱ��';

comment on column RSBT_FEEURGENCYRECORD.FEE_YEAR is
'�ɷ����';

comment on column RSBT_FEEURGENCYRECORD.FEE_BILL is
'Ӧ���ܷ���';

comment on column RSBT_FEEURGENCYRECORD.FEE_URGENCY_MODE is
'�߽ɷ�ʽ ';

comment on column RSBT_FEEURGENCYRECORD.FEE_URGENCY_OPERATION is
'�߽ɲ�����Ա';

comment on column RSBT_FEEURGENCYRECORD.FEE_URGENCY_PERSON is
'�߽ɵ�λ��ϵ��';

comment on column RSBT_FEEURGENCYRECORD.FEE_URGENCY_FILE_CODE is
'�߽��ļ����';

comment on column RSBT_FEEURGENCYRECORD.MEMO is
'��ע';

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
'���ߵ�̨(վ)�շѼ������ݱ�';

comment on column RSBT_FEE_DERATE.GUID is
'����';

comment on column RSBT_FEE_DERATE.NAME is
'������������';

comment on column RSBT_FEE_DERATE.PROPORTION is
'������������ܴ���1ͬʱҲ����С��0';

comment on column RSBT_FEE_DERATE.DESCRIPTION is
'������������';

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
'���ߵ�̨(վ)Ƶ�ʱ�';

comment on column RSBT_FREQ.GUID is
'����';

comment on column RSBT_FREQ.STATION_GUID is
'RSBT_ STATION';

comment on column RSBT_FREQ.FREQ_TYPE is
'��(��)���������ͣ��Σ�����';

comment on column RSBT_FREQ.FREQ_LC is
'����Ƶ��(��Ƶ)';

comment on column RSBT_FREQ.FREQ_UC is
'����Ƶ��(��Ƶ)';

comment on column RSBT_FREQ.FREQ_EFB is
'����Ƶ������';

comment on column RSBT_FREQ.FREQ_EFE is
'����Ƶ������';

comment on column RSBT_FREQ.FREQ_E_BAND is
'����(��Ҫ)����';

comment on column RSBT_FREQ.FREQ_RFB is
'����Ƶ������';

comment on column RSBT_FREQ.FREQ_RFE is
'����Ƶ������';

comment on column RSBT_FREQ.FREQ_R_BAND is
'����(��Ҫ)����';

comment on column RSBT_FREQ.FREQ_MOD is
'���Ʒ�ʽ';

comment on column RSBT_FREQ.FREQ_MB is
'��/����Ƶ�ʱ�ʶ';

comment on column RSBT_FREQ.FREQ_CODE is
'����Ƶ�����ݿ��Ӧ��';

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
   FT_FREQ_HCL          VARCHAR2��20��,
   FT_FREQ_TYPE         VARCHAR2 (1),
   FT_FREQ_MC           VARCHAR2��8��,
   FT_FREQ_MC1          VARCHAR2 (20),
   FT_FREQ_MC2          VARCHAR2��20��,
   FT_FREQ_MC3          VARCHAR2��20��,
   FT_FREQ_CCODE        VARCHAR2 (20),
   FT_FREQ_CSGN         VARCHAR2 (20),
   FT_FREQ_DUPDN        VARCHAR2��1��,
   FT_FREQ_UNIT_TYPE    VARCHAR2��8��,
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
'���ߵ�̨��վ��Ƶ�������';

comment on column RSBT_FREQ_T.GUID is
'RSBT_FREQ';

comment on column RSBT_FREQ_T.FT_FREQ_NO is
'Ƶ�����';

comment on column RSBT_FREQ_T.FT_FREQ_TIMEB is
'����ʱ����';

comment on column RSBT_FREQ_T.FT_FREQ_TIMEE is
'����ʱ��ֹ';

comment on column RSBT_FREQ_T.FT_FREQ_INFO_TYPE is
'������Ϣ����';

comment on column RSBT_FREQ_T.FT_FREQ_HCL is
'����';

comment on column RSBT_FREQ_T.FT_FREQ_TYPE is
'�������/�ŵ�����';

comment on column RSBT_FREQ_T.FT_FREQ_MC is
'������������';

comment on column RSBT_FREQ_T.FT_FREQ_MC1 is
'��������1';

comment on column RSBT_FREQ_T.FT_FREQ_MC2 is
'��������2';

comment on column RSBT_FREQ_T.FT_FREQ_MC3 is
'��������3';

comment on column RSBT_FREQ_T.FT_FREQ_CCODE is
'������';

comment on column RSBT_FREQ_T.FT_FREQ_CSGN is
'������ʶ��';

comment on column RSBT_FREQ_T.FT_FREQ_DUPDN is
'ֱ��վ������/���б�ʶ';

comment on column RSBT_FREQ_T.FT_FREQ_UNIT_TYPE is
'Ƶ�ʵ�λ';

comment on column RSBT_FREQ_T.FT_FREQ_FEP is
'���伫����ʽ';

comment on column RSBT_FREQ_T.FT_FREQ_FRP is
'���ռ�����ʽ';

comment on column RSBT_FREQ_T.FT_FREQ_EPOW is
'���书��W';

comment on column RSBT_FREQ_T.FT_FREQ_POWFLAG is
'���ʱ�ʶ';

comment on column RSBT_FREQ_T.FT_FREQ_EIRP is
'EIRPֵ';

comment on column RSBT_FREQ_T.FT_FREQ_POW_MAX is
'��ֵ����';

comment on column RSBT_FREQ_T.FT_FREQ_POW_AVG is
'ƽ������';

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
'̨(վ)ִ�ձ�';

comment on column RSBT_LICENSE.GUID is
'����';

comment on column RSBT_LICENSE.STATION_GUID is
'̨վGUID';

comment on column RSBT_LICENSE.APP_CODE is
'�������';

comment on column RSBT_LICENSE.STAT_TDI is
'���������걨����';

comment on column RSBT_LICENSE.STAT_APP_TYPE is
'���������걨������';

comment on column RSBT_LICENSE.LICENSE_TYPE is
'ִ������';

comment on column RSBT_LICENSE.LICENSE_CODE is
'ִ�պ�';

comment on column RSBT_LICENSE.LICENSE_ORG_NAME is
'ִ�յ�λ����';

comment on column RSBT_LICENSE.LICENSE_MANAGER is
'�˷���λ����';

comment on column RSBT_LICENSE.LICENSE_DATE_B is
'ִ����Ч����';

comment on column RSBT_LICENSE.LICENSE_DATE_E is
'ִ����Ч��ֹ';

comment on column RSBT_LICENSE.LICENSE_DATE is
'��֤ʱ��';

comment on column RSBT_LICENSE.MEMO is
'��ע';

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
'���ߵ�̨(վ)��·��';

comment on column RSBT_LINK.GUID is
'����
����
����';

comment on column RSBT_LINK.NET_GUID_A is
'RSBT_ NET
RSBT_ NET
RSBT_NET';

comment on column RSBT_LINK.STATION_GUID_A is
'̨վAGUID';

comment on column RSBT_LINK.GUID_EAF_A is
'�豸Ƶ�������������� GUID';

comment on column RSBT_LINK.NET_GUID_B is
'RSBT_ NET';

comment on column RSBT_LINK.STATION_GUID_B is
'̨վBGUID';

comment on column RSBT_LINK.GUID_EAF_B is
'�豸Ƶ�������������� GUID';

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
'���ߵ�̨(վ)�������ݱ�';

comment on column RSBT_NET.GUID is
'����';

comment on column RSBT_NET.ORG_GUID is
'���뵥λGUID';

comment on column RSBT_NET.FEE_GUID is
'�ɷѵ�λGUID';

comment on column RSBT_NET.ORG_CODE is
'���ߵ���������֯��������';

comment on column RSBT_NET.NET_NAME is
'���ߵ�ϵͳ/��������';

comment on column RSBT_NET.NET_SVN is
'ͨ��ҵ��/ϵͳ����';

comment on column RSBT_NET.NET_SP is
'ҵ������';

comment on column RSBT_NET.NET_TS is
'��������';

comment on column RSBT_NET.NET_BAND is
'�ŵ�����/�������';

comment on column RSBT_NET.NET_AREA is
'ʹ�÷�Χ';

comment on column RSBT_NET.NET_USE is
'������;';

comment on column RSBT_NET.NET_SAT_NAME is
'����/��������';

comment on column RSBT_NET.NET_LG is
'��ƹ������';

comment on column RSBT_NET.NET_START_DATE is
'��������';

comment on column RSBT_NET.NET_CONFIRM_DATE is
'��׼����';

comment on column RSBT_NET.NET_EXPIRED_DATE is
'��������';

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
'��֯������';

comment on column RSBT_ORG.ORG_CODE is
'��֯��������';

comment on column RSBT_ORG.ORG_NAME is
'��֯��������';

comment on column RSBT_ORG.ORG_AREA_CODE is
'��������';

comment on column RSBT_ORG.ORG_SYS_CODE is
'ϵͳ/��ҵ����';

comment on column RSBT_ORG.ORG_TYPE is
'��λ����';

comment on column RSBT_ORG.ORG_LINK_PERSON is
'��λ��ϵ��';

comment on column RSBT_ORG.ORG_PERSON_ID is
'��ϵ�����֤����';

comment on column RSBT_ORG.ORG_SUP_CODE is
'�ϼ���֯��������';

comment on column RSBT_ORG.ORG_ADDR is
'��֯������ַ';

comment on column RSBT_ORG.ORG_POST is
'��֯�����ʱ�';

comment on column RSBT_ORG.ORG_PHONE is
'��ϵ�绰';

comment on column RSBT_ORG.ORG_MOB_PHONE is
'�ֻ�����';

comment on column RSBT_ORG.ORG_FAX is
'��֯��������';

comment on column RSBT_ORG.ORG_BANK is
'��������';

comment on column RSBT_ORG.ORG_ACCOUNT_NAME is
'�˻�����';

comment on column RSBT_ORG.ORG_ACCOUNT is
'�����ʺ�';

comment on column RSBT_ORG.ORG_HOSTILITY is
'��̨��λ����';

comment on column RSBT_ORG.ORG_WEB_SITE is
'��ַ';

comment on column RSBT_ORG.ORG_MAIL is
'��������';

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
'���ߵ�̨(վ)��';

comment on column RSBT_STATION.GUID is
'����';

comment on column RSBT_STATION.NET_GUID is
'RSBT_ NET';

comment on column RSBT_STATION.ORG_CODE is
'���ߵ���������֯���� ����';

comment on column RSBT_STATION.APP_CODE is
'���ߵ�̨(վ)�������';

comment on column RSBT_STATION.STAT_APP_TYPE is
'���������걨������';

comment on column RSBT_STATION.STAT_TDI is
'���������걨����';

comment on column RSBT_STATION.STAT_NAME is
'���ߵ�̨վ����';

comment on column RSBT_STATION.STAT_ADDR is
'���ߵ�̨վ��ַ';

comment on column RSBT_STATION.STAT_AREA_CODE is
'���ߵ�̨վ���ڵص�������';

comment on column RSBT_STATION.STAT_TYPE is
'̨վ���';

comment on column RSBT_STATION.STAT_WORK is
'������ʽ';

comment on column RSBT_STATION.STAT_STATUS is
'̨վ״̬';

comment on column RSBT_STATION.STAT_EQU_SUM is
'(̨վ��)�豸����';

comment on column RSBT_STATION.STAT_LG is
'̨վ����(����Ϊ����)';

comment on column RSBT_STATION.STAT_LA is
'̨վγ��(��γΪ����)';

comment on column RSBT_STATION.STAT_AT is
'���θ߶�';

comment on column RSBT_STATION.STAT_DATE_START is
'��������';

comment on column RSBT_STATION.MEMO is
'Э�����ܲ��ţ�����Э���͵Ǽ����ϴ��������';

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
'���ߵ�̨վ��ܼ�¼��';

comment on column RSBT_STATIONSUPERVISIONRECORD.GUID is
'����';

comment on column RSBT_STATIONSUPERVISIONRECORD.STATION_GUID is
'RSBT_ STATION';

comment on column RSBT_STATIONSUPERVISIONRECORD.STATION_ILLEGAL_TIME is
'̨վΥ�漰�ܸ���ʱ��';

comment on column RSBT_STATIONSUPERVISIONRECORD.STATION_ILLEGAL_MODE is
'̨վΥ�漰�ܸ������';

comment on column RSBT_STATIONSUPERVISIONRECORD.STATION_SUPERVISION_STATUS is
'̨վ���״̬';

comment on column RSBT_STATIONSUPERVISIONRECORD.STATION_ILLEGAL_DATE is
'̨վΥ�����';

comment on column RSBT_STATIONSUPERVISIONRECORD.STATION_ILLEGAL_DATE_U is
'Υ�������λ';

comment on column RSBT_STATIONSUPERVISIONRECORD.STATION_ILLEGAL_LG is
'Υ��̨վ����';

comment on column RSBT_STATIONSUPERVISIONRECORD.STATION_ILLEGAL_LA is
'Υ��̨վγ��';

comment on column RSBT_STATIONSUPERVISIONRECORD.STATION_ILLEGAL_EQUMODE is
'Υ���豸�ͺ�';

comment on column RSBT_STATIONSUPERVISIONRECORD.STATION_PUNISH_TIME is
'Υ��鴦ʱ��';

comment on column RSBT_STATIONSUPERVISIONRECORD.STATION_PUNISH_RESULT is
'Υ��鴦���';

comment on column RSBT_STATIONSUPERVISIONRECORD.MEMO is
'��ע';

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
'���ߵ�̨վ�������վ������';

comment on column RSBT_STATION_MONITOR.GUID is
'����';

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
'���ߵ�̨��վ��̨վ�����';

comment on column RSBT_STATION_T.GUID is
'RSBT_ STATION';

comment on column RSBT_STATION_T.ST_TIME_B is
'����ʱ����';

comment on column RSBT_STATION_T.ST_TIME_E is
'����ʱ��ֹ';

comment on column RSBT_STATION_T.ST_LMMTR is
'�Ƿ������ʽ��̨';

comment on column RSBT_STATION_T.ST_USER_AREA is
'ʹ������';

comment on column RSBT_STATION_T.ST_TF_CODE is
'վ����';

comment on column RSBT_STATION_T.ST_TF_TRANS_CA_PU is
'����������λ';

comment on column RSBT_STATION_T.ST_TF_TRANS_CA_P is
'��������ֵ';

comment on column RSBT_STATION_T.ST_E_NET_CODE is
'������';

comment on column RSBT_STATION_T.ST_E_MULTI_ADDR is
'��ַ��ʽ';

comment on column RSBT_STATION_T.ST_E_COM_AREA is
'ͨ�ŷ�Χ';

comment on column RSBT_STATION_T.ST_POS_TYPE is
'λ������';

comment on column RSBT_STATION_T.ST_E_POS is
'λ�����ͣ�ֵ��';

comment on column RSBT_STATION_T.ST_E_SAT is
'�ռ��̨������������';

comment on column RSBT_STATION_T.ST_E_LG is
'��ƹ������';

comment on column RSBT_STATION_T.ST_B_SGN is
'̨��';

comment on column RSBT_STATION_T.ST_B_LEVEL is
'̨վ����';

comment on column RSBT_STATION_T.ST_B_BM is
'�㲥��ʽ';

comment on column RSBT_STATION_T.ST_B_EDU is
'�Ƿ����̨';

comment on column RSBT_STATION_T.ST_B_IC is
'�Ƿ��ת̨';

comment on column RSBT_STATION_T.ST_B_COVER_AREA is
'��������';

comment on column RSBT_STATION_T.ST_SHIP_TYPE is
'��������';

comment on column RSBT_STATION_T.ST_CALL_SIGN is
'����';

comment on column RSBT_STATION_T.ST_S_MMSI is
'MMSI��';

comment on column RSBT_STATION_T.ST_S_CS is
'�����ǼǺ�';

comment on column RSBT_STATION_T.ST_SHIP_NAME is
'��������';

comment on column RSBT_STATION_T.ST_S_PN is
'��������';

comment on column RSBT_STATION_T.ST_S_AAIC is
'��������������';

comment on column RSBT_STATION_T.ST_S_T is
'�ܶ�λ';

comment on column RSBT_STATION_T.ST_S_P is
'�ܹ���';

comment on column RSBT_STATION_T.ST_A_MODEL is
'�������ͺ�';

comment on column RSBT_STATION_T.ST_A_TYPE is
'����������';

comment on column RSBT_STATION_T.ST_A_CALL is
'ѡ���򱨺�';

comment on column RSBT_STATION_T.ST_A_CALL_OI is
'���Ż�������ʶ';

comment on column RSBT_STATION_T.ST_A_SGN is
'������ʶ����';

comment on column RSBT_STATION_T.ST_A_ST is
'����������';

comment on column RSBT_STATION_T.ST_A_PILOTING is
'�Ƿ񰴵ر����';

comment on column RSBT_STATION_T.ST_A_NRM is
'������ע�����';

comment on column RSBT_STATION_T.ST_R_WAMIN is
'������λ����Сֵ';

comment on column RSBT_STATION_T.ST_R_WAMAX is
'������λ�����ֵ';

comment on column RSBT_STATION_T.ST_R_EMIN is
'��������Сֵ';

comment on column RSBT_STATION_T.ST_R_EMAX is
'���������ֵ';

comment on column RSBT_STATION_T.ST_C_CODE is
'��վ���(Ψһ��';

comment on column RSBT_STATION_T.ST_C_SUM is
'��������';

comment on column RSBT_STATION_T.ST_SERV_R is
'����뾶';

comment on column RSBT_STATION_T.ST_D_TEC_TYPE is
'��������';

comment on column RSBT_STATION_T.ST_D_TYPE is
'ֱ��վ����';

comment on column RSBT_STATION_T.ST_ME_SAT_NAME is
'�����ƶ�ͨ��ϵͳ����';

comment on column RSBT_STATION_T.ST_ME_STA1 is
'�ؿ�վ����1';

comment on column RSBT_STATION_T.ST_ME_STA2 is
'�ؿ�վ����2';

comment on column RSBT_STATION_T.ST_ME_STA3 is
'�ؿ�վ����3  ';

comment on column RSBT_STATION_T.ST_ME_STYPE is
'����/����';

comment on column RSBT_STATION_T.ST_ME_NAME1 is
'�ռ��̨(����)����1';

comment on column RSBT_STATION_T.ST_ME_NAME2 is
'�ռ��̨(����)����2';

comment on column RSBT_STATION_T.ST_ME_LG1 is
'��ƹ������1';

comment on column RSBT_STATION_T.ST_ME_LG2 is
'��ƹ������2 ';

comment on column RSBT_STATION_T.ST_ME_FBAND is
'ʹ���ܴ���';

comment on column RSBT_STATION_T.ST_B_TYPE1 is
'�㲥��̨̨վ���1';

comment on column RSBT_STATION_T.ST_B_TYPE2 is
'�㲥��̨̨վ���2';

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
'ͨ�Ŷ�����걨��ţ���H�ã�';

comment on column RSBT_ST_COBJ.GUID is
'����';

comment on column RSBT_ST_COBJ.STATION_GUID is
'���RSBT_STATION';

comment on column RSBT_ST_COBJ.OBJ_TYPE is
'ͨ�Ŷ�������';

comment on column RSBT_ST_COBJ.OBJ_NAME is
'�����Ż�����';

comment on column RSBT_ST_COBJ.OBJ_TDI is
'�������ϱ��';

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
