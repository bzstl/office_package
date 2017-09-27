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

drop table WF_ACCSHEET cascade constraints;

drop table WF_CALLSIGN_SHIP cascade constraints;

drop table WF_CREDIT cascade constraints;

drop table WF_DETECTION cascade constraints;

drop table WF_DETECTION_ATTECH cascade constraints;

drop table WF_DISTURB cascade constraints;

drop table WF_DISTURB_ATTECH cascade constraints;

drop table WF_GRANT_PERMIT cascade constraints;

drop table WF_IMPORT cascade constraints;

drop table WF_IMPORT_EQUIP cascade constraints;

drop table WF_INVESTIGATE cascade constraints;

drop table WF_INV_ATTACH cascade constraints;

drop table WF_LEDGER cascade constraints;

drop table WF_LETTER cascade constraints;

drop table WF_MONIT cascade constraints;

drop table WF_MONIT_ATTACH cascade constraints;

drop table WF_NOTGRANT_PERMIT cascade constraints;

drop table WF_PUNISH cascade constraints;

drop table WF_QUALIFICATION cascade constraints;

drop table WF_SUPV cascade constraints;

drop table WF_SUPV_ATTACH cascade constraints;

drop table WF_UNION cascade constraints;

drop table WF_UNIT cascade constraints;

drop table WF_USER cascade constraints;

/*==============================================================*/
/* Table: WF_ACCSHEET                                           */
/*==============================================================*/
create table WF_ACCSHEET 
(
   GUID                 VARCHAR2(36)         not null,
   ACC_ID               VARCHAR2(16),
   ACC_DATE             DATE,
   DEPT_GUID            VARCHAR2(36),
   ACC_TYPE             VARCHAR2(2),
   ACC_FILE             VARCHAR2(1000),
   ACC_OPINION          VARCHAR2(1000),
   MEMO                 VARCHAR2(1000),
   constraint PK_WF_ACCSHEET primary key (GUID)
)
tablespace RMIP_EXCHANGEDB;

comment on column WF_ACCSHEET.GUID is
'编号';

comment on column WF_ACCSHEET.ACC_ID is
'受理号';

comment on column WF_ACCSHEET.ACC_DATE is
'受理时间';

comment on column WF_ACCSHEET.DEPT_GUID is
'申请单位GUID';

comment on column WF_ACCSHEET.ACC_TYPE is
'业务类型';

comment on column WF_ACCSHEET.ACC_FILE is
'材料提交';

comment on column WF_ACCSHEET.ACC_OPINION is
'受理意见    ';

comment on column WF_ACCSHEET.MEMO is
'备注';

/*==============================================================*/
/* Table: WF_CALLSIGN_SHIP                                      */
/*==============================================================*/
create table WF_CALLSIGN_SHIP 
(
   GUID                 VARCHAR2(36)         not null,
   ACC_ID               VARCHAR2(16),
   APP_DATE             DATE,
   DEPT_GUID            VARCHAR2(36),
   SHIP_NAME            VARCHAR2(80),
   SHIP_PORT            VARCHAR2(80),
   SHIP_TYPE            VARCHAR2(8),
   POWER                VARCHAR2(80),
   MEMO                 VARCHAR2(1000),
   constraint PK_WF_CALLSIGN_SHIP primary key (GUID)
)
tablespace RMIP_EXCHANGEDB;

comment on column WF_CALLSIGN_SHIP.GUID is
'编号';

comment on column WF_CALLSIGN_SHIP.ACC_ID is
'受理号';

comment on column WF_CALLSIGN_SHIP.APP_DATE is
'申请时间';

comment on column WF_CALLSIGN_SHIP.DEPT_GUID is
'申请单位GUID';

comment on column WF_CALLSIGN_SHIP.SHIP_NAME is
'船舶名称';

comment on column WF_CALLSIGN_SHIP.SHIP_PORT is
'船籍港';

comment on column WF_CALLSIGN_SHIP.SHIP_TYPE is
'船舶类型';

comment on column WF_CALLSIGN_SHIP.POWER is
'吨位/马力';

comment on column WF_CALLSIGN_SHIP.MEMO is
'备注';

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
)
tablespace RMIP_EXCHANGEDB;

comment on table WF_CREDIT is
'用户信用信息表';

comment on column WF_CREDIT.GUID is
'唯一标识';

comment on column WF_CREDIT.CRED_OBJ_TYPE is
'相对人    0  法人   1    自然人';

comment on column WF_CREDIT.CRED_INFO_TYPE is
'信息事项 0擅设电台 1违反研制、生产、进口无线电发射设备  2干扰无线电  3 随意变更信号  4 不遵守频率管理  5 违反使用无线电台执照   6 违法销售设备 ';

comment on column WF_CREDIT.CRED_OBJ_ID1 is
'处罚对象ID（自然人）';

comment on column WF_CREDIT.CRED_OBJ_ID2 is
'处罚对象ID（法人）';

