/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     2016/9/9 14:08:44                            */
/*==============================================================*/


alter table AR_ATTACHMENT
   drop constraint FK_AR_ATTAC_REFERENCE_AR_APPLY;

alter table AR_EQU
   drop constraint FK_AR_EQU_REFERENCE_AR_STATI;

alter table AR_EQU_POW
   drop constraint FK_AR_EQU_P_REFERENCE_AR_EQU;

alter table AR_STATION
   drop constraint FK_AR_STATI_REFERENCE_AR_APPLY;

alter table AR_UNIT
   drop constraint FK_AR_UNIT_REFERENCE_AR_APPLY;

alter table AR_USER
   drop constraint FK_AR_USER_REFERENCE_AR_APPLY;

alter table WF_CREDIT
   drop constraint FK_WF_CREDI_REFERENCE_WF_UNIT;

alter table WF_CREDIT
   drop constraint FK_WF_CREDI_REFERENCE_WF_USER;

alter table WF_DETECTION_ATTECH
   drop constraint FK_WF_DETEC_REFERENCE_WF_DETEC;

alter table WF_DISTURB
   drop constraint FK_WF_DISTU_REFERENCE_WF_MONIT;

alter table WF_DISTURB
   drop constraint FK_WF_DISTU_REFERENCE_WF_INVES;

alter table WF_DISTURB
   drop constraint FK_WF_DISTU_REFERENCE_WF_UNIT;

alter table WF_DISTURB_ATTECH
   drop constraint FK_WF_DISTU_REFERENCE_WF_DISTU;

alter table WF_INV_ATTACH
   drop constraint FK_WF_INV_A_REFERENCE_WF_INVES;

alter table WF_LEDGER
   drop constraint FK_WF_LEDGE_REFERENCE_WF_LETTE;

alter table WF_LEDGER
   drop constraint FK_WF_LEDGE_REFERENCE_WF_UNIT;

alter table WF_LEDGER
   drop constraint FK_WF_LEDGE_REFERENCE_WF_USER;

alter table WF_LETTER
   drop constraint FK_WF_LETTE_REFERENCE_WF_SUPV;

alter table WF_MONIT_ATTACH
   drop constraint FK_WF_MONIT_REFERENCE_WF_MONIT;

alter table WF_SUPV_ATTACH
   drop constraint FK_WF_SUPV__REFERENCE_WF_SUPV;

drop table AR_APPLY cascade constraints;

drop table AR_ATTACHMENT cascade constraints;

drop table AR_CALL_SIGN cascade constraints;

drop table AR_DIC cascade constraints;

drop table AR_EQU cascade constraints;

drop table AR_EQU_POW cascade constraints;

drop table AR_STATION cascade constraints;

drop table AR_STATION_EXT cascade constraints;

drop table AR_UNIT cascade constraints;

drop table AR_USER cascade constraints;

drop table WF_CREDIT cascade constraints;

drop table WF_DETECTION cascade constraints;

drop table WF_DETECTION_ATTECH cascade constraints;

drop table WF_DISTURB cascade constraints;

drop table WF_DISTURB_ATTECH cascade constraints;

drop table WF_INVESTIGATE cascade constraints;

drop table WF_INV_ATTACH cascade constraints;

drop table WF_LEDGER cascade constraints;

drop table WF_LETTER cascade constraints;

drop table WF_MONIT cascade constraints;

drop table WF_MONIT_ATTACH cascade constraints;

drop table WF_PUNISH cascade constraints;

drop table WF_QUALIFICATION cascade constraints;

drop table WF_SUPV cascade constraints;

drop table WF_SUPV_ATTACH cascade constraints;

drop table WF_UNION cascade constraints;

drop table WF_UNIT cascade constraints;

drop table WF_USER cascade constraints;

/*==============================================================*/
/* Table: AR_APPLY                                              */
/*==============================================================*/
create table AR_APPLY 
(
   APPLY_ID             VARCHAR2(36)         not null,
   APP_CODE             VARCHAR2(20)         not null,
   AREA_CODE            VARCHAR2(10)         not null,
   APP_ITEM             VARCHAR2(1 BYTE)     not null,
   APP_SUBJECT          VARCHAR2(1 BYTE)     not null,
   STAT_CLASS           VARCHAR2(1 BYTE)     not null,
   SPECIAL_EXPLAIN      VARCHAR2(50 BYTE),
   STAT_NAME            VARCHAR2(50 BYTE),
   STAT_SCOPE           VARCHAR2(1 BYTE)     not null,
   STAT_SPECIAL         VARCHAR2(100 BYTE),
   STAT_TYPE            VARCHAR2(1 BYTE),
   CALLSIGN_OLD         VARCHAR2(20 BYTE),
   LEVEL_OLD            VARCHAR2(1 BYTE),
   OTHERINFO            VARCHAR2(300 BYTE),
   MEMO                 VARCHAR2(300 BYTE),
   APP_DATE             DATE                 not null,
   LASTMODIFY           DATE                 not null,
   constraint PK_AR_APPLY primary key (APPLY_ID)
);

comment on table AR_APPLY is
'ҵ�����ߵ�̨վ���������';

comment on column AR_APPLY.APPLY_ID is
'����ID       ';

comment on column AR_APPLY.APP_CODE is
'�������';

comment on column AR_APPLY.AREA_CODE is
'�����������';

comment on column AR_APPLY.APP_ITEM is
'������Ŀ   ��������ҵ������  0 ����/1 ���������Ϣ/ 2�����̨����/3�����̨��������';

comment on column AR_APPLY.APP_SUBJECT is
'�����������    ҵ���̨���������0����/1��λ ';

comment on column AR_APPLY.STAT_CLASS is
' ̨վ����    �����ҵ��̨վ���� ��0һ��/1����';

comment on column AR_APPLY.SPECIAL_EXPLAIN is
'����̨վ��������      STAT_CLASS�ֶ�Ϊ1ʱ�����ֶδ�����������˵��';

comment on column AR_APPLY.STAT_NAME is
'̨վ����';

comment on column AR_APPLY.STAT_SCOPE is
'��ͨ�ŷ�Χ     0  ʡ����������ֱϽ��/1 ��������������ʡ����λ������';

comment on column AR_APPLY.STAT_SPECIAL is
'����̨վ˵��';

comment on column AR_APPLY.STAT_TYPE is
'�����̨���      ȡֵ  A/ B/ C';

comment on column AR_APPLY.CALLSIGN_OLD is
'ԭָ�����';

comment on column AR_APPLY.LEVEL_OLD is
'ԭ������������      ȡֵ  A/ B/ C';

comment on column AR_APPLY.OTHERINFO is
'��������˵��';

comment on column AR_APPLY.MEMO is
'��˱�ע';

comment on column AR_APPLY.APP_DATE is
'����ʱ��';

comment on column AR_APPLY.LASTMODIFY is
'�����ʱ��';

/*==============================================================*/
/* Table: AR_ATTACHMENT                                         */
/*==============================================================*/
create table AR_ATTACHMENT 
(
   FILE_ID              VARCHAR2(36)         not null,
   APPLY_ID             VARCHAR2(36)         not null,
   FILE_TYPE            VARCHAR2(1)          not null,
   CONTENT              BLOB,
   FILENAME             VARCHAR2(200),
   constraint PK_FILE_ID primary key (FILE_ID)
);

comment on table AR_ATTACHMENT is
'�������ʸ�����';

comment on column AR_ATTACHMENT.FILE_ID is
'����';

comment on column AR_ATTACHMENT.APPLY_ID is
'�����ID';

comment on column AR_ATTACHMENT.FILE_TYPE is
'��������  0�������֤��/1��̨��λ֤������/2��λ���������֤��/3�������������֤��/4������������֤��';

comment on column AR_ATTACHMENT.CONTENT is
'��������';

comment on column AR_ATTACHMENT.FILENAME is
'��������';

/*==============================================================*/
/* Table: AR_CALL_SIGN                                          */
/*==============================================================*/
create table AR_CALL_SIGN 
(
   CALL_SIGN_ID         VARCHAR2(10)         not null,
   AREA_CODE            VARCHAR2(10)         not null,
   CALL_SIGN_STATUS     VARCHAR2(1)          not null,
   SET_TIME             DATE,
   END_TIME             DATE,
   ACTIVATE_TIME        DATE,
   MEMO                 VARCHAR2(100),
   constraint PK_AR_CALL_SIGN primary key (CALL_SIGN_ID)
);

comment on table AR_CALL_SIGN is
'������Դ��';

