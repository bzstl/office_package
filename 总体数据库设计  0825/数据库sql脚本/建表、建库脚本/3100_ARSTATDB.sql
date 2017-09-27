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
'业余无线电台站设置申请表';

comment on column AR_APPLY.APPLY_ID is
'申请ID       ';

comment on column AR_APPLY.APP_CODE is
'申请表编号';

comment on column AR_APPLY.AREA_CODE is
'管理机构代码';

comment on column AR_APPLY.APP_ITEM is
'申请项目   申请办理的业务内容  0 新设/1 变更个人信息/ 2变更电台级别/3变更电台其他参数';

comment on column AR_APPLY.APP_SUBJECT is
'申请主体类别    业余电台申请者类别，0个人/1单位 ';

comment on column AR_APPLY.STAT_CLASS is
' 台站种类    申请的业余台站种类 ，0一般/1特殊';

comment on column AR_APPLY.SPECIAL_EXPLAIN is
'特殊台站种类描述      STAT_CLASS字段为1时，该字段储存特殊种类说明';

comment on column AR_APPLY.STAT_NAME is
'台站名称';

comment on column AR_APPLY.STAT_SCOPE is
'拟通信范围     0  省、自治区、直辖市/1 两个或两个以上省级单位或涉外';

comment on column AR_APPLY.STAT_SPECIAL is
'特殊台站说明';

comment on column AR_APPLY.STAT_TYPE is
'拟设电台类别      取值  A/ B/ C';

comment on column AR_APPLY.CALLSIGN_OLD is
'原指配呼号';

comment on column AR_APPLY.LEVEL_OLD is
'原操作技术能力      取值  A/ B/ C';

comment on column AR_APPLY.OTHERINFO is
'其他事项说明';

comment on column AR_APPLY.MEMO is
'审核备注';

comment on column AR_APPLY.APP_DATE is
'申请时间';

comment on column AR_APPLY.LASTMODIFY is
'最后变更时间';

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
'申请资质附件表';

comment on column AR_ATTACHMENT.FILE_ID is
'主键';

comment on column AR_ATTACHMENT.APPLY_ID is
'申请表ID';

comment on column AR_ATTACHMENT.FILE_TYPE is
'附件类型  0个人身份证明/1设台单位证明材料/2单位负责人身份证明/3技术负责人身份证明/4操作技术能力证明';

comment on column AR_ATTACHMENT.CONTENT is
'附件内容';

comment on column AR_ATTACHMENT.FILENAME is
'附件名称';

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
'呼号资源表';

comment on column AR_CALL_SIGN.CALL_SIGN_ID is
'呼号编号（呼号）';

comment on column AR_CALL_SIGN.AREA_CODE is
'管理机构代码';

comment on column AR_CALL_SIGN.CALL_SIGN_STATUS is
'呼号状态    0 未指配/1  已占用/2  预留/3 锁定/4  注销/5  他省占用/6  临时指配';

comment on column AR_CALL_SIGN.SET_TIME is
'指配时间';

comment on column AR_CALL_SIGN.END_TIME is
'到期时间';

comment on column AR_CALL_SIGN.ACTIVATE_TIME is
'回收到期时间';

comment on column AR_CALL_SIGN.MEMO is
'备注';

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
'业余台站字典表';

comment on column AR_DIC.CO is
'序号';

comment on column AR_DIC.CN is
'代码编号';

comment on column AR_DIC.CODE_CHI_NAME is
'代码中文名称';

comment on column AR_DIC.CODE_DATA_TYPE is
'代码数据表类型';

comment on column AR_DIC.CODE_TYPE_CHI_NAME is
'代码数据表类型中文名称';

comment on column AR_DIC.CODE_DISCN is
'显示序号';

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
'业余无线电台站设备表';

comment on column AR_EQU.EQU_ID is
'设备ID';

comment on column AR_EQU.SYS_ID is
'台站ID';

comment on column AR_EQU.EQU_MODEL is
'设备型号';

comment on column AR_EQU.EQU_MFRS is
'设备生产厂家';

comment on column AR_EQU.EQU_CODE is
'型号核准代码';

comment on column AR_EQU.EQU_SN is
'出厂编号';

comment on column AR_EQU.EQU_STATUS is
'设备状态';

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
'设备功率关系表';

comment on column AR_EQU_POW.INFOID is
'信息ID';

comment on column AR_EQU_POW.EQU_ID is
'设备ID';

comment on column AR_EQU_POW.POW_TYPE is
'功率类型  0 HF以下/1  HF/2  50M/3  144M/4 430/5 1240及以上';

comment on column AR_EQU_POW.POW_VALUE is
'功率值';

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
'业余无线电台站基本信息表';

comment on column AR_STATION.APPLY_ID is
'申请ID';

comment on column AR_STATION.CALL_SIGN_ID is
'呼号编号（呼号）';

comment on column AR_STATION.AREA_CODE is
'管理机构代码';

comment on column AR_STATION.STAT_CLASS is
'台站种类';

comment on column AR_STATION.STAT_STATUS is
'台站状态';

comment on column AR_STATION.REP_FREQ_UP is
'中继台上行频率';

comment on column AR_STATION.REP_FREQ_DOWN is
'中继台下行频率';

comment on column AR_STATION.REP_POW is
'中继台下行功率 ';