comment on column WF_CREDIT.CRED_PUN_CONTENT is
'处罚内容（法定代表人身份证号码）  格式为：“法定代表人身份证号码：XXXX';

comment on column WF_CREDIT.CRED_PUN_ID is
'处罚文号';

comment on column WF_CREDIT.CRED_MATTER_TYPE is
'事项类型（处罚种类） 字典';

comment on column WF_CREDIT.CRED_FACTS is
'违法事实（处罚事由）';

comment on column WF_CREDIT.CRED_DATE is
'处罚决定日期（处罚日期）';

comment on column WF_CREDIT.CRED_MEASURES is
'处罚措施（处罚内容）';

comment on column WF_CREDIT.CRED_GIST is
'处罚依据';

comment on column WF_CREDIT.CRED_UPDATE_TIME is
'业务更新时间';

comment on column WF_CREDIT.CRED_EFFECTIVE is
'有效性  0无效  1 有效';

comment on column WF_CREDIT.CRED_PUN_ORG is
'处罚机关';

/*==============================================================*/
/* Table: WF_DETECTION                                          */
/*==============================================================*/
create table WF_DETECTION 
(
   GUID                 VARCHAR2(36)         not null,
   DET_ID               VARCHAR2(36)         not null,
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
)
tablespace RMIP_EXCHANGEDB;

comment on table WF_DETECTION is
'检测任务表';

comment on column WF_DETECTION.GUID is
'唯一标识';

comment on column WF_DETECTION.DET_ID is
'检测任务编号';

comment on column WF_DETECTION.DET_NAME is
'任务名称';

comment on column WF_DETECTION.DET_TYPE is
'任务性质代码  0 常规  1专项  2特殊  3 其他';

comment on column WF_DETECTION.DET_DEPART is
'下达任务部门代码     ';

comment on column WF_DETECTION.DET_COMPL_DATE is
'完成日期';

comment on column WF_DETECTION.DET_COMPL_TIME is
'完成日期当天的时间';

comment on column WF_DETECTION.DET_ATTN is
'联系人';

comment on column WF_DETECTION.DET_LEADER is
'部门领导';

comment on column WF_DETECTION.DET_CONTENT is
'内容描述';

comment on column WF_DETECTION.DET_REQUEST is
'具体要求';

comment on column WF_DETECTION.DET_RESULT is
'任务结果';

comment on column WF_DETECTION.DET_HANDLER is
'执行人员';

comment on column WF_DETECTION.DET_STATUS is
'处理状态   0未处理   1未审核  2  完成';

comment on column WF_DETECTION.DET_MEMO is
'备注';

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
)
tablespace RMIP_EXCHANGEDB;

comment on table WF_DETECTION_ATTECH is
'干扰投诉受理与附件表';

comment on column WF_DETECTION_ATTECH.FILE_ID is
'文件ID';

comment on column WF_DETECTION_ATTECH.DETECTION_GUID is
'检测任务ID';

comment on column WF_DETECTION_ATTECH.FILENAME is
'附件名名称';

comment on column WF_DETECTION_ATTECH.CONTENT is
'附件内容';

/*==============================================================*/
/* Table: WF_DISTURB                                            */
/*==============================================================*/
create table WF_DISTURB 
(
   GUID                 VARCHAR2(36)         not null,
   DIST_ID              VARCHAR2(36)         not null,
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
)
tablespace RMIP_EXCHANGEDB;

comment on table WF_DISTURB is
'干扰投诉受理登记表';

comment on column WF_DISTURB.GUID is
'唯一标识';

comment on column WF_DISTURB.DIST_ID is
'干扰受理单编号';

comment on column WF_DISTURB.UNIT_GUID is
'单位ID';

comment on column WF_DISTURB.DIST_STAT_ADDR is
'设台地址';

comment on column WF_DISTURB.DIST_ANT_HEIGHT is
'天线高度';

comment on column WF_DISTURB.DIST_ANT_MODEL is
'天线方式';

comment on column WF_DISTURB.DIST_EQU is
'使用设备';

comment on column WF_DISTURB.DIST_LICENSE_ID is
'电台执照编号';

comment on column WF_DISTURB.DIST_FM_MODEL is
'调制方式';

comment on column WF_DISTURB.DIST_LICENSE_DATE is
'验照年度';

comment on column WF_DISTURB.DIST_FREQ is
'受干扰频率';

comment on column WF_DISTURB.DIST_ASPECT is
'干扰制式';

comment on column WF_DISTURB.DIST_DATE is
'受干扰日期';

comment on column WF_DISTURB.DIST_TIME is
'受干扰时间';

comment on column WF_DISTURB.DIST_LEVEL is
'干扰影响程度';

comment on column WF_DISTURB.DIST_SUMMARY is
'申述内容摘要';

comment on column WF_DISTURB.DIST_STATE_DATE is
'申述日期';

comment on column WF_DISTURB.DIST_ACCEP_OPINION is
'受理人员意见';

comment on column WF_DISTURB.DIST_LEADER_OPINION is
'分管领导意见';