comment on column AR_CALL_SIGN.CALL_SIGN_ID is
'���ű�ţ����ţ�';

comment on column AR_CALL_SIGN.AREA_CODE is
'�����������';

comment on column AR_CALL_SIGN.CALL_SIGN_STATUS is
'����״̬    0 δָ��/1  ��ռ��/2  Ԥ��/3 ����/4  ע��/5  ��ʡռ��/6  ��ʱָ��';

comment on column AR_CALL_SIGN.SET_TIME is
'ָ��ʱ��';

comment on column AR_CALL_SIGN.END_TIME is
'����ʱ��';

comment on column AR_CALL_SIGN.ACTIVATE_TIME is
'���յ���ʱ��';

comment on column AR_CALL_SIGN.MEMO is
'��ע';

/*==============================================================*/
/* Table: AR_DIC                                                */
/*==============================================================*/
create table AR_DIC 
(
   CO                   NUMBER               not null,
   CN                   VARCHAR2(10)         not null,
   CODE_CHI_NAME        VARCHAR2(80)         not null,
   CODE_DATA_TYPE       VARCHAR2(8)          not null,
   CODE_TYPE_CHI_NAME   VARCHAR2(80),
   CODE_DISCN           NUMBER,
   constraint PK_CO primary key (CO)
);

comment on table AR_DIC is
'ҵ��̨վ�ֵ��';

comment on column AR_DIC.CO is
'���';

comment on column AR_DIC.CN is
'������';

comment on column AR_DIC.CODE_CHI_NAME is
'������������';

comment on column AR_DIC.CODE_DATA_TYPE is
'�������ݱ�����';

comment on column AR_DIC.CODE_TYPE_CHI_NAME is
'�������ݱ�������������';

comment on column AR_DIC.CODE_DISCN is
'��ʾ���';

/*==============================================================*/
/* Table: AR_EQU                                                */
/*==============================================================*/
create table AR_EQU 
(
   EQU_ID               VARCHAR2(36)         not null,
   SYS_ID               VARCHAR2(36)         not null,
   EQU_MODEL            VARCHAR2(40)         not null,
   EQU_MFRS             VARCHAR2(100),
   EQU_CODE             VARCHAR2(40)         not null,
   EQU_SN               VARCHAR2(40)         not null,
   EQU_STATUS           VARCHAR2(1)          not null,
   constraint PK_EQU_ID primary key (EQU_ID)
);

comment on table AR_EQU is
'ҵ�����ߵ�̨վ�豸��';

comment on column AR_EQU.EQU_ID is
'�豸ID';

comment on column AR_EQU.SYS_ID is
'̨վID';

comment on column AR_EQU.EQU_MODEL is
'�豸�ͺ�';

comment on column AR_EQU.EQU_MFRS is
'�豸��������';

comment on column AR_EQU.EQU_CODE is
'�ͺź�׼����';

comment on column AR_EQU.EQU_SN is
'�������';

comment on column AR_EQU.EQU_STATUS is
'�豸״̬';

/*==============================================================*/
/* Table: AR_EQU_POW                                            */
/*==============================================================*/
create table AR_EQU_POW 
(
   INFOID               VARCHAR2(36)         not null,
   EQU_ID               VARCHAR2(36)         not null,
   POW_TYPE             VARCHAR2(1)          not null,
   POW_VALUE            NUMBER(13,3)         not null,
   constraint PK_INFOID primary key (INFOID)
);

comment on table AR_EQU_POW is
'�豸���ʹ�ϵ��';

comment on column AR_EQU_POW.INFOID is
'��ϢID';

comment on column AR_EQU_POW.EQU_ID is
'�豸ID';

comment on column AR_EQU_POW.POW_TYPE is
'��������  0 HF����/1  HF/2  50M/3  144M/4 430/5 1240������';

comment on column AR_EQU_POW.POW_VALUE is
'����ֵ';

/*==============================================================*/
/* Table: AR_STATION                                            */
/*==============================================================*/
create table AR_STATION 
(
   APPLY_ID             VARCHAR2(36)         not null,
   CALL_SIGN_ID         VARCHAR2(10),
   AREA_CODE            VARCHAR2(10)         not null,
   STAT_CLASS           VARCHAR2(1)          not null,
   STAT_STATUS          VARCHAR2(1)          not null,
   REP_FREQ_UP          NUMBER(14,7),
   REP_FREQ_DOWN        NUMBER(14,7),
   REP_POW              NUMBER(10,3),
   REP_MOD              VARCHAR2(1),
   REP_DATA_MOD_CLASS   VARCHAR2(1),
   REP_REMOTER_CLASS    VARCHAR2(1),
   AR_MEMO              VARCHAR2(100),
   constraint PK_STATION_APPLY_ID primary key (APPLY_ID)
);

comment on table AR_STATION is
'ҵ�����ߵ�̨վ������Ϣ��';

comment on column AR_STATION.APPLY_ID is
'����ID';

comment on column AR_STATION.CALL_SIGN_ID is
'���ű�ţ����ţ�';

comment on column AR_STATION.AREA_CODE is
'�����������';

comment on column AR_STATION.STAT_CLASS is
'̨վ����';

comment on column AR_STATION.STAT_STATUS is
'̨վ״̬';

comment on column AR_STATION.REP_FREQ_UP is
'�м�̨����Ƶ��';

comment on column AR_STATION.REP_FREQ_DOWN is
'�м�̨����Ƶ��';

comment on column AR_STATION.REP_POW is
'�м�̨���й��� ';

comment on column AR_STATION.REP_MOD is
'���Ʒ�ʽ';

comment on column AR_STATION.REP_DATA_MOD_CLASS is
'���ֵ���ϵͳ����';

comment on column AR_STATION.REP_REMOTER_CLASS is
'ң�ش�ʩ����';

comment on column AR_STATION.AR_MEMO is
'��ע';

/*==============================================================*/
/* Table: AR_STATION_EXT                                        */
/*==============================================================*/
create table AR_STATION_EXT 
(
   SYS_ID               VARCHAR2(36)         not null,
   APPLY_ID             VARCHAR2(36)         not null,
   STAT_SETKIND         VARCHAR2(2),
   SYS_NAME             VARCHAR2(20),
   STAT_ADDR1           VARCHAR2(20),
   STAT_ADDR2           VARCHAR2(20),
   STAT_ADDR3           VARCHAR2(20),
   STAT_ADDR4           VARCHAR2(50),
   STAT_HEIGHT          NUMBER(10,3),
   STAT_LG              NUMBER(10,7),
   STAT_LA              NUMBER(10,7),
   PLATE_NUMBER         VARCHAR2(20),
   constraint PK_SYS_ID primary key (SYS_ID)
);

comment on table AR_STATION_EXT is
'ҵ�����ߵ�̨վ��չ��Ϣ��';

comment on column AR_STATION_EXT.SYS_ID is
'����ID';

comment on column AR_STATION_EXT.APPLY_ID is
'�����ID';

comment on column AR_STATION_EXT.STAT_SETKIND is
'��̨���÷�ʽ';

comment on column AR_STATION_EXT.SYS_NAME is
'��������';

comment on column AR_STATION_EXT.STAT_ADDR1 is
'�̶�̨��ַ��ʡ�ݣ�';

comment on column AR_STATION_EXT.STAT_ADDR2 is
'�̶�̨��ַ���С�����';

comment on column AR_STATION_EXT.STAT_ADDR3 is
'�̶�̨��ַ���أ�';

comment on column AR_STATION_EXT.STAT_ADDR4 is
'�̶�̨��ַ����ϸ��';

comment on column AR_STATION_EXT.STAT_HEIGHT is
'�̶�̨��������㺣�θ߶�';

comment on column AR_STATION_EXT.STAT_LG is
'�������꾭��';

comment on column AR_STATION_EXT.STAT_LA is
'��������γ��';

comment on column AR_STATION_EXT.PLATE_NUMBER is
'��̨���ƺ�';

/*==============================================================*/
/* Table: AR_UNIT                                               */
/*==============================================================*/
create table AR_UNIT 
(
   UNIT_ID              VARCHAR2(36)         not null,
   APPLY_ID             VARCHAR2(36)         not null,
   UNIT_NAME            VARCHAR2(100),
   REG_UNIT             VARCHAR2(100),
   ADDRESS1             VARCHAR2(20),
   ADDRESS2             VARCHAR2(20),
   ADDRESS3             VARCHAR2(20),
   ADDRESS4             VARCHAR2(100),
   UNIT_CODE            VARCHAR2(50),
   UNIT_PHONE           VARCHAR2(40),
   UNIT_FAX             VARCHAR2(40),
   constraint PK_AR_UNIT primary key (UNIT_ID)
);

