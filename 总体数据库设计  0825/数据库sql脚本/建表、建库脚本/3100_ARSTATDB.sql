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
)
tablespace "3100_ARSTATDB";

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
)
tablespace "3100_ARSTATDB";

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
)
tablespace "3100_ARSTATDB";

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
)
tablespace "3100_ARSTATDB";

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
)
tablespace "3100_ARSTATDB";

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
)
tablespace "3100_ARSTATDB";

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
)
tablespace "3100_ARSTATDB";

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
)
tablespace "3100_ARSTATDB";

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
)
tablespace "3100_ARSTATDB";

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
)
tablespace "3100_ARSTATDB";

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