comment on column WF_DISTURB.MONIT_GUID is
'监测任务单ID';

comment on column WF_DISTURB.INVESTIGATE_GUID is
'查处执法任务ID';

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
)
tablespace RMIP_EXCHANGEDB;

comment on table WF_DISTURB_ATTECH is
'干扰投诉受理与附件表';

comment on column WF_DISTURB_ATTECH.FILE_ID is
'文件ID';

comment on column WF_DISTURB_ATTECH.DISTURB_GUID is
'干扰受理登记变表';

comment on column WF_DISTURB_ATTECH.FILENAME is
'附件名名称';

comment on column WF_DISTURB_ATTECH.CONTENT is
'附件内容';

/*==============================================================*/
/* Table: WF_GRANT_PERMIT                                       */
/*==============================================================*/
create table WF_GRANT_PERMIT 
(
   GUID                 VARCHAR2(36)         not null,
   ACC_ID               VARCHAR2(16),
   PER_NO               VARCHAR2(16),
   SIGN_DATE            DATE,
   ACC_TYPE             VARCHAR2(2),
   REGION_USE           VARCHAR2(100),
   ACC_OPINION          VARCHAR2(40),
   EPMAX_INDOOR         VARCHAR2(40),
   EPMAX_HAND           VARCHAR2(40),
   CALLSIGN             VARCHAR2(10),
   EXP_LIFE             VARCHAR2(20),
   EXP_DEADLINE         DATE,
   constraint PK_WF_GRANT_PERMIT primary key (GUID)
)
tablespace RMIP_EXCHANGEDB;

comment on column WF_GRANT_PERMIT.GUID is
'编号';

comment on column WF_GRANT_PERMIT.ACC_ID is
'受理号';

comment on column WF_GRANT_PERMIT.PER_NO is
'决定书编号';

comment on column WF_GRANT_PERMIT.SIGN_DATE is
'签发时间';

comment on column WF_GRANT_PERMIT.ACC_TYPE is
'频率用途';

comment on column WF_GRANT_PERMIT.REGION_USE is
'使用区域';

comment on column WF_GRANT_PERMIT.ACC_OPINION is
'发射功率';

comment on column WF_GRANT_PERMIT.EPMAX_INDOOR is
'室内天线最大输出功率';

comment on column WF_GRANT_PERMIT.EPMAX_HAND is
'手持台最大发射功率';

comment on column WF_GRANT_PERMIT.CALLSIGN is
'电台呼号';

comment on column WF_GRANT_PERMIT.EXP_LIFE is
'有效期';

comment on column WF_GRANT_PERMIT.EXP_DEADLINE is
'有效期截止时间';

/*==============================================================*/
/* Table: WF_IMPORT                                             */
/*==============================================================*/
create table WF_IMPORT 
(
   GUID                 VARCHAR2(36)         not null,
   ACC_ID               VARCHAR2(16),
   APP_DATE             DATE,
   DEPT_GUID            VARCHAR2(36),
   ARR_DATE             DATE,
   CUST_DATE            DATE,
   ISALL                VARCHAR2(8),
   CONTRACTNO           VARCHAR2(80),
   SIGN_CHN             VARCHAR2(120),
   CUST_ARR             VARCHAR2(40),
   SIGN_OUT             VARCHAR2(80),
   DELI_COUN            VARCHAR2(40),
   TMP_IN               VARCHAR2(80),
   USE_INCHN            VARCHAR2(2),
   TECH_STATE           VARCHAR2(8),
   PURPOSE              VARCHAR2(80),
   MEMO                 VARCHAR2(1000),
   constraint PK_WF_IMPORT primary key (GUID)
)
tablespace RMIP_EXCHANGEDB;

comment on column WF_IMPORT.GUID is
'编号';

comment on column WF_IMPORT.ACC_ID is
'受理号';

comment on column WF_IMPORT.APP_DATE is
'申请时间';

comment on column WF_IMPORT.DEPT_GUID is
'申请单位GUID';

comment on column WF_IMPORT.ARR_DATE is
'到货时间';

comment on column WF_IMPORT.CUST_DATE is
'出关时间';

comment on column WF_IMPORT.ISALL is
'是否分批到货';

comment on column WF_IMPORT.CONTRACTNO is
'合同号';

comment on column WF_IMPORT.SIGN_CHN is
'中方签合同单位';

comment on column WF_IMPORT.CUST_ARR is
'到货海关';

comment on column WF_IMPORT.SIGN_OUT is
'外方签合同单位';

comment on column WF_IMPORT.DELI_COUN is
'发货国家';

comment on column WF_IMPORT.TMP_IN is
'是否临时进关';

comment on column WF_IMPORT.USE_INCHN is
'是否在中国境内使用';

comment on column WF_IMPORT.TECH_STATE is
'技术状态';

comment on column WF_IMPORT.PURPOSE is
'用途';

comment on column WF_IMPORT.MEMO is
'备注';