comment on table AR_UNIT is
'��̨��λ��Ϣ��';

comment on column AR_UNIT.UNIT_ID is
'��̨��λID';

comment on column AR_UNIT.APPLY_ID is
'����ID';

comment on column AR_UNIT.UNIT_NAME is
'��̨��λ����';

comment on column AR_UNIT.REG_UNIT is
'���뵥λ�Ǽǻ���';

comment on column AR_UNIT.ADDRESS1 is
'���뵥λ��ַ��ʡ�ݣ�';

comment on column AR_UNIT.ADDRESS2 is
'���뵥λ��ַ���С�����';

comment on column AR_UNIT.ADDRESS3 is
'���뵥λ��ַ���أ�';

comment on column AR_UNIT.ADDRESS4 is
'���뵥λ��ַ����ϸ��';

comment on column AR_UNIT.UNIT_CODE is
'���뵥λ��������';

comment on column AR_UNIT.UNIT_PHONE is
'���뵥λ��ϵ�绰';

comment on column AR_UNIT.UNIT_FAX is
'���뵥λ����';

/*==============================================================*/
/* Table: AR_USER                                               */
/*==============================================================*/
create table AR_USER 
(
   USER_ID              VARCHAR2(36)         not null,
   APPLY_ID             VARCHAR2(36)         not null,
   USER_TYPE            VARCHAR2(1)          not null,
   USER_NAME            VARCHAR2(50)         not null,
   GENDER               VARCHAR2(1),
   IDCARD               VARCHAR2(20)         not null,
   NATION               VARCHAR2(40),
   EDUCATION            VARCHAR2(20),
   OPERATION_LEVEL      VARCHAR2(1),
   LEVEL_CODE           VARCHAR2(40),
   SERVICE_UNIT         VARCHAR2(100),
   SERVICE_POST         VARCHAR2(6),
   ADDRESS1             VARCHAR2(20),
   ADDRESS2             VARCHAR2(20),
   ADDRESS3             VARCHAR2(20),
   ADDRESS4             VARCHAR2(20),
   ADDRESS_POST         VARCHAR2(6),
   CONTACT_ADDR1        VARCHAR2(20),
   CONTACT_ADDR2        VARCHAR2(20),
   CONTACT_ADDR3        VARCHAR2(20),
   CONTACT_ADDR4        VARCHAR2(100),
   CONTACT_POST         VARCHAR2(6),
   EMAIL                VARCHAR2(100),
   FAX                  VARCHAR2(40),
   SERVICE_PHONE        VARCHAR2(40),
   HOME_PHONE           VARCHAR2(40),
   MOBILE               VARCHAR2(40),
   CONNECT_PHONE        VARCHAR2(40),
   constraint PK_AR_USER primary key (USER_ID)
);

comment on table AR_USER is
'��̨��Ա��Ϣ��';

comment on column AR_USER.USER_ID is
'��ԱID';

comment on column AR_USER.APPLY_ID is
'����ID';

comment on column AR_USER.USER_TYPE is
'��Ա���    0 ����̨վ������/1��λ��̨��λ������/2��λ��̨����������';

comment on column AR_USER.USER_NAME is
'������/����������/��λ����������';

comment on column AR_USER.GENDER is
'������/����������/��λ�������Ա�     0Ů/1��';

comment on column AR_USER.IDCARD is
'������/����������/��λ���������֤ ';

comment on column AR_USER.NATION is
'������/��������������';

comment on column AR_USER.EDUCATION is
'������/�����������Ļ��̶�';

comment on column AR_USER.OPERATION_LEVEL is
'������/���������˲�������   ȡֵ��Χ A/B/C';

comment on column AR_USER.LEVEL_CODE is
'������/���������˼���֤���';

comment on column AR_USER.SERVICE_UNIT is
'������/���������˷���λ';

comment on column AR_USER.SERVICE_POST is
'������/���������˷���λ�ʱ�';

comment on column AR_USER.ADDRESS1 is
'������/���������˳�ס��ַ��ʡ�ݣ�';

comment on column AR_USER.ADDRESS2 is
'������/���������˳�ס��ַ���С�����';

comment on column AR_USER.ADDRESS3 is
'������/���������˳�ס��ַ���أ�';

comment on column AR_USER.ADDRESS4 is
'������/���������˳�ס��ַ����ϸ��';

comment on column AR_USER.ADDRESS_POST is
'������/���������˳�ס��ַ�ʱ�';

comment on column AR_USER.CONTACT_ADDR1 is
'������/����������/��λ��������ϵ��ַ��ʡ�ݣ�';

comment on column AR_USER.CONTACT_ADDR2 is
'������/����������/��λ��������ϵ��ַ���С�����';

comment on column AR_USER.CONTACT_ADDR3 is
'������/����������/��λ��������ϵ��ַ���أ�';

comment on column AR_USER.CONTACT_ADDR4 is
'������/����������/��λ��������ϵ��ַ����ϸ��';

comment on column AR_USER.CONTACT_POST is
'������/����������/��λ��������ϵ��ַ�ʱ�';

comment on column AR_USER.EMAIL is
'������/����������/��λ�����˵����ʼ�';

comment on column AR_USER.FAX is
'������/����������/��λ�����˴���';

comment on column AR_USER.SERVICE_PHONE is
'������/����������/��λ�����˵�λ�绰      ��Ϊ��λ��̨ʱ�����ֶδ��浥λ��������ϵ�绰';

comment on column AR_USER.HOME_PHONE is
'������/����������/��λ������סլ�绰';

comment on column AR_USER.MOBILE is
'������/����������/��λ�������ƶ��绰';

comment on column AR_USER.CONNECT_PHONE is
'��λ��������ϵ�绰';

/*==============================================================*/
/* Table: WF_CREDIT                                             */
/*==============================================================*/
create table WF_CREDIT 
(
   GUID                 VARCHAR2(36)         not null,
   CRED_OBJ_TYPE        VARCHAR2(1)          not null,
   CRED_INFO_TYPE       VARCHAR2(1),
   CRED_OBJ_ID1         VARCHAR2(36),
   CRED_OBJ_ID2         VARCHAR2(36),
   CRED_PUN_CONTENT     VARCHAR2(2000),
   CRED_PUN_ID          VARCHAR2(128),
   CRED_MATTER_TYPE     VARCHAR2(10),
   CRED_FACTS           VARCHAR2(2000),
   CRED_DATE            DATE,
   CRED_MEASURES        VARCHAR2(400),
   CRED_GIST            VARCHAR2(400),
   CRED_UPDATE_TIME     DATE,
   CRED_EFFECTIVE       VARCHAR2(1),
   CRED_PUN_ORG         VARCHAR2(100),
   constraint PK_WF_CREDIT primary key (GUID)
);

comment on table WF_CREDIT is
'�û�������Ϣ��';

comment on column WF_CREDIT.CRED_OBJ_TYPE is
'�����    0  ����   1    ��Ȼ��';

comment on column WF_CREDIT.CRED_INFO_TYPE is
'��Ϣ���� 0�����̨ 1Υ�����ơ��������������ߵ緢���豸  2�������ߵ�  3 �������ź�  4 ������Ƶ�ʹ���  5 Υ��ʹ�����ߵ�ִ̨��   6 Υ�������豸 ';

comment on column WF_CREDIT.CRED_OBJ_ID1 is
'��������ID����Ȼ�ˣ�';

comment on column WF_CREDIT.CRED_OBJ_ID2 is
'��������ID�����ˣ�';

comment on column WF_CREDIT.CRED_PUN_CONTENT is
'�������ݣ��������������֤���룩  ��ʽΪ�����������������֤���룺XXXX';

comment on column WF_CREDIT.CRED_PUN_ID is
'�����ĺ�';

comment on column WF_CREDIT.CRED_MATTER_TYPE is
'�������ͣ��������ࣩ �ֵ�';

comment on column WF_CREDIT.CRED_FACTS is
'Υ����ʵ���������ɣ�';

comment on column WF_CREDIT.CRED_DATE is
'�����������ڣ��������ڣ�';

comment on column WF_CREDIT.CRED_MEASURES is
'������ʩ���������ݣ�';

comment on column WF_CREDIT.CRED_GIST is
'��������';

comment on column WF_CREDIT.CRED_UPDATE_TIME is
'ҵ�����ʱ��';

comment on column WF_CREDIT.CRED_EFFECTIVE is
'��Ч��  0��Ч  1 ��Ч';