comment on column AR_STATION.REP_MOD is
'调制方式';

comment on column AR_STATION.REP_DATA_MOD_CLASS is
'数字调制系统种类';

comment on column AR_STATION.REP_REMOTER_CLASS is
'遥控措施种类';

comment on column AR_STATION.AR_MEMO is
'备注';

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
'业务无线电台站扩展信息表';

comment on column AR_STATION_EXT.SYS_ID is
'分类ID';

comment on column AR_STATION_EXT.APPLY_ID is
'申请表ID';

comment on column AR_STATION_EXT.STAT_SETKIND is
'电台设置方式';

comment on column AR_STATION_EXT.SYS_NAME is
'分类名称';

comment on column AR_STATION_EXT.STAT_ADDR1 is
'固定台地址（省份）';

comment on column AR_STATION_EXT.STAT_ADDR2 is
'固定台地址（市、区）';

comment on column AR_STATION_EXT.STAT_ADDR3 is
'固定台地址（县）';

comment on column AR_STATION_EXT.STAT_ADDR4 is
'固定台地址（详细）';

comment on column AR_STATION_EXT.STAT_HEIGHT is
'固定台天线馈电点海拔高度';

comment on column AR_STATION_EXT.STAT_LG is
'地理坐标经度';

comment on column AR_STATION_EXT.STAT_LA is
'地理坐标纬度';

comment on column AR_STATION_EXT.PLATE_NUMBER is
'设台车牌号';

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
'设台单位信息表';

comment on column AR_UNIT.UNIT_ID is
'设台单位ID';

comment on column AR_UNIT.APPLY_ID is
'申请ID';

comment on column AR_UNIT.UNIT_NAME is
'设台单位名称';

comment on column AR_UNIT.REG_UNIT is
'申请单位登记机关';

comment on column AR_UNIT.ADDRESS1 is
'申请单位地址（省份）';

comment on column AR_UNIT.ADDRESS2 is
'申请单位地址（市、区）';

comment on column AR_UNIT.ADDRESS3 is
'申请单位地址（县）';

comment on column AR_UNIT.ADDRESS4 is
'申请单位地址（详细）';

comment on column AR_UNIT.UNIT_CODE is
'申请单位机构代码';

comment on column AR_UNIT.UNIT_PHONE is
'申请单位联系电话';

comment on column AR_UNIT.UNIT_FAX is
'申请单位传真';

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
'设台人员信息表';

comment on column AR_USER.USER_ID is
'人员ID';

comment on column AR_USER.APPLY_ID is
'申请ID';

comment on column AR_USER.USER_TYPE is
'人员类别    0 个人台站申请人/1单位设台单位负责人/2单位设台技术负责人';

comment on column AR_USER.USER_NAME is
'申请人/技术负责人/单位负责人姓名';

comment on column AR_USER.GENDER is
'申请人/技术负责人/单位负责人性别     0女/1男';

comment on column AR_USER.IDCARD is
'申请人/技术负责人/单位负责人身份证 ';

comment on column AR_USER.NATION is
'申请人/技术负责人民族';

comment on column AR_USER.EDUCATION is
'申请人/技术负责人文化程度';

comment on column AR_USER.OPERATION_LEVEL is
'申请人/技术负责人操作级别   取值范围 A/B/C';

comment on column AR_USER.LEVEL_CODE is
'申请人/技术负责人级别证编号';

comment on column AR_USER.SERVICE_UNIT is
'申请人/技术负责人服务单位';

comment on column AR_USER.SERVICE_POST is
'申请人/技术负责人服务单位邮编';

comment on column AR_USER.ADDRESS1 is
'申请人/技术负责人常住地址（省份）';

comment on column AR_USER.ADDRESS2 is
'申请人/技术负责人常住地址（市、区）';

comment on column AR_USER.ADDRESS3 is
'申请人/技术负责人常住地址（县）';

comment on column AR_USER.ADDRESS4 is
'申请人/技术负责人常住地址（详细）';

comment on column AR_USER.ADDRESS_POST is
'申请人/技术负责人常住地址邮编';

comment on column AR_USER.CONTACT_ADDR1 is
'申请人/技术负责人/单位负责人联系地址（省份）';

comment on column AR_USER.CONTACT_ADDR2 is
'申请人/技术负责人/单位负责人联系地址（市、区）';

comment on column AR_USER.CONTACT_ADDR3 is
'申请人/技术负责人/单位负责人联系地址（县）';

comment on column AR_USER.CONTACT_ADDR4 is
'申请人/技术负责人/单位负责人联系地址（详细）';

comment on column AR_USER.CONTACT_POST is
'申请人/技术负责人/单位负责人联系地址邮编';

comment on column AR_USER.EMAIL is
'申请人/技术负责人/单位负责人电子邮件';

comment on column AR_USER.FAX is
'申请人/技术负责人/单位负责人传真';

comment on column AR_USER.SERVICE_PHONE is
'申请人/技术负责人/单位负责人单位电话      当为单位设台时，此字段储存单位负责人联系电话';

comment on column AR_USER.HOME_PHONE is
'申请人/技术负责人/单位负责人住宅电话';

comment on column AR_USER.MOBILE is
'申请人/技术负责人/单位负责人移动电话';

comment on column AR_USER.CONNECT_PHONE is
'单位负责人联系电话';

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