/*==============================================================*/
/* Table: WF_IMPORT_EQUIP                                       */
/*==============================================================*/
create table WF_IMPORT_EQUIP 
(
   GUID                 VARCHAR2(36)         not null,
   ACC_GUID             VARCHAR2(16),
   MANU                 VARCHAR2(120),
   GOODS_NAME           VARCHAR2(120),
   MODEL                VARCHAR2(120),
   FREQ_RANGE           VARCHAR2(200),
   EMIT_POW             NUMBER,
   POW_UNIT             VARCHAR2(8),
   AMOUNT               NUMBER,
   constraint PK_WF_IMPORT_EQUIP primary key (GUID)
)
tablespace RMIP_EXCHANGEDB;

comment on column WF_IMPORT_EQUIP.GUID is
'编号';

comment on column WF_IMPORT_EQUIP.ACC_GUID is
'受理GUID';

comment on column WF_IMPORT_EQUIP.MANU is
'生产厂商';

comment on column WF_IMPORT_EQUIP.GOODS_NAME is
'商品名称';

comment on column WF_IMPORT_EQUIP.MODEL is
'型号';

comment on column WF_IMPORT_EQUIP.FREQ_RANGE is
'频率范围';

comment on column WF_IMPORT_EQUIP.EMIT_POW is
'发射功率';

comment on column WF_IMPORT_EQUIP.POW_UNIT is
'单位';

comment on column WF_IMPORT_EQUIP.AMOUNT is
'数量';

/*==============================================================*/
/* Table: WF_INVESTIGATE                                        */
/*==============================================================*/
create table WF_INVESTIGATE 
(
   GUID                 VARCHAR2(36)         not null,
   INV_ID               VARCHAR2(36)         not null,
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
)
tablespace RMIP_EXCHANGEDB;

comment on table WF_INVESTIGATE is
'查处执法任务表';

comment on column WF_INVESTIGATE.GUID is
'唯一标识';

comment on column WF_INVESTIGATE.INV_ID is
'查处执法任务编号';

comment on column WF_INVESTIGATE.INV_HANDLE_DATE is
'处理日期';

comment on column WF_INVESTIGATE.INV_CASE_TYPE is
'事件类型代码    ';

comment on column WF_INVESTIGATE.INV_SOURCE_TYPE is
'事件来源代码 ';

comment on column WF_INVESTIGATE.INV_CASE_NAME is
'事件名称';

comment on column WF_INVESTIGATE.INV_COMPLETE_DATE is
'完成日期';

comment on column WF_INVESTIGATE.INV_HANDLER is
'处理者';

comment on column WF_INVESTIGATE.INV_CONTENT is
'任务内容';

comment on column WF_INVESTIGATE.INV_RESULT is
'执法结果';

comment on column WF_INVESTIGATE.UNIT_GUID is
'单位ID';

comment on column WF_INVESTIGATE.INV_SYSTEM_CODE is
'系统代码';

comment on column WF_INVESTIGATE.INV_STATUS_TYPE is
'处理状态   0  未接收   1未处理  2 调查环节 3立案环节 4领导审批事先告知数书  5陈述申辩  6 审批处罚决定书 7结案环节 8处理完成';

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
)
tablespace RMIP_EXCHANGEDB;

comment on table WF_INV_ATTACH is
'查处执法任务与附件表';

comment on column WF_INV_ATTACH.FILE_ID is
'文件ID';

comment on column WF_INV_ATTACH.INVESTIGATE_GUID is
'查处任务ID';

comment on column WF_INV_ATTACH.FILENAME is
'附件名名称';

comment on column WF_INV_ATTACH.CONTENT is
'附件内容';

/*==============================================================*/
/* Table: WF_LEDGER                                             */
/*==============================================================*/
create table WF_LEDGER 
(
   GUID                 VARCHAR2(36)         not null,
   LEG_ID               VARCHAR2(36)         not null,
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
)
tablespace RMIP_EXCHANGEDB;

comment on table WF_LEDGER is
'信访投诉台账信息表';

comment on column WF_LEDGER.GUID is
'唯一标识';

comment on column WF_LEDGER.LEG_ID is
'台账编号';

comment on column WF_LEDGER.LEG_CORP_CODE is
'法人代表号';

comment on column WF_LEDGER.LEG_CASE_TYPE is
'案件类型代码 1：基站投诉  2：广播干扰/广播信号投诉  3：业余无线电投诉   4：其它投诉';

comment on column WF_LEDGER.USER_GUID is
'投诉人ID';

comment on column WF_LEDGER.LEG_COMP_ADDR is
'投诉地址';

comment on column WF_LEDGER.LEG_OBJ_TYPE is
'投诉对象类型  0  个人/ 1 单位';

comment on column WF_LEDGER.LEG_ADDR_CODE is
'投诉对象所在区县代码';

comment on column WF_LEDGER.LEG_OBJ_ID1 is
'投诉对象ID（自然人）';

comment on column WF_LEDGER.LEG_OBJ_ID2 is
'投诉对象ID（法人）';