comment on column WF_CREDIT.CRED_PUN_ORG is
'��������';

/*==============================================================*/
/* Table: WF_DETECTION                                          */
/*==============================================================*/
create table WF_DETECTION 
(
   GUID                 VARCHAR2(36)         not null,
   DET_NAME             VARCHAR2(128),
   DET_TYPE             VARCHAR2(1),
   DET_DEPART           VARCHAR2(1),
   DET_COMPL_DATE       DATE,
   DET_COMPL_TIME       VARCHAR2(2),
   DET_ATTN             VARCHAR2(50),
   DET_LEADER           VARCHAR2(50),
   DET_CONTENT          VARCHAR2(1000),
   DET_REQUEST          VARCHAR2(1000),
   DET_RESULT           VARCHAR2(1000),
   DET_HANDLER          VARCHAR2(50),
   DET_STATUS           VARCHAR2(2),
   DET_MEMO             VARCHAR2(1000),
   constraint PK_WF_DETECTION primary key (GUID)
);

comment on table WF_DETECTION is
'��������';

comment on column WF_DETECTION.GUID is
'�������ID';

comment on column WF_DETECTION.DET_NAME is
'��������';

comment on column WF_DETECTION.DET_TYPE is
'�������ʴ���  0 ����  1ר��  2����  3 ����';

comment on column WF_DETECTION.DET_DEPART is
'�´������Ŵ���     ';

comment on column WF_DETECTION.DET_COMPL_DATE is
'�������';

comment on column WF_DETECTION.DET_COMPL_TIME is
'������ڵ����ʱ��';

comment on column WF_DETECTION.DET_ATTN is
'��ϵ��';

comment on column WF_DETECTION.DET_LEADER is
'�����쵼';

comment on column WF_DETECTION.DET_CONTENT is
'��������';

comment on column WF_DETECTION.DET_REQUEST is
'����Ҫ��';

comment on column WF_DETECTION.DET_RESULT is
'������';

comment on column WF_DETECTION.DET_HANDLER is
'ִ����Ա';

comment on column WF_DETECTION.DET_STATUS is
'����״̬   0δ����   1δ���  2  ���';

comment on column WF_DETECTION.DET_MEMO is
'��ע';

/*==============================================================*/
/* Table: WF_DETECTION_ATTECH                                   */
/*==============================================================*/
create table WF_DETECTION_ATTECH 
(
   FILE_ID              VARCHAR2(36)         not null,
   DETECTION_GUID       VARCHAR2(36),
   FILENAME             VARCHAR2(200),
   CONTENT              BLOB,
   constraint PK_WF_DETECTION_ATTECH primary key (FILE_ID)
);

comment on table WF_DETECTION_ATTECH is
'����Ͷ�������븽����';

comment on column WF_DETECTION_ATTECH.FILE_ID is
'�ļ�ID';

comment on column WF_DETECTION_ATTECH.DETECTION_GUID is
'�������ID';

comment on column WF_DETECTION_ATTECH.FILENAME is
'����������';

comment on column WF_DETECTION_ATTECH.CONTENT is
'��������';

/*==============================================================*/
/* Table: WF_DISTURB                                            */
/*==============================================================*/
create table WF_DISTURB 
(
   GUID                 VARCHAR2(36)         not null,
   UNIT_GUID            VARCHAR2(36),
   DIST_STAT_ADDR       VARCHAR2(100),
   DIST_ANT_HEIGHT      VARCHAR2(20),
   DIST_ANT_MODEL       VARCHAR2(128),
   DIST_EQU             VARCHAR2(500),
   DIST_LICENSE_ID      VARCHAR2(36),
   DIST_FM_MODEL        VARCHAR2(128),
   DIST_LICENSE_DATE    DATE,
   DIST_FREQ            VARCHAR2(128),
   DIST_ASPECT          VARCHAR2(128),
   DIST_DATE            DATE,
   DIST_TIME            VARCHAR2(1),
   DIST_LEVEL           VARCHAR2(128),
   DIST_SUMMARY         VARCHAR2(1000),
   DIST_STATE_DATE      DATE,
   DIST_ACCEP_OPINION   VARCHAR2(1000),
   DIST_LEADER_OPINION  VARCHAR2(500),
   MONIT_GUID           VARCHAR2(36),
   INVESTIGATE_GUID     VARCHAR2(36),
   constraint PK_WF_DISTURB primary key (GUID)
);

comment on table WF_DISTURB is
'����Ͷ������ǼǱ�';

comment on column WF_DISTURB.GUID is
'�����������';

comment on column WF_DISTURB.UNIT_GUID is
'��λID';

comment on column WF_DISTURB.DIST_STAT_ADDR is
'��̨��ַ';

comment on column WF_DISTURB.DIST_ANT_HEIGHT is
'���߸߶�';

comment on column WF_DISTURB.DIST_ANT_MODEL is
'���߷�ʽ';

comment on column WF_DISTURB.DIST_EQU is
'ʹ���豸';

comment on column WF_DISTURB.DIST_LICENSE_ID is
'��ִ̨�ձ��';

comment on column WF_DISTURB.DIST_FM_MODEL is
'���Ʒ�ʽ';

comment on column WF_DISTURB.DIST_LICENSE_DATE is
'�������';

comment on column WF_DISTURB.DIST_FREQ is
'�ܸ���Ƶ��';

comment on column WF_DISTURB.DIST_ASPECT is
'������ʽ';

comment on column WF_DISTURB.DIST_DATE is
'�ܸ�������';

comment on column WF_DISTURB.DIST_TIME is
'�ܸ���ʱ��';

comment on column WF_DISTURB.DIST_LEVEL is
'����Ӱ��̶�';

comment on column WF_DISTURB.DIST_SUMMARY is
'��������ժҪ';

comment on column WF_DISTURB.DIST_STATE_DATE is
'��������';

comment on column WF_DISTURB.DIST_ACCEP_OPINION is
'������Ա���';

comment on column WF_DISTURB.DIST_LEADER_OPINION is
'�ֹ��쵼���';

comment on column WF_DISTURB.MONIT_GUID is
'�������ID';

comment on column WF_DISTURB.INVESTIGATE_GUID is
'�鴦ִ������ID';

/*==============================================================*/
/* Table: WF_DISTURB_ATTECH                                     */
/*==============================================================*/
create table WF_DISTURB_ATTECH 
(
   FILE_ID              VARCHAR2(36)         not null,
   DISTURB_GUID         VARCHAR2(36),
   FILENAME             VARCHAR2(200),
   CONTENT              BLOB,
   constraint PK_WF_DISTURB_ATTECH primary key (FILE_ID)
);

comment on table WF_DISTURB_ATTECH is
'����Ͷ�������븽����';

comment on column WF_DISTURB_ATTECH.FILE_ID is
'�ļ�ID';

comment on column WF_DISTURB_ATTECH.DISTURB_GUID is
'��������ǼǱ��';

comment on column WF_DISTURB_ATTECH.FILENAME is
'����������';

comment on column WF_DISTURB_ATTECH.CONTENT is
'��������';

/*==============================================================*/
/* Table: WF_INVESTIGATE                                        */
/*==============================================================*/
create table WF_INVESTIGATE 
(
   GUID                 VARCHAR2(36)         not null,
   INV_HANDLE_DATE      DATE,
   INV_CASE_TYPE        VARCHAR2(1),
   INV_SOURCE_TYPE      VARCHAR2(1),
   INV_CASE_NAME        VARCHAR2(128),
   INV_COMPLETE_DATE    DATE,
   INV_HANDLER          VARCHAR2(50),
   INV_CONTENT          VARCHAR2(1000),
   INV_RESULT           VARCHAR2(1000),
   UNIT_GUID            VARCHAR2(36),
   INV_SYSTEM_CODE      VARCHAR2(36),
   INV_STATUS_TYPE      VARCHAR2(1),
   constraint PK_WF_INVESTIGATE primary key (GUID)
);

comment on table WF_INVESTIGATE is
'�鴦ִ�������';

comment on column WF_INVESTIGATE.GUID is
'�鴦ִ��������';

comment on column WF_INVESTIGATE.INV_HANDLE_DATE is
'��������';

comment on column WF_INVESTIGATE.INV_CASE_TYPE is
'�¼����ʹ���    ';

comment on column WF_INVESTIGATE.INV_SOURCE_TYPE is
'�¼���Դ���� ';

comment on column WF_INVESTIGATE.INV_CASE_NAME is
'�¼�����';

comment on column WF_INVESTIGATE.INV_COMPLETE_DATE is
'�������';