comment on column WF_LEDGER.LEG_SOURCE_TYPE is
'投诉来源代码    0来访/1信访/2电访/3网站/4局长信箱/ 5代表12345/6监督检查/7其他';

comment on column WF_LEDGER.LEG_CONTENT is
'投诉内容';

comment on column WF_LEDGER.LEG_RNR_DATE is
'受理响应日期';

comment on column WF_LEDGER.LEG_COMP_DATE is
'投诉产生日期';

comment on column WF_LEDGER.LEG_SITUATION is
'检查的情况描述';

comment on column WF_LEDGER.LEG_RESULT_TYPE is
'检查处理结果分类   0整改（停工）/1拆除（拆天线、拆基站）2 其他';

comment on column WF_LEDGER.LEG_UNIT is
'被检单位';

comment on column WF_LEDGER.LEG_REPLY_DATE is
'回复投诉人的时间';

comment on column WF_LEDGER.LEG_COR_ID is
'责令整改编号';

comment on column WF_LEDGER.LEG_COMPL_DATE is
'投诉处理完毕时间(投诉闭环时间)';

comment on column WF_LEDGER.LEG_GUID is
'投诉登记表编号';

comment on column WF_LEDGER.LEG_NAME1 is
'经办人';

comment on column WF_LEDGER.LEG_NAME2 is
'负责人';

comment on column WF_LEDGER.LEG_MEMO is
'备注';

/*==============================================================*/
/* Table: WF_LETTER                                             */
/*==============================================================*/
create table WF_LETTER 
(
   GUID                 VARCHAR2(36)         not null,
   LET_ID               VARCHAR2(36)         not null,
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
)
tablespace RMIP_EXCHANGEDB;

comment on table WF_LETTER is
'信访投诉登记表';

comment on column WF_LETTER.GUID is
'唯一标识';

comment on column WF_LETTER.LET_ID is
'信访登记表编号';

comment on column WF_LETTER.LET_TYPE is
'投诉人为0/行政相对人为1';

comment on column WF_LETTER.LET_COMP_AGAIN_NAME is
'投诉对象名称/姓名';

comment on column WF_LETTER.LET_REPEAT is
'是否重复投诉  0是 1否';

comment on column WF_LETTER.LETTER_GUID is
'重复登记表编号';

comment on column WF_LETTER.LET_FB_TYPE is
'办理情况反馈代码  0 办结/1 不予受理/2 不再受理';

comment on column WF_LETTER.LET_REPLY_TYPE is
'答复方式代码 0 电话/1 书面/2 约谈';

comment on column WF_LETTER.LET_OPINION is
'最终意见';

comment on column WF_LETTER.LET_IF_REPLY is
'结果回复情况     0 未回复用户    1   已回复用户';

comment on column WF_LETTER.SUPV_GUID is
'监督检查任务ID';

comment on column WF_LETTER.LEDGER_GUID is
'信访台账编号';

comment on column WF_LETTER.LET_MEMO is
'备注';

/*==============================================================*/
/* Table: WF_MONIT                                              */
/*==============================================================*/
create table WF_MONIT 
(
   GUID                 VARCHAR2(36)         not null,
   MONIT_ID             VARCHAR2(36)         not null,
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
)
tablespace RMIP_EXCHANGEDB;

comment on table WF_MONIT is
'监测任务表';

comment on column WF_MONIT.GUID is
'唯一标识';

comment on column WF_MONIT.MONIT_ID is
'监测任务编号';

comment on column WF_MONIT.MONIT_NAME is
'任务名称';

comment on column WF_MONIT.MONIT_TYPE is
'任务性质代码  0 常规  1专项  2特殊  3 其他';

comment on column WF_MONIT.MONIT_DEPARTMENT is
'下达任务部门代码';

comment on column WF_MONIT.MONIT_COMPLETE_DATE is
'完成日期';

comment on column WF_MONIT.MONIT_COMPLETE_TIME is
'完成日期当天的时间';

comment on column WF_MONIT.MONIT_ATTN is
'联系人';

comment on column WF_MONIT.MONIT_LEADER is
'部门领导';

comment on column WF_MONIT.MONIT_CONTENT is
'内容描述';

comment on column WF_MONIT.MONIT_REQUEST is
'具体要求';

comment on column WF_MONIT.MONIT_RESULT is
'任务结果';

comment on column WF_MONIT.MONIT_MEMO is
'备注';

comment on column WF_MONIT.MONIT_HANDLER is
'执行人员';

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
)
tablespace RMIP_EXCHANGEDB;

comment on table WF_MONIT_ATTACH is
'监督检查任务与附件表';

comment on column WF_MONIT_ATTACH.FILE_ID is
'文件ID';

comment on column WF_MONIT_ATTACH.MONIT_GUID is
'监测任务ID';

comment on column WF_MONIT_ATTACH.FILENAME is
'附件名名称';

comment on column WF_MONIT_ATTACH.CONTENT is
'附件内容';

/*==============================================================*/
/* Table: WF_NOTGRANT_PERMIT                                    */
/*==============================================================*/
create table WF_NOTGRANT_PERMIT 
(
   GUID                 VARCHAR2(36)         not null,
   ACC_ID               VARCHAR2(16),
   PER_NO               VARCHAR2(16),
   SIGN_DATE            DATE,
   ACC_TYPE             VARCHAR2(200),
   REGION_USE           VARCHAR2(200),
   MEMO                 VARCHAR2(200),
   constraint PK_WF_NOTGRANT_PERMIT primary key (GUID)
)
tablespace RMIP_EXCHANGEDB;

comment on column WF_NOTGRANT_PERMIT.GUID is
'编号';

comment on column WF_NOTGRANT_PERMIT.ACC_ID is
'受理号';

comment on column WF_NOTGRANT_PERMIT.PER_NO is
'决定书编号';

comment on column WF_NOTGRANT_PERMIT.SIGN_DATE is
'签发时间';

comment on column WF_NOTGRANT_PERMIT.ACC_TYPE is
'拒绝理由';

comment on column WF_NOTGRANT_PERMIT.REGION_USE is
'拒绝法规条文';

comment on column WF_NOTGRANT_PERMIT.MEMO is
'备注';

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
)
tablespace RMIP_EXCHANGEDB;

comment on table WF_PUNISH is
'行政处罚数据表';

comment on column WF_PUNISH.GUID is
'对应的问题数据的主键';

comment on column WF_PUNISH.PUNISH_ENTY_ID is
'法人库处罚数据序号';

comment on column WF_PUNISH.PUNISH_CODE is
'处罚通知书编号';

comment on column WF_PUNISH.PUNISH_UNIT is
'处罚机关';

comment on column WF_PUNISH.PUNISH_CORP is
'被处罚单位';

comment on column WF_PUNISH.PUNISH_ORG_CODE is
'组织机构代码';

comment on column WF_PUNISH.PUNISH_REG_NO is
'注册号';

comment on column WF_PUNISH.PUNISH_CORP_ADDR is
'地址（生产经营地址）';

comment on column WF_PUNISH.PUNISH_ZIP is
'邮编';

comment on column WF_PUNISH.PUNISH_TEL is
'联系电话';

comment on column WF_PUNISH.PUNISH_PERSON is
'法定代表人/负责人';

comment on column WF_PUNISH.PUNISH_PERSON_TITLE is
'职务';

comment on column WF_PUNISH.PUNISH_ILLEG_DATE is
'违法时间';

comment on column WF_PUNISH.PUNISH_ILLEG_ADDR is
'违法地点';

comment on column WF_PUNISH.APUNISH_REA_CODE is
'违法地点区划（参见问题数据和修正数据xml格式定义开发手册 附录G-资质、处罚区划字典';

comment on column WF_PUNISH.PUNISH_ILLEG_CONTEXT is
'违法事实';

comment on column WF_PUNISH.PUNISH_ILLEG_EVID is
'证据';

comment on column WF_PUNISH.PUNISH_ILLEG_RULE is
'违反规定';

comment on column WF_PUNISH.PUNISH_BASIS is
'处罚依据';

comment on column WF_PUNISH.PUNISH_MEASURES is
'处罚措施';

comment on column WF_PUNISH.PUNISH_DATE is
'处罚决定时间';

comment on column WF_PUNISH.PUNISH_BUSI_UPD_TIME is
'业务更新时间';

comment on column WF_PUNISH.PUNISH_LIMIT is
'履罚期限';

comment on column WF_PUNISH.PUNISH_VALIDITY is
'有效性  0无效   1有效';

comment on column WF_PUNISH.PUNISH_TEAM is
'受处罚单位和集体名称';

comment on column WF_PUNISH.PUNISH_UNIT_PROPERTY is
'被处罚单位性质';

comment on column WF_PUNISH.PUNISH_TAX_CODE is
'税务登记号';

comment on column WF_PUNISH.PUNISH_CONTENT is
'处罚内容';

comment on column WF_PUNISH.PUNISH_SPOT_TEST_TYPE is
'抽查类别';

comment on column WF_PUNISH.PUNISH_ANN_REASON is
'通告原因';

comment on column WF_PUNISH.PUNISH_FROM_DEPT_ID is
'委办局编号参见问题数据和修正数据xml格式定义开发手册 附录G-资质、处罚区划字典';

comment on column WF_PUNISH.PUNISH_UNI_SC_ID is
'统一社会信用代码';

comment on column WF_PUNISH.PUNISH_ER_REASON is
'问题数据的原因';

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
   QUAL_START_DATE      DATE,
   QUAL_END_DATE        DATE,
   QUAL_PERSON_NAME     VARCHAR2(128),
   QUAL_BUSINESS_SCOPE  VARCHAR2(2000),
   QUAL_UNIT_ADDR       VARCHAR2(128),
   QUAL_BUSINESS_ADDR   VARCHAR2(128),
   QUAL_UNIT_PERSON     VARCHAR2(128),
   QUALI_LEVEL          VARCHAR2(128),
   QUAL_MANAGE_ORG      VARCHAR2(128),
   QUAL_REG_NO          VARCHAR2(1024),
   QUAL_BUSI_UPD_TIME   DATE,
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
)
tablespace RMIP_EXCHANGEDB;