comment on column WF_INVESTIGATE.INV_HANDLER is
'������';

comment on column WF_INVESTIGATE.INV_CONTENT is
'��������';

comment on column WF_INVESTIGATE.INV_RESULT is
'ִ�����';

comment on column WF_INVESTIGATE.UNIT_GUID is
'��λID';

comment on column WF_INVESTIGATE.INV_SYSTEM_CODE is
'ϵͳ����';

comment on column WF_INVESTIGATE.INV_STATUS_TYPE is
'����״̬   0  δ����   1δ����  2 ���黷�� 3�������� 4�쵼�������ȸ�֪����  5�������  6 �������������� 7�᰸���� 8�������';

/*==============================================================*/
/* Table: WF_INV_ATTACH                                         */
/*==============================================================*/
create table WF_INV_ATTACH 
(
   FILE_ID              VARCHAR2(36)         not null,
   INVESTIGATE_GUID     VARCHAR2(36),
   FILENAME             VARCHAR2(200),
   CONTENT              BLOB,
   constraint PK_WF_INV_ATTACH primary key (FILE_ID)
);

comment on table WF_INV_ATTACH is
'�鴦ִ�������븽����';

comment on column WF_INV_ATTACH.FILE_ID is
'�ļ�ID';

comment on column WF_INV_ATTACH.INVESTIGATE_GUID is
'�鴦����ID';

comment on column WF_INV_ATTACH.FILENAME is
'����������';

comment on column WF_INV_ATTACH.CONTENT is
'��������';

/*==============================================================*/
/* Table: WF_LEDGER                                             */
/*==============================================================*/
create table WF_LEDGER 
(
   GUID                 VARCHAR2(36)         not null,
   LEG_CORP_CODE        VARCHAR2(20),
   LEG_CASE_TYPE        VARCHAR2(1),
   USER_GUID            VARCHAR2(36),
   LEG_COMP_ADDR        VARCHAR2(100),
   LEG_OBJ_TYPE         VARCHAR2(1),
   LEG_ADDR_CODE        VARCHAR2(1),
   LEG_OBJ_ID1          VARCHAR2(36),
   LEG_OBJ_ID2          VARCHAR2(36),
   LEG_SOURCE_TYPE      VARCHAR2(1),
   LEG_CONTENT          VARCHAR2(1000),
   LEG_RNR_DATE         DATE,
   LEG_COMP_DATE        DATE,
   LEG_SITUATION        VARCHAR2(1000),
   LEG_RESULT_TYPE      VARCHAR2(1),
   LEG_UNIT             VARCHAR2(100),
   LEG_REPLY_DATE       DATE,
   LEG_COR_ID           VARCHAR2(36),
   LEG_COMPL_DATE       DATE,
   LEG_GUID             VARCHAR2(36),
   LEG_NAME1            VARCHAR2(50),
   LEG_NAME2            VARCHAR2(50),
   LEG_MEMO             VARCHAR2(1000),
   constraint PK_WF_LEDGER primary key (GUID)
);

comment on table WF_LEDGER is
'�ŷ�Ͷ��̨����Ϣ��';

comment on column WF_LEDGER.GUID is
'����ID';

comment on column WF_LEDGER.LEG_CORP_CODE is
'���˴����';

comment on column WF_LEDGER.LEG_CASE_TYPE is
'�������ʹ��� 1����վͶ��  2���㲥����/�㲥�ź�Ͷ��  3��ҵ�����ߵ�Ͷ��   4������Ͷ��';

comment on column WF_LEDGER.USER_GUID is
'Ͷ����ID';

comment on column WF_LEDGER.LEG_COMP_ADDR is
'Ͷ�ߵ�ַ';

comment on column WF_LEDGER.LEG_OBJ_TYPE is
'Ͷ�߶�������  0  ����/ 1 ��λ';

comment on column WF_LEDGER.LEG_ADDR_CODE is
'Ͷ�߶����������ش���';

comment on column WF_LEDGER.LEG_OBJ_ID1 is
'Ͷ�߶���ID����Ȼ�ˣ�';

comment on column WF_LEDGER.LEG_OBJ_ID2 is
'Ͷ�߶���ID�����ˣ�';

comment on column WF_LEDGER.LEG_SOURCE_TYPE is
'Ͷ����Դ����    0����/1�ŷ�/2���/3��վ/4�ֳ�����/ 5����12345/6�ල���/7����';

comment on column WF_LEDGER.LEG_CONTENT is
'Ͷ������';

comment on column WF_LEDGER.LEG_RNR_DATE is
'������Ӧ����';

comment on column WF_LEDGER.LEG_COMP_DATE is
'Ͷ�߲�������';

comment on column WF_LEDGER.LEG_SITUATION is
'�����������';

comment on column WF_LEDGER.LEG_RESULT_TYPE is
'��鴦��������   0���ģ�ͣ����/1����������ߡ����վ��2 ����';

comment on column WF_LEDGER.LEG_UNIT is
'���쵥λ';

comment on column WF_LEDGER.LEG_REPLY_DATE is
'�ظ�Ͷ���˵�ʱ��';

comment on column WF_LEDGER.LEG_COR_ID is
'�������ı��';

comment on column WF_LEDGER.LEG_COMPL_DATE is
'Ͷ�ߴ������ʱ��(Ͷ�߱ջ�ʱ��)';

comment on column WF_LEDGER.LEG_GUID is
'Ͷ�ߵǼǱ���';

comment on column WF_LEDGER.LEG_NAME1 is
'������';

comment on column WF_LEDGER.LEG_NAME2 is
'������';

comment on column WF_LEDGER.LEG_MEMO is
'��ע';

/*==============================================================*/
/* Table: WF_LETTER                                             */
/*==============================================================*/
create table WF_LETTER 
(
   GUID                 VARCHAR2(36)         not null,
   LET_TYPE             VARCHAR2(1),
   LET_COMP_AGAIN_NAME  VARCHAR2(50),
   LET_REPEAT           VARCHAR2(1),
   LETTER_GUID          VARCHAR2(36),
   LET_FB_TYPE          VARCHAR2(1),
   LET_REPLY_TYPE       VARCHAR2(1),
   LET_OPINION          VARCHAR2(1000),
   LET_IF_REPLY         VARCHAR2(1),
   SUPV_GUID            VARCHAR2(36),
   LEDGER_GUID          VARCHAR2(36),
   LET_MEMO             VARCHAR2(1000),
   constraint PK_WF_LETTER primary key (GUID)
);

comment on table WF_LETTER is
'�ŷ�Ͷ�ߵǼǱ�';

comment on column WF_LETTER.GUID is
'���';

comment on column WF_LETTER.LET_TYPE is
'Ͷ����Ϊ0/���������Ϊ1';

comment on column WF_LETTER.LET_COMP_AGAIN_NAME is
'Ͷ�߶�������/����';

comment on column WF_LETTER.LET_REPEAT is
'�Ƿ��ظ�Ͷ��  0�� 1��';

comment on column WF_LETTER.LETTER_GUID is
'�ظ��ǼǱ���';

comment on column WF_LETTER.LET_FB_TYPE is
'���������������  0 ���/1 ��������/2 ��������';

comment on column WF_LETTER.LET_REPLY_TYPE is
'�𸴷�ʽ���� 0 �绰/1 ����/2 Լ̸';

comment on column WF_LETTER.LET_OPINION is
'�������';

comment on column WF_LETTER.LET_IF_REPLY is
'����ظ����     0 δ�ظ��û�    1   �ѻظ��û�';

comment on column WF_LETTER.SUPV_GUID is
'�ල�������ID';

comment on column WF_LETTER.LEDGER_GUID is
'�ŷ�̨�˱��';

comment on column WF_LETTER.LET_MEMO is
'��ע';

/*==============================================================*/
/* Table: WF_MONIT                                              */
/*==============================================================*/
create table WF_MONIT 
(
   GUID                 VARCHAR2(36)         not null,
   MONIT_NAME           VARCHAR2(128),
   MONIT_TYPE           VARCHAR2(1),
   MONIT_DEPARTMENT     VARCHAR2(1),
   MONIT_COMPLETE_DATE  DATE,
   MONIT_COMPLETE_TIME  VARCHAR2(2),
   MONIT_ATTN           VARCHAR2(50),
   MONIT_LEADER         VARCHAR2(50),
   MONIT_CONTENT        VARCHAR2(1000),
   MONIT_REQUEST        VARCHAR2(1000),
   MONIT_RESULT         VARCHAR2(1000),
   MONIT_MEMO           VARCHAR2(1000),
   MONIT_HANDLER        VARCHAR2(50),
   constraint PK_WF_MONIT primary key (GUID)
);