comment on table WF_QUALIFICATION is
'资质数据表';

comment on column WF_QUALIFICATION.GUID is
'对应的问题数据的主键';

comment on column WF_QUALIFICATION.QUAL_LICENSE_ID is
'数据中心许可证唯一序号';

comment on column WF_QUALIFICATION.QUAL_CORP_INFO_ID is
'数据中心法人实体序号';

comment on column WF_QUALIFICATION.QUAL_ENTITY_ID is
'企业唯一标识（工商）';

comment on column WF_QUALIFICATION.QUAL_ORGAN_CODE is
'组织结构代码';

comment on column WF_QUALIFICATION.QUAL_LICENSE_TYPE is
'许可证事项名称代码（登录法人库系统法人信息目录管理菜单查看）';

comment on column WF_QUALIFICATION.QUAL_UNIQUE_CODE is
'资质信息委办局唯一标识';

comment on column WF_QUALIFICATION.QUAL_BUREAU_CODE is
'委办局编号（参见问题数据和修正数据xml格式定义开发手册 附录G-单位字典）';

comment on column WF_QUALIFICATION.QUAL_LICENSE_STAT is
'许可证号状态（参见问题数据和修正数据xml格式定义开发手册 附录G-资质状态字典）';

comment on column WF_QUALIFICATION.QUAL_LICENSE_CODE is
'许可证号';

comment on column WF_QUALIFICATION.QUAL_LICENSE_DATE is
'发证日期';

comment on column WF_QUALIFICATION.QUAL_UNIT_NAME is
'法人名称';

comment on column WF_QUALIFICATION.QUAL_START_DATE is
'有效日期(起)';

comment on column WF_QUALIFICATION.QUAL_END_DATE is
'有效日期(止)';

comment on column WF_QUALIFICATION.QUAL_PERSON_NAME is
'法定代表人';

comment on column WF_QUALIFICATION.QUAL_BUSINESS_SCOPE is
'经营范围';

comment on column WF_QUALIFICATION.QUAL_UNIT_ADDR is
'单位地址';

comment on column WF_QUALIFICATION.QUAL_BUSINESS_ADDR is
'经营地址';

comment on column WF_QUALIFICATION.QUAL_UNIT_PERSON is
'负责人';

comment on column WF_QUALIFICATION.QUALI_LEVEL is
'资质等级';

comment on column WF_QUALIFICATION.QUAL_MANAGE_ORG is
'主管机关';

comment on column WF_QUALIFICATION.QUAL_REG_NO is
'注册号';

comment on column WF_QUALIFICATION.QUAL_BUSI_UPD_TIME is
'业务发布时间';

comment on column WF_QUALIFICATION.QUAL_UNIT_PROP is
'单位性质';

comment on column WF_QUALIFICATION.QUAL_ISSUE_ORG is
'发证机关';

comment on column WF_QUALIFICATION.QUAL_PERM_CONTEXT is
'许可内容';

comment on column WF_QUALIFICATION.QUAL_PERSON_TITLE is
'法定代表人职务/职称';

comment on column WF_QUALIFICATION.QUAL_PERSON_TEL is
'法定代表人电话';

comment on column WF_QUALIFICATION.QUAL_UNIT_PERSON_TITLE is
'负责人职务/职称';

comment on column WF_QUALIFICATION.QUAL_UNIT_PERSON_TEL is
'联系电话';

comment on column WF_QUALIFICATION.QUAL_ZIP is
'邮编';

comment on column WF_QUALIFICATION.QUAL_QUAL_OTHER_UNIT is
'涉及单位名称';

comment on column WF_QUALIFICATION.QUAL_OTHER_ORGAN_CODE is
'涉及单位组织机构代码';

comment on column WF_QUALIFICATION.COLUMAREA_CODEN_33 is
'颁发单位区划（参见问题数据和修正数据xml格式定义开发手册  附录G-资质、处罚区划字典）';

comment on column WF_QUALIFICATION.QUAL_PERM_SCOPE is
'许可范围';

comment on column WF_QUALIFICATION.QUAL_PERM_CONTENT is
'行政许可决定书内容';

comment on column WF_QUALIFICATION.QUAL_LICENSE_NAME is
'证件名称';

comment on column WF_QUALIFICATION.QUAL_PRO_NAME is
'产品名称';

comment on column WF_QUALIFICATION.QUAL_PRO_MODEL is
'型号';

comment on column WF_QUALIFICATION.QUAL_PRO_STANDARD is
'规格';

comment on column WF_QUALIFICATION.QUAL_PRO_ACCURACY is
'准确度';