comment on table WF_MONIT is
'��������';

comment on column WF_MONIT.GUID is
'�������ID';

comment on column WF_MONIT.MONIT_NAME is
'��������';

comment on column WF_MONIT.MONIT_TYPE is
'�������ʴ���  0 ����  1ר��  2����  3 ����';

comment on column WF_MONIT.MONIT_DEPARTMENT is
'�´������Ŵ���';

comment on column WF_MONIT.MONIT_COMPLETE_DATE is
'�������';

comment on column WF_MONIT.MONIT_COMPLETE_TIME is
'������ڵ����ʱ��';

comment on column WF_MONIT.MONIT_ATTN is
'��ϵ��';

comment on column WF_MONIT.MONIT_LEADER is
'�����쵼';

comment on column WF_MONIT.MONIT_CONTENT is
'��������';

comment on column WF_MONIT.MONIT_REQUEST is
'����Ҫ��';

comment on column WF_MONIT.MONIT_RESULT is
'������';

comment on column WF_MONIT.MONIT_MEMO is
'��ע';

comment on column WF_MONIT.MONIT_HANDLER is
'ִ����Ա';

/*==============================================================*/
/* Table: WF_MONIT_ATTACH                                       */
/*==============================================================*/
create table WF_MONIT_ATTACH 
(
   FILE_ID              VARCHAR2(36)         not null,
   MONIT_GUID           VARCHAR2(36),
   FILENAME             VARCHAR2(200),
   CONTENT              BLOB,
   constraint PK_WF_MONIT_ATTACH primary key (FILE_ID)
);

comment on table WF_MONIT_ATTACH is
'�ල��������븽����';

comment on column WF_MONIT_ATTACH.FILE_ID is
'�ļ�ID';

comment on column WF_MONIT_ATTACH.MONIT_GUID is
'�������ID';

comment on column WF_MONIT_ATTACH.FILENAME is
'����������';

comment on column WF_MONIT_ATTACH.CONTENT is
'��������';

/*==============================================================*/
/* Table: WF_PUNISH                                             */
/*==============================================================*/
create table WF_PUNISH 
(
   GUID                 VARCHAR2(36)         not null,
   PUNISH_ENTY_ID       INTEGER,
   PUNISH_CODE          VARCHAR2(128),
   PUNISH_UNIT          VARCHAR2(400),
   PUNISH_CORP          VARCHAR2(400)        not null,
   PUNISH_ORG_CODE      VARCHAR2(200),
   PUNISH_REG_NO        VARCHAR2(200),
   PUNISH_CORP_ADDR     VARCHAR2(1000),
   PUNISH_ZIP           VARCHAR2(100),
   PUNISH_TEL           VARCHAR2(200),
   PUNISH_PERSON        VARCHAR2(400),
   PUNISH_PERSON_TITLE  VARCHAR2(400),
   PUNISH_ILLEG_DATE    DATE,
   PUNISH_ILLEG_ADDR    VARCHAR2(400),
   APUNISH_REA_CODE     VARCHAR2(20),
   PUNISH_ILLEG_CONTEXT VARCHAR2(2000),
   PUNISH_ILLEG_EVID    VARCHAR2(400),
   PUNISH_ILLEG_RULE    VARCHAR2(400),
   PUNISH_BASIS         VARCHAR2(400),
   PUNISH_MEASURES      VARCHAR2(400),
   PUNISH_DATE          DATE,
   PUNISH_BUSI_UPD_TIME DATE                 not null,
   PUNISH_LIMIT         VARCHAR2(400),
   PUNISH_VALIDITY      VARCHAR2(1),
   PUNISH_TEAM          VARCHAR2(400),
   PUNISH_UNIT_PROPERTY VARCHAR2(128),
   PUNISH_TAX_CODE      VARCHAR2(20),
   PUNISH_CONTENT       VARCHAR2(2000),
   PUNISH_SPOT_TEST_TYPE VARCHAR2(128),
   PUNISH_ANN_REASON    VARCHAR2(128),
   PUNISH_FROM_DEPT_ID  VARCHAR2(10)         not null,
   PUNISH_UNI_SC_ID     VARCHAR2(100),
   PUNISH_ER_REASON     VARCHAR2(400)        not null,
   constraint PK_WF_PUNISH primary key (GUID)
);

comment on table WF_PUNISH is
'�����������ݱ�';

comment on column WF_PUNISH.GUID is
'��Ӧ���������ݵ�����';

comment on column WF_PUNISH.PUNISH_ENTY_ID is
'���˿⴦���������';

comment on column WF_PUNISH.PUNISH_CODE is
'����֪ͨ����';

comment on column WF_PUNISH.PUNISH_UNIT is
'��������';

comment on column WF_PUNISH.PUNISH_CORP is
'��������λ';

comment on column WF_PUNISH.PUNISH_ORG_CODE is
'��֯��������';

comment on column WF_PUNISH.PUNISH_REG_NO is
'ע���';

comment on column WF_PUNISH.PUNISH_CORP_ADDR is
'��ַ��������Ӫ��ַ��';

comment on column WF_PUNISH.PUNISH_ZIP is
'�ʱ�';

comment on column WF_PUNISH.PUNISH_TEL is
'��ϵ�绰';

comment on column WF_PUNISH.PUNISH_PERSON is
'����������/������';

comment on column WF_PUNISH.PUNISH_PERSON_TITLE is
'ְ��';

comment on column WF_PUNISH.PUNISH_ILLEG_DATE is
'Υ��ʱ��';

comment on column WF_PUNISH.PUNISH_ILLEG_ADDR is
'Υ���ص�';

comment on column WF_PUNISH.APUNISH_REA_CODE is
'Υ���ص��������μ��������ݺ���������xml��ʽ���忪���ֲ� ��¼G-���ʡ����������ֵ�';

comment on column WF_PUNISH.PUNISH_ILLEG_CONTEXT is
'Υ����ʵ';

comment on column WF_PUNISH.PUNISH_ILLEG_EVID is
'֤��';

comment on column WF_PUNISH.PUNISH_ILLEG_RULE is
'Υ���涨';

comment on column WF_PUNISH.PUNISH_BASIS is
'��������';

comment on column WF_PUNISH.PUNISH_MEASURES is
'������ʩ';

comment on column WF_PUNISH.PUNISH_DATE is
'��������ʱ��';

comment on column WF_PUNISH.PUNISH_BUSI_UPD_TIME is
'ҵ�����ʱ��';

comment on column WF_PUNISH.PUNISH_LIMIT is
'�ķ�����';

comment on column WF_PUNISH.PUNISH_VALIDITY is
'��Ч��  0��Ч   1��Ч';

comment on column WF_PUNISH.PUNISH_TEAM is
'�ܴ�����λ�ͼ�������';

comment on column WF_PUNISH.PUNISH_UNIT_PROPERTY is
'��������λ����';

comment on column WF_PUNISH.PUNISH_TAX_CODE is
'˰��ǼǺ�';

comment on column WF_PUNISH.PUNISH_CONTENT is
'��������';

comment on column WF_PUNISH.PUNISH_SPOT_TEST_TYPE is
'������';

comment on column WF_PUNISH.PUNISH_ANN_REASON is
'ͨ��ԭ��';

comment on column WF_PUNISH.PUNISH_FROM_DEPT_ID is
'ί��ֱ�Ųμ��������ݺ���������xml��ʽ���忪���ֲ� ��¼G-���ʡ����������ֵ�';

comment on column WF_PUNISH.PUNISH_UNI_SC_ID is
'ͳһ������ô���';

comment on column WF_PUNISH.PUNISH_ER_REASON is
'�������ݵ�ԭ��';

/*==============================================================*/
/* Table: WF_QUALIFICATION                                      */
/*==============================================================*/
create table WF_QUALIFICATION 
(
   GUID                 VARCHAR2(36)         not null,
   QUAL_LICENSE_ID      VARCHAR2(20),
   QUAL_CORP_INFO_ID    VARCHAR2(20),
   QUAL_ENTITY_ID       VARCHAR2(21),
   QUAL_ORGAN_CODE      VARCHAR2(10),
   QUAL_LICENSE_TYPE    VARCHAR2(6)          not null,
   QUAL_UNIQUE_CODE     VARCHAR2(128),
   QUAL_BUREAU_CODE     VARCHAR2(10)         not null,
   QUAL_LICENSE_STAT    VARCHAR2(4),
   QUAL_LICENSE_CODE    VARCHAR2(128)        not null,
   QUAL_LICENSE_DATE    DATE,
   QUAL_UNIT_NAME       VARCHAR2(128)        not null,
   QUAL_START_DATE      VARCHAR2(0),
   QUAL_END_DATE        VARCHAR2(0),
   QUAL_PERSON_NAME     VARCHAR2(128),
   QUAL_BUSINESS_SCOPE  VARCHAR2(2000),
   QUAL_UNIT_ADDR       VARCHAR2(128),
   QUAL_BUSINESS_ADDR   VARCHAR2(128),
   QUAL_UNIT_PERSON     VARCHAR2(128),
   QUALI_LEVEL          VARCHAR2(128),
   QUAL_MANAGE_ORG      VARCHAR2(128),
   QUAL_REG_NO          VARCHAR2(1024),
   QUAL_BUSI_UPD_TIME   VARCHAR2(0),
   QUAL_UNIT_PROP       VARCHAR2(128),
   QUAL_ISSUE_ORG       VARCHAR2(128),
   QUAL_PERM_CONTEXT    VARCHAR2(4000),
   QUAL_PERSON_TITLE    VARCHAR2(128),
   QUAL_PERSON_TEL      VARCHAR2(128),
   QUAL_UNIT_PERSON_TITLE VARCHAR2(128),
   QUAL_UNIT_PERSON_TEL VARCHAR2(40),
   QUAL_ZIP             VARCHAR2(6),
   QUAL_QUAL_OTHER_UNIT VARCHAR2(128),
   QUAL_OTHER_ORGAN_CODE VARCHAR2(128),
   COLUMAREA_CODEN_33   VARCHAR2(20),
   QUAL_PERM_SCOPE      VARCHAR2(1024),
   QUAL_PERM_CONTENT    CLOB,
   QUAL_LICENSE_NAME    VARCHAR2(128),
   QUAL_PRO_NAME        VARCHAR2(128),
   QUAL_PRO_MODEL       VARCHAR2(128),
   QUAL_PRO_STANDARD    VARCHAR2(128),
   QUAL_PRO_ACCURACY    VARCHAR2(128),
   QUAL_VALIDITY        VARCHAR2(1),
   QUAL_UNI_SC_ID       VARCHAR2(18),
   QUAL_ER_REASON       VARCHAR2(400)        not null,
   constraint PK_WF_QUALIFICATION primary key (GUID)
);

comment on table WF_QUALIFICATION is
'�������ݱ�';

comment on column WF_QUALIFICATION.GUID is
'��Ӧ���������ݵ�����';

comment on column WF_QUALIFICATION.QUAL_LICENSE_ID is
'�����������֤Ψһ���';

comment on column WF_QUALIFICATION.QUAL_CORP_INFO_ID is
'�������ķ���ʵ�����';

comment on column WF_QUALIFICATION.QUAL_ENTITY_ID is
'��ҵΨһ��ʶ�����̣�';

comment on column WF_QUALIFICATION.QUAL_ORGAN_CODE is
'��֯�ṹ����';

comment on column WF_QUALIFICATION.QUAL_LICENSE_TYPE is
'���֤�������ƴ��루��¼���˿�ϵͳ������ϢĿ¼����˵��鿴��';

comment on column WF_QUALIFICATION.QUAL_UNIQUE_CODE is
'������Ϣί���Ψһ��ʶ';

comment on column WF_QUALIFICATION.QUAL_BUREAU_CODE is
'ί��ֱ�ţ��μ��������ݺ���������xml��ʽ���忪���ֲ� ��¼G-��λ�ֵ䣩';

comment on column WF_QUALIFICATION.QUAL_LICENSE_STAT is
'���֤��״̬���μ��������ݺ���������xml��ʽ���忪���ֲ� ��¼G-����״̬�ֵ䣩';

comment on column WF_QUALIFICATION.QUAL_LICENSE_CODE is
'���֤��';

comment on column WF_QUALIFICATION.QUAL_LICENSE_DATE is
'��֤����';

comment on column WF_QUALIFICATION.QUAL_UNIT_NAME is
'��������';

comment on column WF_QUALIFICATION.QUAL_START_DATE is
'��Ч����(��)';

comment on column WF_QUALIFICATION.QUAL_END_DATE is
'��Ч����(ֹ)';

comment on column WF_QUALIFICATION.QUAL_PERSON_NAME is
'����������';

comment on column WF_QUALIFICATION.QUAL_BUSINESS_SCOPE is
'��Ӫ��Χ';

comment on column WF_QUALIFICATION.QUAL_UNIT_ADDR is
'��λ��ַ';

comment on column WF_QUALIFICATION.QUAL_BUSINESS_ADDR is
'��Ӫ��ַ';

comment on column WF_QUALIFICATION.QUAL_UNIT_PERSON is
'������';

comment on column WF_QUALIFICATION.QUALI_LEVEL is
'���ʵȼ�';

comment on column WF_QUALIFICATION.QUAL_MANAGE_ORG is
'���ܻ���';

comment on column WF_QUALIFICATION.QUAL_REG_NO is
'ע���';

comment on column WF_QUALIFICATION.QUAL_BUSI_UPD_TIME is
'ҵ�񷢲�ʱ��';

comment on column WF_QUALIFICATION.QUAL_UNIT_PROP is
'��λ����';

comment on column WF_QUALIFICATION.QUAL_ISSUE_ORG is
'��֤����';

comment on column WF_QUALIFICATION.QUAL_PERM_CONTEXT is
'�������';

comment on column WF_QUALIFICATION.QUAL_PERSON_TITLE is
'����������ְ��/ְ��';

comment on column WF_QUALIFICATION.QUAL_PERSON_TEL is
'���������˵绰';

comment on column WF_QUALIFICATION.QUAL_UNIT_PERSON_TITLE is
'������ְ��/ְ��';

comment on column WF_QUALIFICATION.QUAL_UNIT_PERSON_TEL is
'��ϵ�绰';

comment on column WF_QUALIFICATION.QUAL_ZIP is
'�ʱ�';

comment on column WF_QUALIFICATION.QUAL_QUAL_OTHER_UNIT is
'�漰��λ����';

comment on column WF_QUALIFICATION.QUAL_OTHER_ORGAN_CODE is
'�漰��λ��֯��������';

comment on column WF_QUALIFICATION.COLUMAREA_CODEN_33 is
'�䷢��λ�������μ��������ݺ���������xml��ʽ���忪���ֲ�  ��¼G-���ʡ����������ֵ䣩';

comment on column WF_QUALIFICATION.QUAL_PERM_SCOPE is
'��ɷ�Χ';

comment on column WF_QUALIFICATION.QUAL_PERM_CONTENT is
'������ɾ���������';

comment on column WF_QUALIFICATION.QUAL_LICENSE_NAME is
'֤������';

comment on column WF_QUALIFICATION.QUAL_PRO_NAME is
'��Ʒ����';

comment on column WF_QUALIFICATION.QUAL_PRO_MODEL is
'�ͺ�';

comment on column WF_QUALIFICATION.QUAL_PRO_STANDARD is
'���';

comment on column WF_QUALIFICATION.QUAL_PRO_ACCURACY is
'׼ȷ��';

comment on column WF_QUALIFICATION.QUAL_VALIDITY is
'��Ч�� 0��Ч  1 ��Ч';

comment on column WF_QUALIFICATION.QUAL_UNI_SC_ID is
'ͳһ������ô���';

comment on column WF_QUALIFICATION.QUAL_ER_REASON is
'�������ݵ�ԭ��';

/*==============================================================*/
/* Table: WF_SUPV                                               */
/*==============================================================*/
create table WF_SUPV 
(
   GUID                 VARCHAR2(36)         not null,
   SUPV_CONTENT         VARCHAR2(1000),
   SUPV_OPINION         VARCHAR2(1000),
   SUPV_CARRIER         VARCHAR2(50),
   SUPV_PRO_TYPE        VARCHAR2(1),
   SUPV_MEMO            VARCHAR2(1000),
   SUPV_LEGAL           VARCHAR2(1),
   constraint PK_WF_SUPV primary key (GUID)
);

comment on table WF_SUPV is
'�ල��������';

comment on column WF_SUPV.GUID is
'Ͷ�����񵥱��';

comment on column WF_SUPV.SUPV_CONTENT is
'��������';

comment on column WF_SUPV.SUPV_OPINION is
'�������';

comment on column WF_SUPV.SUPV_CARRIER is
'��Ӫ������';