comment on column WF_QUALIFICATION.QUAL_VALIDITY is
'有效性 0无效  1 有效';

comment on column WF_QUALIFICATION.QUAL_UNI_SC_ID is
'统一社会信用代码';

comment on column WF_QUALIFICATION.QUAL_ER_REASON is
'问题数据的原因';

/*==============================================================*/
/* Table: WF_SUPV                                               */
/*==============================================================*/
create table WF_SUPV 
(
   GUID                 VARCHAR2(36)         not null,
   SUPV_ID              VARCHAR2(36)         not null,
   SUPV_CONTENT         VARCHAR2(1000),
   SUPV_OPINION         VARCHAR2(1000),
   SUPV_CARRIER         VARCHAR2(50),
   SUPV_PRO_TYPE        VARCHAR2(1),
   SUPV_MEMO            VARCHAR2(1000),
   SUPV_LEGAL           VARCHAR2(1),
   constraint PK_WF_SUPV primary key (GUID)
)
tablespace RMIP_EXCHANGEDB;

comment on table WF_SUPV is
'监督检查任务表';

comment on column WF_SUPV.GUID is
'唯一标识';

comment on column WF_SUPV.SUPV_ID is
'投诉任务单编号';

comment on column WF_SUPV.SUPV_CONTENT is
'任务内容';

comment on column WF_SUPV.SUPV_OPINION is
'调查意见';

comment on column WF_SUPV.SUPV_CARRIER is
'运营商名称';

comment on column WF_SUPV.SUPV_PRO_TYPE is
'处理代码    0整改（停工）/1拆除（拆天线、拆基站）';

comment on column WF_SUPV.SUPV_MEMO is
'备注';

comment on column WF_SUPV.SUPV_LEGAL is
'是否合法   0不合法/1合法';

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
)
tablespace RMIP_EXCHANGEDB;

comment on table WF_SUPV_ATTACH is
'监督检查任务与附件表';

comment on column WF_SUPV_ATTACH.FILE_ID is
'文件ID';

comment on column WF_SUPV_ATTACH.SUPV_GUID is
'监督检查任务ID';

comment on column WF_SUPV_ATTACH.FILENAME is
'附件名名称';

comment on column WF_SUPV_ATTACH.CONTENT is
'附件内容';

/*==============================================================*/
/* Table: WF_UNION                                              */
/*==============================================================*/
create table WF_UNION 
(
   GUID                 VARCHAR2(36)         not null,
   UNION_ID             VARCHAR2(36)         not null,
   UNION_ADDR1          VARCHAR2(100),
   UNION_PERSON_LIST    VARCHAR2(1000),
   UNION_PURPOSE        VARCHAR2(1024),
   UNION_EQU            VARCHAR2(1024),
   UNION_CONTENT        VARCHAR2(4000),
   UNION_RESULT1        VARCHAR2(1024),
   UNION_OPINION        VARCHAR2(300),
   constraint PK_WF_UNION primary key (GUID)
)
tablespace RMIP_EXCHANGEDB;

comment on table WF_UNION is
'联合执法方案表';

comment on column WF_UNION.GUID is
'唯一标识';

comment on column WF_UNION.UNION_ID is
'联合执法方案编号';

comment on column WF_UNION.UNION_ADDR1 is
'执法地点';

comment on column WF_UNION.UNION_PERSON_LIST is
'人员名单';

comment on column WF_UNION.UNION_PURPOSE is
'目的';

comment on column WF_UNION.UNION_EQU is
'使用设备';

comment on column WF_UNION.UNION_CONTENT is
'方案内容';

comment on column WF_UNION.UNION_RESULT1 is
'处理情况';

comment on column WF_UNION.UNION_OPINION is
'领导审核意见';

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
)
tablespace RMIP_EXCHANGEDB;

comment on column WF_UNIT.GUID is
'唯一标识';

comment on column WF_UNIT.UNIT_NAME is
'名称';

comment on column WF_UNIT.UNIT_CODE is
'组织机构代码';

comment on column WF_UNIT.UNIT_ADDR is
'地址';

comment on column WF_UNIT.UNIT_TELPHONE is
'联系电话';

comment on column WF_UNIT.UNIT_MAIL is
'邮箱';

comment on column WF_UNIT.UNIT_ATTN is
'联系人';

comment on column WF_UNIT.UNIT_PHONR is
'手机号';

comment on column WF_UNIT.UNIT_ZIP is
'邮政编号';

comment on column WF_UNIT.UNIT_FAX is
'传真号';

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
)
tablespace RMIP_EXCHANGEDB;

comment on table WF_USER is
'人员信息表';

comment on column WF_USER.USER_ID is
'唯一标识';

comment on column WF_USER.USER_NAME is
'姓名';

comment on column WF_USER.USER_MAIL is
'电子邮箱';

comment on column WF_USER.USER_PHONE is
'联系电话';

comment on column WF_USER.USER_ADDR is
'地址';

comment on column WF_USER.USER_CODE is
'身份证号';

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