comment on column WF_SUPV.SUPV_PRO_TYPE is
'�������    0���ģ�ͣ����/1����������ߡ����վ��';

comment on column WF_SUPV.SUPV_MEMO is
'��ע';

comment on column WF_SUPV.SUPV_LEGAL is
'�Ƿ�Ϸ�   0���Ϸ�/1�Ϸ�';

/*==============================================================*/
/* Table: WF_SUPV_ATTACH                                        */
/*==============================================================*/
create table WF_SUPV_ATTACH 
(
   FILE_ID              VARCHAR2(36)         not null,
   SUPV_GUID            VARCHAR2(36),
   FILENAME             VARCHAR2(200),
   CONTENT              BLOB,
   constraint PK_WF_SUPV_ATTACH primary key (FILE_ID)
);

comment on table WF_SUPV_ATTACH is
'�ල��������븽����';

comment on column WF_SUPV_ATTACH.FILE_ID is
'�ļ�ID';

comment on column WF_SUPV_ATTACH.SUPV_GUID is
'�ල�������ID';

comment on column WF_SUPV_ATTACH.FILENAME is
'����������';

comment on column WF_SUPV_ATTACH.CONTENT is
'��������';

/*==============================================================*/
/* Table: WF_UNION                                              */
/*==============================================================*/
create table WF_UNION 
(
   GUID                 VARCHAR2(36)         not null,
   UNION_ADDR1          VARCHAR2(100),
   UNION_PERSON_LIST    VARCHAR2(1000),
   UNION_PURPOSE        VARCHAR2(1024),
   UNION_EQU            VARCHAR2(1024),
   UNION_CONTENT        VARCHAR2(4000),
   UNION_RESULT1        VARCHAR2(1024),
   UNION_OPINION        VARCHAR2(300),
   constraint PK_WF_UNION primary key (GUID)
);

comment on table WF_UNION is
'����ִ��������';

comment on column WF_UNION.GUID is
'����ִ���������';

comment on column WF_UNION.UNION_ADDR1 is
'ִ���ص�';

comment on column WF_UNION.UNION_PERSON_LIST is
'��Ա����';

comment on column WF_UNION.UNION_PURPOSE is
'Ŀ��';

comment on column WF_UNION.UNION_EQU is
'ʹ���豸';

comment on column WF_UNION.UNION_CONTENT is
'��������';

comment on column WF_UNION.UNION_RESULT1 is
'�������';

comment on column WF_UNION.UNION_OPINION is
'�쵼������';

/*==============================================================*/
/* Table: WF_UNIT                                               */
/*==============================================================*/
create table WF_UNIT 
(
   GUID                 VARCHAR2(36)         not null,
   UNIT_NAME            VARCHAR2(100),
   UNIT_CODE            VARCHAR2(9),
   UNIT_ADDR            VARCHAR2(36),
   UNIT_TELPHONE        VARCHAR2(40),
   UNIT_MAIL            VARCHAR2(50),
   UNIT_ATTN            VARCHAR2(36),
   UNIT_PHONR           VARCHAR2(40),
   UNIT_ZIP             VARCHAR2(6),
   UNIT_FAX             VARCHAR2(40),
   constraint PK_WF_UNIT primary key (GUID)
);

comment on column WF_UNIT.GUID is
'���';

comment on column WF_UNIT.UNIT_NAME is
'����';

comment on column WF_UNIT.UNIT_CODE is
'��֯��������';

comment on column WF_UNIT.UNIT_ADDR is
'��ַ';

comment on column WF_UNIT.UNIT_TELPHONE is
'��ϵ�绰';

comment on column WF_UNIT.UNIT_MAIL is
'����';

comment on column WF_UNIT.UNIT_ATTN is
'��ϵ��';

comment on column WF_UNIT.UNIT_PHONR is
'�ֻ���';

comment on column WF_UNIT.UNIT_ZIP is
'�������';

comment on column WF_UNIT.UNIT_FAX is
'�����';

/*==============================================================*/
/* Table: WF_USER                                               */
/*==============================================================*/
create table WF_USER 
(
   USER_ID              VARCHAR2(36)         not null,
   USER_NAME            VARCHAR2(50),
   USER_MAIL            VARCHAR2(50),
   USER_PHONE           VARCHAR2(40),
   USER_ADDR            VARCHAR2(100),
   USER_CODE            VARCHAR2(20),
   constraint PK_WF_USER primary key (USER_ID)
);

comment on table WF_USER is
'��Ա��Ϣ��';

comment on column WF_USER.USER_ID is
'��ԱID';

comment on column WF_USER.USER_NAME is
'����';

comment on column WF_USER.USER_MAIL is
'��������';

comment on column WF_USER.USER_PHONE is
'��ϵ�绰';

comment on column WF_USER.USER_ADDR is
'��ַ';

comment on column WF_USER.USER_CODE is
'���֤��';

alter table AR_ATTACHMENT
   add constraint FK_AR_ATTAC_REFERENCE_AR_APPLY foreign key (APPLY_ID)
      references AR_APPLY (APPLY_ID);

alter table AR_EQU
   add constraint FK_AR_EQU_REFERENCE_AR_STATI foreign key (SYS_ID)
      references AR_STATION_EXT (SYS_ID);

alter table AR_EQU_POW
   add constraint FK_AR_EQU_P_REFERENCE_AR_EQU foreign key (EQU_ID)
      references AR_EQU (EQU_ID);

alter table AR_STATION
   add constraint FK_AR_STATI_REFERENCE_AR_APPLY foreign key (APPLY_ID)
      references AR_APPLY (APPLY_ID);

alter table AR_UNIT
   add constraint FK_AR_UNIT_REFERENCE_AR_APPLY foreign key (APPLY_ID)
      references AR_APPLY (APPLY_ID);

alter table AR_USER
   add constraint FK_AR_USER_REFERENCE_AR_APPLY foreign key (APPLY_ID)
      references AR_APPLY (APPLY_ID);

alter table WF_CREDIT
   add constraint FK_WF_CREDI_REFERENCE_WF_UNIT foreign key (CRED_OBJ_ID2)
      references WF_UNIT (GUID);

alter table WF_CREDIT
   add constraint FK_WF_CREDI_REFERENCE_WF_USER foreign key (CRED_OBJ_ID1)
      references WF_USER (USER_ID);

alter table WF_DETECTION_ATTECH
   add constraint FK_WF_DETEC_REFERENCE_WF_DETEC foreign key (DETECTION_GUID)
      references WF_DETECTION (GUID);

alter table WF_DISTURB
   add constraint FK_WF_DISTU_REFERENCE_WF_MONIT foreign key (MONIT_GUID)
      references WF_MONIT (GUID);

alter table WF_DISTURB
   add constraint FK_WF_DISTU_REFERENCE_WF_INVES foreign key (INVESTIGATE_GUID)
      references WF_INVESTIGATE (GUID);

alter table WF_DISTURB
   add constraint FK_WF_DISTU_REFERENCE_WF_UNIT foreign key (UNIT_GUID)
      references WF_UNIT (GUID);

alter table WF_DISTURB_ATTECH
   add constraint FK_WF_DISTU_REFERENCE_WF_DISTU foreign key (DISTURB_GUID)
      references WF_DISTURB (GUID);

alter table WF_INV_ATTACH
   add constraint FK_WF_INV_A_REFERENCE_WF_INVES foreign key (INVESTIGATE_GUID)
      references WF_INVESTIGATE (GUID);

alter table WF_LEDGER
   add constraint FK_WF_LEDGE_REFERENCE_WF_LETTE foreign key (LEG_GUID)
      references WF_LETTER (GUID);

alter table WF_LEDGER
   add constraint FK_WF_LEDGE_REFERENCE_WF_UNIT foreign key (LEG_OBJ_ID2)
      references WF_UNIT (GUID);

alter table WF_LEDGER
   add constraint FK_WF_LEDGE_REFERENCE_WF_USER foreign key (LEG_OBJ_ID1)
      references WF_USER (USER_ID);

alter table WF_LETTER
   add constraint FK_WF_LETTE_REFERENCE_WF_SUPV foreign key (SUPV_GUID)
      references WF_SUPV (GUID);

alter table WF_MONIT_ATTACH
   add constraint FK_WF_MONIT_REFERENCE_WF_MONIT foreign key (MONIT_GUID)
      references WF_MONIT (GUID);

alter table WF_SUPV_ATTACH
   add constraint FK_WF_SUPV__REFERENCE_WF_SUPV foreign key (SUPV_GUID)
      references WF_SUPV (GUID);

