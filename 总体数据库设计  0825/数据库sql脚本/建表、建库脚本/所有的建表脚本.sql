------------------------------------------------
-- Export file for user  DEV             --
-- Created by ZHANGJF on 2016/10/14, 11:42:57 --
------------------------------------------------

set define off
spool rmip.log

prompt
prompt Creating table ACT_EVT_LOG
prompt ==========================
prompt
create table  ACT_EVT_LOG
(
  log_nr_       NUMBER(19) not null,
  type_         NVARCHAR2(64),
  proc_def_id_  NVARCHAR2(64),
  proc_inst_id_ NVARCHAR2(64),
  execution_id_ NVARCHAR2(64),
  task_id_      NVARCHAR2(64),
  time_stamp_   TIMESTAMP(6) not null,
  user_id_      NVARCHAR2(255),
  data_         BLOB,
  lock_owner_   NVARCHAR2(255),
  lock_time_    TIMESTAMP(6),
  is_processed_ NUMBER(3) default 0
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255;
alter table  ACT_EVT_LOG
  add primary key (LOG_NR_)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ACT_RE_DEPLOYMENT
prompt ================================
prompt
create table  ACT_RE_DEPLOYMENT
(
  id_          NVARCHAR2(64) not null,
  name_        NVARCHAR2(255),
  category_    NVARCHAR2(255),
  tenant_id_   NVARCHAR2(255) default '',
  deploy_time_ TIMESTAMP(6)
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  ACT_RE_DEPLOYMENT
  add primary key (ID_)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ACT_GE_BYTEARRAY
prompt ===============================
prompt
create table  ACT_GE_BYTEARRAY
(
  id_            NVARCHAR2(64) not null,
  rev_           INTEGER,
  name_          NVARCHAR2(255),
  deployment_id_ NVARCHAR2(64),
  bytes_         BLOB,
  generated_     NUMBER(1)
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_BYTEAR_DEPL on  ACT_GE_BYTEARRAY (DEPLOYMENT_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  ACT_GE_BYTEARRAY
  add primary key (ID_)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  ACT_GE_BYTEARRAY
  add constraint ACT_FK_BYTEARR_DEPL foreign key (DEPLOYMENT_ID_)
  references  ACT_RE_DEPLOYMENT (ID_);
alter table  ACT_GE_BYTEARRAY
  add check (GENERATED_ IN (1,0));

prompt
prompt Creating table ACT_GE_PROPERTY
prompt ==============================
prompt
create table  ACT_GE_PROPERTY
(
  name_  NVARCHAR2(64) not null,
  value_ NVARCHAR2(300),
  rev_   INTEGER
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  ACT_GE_PROPERTY
  add primary key (NAME_)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ACT_HI_ACTINST
prompt =============================
prompt
create table  ACT_HI_ACTINST
(
  id_                NVARCHAR2(64) not null,
  proc_def_id_       NVARCHAR2(64) not null,
  proc_inst_id_      NVARCHAR2(64) not null,
  execution_id_      NVARCHAR2(64) not null,
  act_id_            NVARCHAR2(255) not null,
  task_id_           NVARCHAR2(64),
  call_proc_inst_id_ NVARCHAR2(64),
  act_name_          NVARCHAR2(255),
  act_type_          NVARCHAR2(255) not null,
  assignee_          NVARCHAR2(255),
  start_time_        TIMESTAMP(6) not null,
  end_time_          TIMESTAMP(6),
  duration_          NUMBER(19),
  tenant_id_         NVARCHAR2(255) default ''
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_HI_ACT_INST_END on  ACT_HI_ACTINST (END_TIME_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_HI_ACT_INST_EXEC on  ACT_HI_ACTINST (EXECUTION_ID_, ACT_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_HI_ACT_INST_PROCINST on  ACT_HI_ACTINST (PROC_INST_ID_, ACT_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_HI_ACT_INST_START on  ACT_HI_ACTINST (START_TIME_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  ACT_HI_ACTINST
  add primary key (ID_)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ACT_HI_ATTACHMENT
prompt ================================
prompt
create table  ACT_HI_ATTACHMENT
(
  id_           NVARCHAR2(64) not null,
  rev_          INTEGER,
  user_id_      NVARCHAR2(255),
  name_         NVARCHAR2(255),
  description_  NVARCHAR2(2000),
  type_         NVARCHAR2(255),
  task_id_      NVARCHAR2(64),
  proc_inst_id_ NVARCHAR2(64),
  url_          NVARCHAR2(2000),
  content_id_   NVARCHAR2(64),
  time_         TIMESTAMP(6)
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255;
alter table  ACT_HI_ATTACHMENT
  add primary key (ID_)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ACT_HI_COMMENT
prompt =============================
prompt
create table  ACT_HI_COMMENT
(
  id_           NVARCHAR2(64) not null,
  type_         NVARCHAR2(255),
  time_         TIMESTAMP(6) not null,
  user_id_      NVARCHAR2(255),
  task_id_      NVARCHAR2(64),
  proc_inst_id_ NVARCHAR2(64),
  action_       NVARCHAR2(255),
  message_      NVARCHAR2(2000),
  full_msg_     BLOB
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255;
alter table  ACT_HI_COMMENT
  add primary key (ID_)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ACT_HI_DETAIL
prompt ============================
prompt
create table  ACT_HI_DETAIL
(
  id_           NVARCHAR2(64) not null,
  type_         NVARCHAR2(255) not null,
  proc_inst_id_ NVARCHAR2(64),
  execution_id_ NVARCHAR2(64),
  task_id_      NVARCHAR2(64),
  act_inst_id_  NVARCHAR2(64),
  name_         NVARCHAR2(255) not null,
  var_type_     NVARCHAR2(64),
  rev_          INTEGER,
  time_         TIMESTAMP(6) not null,
  bytearray_id_ NVARCHAR2(64),
  double_       NUMBER(*,10),
  long_         NUMBER(19),
  text_         NVARCHAR2(2000),
  text2_        NVARCHAR2(2000)
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255;
create index  ACT_IDX_HI_DETAIL_ACT_INST on  ACT_HI_DETAIL (ACT_INST_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;
create index  ACT_IDX_HI_DETAIL_NAME on  ACT_HI_DETAIL (NAME_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;
create index  ACT_IDX_HI_DETAIL_PROC_INST on  ACT_HI_DETAIL (PROC_INST_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;
create index  ACT_IDX_HI_DETAIL_TASK_ID on  ACT_HI_DETAIL (TASK_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;
create index  ACT_IDX_HI_DETAIL_TIME on  ACT_HI_DETAIL (TIME_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  ACT_HI_DETAIL
  add primary key (ID_)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ACT_HI_IDENTITYLINK
prompt ==================================
prompt
create table  ACT_HI_IDENTITYLINK
(
  id_           NVARCHAR2(64) not null,
  group_id_     NVARCHAR2(255),
  type_         NVARCHAR2(255),
  user_id_      NVARCHAR2(255),
  task_id_      NVARCHAR2(64),
  proc_inst_id_ NVARCHAR2(64)
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_HI_IDENT_LNK_PROCINST on  ACT_HI_IDENTITYLINK (PROC_INST_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_HI_IDENT_LNK_TASK on  ACT_HI_IDENTITYLINK (TASK_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_HI_IDENT_LNK_USER on  ACT_HI_IDENTITYLINK (USER_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  ACT_HI_IDENTITYLINK
  add primary key (ID_)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ACT_HI_PROCINST
prompt ==============================
prompt
create table  ACT_HI_PROCINST
(
  id_                        NVARCHAR2(64) not null,
  proc_inst_id_              NVARCHAR2(64) not null,
  business_key_              NVARCHAR2(255),
  proc_def_id_               NVARCHAR2(64) not null,
  start_time_                TIMESTAMP(6) not null,
  end_time_                  TIMESTAMP(6),
  duration_                  NUMBER(19),
  start_user_id_             NVARCHAR2(255),
  start_act_id_              NVARCHAR2(255),
  end_act_id_                NVARCHAR2(255),
  super_process_instance_id_ NVARCHAR2(64),
  delete_reason_             NVARCHAR2(2000),
  tenant_id_                 NVARCHAR2(255) default '',
  name_                      NVARCHAR2(255)
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_HI_PRO_INST_END on  ACT_HI_PROCINST (END_TIME_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_HI_PRO_I_BUSKEY on  ACT_HI_PROCINST (BUSINESS_KEY_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  ACT_HI_PROCINST
  add primary key (ID_)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  ACT_HI_PROCINST
  add unique (PROC_INST_ID_)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ACT_HI_TASKINST
prompt ==============================
prompt
create table  ACT_HI_TASKINST
(
  id_             NVARCHAR2(64) not null,
  proc_def_id_    NVARCHAR2(64),
  task_def_key_   NVARCHAR2(255),
  proc_inst_id_   NVARCHAR2(64),
  execution_id_   NVARCHAR2(64),
  parent_task_id_ NVARCHAR2(64),
  name_           NVARCHAR2(255),
  description_    NVARCHAR2(2000),
  owner_          NVARCHAR2(255),
  assignee_       NVARCHAR2(255),
  start_time_     TIMESTAMP(6) not null,
  claim_time_     TIMESTAMP(6),
  end_time_       TIMESTAMP(6),
  duration_       NUMBER(19),
  delete_reason_  NVARCHAR2(2000),
  priority_       INTEGER,
  due_date_       TIMESTAMP(6),
  form_key_       NVARCHAR2(255),
  category_       NVARCHAR2(255),
  tenant_id_      NVARCHAR2(255) default ''
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_HI_TASK_INST_PROCINST on  ACT_HI_TASKINST (PROC_INST_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  ACT_HI_TASKINST
  add primary key (ID_)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ACT_HI_VARINST
prompt =============================
prompt
create table  ACT_HI_VARINST
(
  id_                NVARCHAR2(64) not null,
  proc_inst_id_      NVARCHAR2(64),
  execution_id_      NVARCHAR2(64),
  task_id_           NVARCHAR2(64),
  name_              NVARCHAR2(255) not null,
  var_type_          NVARCHAR2(100),
  rev_               INTEGER,
  bytearray_id_      NVARCHAR2(64),
  double_            NUMBER(*,10),
  long_              NUMBER(19),
  text_              NVARCHAR2(2000),
  text2_             NVARCHAR2(2000),
  create_time_       TIMESTAMP(6),
  last_updated_time_ TIMESTAMP(6)
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_HI_PROCVAR_NAME_TYPE on  ACT_HI_VARINST (NAME_, VAR_TYPE_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_HI_PROCVAR_PROC_INST on  ACT_HI_VARINST (PROC_INST_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_HI_PROCVAR_TASK_ID on  ACT_HI_VARINST (TASK_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  ACT_HI_VARINST
  add primary key (ID_)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ACT_ID_GROUP
prompt ===========================
prompt
create table  ACT_ID_GROUP
(
  id_   NVARCHAR2(64) not null,
  rev_  INTEGER,
  name_ NVARCHAR2(255),
  type_ NVARCHAR2(255)
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  ACT_ID_GROUP
  add primary key (ID_)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ACT_ID_INFO
prompt ==========================
prompt
create table  ACT_ID_INFO
(
  id_        NVARCHAR2(64) not null,
  rev_       INTEGER,
  user_id_   NVARCHAR2(64),
  type_      NVARCHAR2(64),
  key_       NVARCHAR2(255),
  value_     NVARCHAR2(255),
  password_  BLOB,
  parent_id_ NVARCHAR2(255)
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255;
alter table  ACT_ID_INFO
  add primary key (ID_)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table ACT_ID_USER
prompt ==========================
prompt
create table  ACT_ID_USER
(
  id_         NVARCHAR2(64) not null,
  rev_        INTEGER,
  first_      NVARCHAR2(255),
  last_       NVARCHAR2(255),
  email_      NVARCHAR2(255),
  pwd_        NVARCHAR2(255),
  picture_id_ NVARCHAR2(64)
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  ACT_ID_USER
  add primary key (ID_)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table ACT_ID_MEMBERSHIP
prompt ================================
prompt
create table  ACT_ID_MEMBERSHIP
(
  user_id_  NVARCHAR2(64) not null,
  group_id_ NVARCHAR2(64) not null
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_MEMB_GROUP on  ACT_ID_MEMBERSHIP (GROUP_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_MEMB_USER on  ACT_ID_MEMBERSHIP (USER_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  ACT_ID_MEMBERSHIP
  add primary key (USER_ID_, GROUP_ID_)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  ACT_ID_MEMBERSHIP
  add constraint ACT_FK_MEMB_GROUP foreign key (GROUP_ID_)
  references  ACT_ID_GROUP (ID_);
alter table  ACT_ID_MEMBERSHIP
  add constraint ACT_FK_MEMB_USER foreign key (USER_ID_)
  references  ACT_ID_USER (ID_);

prompt
prompt Creating table ACT_RE_PROCDEF
prompt =============================
prompt
create table  ACT_RE_PROCDEF
(
  id_                     NVARCHAR2(64) not null,
  rev_                    INTEGER,
  category_               NVARCHAR2(255),
  name_                   NVARCHAR2(255),
  key_                    NVARCHAR2(255) not null,
  version_                INTEGER not null,
  deployment_id_          NVARCHAR2(64),
  resource_name_          NVARCHAR2(2000),
  dgrm_resource_name_     VARCHAR2(4000),
  description_            NVARCHAR2(2000),
  has_start_form_key_     NUMBER(1),
  has_graphical_notation_ NUMBER(1),
  suspension_state_       INTEGER,
  tenant_id_              NVARCHAR2(255) default ''
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  ACT_RE_PROCDEF
  add primary key (ID_)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  ACT_RE_PROCDEF
  add constraint ACT_UNIQ_PROCDEF unique (KEY_, VERSION_, TENANT_ID_)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  ACT_RE_PROCDEF
  add check (HAS_START_FORM_KEY_ IN (1,0));
alter table  ACT_RE_PROCDEF
  add check (HAS_GRAPHICAL_NOTATION_ IN (1,0));

prompt
prompt Creating table ACT_PROCDEF_INFO
prompt ===============================
prompt
create table  ACT_PROCDEF_INFO
(
  id_           NVARCHAR2(64) not null,
  proc_def_id_  NVARCHAR2(64) not null,
  rev_          INTEGER,
  info_json_id_ NVARCHAR2(64)
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255;
create index  ACT_IDX_PROCDEF_INFO_JSON on  ACT_PROCDEF_INFO (INFO_JSON_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;
create index  ACT_IDX_PROCDEF_INFO_PROC on  ACT_PROCDEF_INFO (PROC_DEF_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  ACT_PROCDEF_INFO
  add primary key (ID_)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  ACT_PROCDEF_INFO
  add constraint ACT_UNIQ_INFO_PROCDEF unique (PROC_DEF_ID_);
alter table  ACT_PROCDEF_INFO
  add constraint ACT_FK_INFO_JSON_BA foreign key (INFO_JSON_ID_)
  references  ACT_GE_BYTEARRAY (ID_);
alter table  ACT_PROCDEF_INFO
  add constraint ACT_FK_INFO_PROCDEF foreign key (PROC_DEF_ID_)
  references  ACT_RE_PROCDEF (ID_);

prompt
prompt Creating table ACT_RE_MODEL
prompt ===========================
prompt
create table  ACT_RE_MODEL
(
  id_                           NVARCHAR2(64) not null,
  rev_                          INTEGER,
  name_                         NVARCHAR2(255),
  key_                          NVARCHAR2(255),
  category_                     NVARCHAR2(255),
  create_time_                  TIMESTAMP(6),
  last_update_time_             TIMESTAMP(6),
  version_                      INTEGER,
  meta_info_                    NVARCHAR2(2000),
  deployment_id_                NVARCHAR2(64),
  editor_source_value_id_       NVARCHAR2(64),
  editor_source_extra_value_id_ NVARCHAR2(64),
  tenant_id_                    NVARCHAR2(255) default ''
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_MODEL_DEPLOYMENT on  ACT_RE_MODEL (DEPLOYMENT_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_MODEL_SOURCE on  ACT_RE_MODEL (EDITOR_SOURCE_VALUE_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_MODEL_SOURCE_EXTRA on  ACT_RE_MODEL (EDITOR_SOURCE_EXTRA_VALUE_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  ACT_RE_MODEL
  add primary key (ID_)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  ACT_RE_MODEL
  add constraint ACT_FK_MODEL_DEPLOYMENT foreign key (DEPLOYMENT_ID_)
  references  ACT_RE_DEPLOYMENT (ID_);
alter table  ACT_RE_MODEL
  add constraint ACT_FK_MODEL_SOURCE foreign key (EDITOR_SOURCE_VALUE_ID_)
  references  ACT_GE_BYTEARRAY (ID_);
alter table  ACT_RE_MODEL
  add constraint ACT_FK_MODEL_SOURCE_EXTRA foreign key (EDITOR_SOURCE_EXTRA_VALUE_ID_)
  references  ACT_GE_BYTEARRAY (ID_);

prompt
prompt Creating table ACT_RU_EXECUTION
prompt ===============================
prompt
create table  ACT_RU_EXECUTION
(
  id_               NVARCHAR2(64) not null,
  rev_              INTEGER,
  proc_inst_id_     NVARCHAR2(64),
  business_key_     NVARCHAR2(255),
  parent_id_        NVARCHAR2(64),
  proc_def_id_      NVARCHAR2(64),
  super_exec_       NVARCHAR2(64),
  act_id_           NVARCHAR2(255),
  is_active_        NUMBER(1),
  is_concurrent_    NUMBER(1),
  is_scope_         NUMBER(1),
  is_event_scope_   NUMBER(1),
  suspension_state_ INTEGER,
  cached_ent_state_ INTEGER,
  tenant_id_        NVARCHAR2(255) default '',
  name_             NVARCHAR2(255),
  lock_time_        TIMESTAMP(6)
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_EXEC_BUSKEY on  ACT_RU_EXECUTION (BUSINESS_KEY_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_EXE_PARENT on  ACT_RU_EXECUTION (PARENT_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_EXE_PROCDEF on  ACT_RU_EXECUTION (PROC_DEF_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_EXE_PROCINST on  ACT_RU_EXECUTION (PROC_INST_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_EXE_SUPER on  ACT_RU_EXECUTION (SUPER_EXEC_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  ACT_RU_EXECUTION
  add primary key (ID_)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  ACT_RU_EXECUTION
  add constraint ACT_FK_EXE_PARENT foreign key (PARENT_ID_)
  references  ACT_RU_EXECUTION (ID_);
alter table  ACT_RU_EXECUTION
  add constraint ACT_FK_EXE_PROCDEF foreign key (PROC_DEF_ID_)
  references  ACT_RE_PROCDEF (ID_);
alter table  ACT_RU_EXECUTION
  add constraint ACT_FK_EXE_PROCINST foreign key (PROC_INST_ID_)
  references  ACT_RU_EXECUTION (ID_);
alter table  ACT_RU_EXECUTION
  add constraint ACT_FK_EXE_SUPER foreign key (SUPER_EXEC_)
  references  ACT_RU_EXECUTION (ID_);
alter table  ACT_RU_EXECUTION
  add check (IS_ACTIVE_ IN (1,0));
alter table  ACT_RU_EXECUTION
  add check (IS_CONCURRENT_ IN (1,0));
alter table  ACT_RU_EXECUTION
  add check (IS_SCOPE_ IN (1,0));
alter table  ACT_RU_EXECUTION
  add check (IS_EVENT_SCOPE_ IN (1,0));

prompt
prompt Creating table ACT_RU_EVENT_SUBSCR
prompt ==================================
prompt
create table  ACT_RU_EVENT_SUBSCR
(
  id_            NVARCHAR2(64) not null,
  rev_           INTEGER,
  event_type_    NVARCHAR2(255) not null,
  event_name_    NVARCHAR2(255),
  execution_id_  NVARCHAR2(64),
  proc_inst_id_  NVARCHAR2(64),
  activity_id_   NVARCHAR2(64),
  configuration_ NVARCHAR2(255),
  created_       TIMESTAMP(6) not null,
  proc_def_id_   NVARCHAR2(64),
  tenant_id_     NVARCHAR2(255) default ''
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255;
create index  ACT_IDX_EVENT_SUBSCR on  ACT_RU_EVENT_SUBSCR (EXECUTION_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;
create index  ACT_IDX_EVENT_SUBSCR_CONFIG_ on  ACT_RU_EVENT_SUBSCR (CONFIGURATION_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  ACT_RU_EVENT_SUBSCR
  add primary key (ID_)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  ACT_RU_EVENT_SUBSCR
  add constraint ACT_FK_EVENT_EXEC foreign key (EXECUTION_ID_)
  references  ACT_RU_EXECUTION (ID_);

prompt
prompt Creating table ACT_RU_TASK
prompt ==========================
prompt
create table  ACT_RU_TASK
(
  id_               NVARCHAR2(64) not null,
  rev_              INTEGER,
  execution_id_     NVARCHAR2(64),
  proc_inst_id_     NVARCHAR2(64),
  proc_def_id_      NVARCHAR2(64),
  name_             NVARCHAR2(255),
  parent_task_id_   NVARCHAR2(64),
  description_      NVARCHAR2(2000),
  task_def_key_     NVARCHAR2(255),
  owner_            NVARCHAR2(255),
  assignee_         NVARCHAR2(255),
  delegation_       NVARCHAR2(64),
  priority_         INTEGER,
  create_time_      TIMESTAMP(6),
  due_date_         TIMESTAMP(6),
  category_         NVARCHAR2(255),
  suspension_state_ INTEGER,
  tenant_id_        NVARCHAR2(255) default '',
  form_key_         NVARCHAR2(255)
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_TASK_CREATE on  ACT_RU_TASK (CREATE_TIME_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_TASK_EXEC on  ACT_RU_TASK (EXECUTION_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_TASK_PROCDEF on  ACT_RU_TASK (PROC_DEF_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_TASK_PROCINST on  ACT_RU_TASK (PROC_INST_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  ACT_RU_TASK
  add primary key (ID_)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  ACT_RU_TASK
  add constraint ACT_FK_TASK_EXE foreign key (EXECUTION_ID_)
  references  ACT_RU_EXECUTION (ID_);
alter table  ACT_RU_TASK
  add constraint ACT_FK_TASK_PROCDEF foreign key (PROC_DEF_ID_)
  references  ACT_RE_PROCDEF (ID_);
alter table  ACT_RU_TASK
  add constraint ACT_FK_TASK_PROCINST foreign key (PROC_INST_ID_)
  references  ACT_RU_EXECUTION (ID_);

prompt
prompt Creating table ACT_RU_IDENTITYLINK
prompt ==================================
prompt
create table  ACT_RU_IDENTITYLINK
(
  id_           NVARCHAR2(64) not null,
  rev_          INTEGER,
  group_id_     NVARCHAR2(255),
  type_         NVARCHAR2(255),
  user_id_      NVARCHAR2(255),
  task_id_      NVARCHAR2(64),
  proc_inst_id_ NVARCHAR2(64),
  proc_def_id_  NVARCHAR2(64)
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_ATHRZ_PROCEDEF on  ACT_RU_IDENTITYLINK (PROC_DEF_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_IDENT_LNK_GROUP on  ACT_RU_IDENTITYLINK (GROUP_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_IDENT_LNK_USER on  ACT_RU_IDENTITYLINK (USER_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_IDL_PROCINST on  ACT_RU_IDENTITYLINK (PROC_INST_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_TSKASS_TASK on  ACT_RU_IDENTITYLINK (TASK_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  ACT_RU_IDENTITYLINK
  add primary key (ID_)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  ACT_RU_IDENTITYLINK
  add constraint ACT_FK_ATHRZ_PROCEDEF foreign key (PROC_DEF_ID_)
  references  ACT_RE_PROCDEF (ID_);
alter table  ACT_RU_IDENTITYLINK
  add constraint ACT_FK_IDL_PROCINST foreign key (PROC_INST_ID_)
  references  ACT_RU_EXECUTION (ID_);
alter table  ACT_RU_IDENTITYLINK
  add constraint ACT_FK_TSKASS_TASK foreign key (TASK_ID_)
  references  ACT_RU_TASK (ID_);

prompt
prompt Creating table ACT_RU_JOB
prompt =========================
prompt
create table  ACT_RU_JOB
(
  id_                  NVARCHAR2(64) not null,
  rev_                 INTEGER,
  type_                NVARCHAR2(255) not null,
  lock_exp_time_       TIMESTAMP(6),
  lock_owner_          NVARCHAR2(255),
  exclusive_           NUMBER(1),
  execution_id_        NVARCHAR2(64),
  process_instance_id_ NVARCHAR2(64),
  proc_def_id_         NVARCHAR2(64),
  retries_             INTEGER,
  exception_stack_id_  NVARCHAR2(64),
  exception_msg_       NVARCHAR2(2000),
  duedate_             TIMESTAMP(6),
  repeat_              NVARCHAR2(255),
  handler_type_        NVARCHAR2(255),
  handler_cfg_         NVARCHAR2(2000),
  tenant_id_           NVARCHAR2(255) default ''
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255;
create index  ACT_IDX_JOB_EXCEPTION on  ACT_RU_JOB (EXCEPTION_STACK_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  ACT_RU_JOB
  add primary key (ID_)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  ACT_RU_JOB
  add constraint ACT_FK_JOB_EXCEPTION foreign key (EXCEPTION_STACK_ID_)
  references  ACT_GE_BYTEARRAY (ID_);
alter table  ACT_RU_JOB
  add check (EXCLUSIVE_ IN (1,0));

prompt
prompt Creating table ACT_RU_VARIABLE
prompt ==============================
prompt
create table  ACT_RU_VARIABLE
(
  id_           NVARCHAR2(64) not null,
  rev_          INTEGER,
  type_         NVARCHAR2(255) not null,
  name_         NVARCHAR2(255) not null,
  execution_id_ NVARCHAR2(64),
  proc_inst_id_ NVARCHAR2(64),
  task_id_      NVARCHAR2(64),
  bytearray_id_ NVARCHAR2(64),
  double_       NUMBER(*,10),
  long_         NUMBER(19),
  text_         NVARCHAR2(2000),
  text2_        NVARCHAR2(2000)
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_VARIABLE_TASK_ID on  ACT_RU_VARIABLE (TASK_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_VAR_BYTEARRAY on  ACT_RU_VARIABLE (BYTEARRAY_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_VAR_EXE on  ACT_RU_VARIABLE (EXECUTION_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index  ACT_IDX_VAR_PROCINST on  ACT_RU_VARIABLE (PROC_INST_ID_)
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  ACT_RU_VARIABLE
  add primary key (ID_)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  ACT_RU_VARIABLE
  add constraint ACT_FK_VAR_BYTEARRAY foreign key (BYTEARRAY_ID_)
  references  ACT_GE_BYTEARRAY (ID_);
alter table  ACT_RU_VARIABLE
  add constraint ACT_FK_VAR_EXE foreign key (EXECUTION_ID_)
  references  ACT_RU_EXECUTION (ID_);
alter table  ACT_RU_VARIABLE
  add constraint ACT_FK_VAR_PROCINST foreign key (PROC_INST_ID_)
  references  ACT_RU_EXECUTION (ID_);

prompt
prompt Creating table AR_APPLY
prompt =======================
prompt
create table  AR_APPLY
(
  apply_id        VARCHAR2(36) not null,
  app_code        VARCHAR2(20) not null,
  area_code       VARCHAR2(10) not null,
  app_item        VARCHAR2(1) not null,
  app_subject     VARCHAR2(1) not null,
  stat_class      VARCHAR2(1) not null,
  special_explain VARCHAR2(50),
  stat_name       VARCHAR2(50),
  stat_scope      VARCHAR2(1) not null,
  stat_special    VARCHAR2(100),
  stat_type       VARCHAR2(1),
  callsign_old    VARCHAR2(20),
  level_old       VARCHAR2(1),
  otherinfo       VARCHAR2(300),
  memo            VARCHAR2(300),
  app_date        DATE not null,
  lastmodify      DATE not null
)
tablespace "3100_ARSTATDB"
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  AR_APPLY
  is '业余无线电台站设置申请表';
comment on column  AR_APPLY.apply_id
  is '申请ID       ';
comment on column  AR_APPLY.app_code
  is '申请表编号';
comment on column  AR_APPLY.area_code
  is '管理机构代码';
comment on column  AR_APPLY.app_item
  is '申请项目   申请办理的业务内容  0 新设/1 变更个人信息/ 2变更电台级别/3变更电台其他参数';
comment on column  AR_APPLY.app_subject
  is '申请主体类别    业余电台申请者类别，0个人/1单位 ';
comment on column  AR_APPLY.stat_class
  is ' 台站种类    申请的业余台站种类 ，0一般/1特殊';
comment on column  AR_APPLY.special_explain
  is '特殊台站种类描述      STAT_CLASS字段为1时，该字段储存特殊种类说明';
comment on column  AR_APPLY.stat_name
  is '台站名称';
comment on column  AR_APPLY.stat_scope
  is '拟通信范围     0  省、自治区、直辖市/1 两个或两个以上省级单位或涉外';
comment on column  AR_APPLY.stat_special
  is '特殊台站说明';
comment on column  AR_APPLY.stat_type
  is '拟设电台类别      取值  A/ B/ C';
comment on column  AR_APPLY.callsign_old
  is '原指配呼号';
comment on column  AR_APPLY.level_old
  is '原操作技术能力      取值  A/ B/ C';
comment on column  AR_APPLY.otherinfo
  is '其他事项说明';
comment on column  AR_APPLY.memo
  is '审核备注';
comment on column  AR_APPLY.app_date
  is '申请时间';
comment on column  AR_APPLY.lastmodify
  is '最后变更时间';
alter table  AR_APPLY
  add constraint PK_AR_APPLY primary key (APPLY_ID)
  using index 
  tablespace "3100_ARSTATDB"
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table AR_ATTACHMENT
prompt ============================
prompt
create table  AR_ATTACHMENT
(
  file_id   VARCHAR2(36) not null,
  apply_id  VARCHAR2(36) not null,
  file_type VARCHAR2(1) not null,
  content   BLOB,
  filename  VARCHAR2(200)
)
tablespace "3100_ARSTATDB"
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  AR_ATTACHMENT
  is '申请资质附件表';
comment on column  AR_ATTACHMENT.file_id
  is '主键';
comment on column  AR_ATTACHMENT.apply_id
  is '申请表ID';
comment on column  AR_ATTACHMENT.file_type
  is '附件类型  0个人身份证明/1设台单位证明材料/2单位负责人身份证明/3技术负责人身份证明/4操作技术能力证明';
comment on column  AR_ATTACHMENT.content
  is '附件内容';
comment on column  AR_ATTACHMENT.filename
  is '附件名称';
alter table  AR_ATTACHMENT
  add constraint PK_FILE_ID primary key (FILE_ID)
  using index 
  tablespace "3100_ARSTATDB"
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  AR_ATTACHMENT
  add constraint FK_AR_ATTAC_REFERENCE_AR_APPLY foreign key (APPLY_ID)
  references  AR_APPLY (APPLY_ID);

prompt
prompt Creating table AR_CALL_SIGN
prompt ===========================
prompt
create table  AR_CALL_SIGN
(
  call_sign_id     VARCHAR2(10) not null,
  area_code        VARCHAR2(10) not null,
  call_sign_status VARCHAR2(1) not null,
  set_time         DATE,
  end_time         DATE,
  activate_time    DATE,
  memo             VARCHAR2(100)
)
tablespace "3100_ARSTATDB"
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  AR_CALL_SIGN
  is '呼号资源表';
comment on column  AR_CALL_SIGN.call_sign_id
  is '呼号编号（呼号）';
comment on column  AR_CALL_SIGN.area_code
  is '管理机构代码';
comment on column  AR_CALL_SIGN.call_sign_status
  is '呼号状态    0 未指配/1  已占用/2  预留/3 锁定/4  注销/5  他省占用/6  临时指配';
comment on column  AR_CALL_SIGN.set_time
  is '指配时间';
comment on column  AR_CALL_SIGN.end_time
  is '到期时间';
comment on column  AR_CALL_SIGN.activate_time
  is '回收到期时间';
comment on column  AR_CALL_SIGN.memo
  is '备注';
alter table  AR_CALL_SIGN
  add constraint PK_AR_CALL_SIGN primary key (CALL_SIGN_ID)
  using index 
  tablespace "3100_ARSTATDB"
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table AR_DIC
prompt =====================
prompt
create table  AR_DIC
(
  co                 NUMBER not null,
  cn                 VARCHAR2(10) not null,
  code_chi_name      VARCHAR2(80) not null,
  code_data_type     VARCHAR2(8) not null,
  code_type_chi_name VARCHAR2(80),
  code_discn         NUMBER
)
tablespace "3100_ARSTATDB"
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  AR_DIC
  is '业余台站字典表';
comment on column  AR_DIC.co
  is '序号';
comment on column  AR_DIC.cn
  is '代码编号';
comment on column  AR_DIC.code_chi_name
  is '代码中文名称';
comment on column  AR_DIC.code_data_type
  is '代码数据表类型';
comment on column  AR_DIC.code_type_chi_name
  is '代码数据表类型中文名称';
comment on column  AR_DIC.code_discn
  is '显示序号';
alter table  AR_DIC
  add constraint PK_CO primary key (CO)
  using index 
  tablespace "3100_ARSTATDB"
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table AR_STATION_EXT
prompt =============================
prompt
create table  AR_STATION_EXT
(
  sys_id       VARCHAR2(36) not null,
  apply_id     VARCHAR2(36) not null,
  stat_setkind VARCHAR2(2),
  sys_name     VARCHAR2(20),
  stat_addr1   VARCHAR2(20),
  stat_addr2   VARCHAR2(20),
  stat_addr3   VARCHAR2(20),
  stat_addr4   VARCHAR2(50),
  stat_height  NUMBER(10,3),
  stat_lg      NUMBER(10,7),
  stat_la      NUMBER(10,7),
  plate_number VARCHAR2(20)
)
tablespace "3100_ARSTATDB"
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  AR_STATION_EXT
  is '业务无线电台站扩展信息表';
comment on column  AR_STATION_EXT.sys_id
  is '分类ID';
comment on column  AR_STATION_EXT.apply_id
  is '申请表ID';
comment on column  AR_STATION_EXT.stat_setkind
  is '电台设置方式';
comment on column  AR_STATION_EXT.sys_name
  is '分类名称';
comment on column  AR_STATION_EXT.stat_addr1
  is '固定台地址（省份）';
comment on column  AR_STATION_EXT.stat_addr2
  is '固定台地址（市、区）';
comment on column  AR_STATION_EXT.stat_addr3
  is '固定台地址（县）';
comment on column  AR_STATION_EXT.stat_addr4
  is '固定台地址（详细）';
comment on column  AR_STATION_EXT.stat_height
  is '固定台天线馈电点海拔高度';
comment on column  AR_STATION_EXT.stat_lg
  is '地理坐标经度';
comment on column  AR_STATION_EXT.stat_la
  is '地理坐标纬度';
comment on column  AR_STATION_EXT.plate_number
  is '设台车牌号';
alter table  AR_STATION_EXT
  add constraint PK_SYS_ID primary key (SYS_ID)
  using index 
  tablespace "3100_ARSTATDB"
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table AR_EQU
prompt =====================
prompt
create table  AR_EQU
(
  equ_id     VARCHAR2(36) not null,
  sys_id     VARCHAR2(36) not null,
  equ_model  VARCHAR2(40) not null,
  equ_mfrs   VARCHAR2(100),
  equ_code   VARCHAR2(40) not null,
  equ_sn     VARCHAR2(40) not null,
  equ_status VARCHAR2(1) not null
)
tablespace "3100_ARSTATDB"
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  AR_EQU
  is '业余无线电台站设备表';
comment on column  AR_EQU.equ_id
  is '设备ID';
comment on column  AR_EQU.sys_id
  is '台站ID';
comment on column  AR_EQU.equ_model
  is '设备型号';
comment on column  AR_EQU.equ_mfrs
  is '设备生产厂家';
comment on column  AR_EQU.equ_code
  is '型号核准代码';
comment on column  AR_EQU.equ_sn
  is '出厂编号';
comment on column  AR_EQU.equ_status
  is '设备状态';
alter table  AR_EQU
  add constraint PK_EQU_ID primary key (EQU_ID)
  using index 
  tablespace "3100_ARSTATDB"
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  AR_EQU
  add constraint FK_AR_EQU_REFERENCE_AR_STATI foreign key (SYS_ID)
  references  AR_STATION_EXT (SYS_ID);

prompt
prompt Creating table AR_EQU_POW
prompt =========================
prompt
create table  AR_EQU_POW
(
  infoid    VARCHAR2(36) not null,
  equ_id    VARCHAR2(36) not null,
  pow_type  VARCHAR2(1) not null,
  pow_value NUMBER(13,3) not null
)
tablespace "3100_ARSTATDB"
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  AR_EQU_POW
  is '设备功率关系表';
comment on column  AR_EQU_POW.infoid
  is '信息ID';
comment on column  AR_EQU_POW.equ_id
  is '设备ID';
comment on column  AR_EQU_POW.pow_type
  is '功率类型  0 HF以下/1  HF/2  50M/3  144M/4 430/5 1240及以上';
comment on column  AR_EQU_POW.pow_value
  is '功率值';
alter table  AR_EQU_POW
  add constraint PK_INFOID primary key (INFOID)
  using index 
  tablespace "3100_ARSTATDB"
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  AR_EQU_POW
  add constraint FK_AR_EQU_P_REFERENCE_AR_EQU foreign key (EQU_ID)
  references  AR_EQU (EQU_ID);

prompt
prompt Creating table AR_STATION
prompt =========================
prompt
create table  AR_STATION
(
  apply_id           VARCHAR2(36) not null,
  call_sign_id       VARCHAR2(10),
  area_code          VARCHAR2(10) not null,
  stat_class         VARCHAR2(1) not null,
  stat_status        VARCHAR2(1) not null,
  rep_freq_up        NUMBER(14,7),
  rep_freq_down      NUMBER(14,7),
  rep_pow            NUMBER(10,3),
  rep_mod            VARCHAR2(1),
  rep_data_mod_class VARCHAR2(1),
  rep_remoter_class  VARCHAR2(1),
  ar_memo            VARCHAR2(100)
)
tablespace "3100_ARSTATDB"
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  AR_STATION
  is '业余无线电台站基本信息表';
comment on column  AR_STATION.apply_id
  is '申请ID';
comment on column  AR_STATION.call_sign_id
  is '呼号编号（呼号）';
comment on column  AR_STATION.area_code
  is '管理机构代码';
comment on column  AR_STATION.stat_class
  is '台站种类';
comment on column  AR_STATION.stat_status
  is '台站状态';
comment on column  AR_STATION.rep_freq_up
  is '中继台上行频率';
comment on column  AR_STATION.rep_freq_down
  is '中继台下行频率';
comment on column  AR_STATION.rep_pow
  is '中继台下行功率 ';
comment on column  AR_STATION.rep_mod
  is '调制方式';
comment on column  AR_STATION.rep_data_mod_class
  is '数字调制系统种类';
comment on column  AR_STATION.rep_remoter_class
  is '遥控措施种类';
comment on column  AR_STATION.ar_memo
  is '备注';
alter table  AR_STATION
  add constraint PK_STATION_APPLY_ID primary key (APPLY_ID)
  using index 
  tablespace "3100_ARSTATDB"
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  AR_STATION
  add constraint FK_AR_STATI_REFERENCE_AR_APPLY foreign key (APPLY_ID)
  references  AR_APPLY (APPLY_ID);

prompt
prompt Creating table AR_UNIT
prompt ======================
prompt
create table  AR_UNIT
(
  unit_id    VARCHAR2(36) not null,
  apply_id   VARCHAR2(36) not null,
  unit_name  VARCHAR2(100),
  reg_unit   VARCHAR2(100),
  address1   VARCHAR2(20),
  address2   VARCHAR2(20),
  address3   VARCHAR2(20),
  address4   VARCHAR2(100),
  unit_code  VARCHAR2(50),
  unit_phone VARCHAR2(40),
  unit_fax   VARCHAR2(40)
)
tablespace "3100_ARSTATDB"
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  AR_UNIT
  is '设台单位信息表';
comment on column  AR_UNIT.unit_id
  is '设台单位ID';
comment on column  AR_UNIT.apply_id
  is '申请ID';
comment on column  AR_UNIT.unit_name
  is '设台单位名称';
comment on column  AR_UNIT.reg_unit
  is '申请单位登记机关';
comment on column  AR_UNIT.address1
  is '申请单位地址（省份）';
comment on column  AR_UNIT.address2
  is '申请单位地址（市、区）';
comment on column  AR_UNIT.address3
  is '申请单位地址（县）';
comment on column  AR_UNIT.address4
  is '申请单位地址（详细）';
comment on column  AR_UNIT.unit_code
  is '申请单位机构代码';
comment on column  AR_UNIT.unit_phone
  is '申请单位联系电话';
comment on column  AR_UNIT.unit_fax
  is '申请单位传真';
alter table  AR_UNIT
  add constraint PK_AR_UNIT primary key (UNIT_ID)
  using index 
  tablespace "3100_ARSTATDB"
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  AR_UNIT
  add constraint FK_AR_UNIT_REFERENCE_AR_APPLY foreign key (APPLY_ID)
  references  AR_APPLY (APPLY_ID);

prompt
prompt Creating table AR_USER
prompt ======================
prompt
create table  AR_USER
(
  user_id         VARCHAR2(36) not null,
  apply_id        VARCHAR2(36) not null,
  user_type       VARCHAR2(1) not null,
  user_name       VARCHAR2(50) not null,
  gender          VARCHAR2(1),
  idcard          VARCHAR2(20) not null,
  nation          VARCHAR2(40),
  education       VARCHAR2(20),
  operation_level VARCHAR2(1),
  level_code      VARCHAR2(40),
  service_unit    VARCHAR2(100),
  service_post    VARCHAR2(6),
  address1        VARCHAR2(20),
  address2        VARCHAR2(20),
  address3        VARCHAR2(20),
  address4        VARCHAR2(20),
  address_post    VARCHAR2(6),
  contact_addr1   VARCHAR2(20),
  contact_addr2   VARCHAR2(20),
  contact_addr3   VARCHAR2(20),
  contact_addr4   VARCHAR2(100),
  contact_post    VARCHAR2(6),
  email           VARCHAR2(100),
  fax             VARCHAR2(40),
  service_phone   VARCHAR2(40),
  home_phone      VARCHAR2(40),
  mobile          VARCHAR2(40),
  connect_phone   VARCHAR2(40)
)
tablespace "3100_ARSTATDB"
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  AR_USER
  is '设台人员信息表';
comment on column  AR_USER.user_id
  is '人员ID';
comment on column  AR_USER.apply_id
  is '申请ID';
comment on column  AR_USER.user_type
  is '人员类别    0 个人台站申请人/1单位设台单位负责人/2单位设台技术负责人';
comment on column  AR_USER.user_name
  is '申请人/技术负责人/单位负责人姓名';
comment on column  AR_USER.gender
  is '申请人/技术负责人/单位负责人性别     0女/1男';
comment on column  AR_USER.idcard
  is '申请人/技术负责人/单位负责人身份证 ';
comment on column  AR_USER.nation
  is '申请人/技术负责人民族';
comment on column  AR_USER.education
  is '申请人/技术负责人文化程度';
comment on column  AR_USER.operation_level
  is '申请人/技术负责人操作级别   取值范围 A/B/C';
comment on column  AR_USER.level_code
  is '申请人/技术负责人级别证编号';
comment on column  AR_USER.service_unit
  is '申请人/技术负责人服务单位';
comment on column  AR_USER.service_post
  is '申请人/技术负责人服务单位邮编';
comment on column  AR_USER.address1
  is '申请人/技术负责人常住地址（省份）';
comment on column  AR_USER.address2
  is '申请人/技术负责人常住地址（市、区）';
comment on column  AR_USER.address3
  is '申请人/技术负责人常住地址（县）';
comment on column  AR_USER.address4
  is '申请人/技术负责人常住地址（详细）';
comment on column  AR_USER.address_post
  is '申请人/技术负责人常住地址邮编';
comment on column  AR_USER.contact_addr1
  is '申请人/技术负责人/单位负责人联系地址（省份）';
comment on column  AR_USER.contact_addr2
  is '申请人/技术负责人/单位负责人联系地址（市、区）';
comment on column  AR_USER.contact_addr3
  is '申请人/技术负责人/单位负责人联系地址（县）';
comment on column  AR_USER.contact_addr4
  is '申请人/技术负责人/单位负责人联系地址（详细）';
comment on column  AR_USER.contact_post
  is '申请人/技术负责人/单位负责人联系地址邮编';
comment on column  AR_USER.email
  is '申请人/技术负责人/单位负责人电子邮件';
comment on column  AR_USER.fax
  is '申请人/技术负责人/单位负责人传真';
comment on column  AR_USER.service_phone
  is '申请人/技术负责人/单位负责人单位电话      当为单位设台时，此字段储存单位负责人联系电话';
comment on column  AR_USER.home_phone
  is '申请人/技术负责人/单位负责人住宅电话';
comment on column  AR_USER.mobile
  is '申请人/技术负责人/单位负责人移动电话';
comment on column  AR_USER.connect_phone
  is '单位负责人联系电话';
alter table  AR_USER
  add constraint PK_AR_USER primary key (USER_ID)
  using index 
  tablespace "3100_ARSTATDB"
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  AR_USER
  add constraint FK_AR_USER_REFERENCE_AR_APPLY foreign key (APPLY_ID)
  references  AR_APPLY (APPLY_ID);

prompt
prompt Creating table FRBT_VERSION
prompt ===========================
prompt
create table  FRBT_VERSION
(
  ver_code    VARCHAR2(10) not null,
  ver_name    VARCHAR2(100),
  start_date  DATE,
  data_status VARCHAR2(8),
  memo        VARCHAR2(512)
)
tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table  FRBT_VERSION
  is '频率划分版本表';
comment on column  FRBT_VERSION.ver_code
  is '版本编号';
comment on column  FRBT_VERSION.ver_name
  is '版本名称';
comment on column  FRBT_VERSION.start_date
  is '施行日期';
comment on column  FRBT_VERSION.data_status
  is '数据状态';
comment on column  FRBT_VERSION.memo
  is '备注';
alter table  FRBT_VERSION
  add constraint PK_FRBT_VERSION primary key (VER_CODE)
  using index 
  tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table FRBT_ALLOCATION
prompt ==============================
prompt
create table  FRBT_ALLOCATION
(
  guid      VARCHAR2(36) not null,
  ver_code  VARCHAR2(10),
  area_code VARCHAR2(10),
  band_b    NUMBER(14,7),
  band_e    NUMBER(14,7),
  fn_code   VARCHAR2(200)
)
tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table  FRBT_ALLOCATION
  is '频率划分表';
comment on column  FRBT_ALLOCATION.ver_code
  is '版本编号';
comment on column  FRBT_ALLOCATION.area_code
  is '区域代码';
comment on column  FRBT_ALLOCATION.band_b
  is '频带开始';
comment on column  FRBT_ALLOCATION.band_e
  is '频带结束';
comment on column  FRBT_ALLOCATION.fn_code
  is '脚注代码';
alter table  FRBT_ALLOCATION
  add constraint PK_FRBT_ALLOCATION primary key (GUID)
  using index 
  tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  FRBT_ALLOCATION
  add constraint FK_FRBT_ALL_REFERENCE_FRBT_VER foreign key (VER_CODE)
  references  FRBT_VERSION (VER_CODE);

prompt
prompt Creating table FRBT_ALLOCATION_SERVICE
prompt ======================================
prompt
create table  FRBT_ALLOCATION_SERVICE
(
  guid          VARCHAR2(36) not null,
  alloc_guid    VARCHAR2(36),
  isallocate    VARCHAR2(8),
  notalloc_info VARCHAR2(80),
  serv_code     VARCHAR2(10),
  addi_info     VARCHAR2(80),
  serv_type     VARCHAR2(8),
  fn_code       VARCHAR2(200)
)
tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table  FRBT_ALLOCATION_SERVICE
  is '频率划分无线电业务配置表';
comment on column  FRBT_ALLOCATION_SERVICE.alloc_guid
  is '划分GUID';
comment on column  FRBT_ALLOCATION_SERVICE.isallocate
  is '是否划分业务使用';
comment on column  FRBT_ALLOCATION_SERVICE.notalloc_info
  is '未划分状况说明';
comment on column  FRBT_ALLOCATION_SERVICE.serv_code
  is '业务代码';
comment on column  FRBT_ALLOCATION_SERVICE.addi_info
  is '业务附加说明';
comment on column  FRBT_ALLOCATION_SERVICE.serv_type
  is '业务类型';
comment on column  FRBT_ALLOCATION_SERVICE.fn_code
  is '脚注代码';
alter table  FRBT_ALLOCATION_SERVICE
  add constraint PK_FRBT_ALLOCATION_SERVICE primary key (GUID)
  using index 
  tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table FRBT_CALLSIGN
prompt ============================
prompt
create table  FRBT_CALLSIGN
(
  callsign_id       VARCHAR2(10) not null,
  station_type      VARCHAR2(6),
  organization_name VARCHAR2(20),
  callsign_range    VARCHAR2(50),
  stat_flag         VARCHAR2(2)
)
tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  FRBT_CALLSIGN
  is '呼号数据表';
comment on column  FRBT_CALLSIGN.callsign_id
  is '台站呼号';
comment on column  FRBT_CALLSIGN.station_type
  is '台站类型';
comment on column  FRBT_CALLSIGN.organization_name
  is '指配主管无委机构';
comment on column  FRBT_CALLSIGN.callsign_range
  is '呼号分组';
comment on column  FRBT_CALLSIGN.stat_flag
  is '呼号状态标识';
alter table  FRBT_CALLSIGN
  add constraint PK_FRBT_CALLSIGN primary key (CALLSIGN_ID)
  using index 
  tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table FRBT_CODE_DIC
prompt ============================
prompt
create table  FRBT_CODE_DIC
(
  co                 NUMBER not null,
  cn                 VARCHAR2(8),
  code_chi_name      VARCHAR2(80),
  code_data_type     VARCHAR2(8),
  code_type_chi_name VARCHAR2(80),
  code_discn         NUMBER
)
tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  FRBT_CODE_DIC
  is '代码数据表';
comment on column  FRBT_CODE_DIC.co
  is '序号';
comment on column  FRBT_CODE_DIC.cn
  is '代码编码';
comment on column  FRBT_CODE_DIC.code_chi_name
  is '代码中文名称';
comment on column  FRBT_CODE_DIC.code_data_type
  is '代码数据表类型';
comment on column  FRBT_CODE_DIC.code_type_chi_name
  is '代码数据表类型中文名称';
comment on column  FRBT_CODE_DIC.code_discn
  is '显示序号';
alter table  FRBT_CODE_DIC
  add constraint PK_FRBT_CODE_DIC primary key (CO)
  using index 
  tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table FRBT_ORG
prompt =======================
prompt
create table  FRBT_ORG
(
  guid             VARCHAR2(36) not null,
  org_code         VARCHAR2(9),
  org_name         VARCHAR2(80),
  org_area_code    VARCHAR2(8),
  org_sys_code     VARCHAR2(8),
  org_type         VARCHAR2(3),
  org_link_person  VARCHAR2(40),
  org_sup_code     VARCHAR2(9),
  org_addr         VARCHAR2(80),
  org_post         VARCHAR2(6),
  org_phone        VARCHAR2(40),
  org_mob_phone    VARCHAR2(40),
  org_fax          VARCHAR2(40),
  org_bank         VARCHAR2(80),
  org_account_name VARCHAR2(80),
  org_account      VARCHAR2(40),
  org_web_site     VARCHAR2(80),
  org_mail         VARCHAR2(80)
)
tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  FRBT_ORG
  is '组织机构表';
comment on column  FRBT_ORG.org_code
  is '组织机构代码';
comment on column  FRBT_ORG.org_name
  is '组织机构名称';
comment on column  FRBT_ORG.org_area_code
  is '地区代码';
comment on column  FRBT_ORG.org_sys_code
  is '系统/行业代码';
comment on column  FRBT_ORG.org_type
  is '单位类型';
comment on column  FRBT_ORG.org_link_person
  is '单位联系人';
comment on column  FRBT_ORG.org_sup_code
  is '上级组织机构代码';
comment on column  FRBT_ORG.org_addr
  is '组织机构地址';
comment on column  FRBT_ORG.org_post
  is '组织机构邮编';
comment on column  FRBT_ORG.org_phone
  is '联系电话';
comment on column  FRBT_ORG.org_mob_phone
  is '手机号码';
comment on column  FRBT_ORG.org_fax
  is '组织机构传真';
comment on column  FRBT_ORG.org_bank
  is '开户银行';
comment on column  FRBT_ORG.org_account_name
  is '账户名称';
comment on column  FRBT_ORG.org_account
  is '银行帐号';
comment on column  FRBT_ORG.org_web_site
  is '网址';
comment on column  FRBT_ORG.org_mail
  is '电子邮箱';
alter table  FRBT_ORG
  add constraint PK_FRBT_ORG primary key (GUID)
  using index 
  tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  FRBT_ORG
  add constraint AK_ORG_CODE_FRBT_ORG unique (ORG_CODE)
  using index 
  tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table FRBT_FILE
prompt ========================
prompt
create table  FRBT_FILE
(
  file_no       VARCHAR2(100) not null,
  file_title    VARCHAR2(200),
  file_type     VARCHAR2(8),
  file_version  VARCHAR2(20),
  file_status   VARCHAR2(8),
  post_org      VARCHAR2(200),
  file_date     DATE,
  file_detail   BLOB,
  file_index    VARCHAR2(200),
  edit_org_code VARCHAR2(9),
  memo          VARCHAR2(512)
)
tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  FRBT_FILE
  is '文件表';
comment on column  FRBT_FILE.file_no
  is '文件号';
comment on column  FRBT_FILE.file_title
  is '文件标题名称';
comment on column  FRBT_FILE.file_type
  is '文件属性';
comment on column  FRBT_FILE.file_version
  is '文件版本';
comment on column  FRBT_FILE.file_status
  is '文件状态（是否有效）';
comment on column  FRBT_FILE.post_org
  is '发文机关名称';
comment on column  FRBT_FILE.file_date
  is '文件时间';
comment on column  FRBT_FILE.file_detail
  is '文件内容';
comment on column  FRBT_FILE.file_index
  is '检索关键字';
comment on column  FRBT_FILE.edit_org_code
  is '维护数据的无委机构组织机构代码';
comment on column  FRBT_FILE.memo
  is '备注';
alter table  FRBT_FILE
  add constraint PK_FRBT_FILE primary key (FILE_NO)
  using index 
  tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  FRBT_FILE
  add constraint FK_FRBT_FIL_REFERENCE_FRBT_ORG foreign key (EDIT_ORG_CODE)
  references  FRBT_ORG (ORG_CODE);

prompt
prompt Creating table FRBT_FOOTNOTE
prompt ============================
prompt
create table  FRBT_FOOTNOTE
(
  fn_code     VARCHAR2(10) not null,
  fn_property VARCHAR2(10),
  fn_class    VARCHAR2(10),
  fn_content  VARCHAR2(4000),
  memo        VARCHAR2(512)
)
tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table  FRBT_FOOTNOTE
  is '脚注表';
comment on column  FRBT_FOOTNOTE.fn_code
  is '脚注代码';
comment on column  FRBT_FOOTNOTE.fn_property
  is '脚注性质';
comment on column  FRBT_FOOTNOTE.fn_class
  is '脚注分类';
comment on column  FRBT_FOOTNOTE.fn_content
  is '脚注内容';
comment on column  FRBT_FOOTNOTE.memo
  is '备注';
alter table  FRBT_FOOTNOTE
  add constraint PK_FRBT_FOOTNOTE primary key (FN_CODE)
  using index 
  tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table FRBT_SERVICE
prompt ===========================
prompt
create table  FRBT_SERVICE
(
  serv_code   VARCHAR2(10) not null,
  serv_name   VARCHAR2(80),
  rgb_color   NUMBER(12),
  iscutline   VARCHAR2(8),
  serv_parent VARCHAR2(80)
)
tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table  FRBT_SERVICE
  is '无线电业务表';
comment on column  FRBT_SERVICE.serv_code
  is '业务代码';
comment on column  FRBT_SERVICE.serv_name
  is '业务名称';
comment on column  FRBT_SERVICE.rgb_color
  is 'RGB颜色';
comment on column  FRBT_SERVICE.iscutline
  is '是否显示图例';
comment on column  FRBT_SERVICE.serv_parent
  is '上级业务代码';
alter table  FRBT_SERVICE
  add constraint PK_FRBT_SERVICE primary key (SERV_CODE)
  using index 
  tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table FRBT_SYSTEM
prompt ==========================
prompt
create table  FRBT_SYSTEM
(
  sys_code  VARCHAR2(10) not null,
  sys_name  VARCHAR2(100),
  serv_code VARCHAR2(10),
  memo      VARCHAR2(512)
)
tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  FRBT_SYSTEM
  is '通信业务/系统表';
comment on column  FRBT_SYSTEM.sys_code
  is '通信业务/系统编号';
comment on column  FRBT_SYSTEM.sys_name
  is '通信业务/系统名称';
comment on column  FRBT_SYSTEM.serv_code
  is '所属业务编号';
comment on column  FRBT_SYSTEM.memo
  is '备注';
alter table  FRBT_SYSTEM
  add constraint PK_FRBT_SYSTEM primary key (SYS_CODE)
  using index 
  tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  FRBT_SYSTEM
  add constraint FK_FRBT_SYS_REFERENCE_FRBT_SER foreign key (SERV_CODE)
  references  FRBT_SERVICE (SERV_CODE);

prompt
prompt Creating table FRBT_PLANS
prompt =========================
prompt
create table  FRBT_PLANS
(
  guid          VARCHAR2(36) not null,
  plans_name    VARCHAR2(100),
  sys_code      VARCHAR2(8),
  band_type     VARCHAR2(8),
  ch_type       VARCHAR2(8),
  freq_lname    VARCHAR2(30),
  freq_uname    VARCHAR2(30),
  edit_org_code VARCHAR2(9),
  file_no       VARCHAR2(500),
  start_date    DATE,
  confirm_date  DATE,
  data_status   VARCHAR2(8),
  memo          VARCHAR2(512)
)
tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  FRBT_PLANS
  is '频率规划表';
comment on column  FRBT_PLANS.plans_name
  is '规划名称';
comment on column  FRBT_PLANS.sys_code
  is '通信系统';
comment on column  FRBT_PLANS.band_type
  is '频段配置类型';
comment on column  FRBT_PLANS.ch_type
  is '频道配置类型';
comment on column  FRBT_PLANS.freq_lname
  is '中心频率（低频）称谓';
comment on column  FRBT_PLANS.freq_uname
  is '中心频率（高频）称谓';
comment on column  FRBT_PLANS.edit_org_code
  is '维护数据的无委机构组织机构代码';
comment on column  FRBT_PLANS.file_no
  is '批文编号';
comment on column  FRBT_PLANS.start_date
  is '施行日期';
comment on column  FRBT_PLANS.confirm_date
  is '批准日期';
comment on column  FRBT_PLANS.data_status
  is '数据状态';
comment on column  FRBT_PLANS.memo
  is '备注';
alter table  FRBT_PLANS
  add constraint PK_FRBT_PLANS primary key (GUID)
  using index 
  tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  FRBT_PLANS
  add constraint FK_FRBT_PLA_REFERENCE_FRBT_SYS foreign key (SYS_CODE)
  references  FRBT_SYSTEM (SYS_CODE);

prompt
prompt Creating table FRBT_PLANS_BAND
prompt ==============================
prompt
create table  FRBT_PLANS_BAND
(
  guid       VARCHAR2(36) not null,
  plans_guid VARCHAR2(36),
  band_lb    NUMBER(14,7),
  band_le    NUMBER(14,7),
  band_ub    NUMBER(14,7),
  band_ue    NUMBER(14,7),
  memo       VARCHAR2(512)
)
tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  FRBT_PLANS_BAND
  is '频率规划频段配置表';
comment on column  FRBT_PLANS_BAND.plans_guid
  is '规划GUID';
comment on column  FRBT_PLANS_BAND.band_lb
  is '低段起始频率';
comment on column  FRBT_PLANS_BAND.band_le
  is '低段终止频率';
comment on column  FRBT_PLANS_BAND.band_ub
  is '高段起始频率';
comment on column  FRBT_PLANS_BAND.band_ue
  is '高段终止频率';
comment on column  FRBT_PLANS_BAND.memo
  is '备注';
alter table  FRBT_PLANS_BAND
  add constraint PK_FRBT_PLANS_BAND primary key (GUID)
  using index 
  tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  FRBT_PLANS_BAND
  add constraint FK_FRBT_PLA_REFERENCE_FRBT_PLA foreign key (PLANS_GUID)
  references  FRBT_PLANS (GUID);

prompt
prompt Creating table FRBT_PLANS_GROUP
prompt ===============================
prompt
create table  FRBT_PLANS_GROUP
(
  guid              VARCHAR2(36) not null,
  plans_guid        VARCHAR2(36),
  group_name        VARCHAR2(100),
  ch_spacing        NUMBER(14,7),
  ch_e_bw           NUMBER(14,7),
  "CH_ER_ INTERVAL" NUMBER(14,7),
  ch_count          NUMBER(4),
  tc_info           VARCHAR2(400),
  ch_form           VARCHAR2(8),
  memo              VARCHAR2(512)
)
tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  FRBT_PLANS_GROUP
  is '频率规划分组表';
comment on column  FRBT_PLANS_GROUP.plans_guid
  is '规划GUID';
comment on column  FRBT_PLANS_GROUP.group_name
  is '规划分组名称';
comment on column  FRBT_PLANS_GROUP.ch_spacing
  is '频率间隔';
comment on column  FRBT_PLANS_GROUP.ch_e_bw
  is '发射必要带宽';
comment on column  FRBT_PLANS_GROUP."CH_ER_ INTERVAL"
  is '收发频率间隔';
comment on column  FRBT_PLANS_GROUP.ch_count
  is '信（波）道数';
comment on column  FRBT_PLANS_GROUP.tc_info
  is '传输容量说明';
comment on column  FRBT_PLANS_GROUP.ch_form
  is '频道单位类型';
comment on column  FRBT_PLANS_GROUP.memo
  is '备注';
alter table  FRBT_PLANS_GROUP
  add constraint PK_FRBT_PLANS_GROUP primary key (GUID)
  using index 
  tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  FRBT_PLANS_GROUP
  add constraint FK_FRBT_PLA_GRO_REF_FRBT_PLA foreign key (PLANS_GUID)
  references  FRBT_PLANS (GUID);

prompt
prompt Creating table FRBT_PLANS_CHANNEL
prompt =================================
prompt
create table  FRBT_PLANS_CHANNEL
(
  guid                  VARCHAR2(36) not null,
  plans_group_guid      VARCHAR2(36),
  ch_lno                VARCHAR2(40),
  freq_lc               NUMBER(14,7),
  freq_lb               NUMBER(14,7),
  freq_le               NUMBER(14,7),
  ch_uno                VARCHAR2(50),
  freq_uc               NUMBER(14,7),
  freq_ub               NUMBER(14,7),
  freq_ue               NUMBER(14,7),
  if_store              VARCHAR2(8),
  "IF_ PROVINCE_ASSIGN" VARCHAR2(8),
  memo                  VARCHAR2(512)
)
tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  FRBT_PLANS_CHANNEL
  is '频率规划频道配置表';
comment on column  FRBT_PLANS_CHANNEL.plans_group_guid
  is '规划分组GUID';
comment on column  FRBT_PLANS_CHANNEL.ch_lno
  is '低频波道号';
comment on column  FRBT_PLANS_CHANNEL.freq_lc
  is '中心频率（低频）';
comment on column  FRBT_PLANS_CHANNEL.freq_lb
  is '低频下限';
comment on column  FRBT_PLANS_CHANNEL.freq_le
  is '低频上限';
comment on column  FRBT_PLANS_CHANNEL.ch_uno
  is '高频波道号';
comment on column  FRBT_PLANS_CHANNEL.freq_uc
  is '中心频率（高频）';
comment on column  FRBT_PLANS_CHANNEL.freq_ub
  is '高频下限';
comment on column  FRBT_PLANS_CHANNEL.freq_ue
  is '高频上限';
comment on column  FRBT_PLANS_CHANNEL.if_store
  is '是否储备频率';
comment on column  FRBT_PLANS_CHANNEL."IF_ PROVINCE_ASSIGN"
  is '是否省级指配 ';
comment on column  FRBT_PLANS_CHANNEL.memo
  is '备注';
alter table  FRBT_PLANS_CHANNEL
  add constraint PK_FRBT_PLANS_CHANNEL primary key (GUID)
  using index 
  tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  FRBT_PLANS_CHANNEL
  add constraint FK_FRB_PLA_CHA_REF_FRB_PLA foreign key (PLANS_GROUP_GUID)
  references  FRBT_PLANS_GROUP (GUID);

prompt
prompt Creating table FRBT_PROTECT
prompt ===========================
prompt
create table  FRBT_PROTECT
(
  guid         VARCHAR2(36) not null,
  org_sys_code VARCHAR2(8),
  pf_type      VARCHAR2(8),
  file_no      VARCHAR2(500),
  start_date   DATE,
  stop_date    DATE,
  data_status  VARCHAR2(8),
  memo         VARCHAR2(512)
)
tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  FRBT_PROTECT
  is '重点保护频率表';
comment on column  FRBT_PROTECT.org_sys_code
  is '系统/行业代码';
comment on column  FRBT_PROTECT.pf_type
  is '保护频率配置类型';
comment on column  FRBT_PROTECT.file_no
  is '批文编号';
comment on column  FRBT_PROTECT.start_date
  is '开始保护日期';
comment on column  FRBT_PROTECT.stop_date
  is '截止保护日期';
comment on column  FRBT_PROTECT.data_status
  is '数据状态';
comment on column  FRBT_PROTECT.memo
  is '备注';
alter table  FRBT_PROTECT
  add constraint PK_FRBT_PROTECT primary key (GUID)
  using index 
  tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table FRBT_PROTECT_BAND
prompt ================================
prompt
create table  FRBT_PROTECT_BAND
(
  guid         VARCHAR2(36) not null,
  protect_guid VARCHAR2(36),
  freq_fb      NUMBER(14,7),
  freq_fe      NUMBER(14,7),
  memo         VARCHAR2(512)
)
tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  FRBT_PROTECT_BAND
  is '重点保护频带配置表';
comment on column  FRBT_PROTECT_BAND.protect_guid
  is '保护GUID';
comment on column  FRBT_PROTECT_BAND.freq_fb
  is '频率下限';
comment on column  FRBT_PROTECT_BAND.freq_fe
  is '频率上限';
comment on column  FRBT_PROTECT_BAND.memo
  is '备注';
alter table  FRBT_PROTECT_BAND
  add constraint PK_FRBT_PROTECT_BAND primary key (GUID)
  using index 
  tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  FRBT_PROTECT_BAND
  add constraint FK_FRBT_PRO_REFERENCE_FRBT_PRO foreign key (PROTECT_GUID)
  references  FRBT_PROTECT (GUID);

prompt
prompt Creating table FRBT_PROTECT_FREQ
prompt ================================
prompt
create table  FRBT_PROTECT_FREQ
(
  guid         VARCHAR2(36) not null,
  protect_guid VARCHAR2(36),
  freq_c       NUMBER(14,7),
  freq_bw      NUMBER(14,7),
  memo         VARCHAR2(512)
)
tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  FRBT_PROTECT_FREQ
  is '重点保护频率配置表';
comment on column  FRBT_PROTECT_FREQ.protect_guid
  is '保护GUID';
comment on column  FRBT_PROTECT_FREQ.freq_c
  is '中心频率';
comment on column  FRBT_PROTECT_FREQ.freq_bw
  is '带宽';
comment on column  FRBT_PROTECT_FREQ.memo
  is '备注';
alter table  FRBT_PROTECT_FREQ
  add constraint PK_FRBT_PROTECT_FREQ primary key (GUID)
  using index 
  tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  FRBT_PROTECT_FREQ
  add constraint FK_FRBT_PRO_FRE_REF_FRBT_PRO foreign key (PROTECT_GUID)
  references  FRBT_PROTECT (GUID);

prompt
prompt Creating table FRBT_SYSTEM_STATPRM
prompt ==================================
prompt
create table  FRBT_SYSTEM_STATPRM
(
  guid     VARCHAR2(36) not null,
  sys_code VARCHAR2(10),
  equ_type VARCHAR2(50),
  freq_mod VARCHAR2(100),
  tx_pow   VARCHAR2(400),
  rx_sen   VARCHAR2(400),
  freq_bw  VARCHAR2(400),
  freq_tol VARCHAR2(400),
  freq_se  VARCHAR2(400),
  file_no  VARCHAR2(500),
  memo     VARCHAR2(512)
)
tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  FRBT_SYSTEM_STATPRM
  is '通信系统典型台站技术参数表';
comment on column  FRBT_SYSTEM_STATPRM.sys_code
  is '通信业务/系统编号';
comment on column  FRBT_SYSTEM_STATPRM.equ_type
  is '设备种类';
comment on column  FRBT_SYSTEM_STATPRM.freq_mod
  is '调制方式';
comment on column  FRBT_SYSTEM_STATPRM.tx_pow
  is '发射功率';
comment on column  FRBT_SYSTEM_STATPRM.rx_sen
  is '接收机灵敏度';
comment on column  FRBT_SYSTEM_STATPRM.freq_bw
  is '占用带宽';
comment on column  FRBT_SYSTEM_STATPRM.freq_tol
  is '频率容限';
comment on column  FRBT_SYSTEM_STATPRM.freq_se
  is '杂散发射';
comment on column  FRBT_SYSTEM_STATPRM.file_no
  is '相关批文编号';
comment on column  FRBT_SYSTEM_STATPRM.memo
  is '备注';
alter table  FRBT_SYSTEM_STATPRM
  add constraint PK_FRBT_SYSTEM_STATPRM primary key (GUID)
  using index 
  tablespace RMIP_RFMEXTDB
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  FRBT_SYSTEM_STATPRM
  add constraint FK_FRBT_SYS_REFERENCE_FRBT_SYS foreign key (SYS_CODE)
  references  FRBT_SYSTEM (SYS_CODE);

prompt
prompt Creating table LEAVE_JPA
prompt ========================
prompt
create table  LEAVE_JPA
(
  id                   NUMBER(19) not null,
  apply_time           DATE,
  dept_leader_approved VARCHAR2(255),
  end_time             DATE,
  hr_approved          VARCHAR2(255),
  leave_type           VARCHAR2(255),
  process_instance_id  VARCHAR2(255),
  reality_end_time     DATE,
  reality_start_time   DATE,
  reason               VARCHAR2(255),
  report_back_date     DATE,
  start_time           DATE,
  user_id              VARCHAR2(255)
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255;
alter table  LEAVE_JPA
  add primary key (ID)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table OA_LEAVE
prompt =======================
prompt
create table  OA_LEAVE
(
  id                  NUMBER(19) not null,
  apply_time          TIMESTAMP(6),
  end_time            TIMESTAMP(6),
  leave_type          VARCHAR2(255),
  process_instance_id VARCHAR2(255),
  reality_end_time    TIMESTAMP(6),
  reality_start_time  TIMESTAMP(6),
  reason              VARCHAR2(255),
  start_time          TIMESTAMP(6),
  user_id             VARCHAR2(255)
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  OA_LEAVE
  add constraint PK_ID primary key (ID)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table RSBT_ORG
prompt =======================
prompt
create table  RSBT_ORG
(
  guid             VARCHAR2(36) not null,
  org_code         VARCHAR2(9),
  org_name         VARCHAR2(80),
  org_area_code    VARCHAR2(8) not null,
  org_sys_code     VARCHAR2(8),
  org_type         VARCHAR2(3) not null,
  org_link_person  VARCHAR2(40),
  org_person_id    VARCHAR2(40),
  org_sup_code     VARCHAR2(9),
  org_addr         VARCHAR2(80),
  org_post         VARCHAR2(6),
  org_phone        VARCHAR2(40),
  org_mob_phone    VARCHAR2(40),
  org_fax          VARCHAR2(40),
  org_bank         VARCHAR2(80),
  org_account_name VARCHAR2(80),
  org_account      VARCHAR2(40),
  org_hostility    NUMBER(1),
  org_web_site     VARCHAR2(80),
  org_mail         VARCHAR2(80)
)
tablespace "3100_STATDB"
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table  RSBT_ORG
  is '组织机构表';
comment on column  RSBT_ORG.org_code
  is '组织机构代码';
comment on column  RSBT_ORG.org_name
  is '组织机构名称';
comment on column  RSBT_ORG.org_area_code
  is '地区代码';
comment on column  RSBT_ORG.org_sys_code
  is '系统/行业代码';
comment on column  RSBT_ORG.org_type
  is '单位类型';
comment on column  RSBT_ORG.org_link_person
  is '单位联系人';
comment on column  RSBT_ORG.org_person_id
  is '联系人身份证号码';
comment on column  RSBT_ORG.org_sup_code
  is '上级组织机构代码';
comment on column  RSBT_ORG.org_addr
  is '组织机构地址';
comment on column  RSBT_ORG.org_post
  is '组织机构邮编';
comment on column  RSBT_ORG.org_phone
  is '联系电话';
comment on column  RSBT_ORG.org_mob_phone
  is '手机号码';
comment on column  RSBT_ORG.org_fax
  is '组织机构传真';
comment on column  RSBT_ORG.org_bank
  is '开户银行';
comment on column  RSBT_ORG.org_account_name
  is '账户名称';
comment on column  RSBT_ORG.org_account
  is '银行帐号';
comment on column  RSBT_ORG.org_hostility
  is '设台单位性质';
comment on column  RSBT_ORG.org_web_site
  is '网址';
comment on column  RSBT_ORG.org_mail
  is '电子邮箱';
alter table  RSBT_ORG
  add constraint PK_RSBT_ORG primary key (GUID)
  using index 
  tablespace "3100_STATDB"
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table RSBT_NET
prompt =======================
prompt
create table  RSBT_NET
(
  guid             VARCHAR2(36) not null,
  org_guid         VARCHAR2(36) not null,
  fee_guid         VARCHAR2(36),
  org_code         VARCHAR2(9) not null,
  net_name         VARCHAR2(80),
  net_svn          VARCHAR2(10),
  net_sp           VARCHAR2(8),
  net_ts           VARCHAR2(8),
  net_band         NUMBER(14,7),
  net_area         VARCHAR2(8),
  net_use          VARCHAR2(80),
  net_sat_name     VARCHAR2(80),
  net_lg           VARCHAR2(10),
  net_start_date   DATE,
  net_confirm_date DATE,
  net_expired_date DATE
)
tablespace "3100_STATDB"
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table  RSBT_NET
  is '无线电台(站)共性数据表';
comment on column  RSBT_NET.guid
  is '主键';
comment on column  RSBT_NET.org_guid
  is '申请单位GUID';
comment on column  RSBT_NET.fee_guid
  is '缴费单位GUID';
comment on column  RSBT_NET.org_code
  is '无线电管理机构组织机构代码';
comment on column  RSBT_NET.net_name
  is '无线电系统/网络名称';
comment on column  RSBT_NET.net_svn
  is '通信业务/系统类型';
comment on column  RSBT_NET.net_sp
  is '业务性质';
comment on column  RSBT_NET.net_ts
  is '技术体制';
comment on column  RSBT_NET.net_band
  is '信道带宽/波道间隔';
comment on column  RSBT_NET.net_area
  is '使用范围';
comment on column  RSBT_NET.net_use
  is '网络用途';
comment on column  RSBT_NET.net_sat_name
  is '卫星/星座名称';
comment on column  RSBT_NET.net_lg
  is '标称轨道经度';
comment on column  RSBT_NET.net_start_date
  is '启用日期';
comment on column  RSBT_NET.net_confirm_date
  is '批准日期';
comment on column  RSBT_NET.net_expired_date
  is '报废日期';
alter table  RSBT_NET
  add constraint PK_RSBT_NET primary key (GUID)
  using index 
  tablespace "3100_STATDB"
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  RSBT_NET
  add constraint FK_RSBT_NET_REFERENCE_RSBT_ORG foreign key (ORG_GUID)
  references  RSBT_ORG (GUID);
alter table  RSBT_NET
  add constraint FK_RSBT_NE_REF2_RSBT_ORG foreign key (FEE_GUID)
  references  RSBT_ORG (GUID);

prompt
prompt Creating table RSBT_STATION
prompt ===========================
prompt
create table  RSBT_STATION
(
  guid            VARCHAR2(36) not null,
  net_guid        VARCHAR2(36),
  org_code        VARCHAR2(9),
  app_code        VARCHAR2(14) not null,
  stat_app_type   VARCHAR2(8) not null,
  stat_tdi        VARCHAR2(4) not null,
  stat_name       VARCHAR2(80),
  stat_addr       VARCHAR2(80),
  stat_area_code  VARCHAR2(8),
  stat_type       VARCHAR2(8),
  stat_work       VARCHAR2(8),
  stat_status     VARCHAR2(8),
  stat_equ_sum    NUMBER(7),
  stat_lg         NUMBER(10,7),
  stat_la         NUMBER(10,7),
  stat_at         NUMBER(6,2),
  stat_date_start DATE,
  memo            VARCHAR2(512)
)
tablespace "3100_STATDB"
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table  RSBT_STATION
  is '无线电台(站)表';
comment on column  RSBT_STATION.guid
  is '主键';
comment on column  RSBT_STATION.net_guid
  is 'RSBT_ NET';
comment on column  RSBT_STATION.org_code
  is '无线电管理机构组织机构 代码';
comment on column  RSBT_STATION.app_code
  is '无线电台(站)申请表编号';
comment on column  RSBT_STATION.stat_app_type
  is '技术资料申报表类型';
comment on column  RSBT_STATION.stat_tdi
  is '技术资料申报表编号';
comment on column  RSBT_STATION.stat_name
  is '无线电台站名称';
comment on column  RSBT_STATION.stat_addr
  is '无线电台站地址';
comment on column  RSBT_STATION.stat_area_code
  is '无线电台站所在地地区编码';
comment on column  RSBT_STATION.stat_type
  is '台站类别';
comment on column  RSBT_STATION.stat_work
  is '工作方式';
comment on column  RSBT_STATION.stat_status
  is '台站状态';
comment on column  RSBT_STATION.stat_equ_sum
  is '(台站总)设备数量';
comment on column  RSBT_STATION.stat_lg
  is '台站经度(西经为负数)';
comment on column  RSBT_STATION.stat_la
  is '台站纬度(南纬为负数)';
comment on column  RSBT_STATION.stat_at
  is '海拔高度';
comment on column  RSBT_STATION.stat_date_start
  is '启用日期';
comment on column  RSBT_STATION.memo
  is '协调主管部门；国际协调和登记资料代码或名称';
alter table  RSBT_STATION
  add constraint PK_RSBT_STATION primary key (GUID)
  using index 
  tablespace "3100_STATDB"
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  RSBT_STATION
  add constraint FK_RSBT_STA_REFERENCE_RSBT_NET foreign key (NET_GUID)
  references  RSBT_NET (GUID);

prompt
prompt Creating table RSBT_ANTFEED
prompt ===========================
prompt
create table  RSBT_ANTFEED
(
  guid          VARCHAR2(36) not null,
  station_guid  VARCHAR2(36),
  ant_work_type VARCHAR2(8),
  ant_pole      VARCHAR2(8),
  ant_rpole     VARCHAR2(8),
  ant_epole     VARCHAR2(8),
  ant_type      VARCHAR2(8),
  ant_model     VARCHAR2(40),
  ant_menu      VARCHAR2(80),
  ant_hight     NUMBER(7,3),
  ant_gain      NUMBER(6,3),
  ant_egain     NUMBER(6,3),
  ant_rgain     NUMBER(6,3),
  ant_angle     NUMBER(7,4),
  ant_size      VARCHAR2(20),
  feed_menu     VARCHAR2(80),
  feed_model    VARCHAR2(40),
  feed_length   NUMBER(6,3),
  feed_lose     NUMBER(6,3),
  ant_code      NUMBER(36),
  feed_code     NUMBER(36)
)
tablespace "3100_STATDB"
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table  RSBT_ANTFEED
  is '无线电台(站)天馈线表';
comment on column  RSBT_ANTFEED.guid
  is '主键';
comment on column  RSBT_ANTFEED.station_guid
  is 'RSBT_STATION GUID';
comment on column  RSBT_ANTFEED.ant_work_type
  is '工作方式';
comment on column  RSBT_ANTFEED.ant_pole
  is '极化方式';
comment on column  RSBT_ANTFEED.ant_rpole
  is '收极化方式';
comment on column  RSBT_ANTFEED.ant_epole
  is '发极化方式';
comment on column  RSBT_ANTFEED.ant_type
  is '天线类型';
comment on column  RSBT_ANTFEED.ant_model
  is '天线型号';
comment on column  RSBT_ANTFEED.ant_menu
  is '天线生产厂家';
comment on column  RSBT_ANTFEED.ant_hight
  is '天线距地面高度';
comment on column  RSBT_ANTFEED.ant_gain
  is '天线增益';
comment on column  RSBT_ANTFEED.ant_egain
  is '天线发增益';
comment on column  RSBT_ANTFEED.ant_rgain
  is '天线收增益';
comment on column  RSBT_ANTFEED.ant_angle
  is '最大辐射方位角';
comment on column  RSBT_ANTFEED.ant_size
  is '天线尺寸';
comment on column  RSBT_ANTFEED.feed_menu
  is '馈线生产厂家';
comment on column  RSBT_ANTFEED.feed_model
  is '馈线型号';
comment on column  RSBT_ANTFEED.feed_length
  is '馈线长度';
comment on column  RSBT_ANTFEED.feed_lose
  is '馈线系统总损耗';
comment on column  RSBT_ANTFEED.ant_code
  is 'ADBMS_PK_ANTENO(天线序号)';
comment on column  RSBT_ANTFEED.feed_code
  is 'ADBMS_PK_FEEDLINENO(馈线序号)';
alter table  RSBT_ANTFEED
  add constraint PK_RSBT_ANTFEED primary key (GUID)
  using index 
  tablespace "3100_STATDB"
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  RSBT_ANTFEED
  add constraint FK_RSBT_ANT_REFERENCE_RSBT_STA foreign key (STATION_GUID)
  references  RSBT_STATION (GUID);

prompt
prompt Creating table RSBT_ANTFEED_T
prompt =============================
prompt
create table  RSBT_ANTFEED_T
(
  guid         VARCHAR2(36) not null,
  at_ant_no    VARCHAR2(4),
  at_se_b      NUMBER(10,7),
  at_se_e      NUMBER(10,7),
  at_ang_b     NUMBER(10,7),
  at_ang_e     NUMBER(10,7),
  at_rnt       NUMBER(9,3),
  at_bwid      NUMBER(10,7),
  at_lel       NUMBER(9,3),
  at_sspeed    NUMBER(9,3),
  at_ccode     VARCHAR2(20),
  at_3dbe      NUMBER(10,7),
  at_3dbr      NUMBER(10,7),
  at_rang      NUMBER(10,7),
  at_eang      NUMBER(10,7),
  at_csgn      VARCHAR2(20),
  at_updn      VARCHAR2(1),
  at_sum       NUMBER(3),
  at_qua       VARCHAR2(20),
  at_unit_type VARCHAR2(8),
  at_h_hpic    VARCHAR2(80),
  at_h_vpic    VARCHAR2(80),
  at_ant_upang NUMBER(10,7)
)
tablespace "3100_STATDB"
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table  RSBT_ANTFEED_T
  is '无线电台(站)天馈线冗余表';
comment on column  RSBT_ANTFEED_T.guid
  is 'RSBT_ ANTFEED';
comment on column  RSBT_ANTFEED_T.at_ant_no
  is '天线序号';
comment on column  RSBT_ANTFEED_T.at_se_b
  is '射线仰角范围起';
comment on column  RSBT_ANTFEED_T.at_se_e
  is '射线仰角范围止';
comment on column  RSBT_ANTFEED_T.at_ang_b
  is '方位角范围起';
comment on column  RSBT_ANTFEED_T.at_ang_e
  is '方位角范围止';
comment on column  RSBT_ANTFEED_T.at_rnt
  is '接收系统噪声温度';
comment on column  RSBT_ANTFEED_T.at_bwid
  is '波束宽度';
comment on column  RSBT_ANTFEED_T.at_lel
  is '第一旁瓣电平';
comment on column  RSBT_ANTFEED_T.at_sspeed
  is '扫描速度';
comment on column  RSBT_ANTFEED_T.at_ccode
  is '扇区号';
comment on column  RSBT_ANTFEED_T.at_3dbe
  is '3dB角宽（发）';
comment on column  RSBT_ANTFEED_T.at_3dbr
  is '3dB角宽（收）';
comment on column  RSBT_ANTFEED_T.at_rang
  is '收倾角';
comment on column  RSBT_ANTFEED_T.at_eang
  is '发倾角';
comment on column  RSBT_ANTFEED_T.at_csgn
  is '扇区标识码';
comment on column  RSBT_ANTFEED_T.at_updn
  is '直放站上行/下行';
comment on column  RSBT_ANTFEED_T.at_sum
  is '天线数量';
comment on column  RSBT_ANTFEED_T.at_qua
  is '接收系统品质';
comment on column  RSBT_ANTFEED_T.at_unit_type
  is '天线增益单位';
comment on column  RSBT_ANTFEED_T.at_h_hpic
  is '水平方向图';
comment on column  RSBT_ANTFEED_T.at_h_vpic
  is '垂直方向图';
comment on column  RSBT_ANTFEED_T.at_ant_upang
  is '天线仰角';
alter table  RSBT_ANTFEED_T
  add constraint PK_RSBT_ANTFEED_T primary key (GUID)
  using index 
  tablespace "3100_STATDB"
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  RSBT_ANTFEED_T
  add constraint FK_RSBT_ANT_REFERENCE_RSBT_ANT foreign key (GUID)
  references  RSBT_ANTFEED (GUID);

prompt
prompt Creating table RSBT_APPLY
prompt =========================
prompt
create table  RSBT_APPLY
(
  guid             VARCHAR2(36) not null,
  org_guid         VARCHAR2(36),
  net_guid         VARCHAR2(36) not null,
  org_manager_guid VARCHAR2(36) not null,
  app_code         VARCHAR2(14) not null,
  app_type         VARCHAR2(8) not null,
  app_sub_type     VARCHAR2(8) not null,
  app_object_type  VARCHAR2(8) not null,
  app_date         DATE,
  app_ftlb         DATE not null,
  app_ftle         DATE not null,
  memo             VARCHAR2(512)
)
tablespace "3100_STATDB"
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table  RSBT_APPLY
  is '申请表';
comment on column  RSBT_APPLY.guid
  is '申请表GUID';
comment on column  RSBT_APPLY.org_guid
  is '申请单位GUID';
comment on column  RSBT_APPLY.net_guid
  is '通信网GUID';
comment on column  RSBT_APPLY.org_manager_guid
  is '管理机构 GUID';
comment on column  RSBT_APPLY.app_code
  is '申请表编号';
comment on column  RSBT_APPLY.app_type
  is '申请表类型';
comment on column  RSBT_APPLY.app_sub_type
  is '申请类型';
comment on column  RSBT_APPLY.app_object_type
  is '申请对象类型';
comment on column  RSBT_APPLY.app_date
  is '申请日期';
comment on column  RSBT_APPLY.app_ftlb
  is '开始日期';
comment on column  RSBT_APPLY.app_ftle
  is '截止日期';
comment on column  RSBT_APPLY.memo
  is '备注';
alter table  RSBT_APPLY
  add constraint PK_RSBT_APPLY primary key (GUID)
  using index 
  tablespace "3100_STATDB"
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  RSBT_APPLY
  add constraint FK_RSBT_APP_REF9_RSBT_ORG foreign key (ORG_MANAGER_GUID)
  references  RSBT_ORG (GUID);
alter table  RSBT_APPLY
  add constraint FK_RSBT_APP_REFERENCE_RSBT_NET foreign key (NET_GUID)
  references  RSBT_NET (GUID);
alter table  RSBT_APPLY
  add constraint FK_RSBT_APP_REFERENCE_RSBT_ORG foreign key (ORG_GUID)
  references  RSBT_ORG (GUID);

prompt
prompt Creating table RSBT_APPFILELIST
prompt ===============================
prompt
create table  RSBT_APPFILELIST
(
  guid           VARCHAR2(36) not null,
  app_guid       VARCHAR2(36) not null,
  app_code       VARCHAR2(14) not null,
  app_file_no    VARCHAR2(40),
  app_attachment VARCHAR2(120),
  app_file_url   VARCHAR2(120)
)
tablespace "3100_STATDB"
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table  RSBT_APPFILELIST
  is '申请表文件列表';
comment on column  RSBT_APPFILELIST.app_guid
  is '申请GUID';
comment on column  RSBT_APPFILELIST.app_code
  is '申请表编号';
comment on column  RSBT_APPFILELIST.app_file_no
  is '频率使用许可证号或批准文号';
comment on column  RSBT_APPFILELIST.app_attachment
  is '文件/批文名称';
comment on column  RSBT_APPFILELIST.app_file_url
  is '附件URL ';
alter table  RSBT_APPFILELIST
  add constraint PK_RSBT_APPFILELIST primary key (GUID)
  using index 
  tablespace "3100_STATDB"
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  RSBT_APPFILELIST
  add constraint FK_RSBT_APP_REFERENCE_RSBT_APP foreign key (APP_GUID)
  references  RSBT_APPLY (GUID);

prompt
prompt Creating table RSBT_APPFREQ
prompt ===========================
prompt
create table  RSBT_APPFREQ
(
  guid          VARCHAR2(36) not null,
  app_guid      VARCHAR2(36) not null,
  app_code      VARCHAR2(14) not null,
  app_freq_lc   NUMBER(14,7),
  app_freq_uc   NUMBER(14,7),
  app_freq_lfb  NUMBER(14,7),
  app_freq_lfe  NUMBER(14,7),
  app_freq_lb   NUMBER(14,7),
  app_freq_ufb  NUMBER(14,7),
  app_freq_ufe  NUMBER(14,7),
  app_freq_ub   NUMBER(14,7),
  app_freq_code VARCHAR2(36),
  app_freq_type VARCHAR2(1)
)
tablespace "3100_STATDB"
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table  RSBT_APPFREQ
  is '申请表频率存贮表';
comment on column  RSBT_APPFREQ.app_guid
  is '申请GUID';
comment on column  RSBT_APPFREQ.app_code
  is '申请表编号';
comment on column  RSBT_APPFREQ.app_freq_lc
  is '中心频率（低频）';
comment on column  RSBT_APPFREQ.app_freq_uc
  is '中心频率（高频）';
comment on column  RSBT_APPFREQ.app_freq_lfb
  is '频率低段上限';
comment on column  RSBT_APPFREQ.app_freq_lfe
  is '频率低段下限';
comment on column  RSBT_APPFREQ.app_freq_lb
  is '频率低段带宽';
comment on column  RSBT_APPFREQ.app_freq_ufb
  is '频率高段上限';
comment on column  RSBT_APPFREQ.app_freq_ufe
  is '频率高段下限';
comment on column  RSBT_APPFREQ.app_freq_ub
  is '频率高段带宽';
comment on column  RSBT_APPFREQ.app_freq_code
  is '国家频率数据库对应码';
comment on column  RSBT_APPFREQ.app_freq_type
  is '频率类型（信道或频段）';
alter table  RSBT_APPFREQ
  add constraint PK_RSBT_APPFREQ primary key (GUID)
  using index 
  tablespace "3100_STATDB"
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  RSBT_APPFREQ
  add constraint FK_RSBT_APP_REF2_RSBT_APP foreign key (APP_GUID)
  references  RSBT_APPLY (GUID);

prompt
prompt Creating table RSBT_CODE_DIC
prompt ============================
prompt
create table  RSBT_CODE_DIC
(
  co                 NUMBER not null,
  cn                 VARCHAR2(10) not null,
  code_chi_name      VARCHAR2(120),
  code_data_type     VARCHAR2(8),
  code_type_chi_name VARCHAR2(80),
  code_discn         NUMBER not null
)
tablespace "3100_STATDB"
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table  RSBT_CODE_DIC
  is '代码数据表';
comment on column  RSBT_CODE_DIC.co
  is '序号';
comment on column  RSBT_CODE_DIC.cn
  is '代码编码';
comment on column  RSBT_CODE_DIC.code_chi_name
  is '代码中文名称';
comment on column  RSBT_CODE_DIC.code_data_type
  is '代码数据表类型';
comment on column  RSBT_CODE_DIC.code_type_chi_name
  is '代码数据表类型中文名称';
comment on column  RSBT_CODE_DIC.code_discn
  is '显示序号';
alter table  RSBT_CODE_DIC
  add constraint PK_RSBT_CODE_DIC primary key (CO)
  using index 
  tablespace "3100_STATDB"
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table RSBT_DB_POOL
prompt ===========================
prompt
create table  RSBT_DB_POOL
(
  org_area_code            VARCHAR2(8) not null,
  server_adress1           VARCHAR2(30),
  server_adress2           VARCHAR2(30),
  database_server_name     VARCHAR2(20),
  database_name            VARCHAR2(30),
  database_management_user VARCHAR2(20) not null,
  database_password        VARCHAR2(20) not null
)
tablespace "3100_STATDB"
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  RSBT_DB_POOL
  is '数据源的代码表';
comment on column  RSBT_DB_POOL.org_area_code
  is '地区代码';
comment on column  RSBT_DB_POOL.server_adress1
  is '服务器IP地址1';
comment on column  RSBT_DB_POOL.server_adress2
  is '服务器IP地址2';
comment on column  RSBT_DB_POOL.database_server_name
  is '数据库服务名';
comment on column  RSBT_DB_POOL.database_name
  is '数据库名称';
comment on column  RSBT_DB_POOL.database_management_user
  is '数据库管理员用户名称';
comment on column  RSBT_DB_POOL.database_password
  is '数据库口令';

prompt
prompt Creating table RSBT_EAF
prompt =======================
prompt
create table  RSBT_EAF
(
  guid         VARCHAR2(36) not null,
  station_guid VARCHAR2(36),
  equ_guid     VARCHAR2(36),
  ant_guid     VARCHAR2(36),
  freq_guid    VARCHAR2(36)
)
tablespace "3100_STATDB"
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  RSBT_EAF
  is '无线电台(站)设备频率与天馈线索引表';
comment on column  RSBT_EAF.guid
  is '主键';
comment on column  RSBT_EAF.station_guid
  is '台站GUID';
comment on column  RSBT_EAF.equ_guid
  is '设备';
comment on column  RSBT_EAF.ant_guid
  is '天线';
comment on column  RSBT_EAF.freq_guid
  is '频率';
alter table  RSBT_EAF
  add constraint PK_RSBT_EAF primary key (GUID)
  using index 
  tablespace "3100_STATDB"
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  RSBT_EAF
  add constraint FK_RSBT_EAF_REFERENCE_RSBT_STA foreign key (STATION_GUID)
  references  RSBT_STATION (GUID);

prompt
prompt Creating table RSBT_EQU
prompt =======================
prompt
create table  RSBT_EQU
(
  guid         VARCHAR2(36) not null,
  station_guid VARCHAR2(36),
  equ_type     VARCHAR2(8),
  equ_model    VARCHAR2(40),
  equ_auth     VARCHAR2(40),
  equ_menu     VARCHAR2(80),
  equ_code     VARCHAR2(40),
  equ_pf       VARCHAR2(8),
  equ_pow      NUMBER(14,7),
  equ_mb       VARCHAR2(1)
)
tablespace "3100_STATDB"
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table  RSBT_EQU
  is '无线电台(站)收/发信机设备表';
comment on column  RSBT_EQU.guid
  is '主键';
comment on column  RSBT_EQU.station_guid
  is 'RSBT_ STATION';
comment on column  RSBT_EQU.equ_type
  is '设备工作方式';
comment on column  RSBT_EQU.equ_model
  is '设备型号';
comment on column  RSBT_EQU.equ_auth
  is '型号核准代码';
comment on column  RSBT_EQU.equ_menu
  is '设备生产厂家';
comment on column  RSBT_EQU.equ_code
  is '设备出厂号';
comment on column  RSBT_EQU.equ_pf
  is '功率标识';
comment on column  RSBT_EQU.equ_pow
  is '发射功率';
comment on column  RSBT_EQU.equ_mb
  is '主/备用标识';
alter table  RSBT_EQU
  add constraint PK_RSBT_EQU primary key (GUID)
  using index 
  tablespace "3100_STATDB"
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  RSBT_EQU
  add constraint FK_RSBT_EQU_REFERENCE_RSBT_STA foreign key (STATION_GUID)
  references  RSBT_STATION (GUID);

prompt
prompt Creating table RSBT_EQU_T
prompt =========================
prompt
create table  RSBT_EQU_T
(
  guid           VARCHAR2(36) not null,
  et_equ_no      VARCHAR2(4),
  et_af_type     VARCHAR2(1),
  et_pow_u       VARCHAR2(8),
  et_equ_cl      VARCHAR2(20),
  et_equ_tl      NUMBER(9,3),
  et_equ_rnq     NUMBER(9,3),
  et_equ_type_id VARCHAR2(8),
  et_equ_name    VARCHAR2(80),
  et_equ_code    VARCHAR2(10),
  et_equ_esgn    VARCHAR2(20),
  et_equ_epos    VARCHAR2(40),
  et_equ_atype   VARCHAR2(8),
  et_equ_apos    VARCHAR2(40),
  et_equ_sum     NUMBER(7),
  et_equ_euse    VARCHAR2(20),
  et_equ_fntval  NUMBER(10,3),
  et_equ_pup     NUMBER(10,3),
  et_equ_pdn     NUMBER(10,3),
  et_equ_chrip   NUMBER(10,3),
  et_equ_pwid1   NUMBER(10,3),
  et_equ_pwid2   NUMBER(10,3),
  et_equ_pr      NUMBER(10,3),
  et_equ_pf      NUMBER(10,3),
  et_equ_rf      NUMBER(10,3),
  et_equ_rf_band NUMBER(10,3),
  et_equ_sen     NUMBER(10,3),
  et_equ_senu    VARCHAR2(8),
  et_equ_senerr  VARCHAR2(10),
  et_equ_rwid    NUMBER(14,7),
  et_equ_mt      VARCHAR2(8),
  et_equ_ccode   VARCHAR2(20),
  et_equ_upu     VARCHAR2(8),
  et_equ_dnu     VARCHAR2(8),
  et_equ_type    VARCHAR2(20),
  et_equ_use     VARCHAR2(40),
  et_equ_pow_max NUMBER(10,3),
  et_equ_pow_avg NUMBER(10,3),
  et_equ_upow    NUMBER(14,7),
  et_equ_dpow    NUMBER(14,7)
)
tablespace "3100_STATDB"
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table  RSBT_EQU_T
  is '无线电台(站) 收/发信机设备冗余表';
comment on column  RSBT_EQU_T.guid
  is 'RSBT_ EQU';
comment on column  RSBT_EQU_T.et_equ_no
  is '设备序号';
comment on column  RSBT_EQU_T.et_af_type
  is '是否自动选频';
comment on column  RSBT_EQU_T.et_pow_u
  is '功率单位';
comment on column  RSBT_EQU_T.et_equ_cl
  is '呼号';
comment on column  RSBT_EQU_T.et_equ_tl
  is '门限电平（dBm）';
comment on column  RSBT_EQU_T.et_equ_rnq
  is '噪声系数（dB）';
comment on column  RSBT_EQU_T.et_equ_type_id
  is '设备类型';
comment on column  RSBT_EQU_T.et_equ_name
  is '设备名称';
comment on column  RSBT_EQU_T.et_equ_code
  is '型式认可代码';
comment on column  RSBT_EQU_T.et_equ_esgn
  is '发射标识';
comment on column  RSBT_EQU_T.et_equ_epos
  is '设备电台安装位置';
comment on column  RSBT_EQU_T.et_equ_atype
  is '设备天线类型';
comment on column  RSBT_EQU_T.et_equ_apos
  is '天线安装位置';
comment on column  RSBT_EQU_T.et_equ_sum
  is '设备数量';
comment on column  RSBT_EQU_T.et_equ_euse
  is '电池有效期';
comment on column  RSBT_EQU_T.et_equ_fntval
  is '频率间隔';
comment on column  RSBT_EQU_T.et_equ_pup
  is '脉冲上升时间';
comment on column  RSBT_EQU_T.et_equ_pdn
  is '脉冲下降时间';
comment on column  RSBT_EQU_T.et_equ_chrip
  is 'Chirp宽度';
comment on column  RSBT_EQU_T.et_equ_pwid1
  is '脉冲宽度1';
comment on column  RSBT_EQU_T.et_equ_pwid2
  is '脉冲宽度2';
comment on column  RSBT_EQU_T.et_equ_pr
  is '脉冲重复周期';
comment on column  RSBT_EQU_T.et_equ_pf
  is '脉冲重复频率';
comment on column  RSBT_EQU_T.et_equ_rf
  is '应答器发射频率';
comment on column  RSBT_EQU_T.et_equ_rf_band
  is '应答器发射的带宽';
comment on column  RSBT_EQU_T.et_equ_sen
  is '接收机灵敏度';
comment on column  RSBT_EQU_T.et_equ_senu
  is '接收机灵敏度单位';
comment on column  RSBT_EQU_T.et_equ_senerr
  is '接收机灵敏度对应的误码率指标';
comment on column  RSBT_EQU_T.et_equ_rwid
  is '接收机中频带宽';
comment on column  RSBT_EQU_T.et_equ_mt
  is '调制方式';
comment on column  RSBT_EQU_T.et_equ_ccode
  is '扇区号';
comment on column  RSBT_EQU_T.et_equ_upu
  is '上行发射功率/信道的单位';
comment on column  RSBT_EQU_T.et_equ_dnu
  is '下行发射功率/信道的单位';
comment on column  RSBT_EQU_T.et_equ_type
  is '设备类别';
comment on column  RSBT_EQU_T.et_equ_use
  is '使用方式';
comment on column  RSBT_EQU_T.et_equ_pow_max
  is '峰值功率';
comment on column  RSBT_EQU_T.et_equ_pow_avg
  is '平均功率';
comment on column  RSBT_EQU_T.et_equ_upow
  is '上行发射功率';
comment on column  RSBT_EQU_T.et_equ_dpow
  is '下行发射功率';
alter table  RSBT_EQU_T
  add constraint PK_RSBT_EQU_T primary key (GUID)
  using index 
  tablespace "3100_STATDB"
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  RSBT_EQU_T
  add constraint FK_RSBT_EQU_REFERENCE_RSBT_EQU foreign key (GUID)
  references  RSBT_EQU (GUID);

prompt
prompt Creating table RSBT_E_SE
prompt ========================
prompt
create table  RSBT_E_SE
(
  guid         VARCHAR2(36) not null,
  station_guid VARCHAR2(36),
  se_comm      NUMBER(7,4),
  se_angle     NUMBER(7,4),
  se_dis       NUMBER(7,4)
)
tablespace "3100_STATDB"
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table  RSBT_E_SE
  is '天际线仰角障碍物数据存贮表';
comment on column  RSBT_E_SE.guid
  is '主键';
comment on column  RSBT_E_SE.station_guid
  is '地球站GUID';
comment on column  RSBT_E_SE.se_comm
  is '方位角';
comment on column  RSBT_E_SE.se_angle
  is '天际线仰角';
comment on column  RSBT_E_SE.se_dis
  is '障碍物距离';
alter table  RSBT_E_SE
  add constraint PK_RSBT_E_SE primary key (GUID)
  using index 
  tablespace "3100_STATDB"
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  RSBT_E_SE
  add constraint FK_RSBT_E_S_REFERENCE_RSBT_STA foreign key (STATION_GUID)
  references  RSBT_STATION (GUID);

prompt
prompt Creating table RSBT_FEE_DERATE
prompt ==============================
prompt
create table  RSBT_FEE_DERATE
(
  guid        VARCHAR2(36) not null,
  name        VARCHAR2(300) not null,
  proportion  NUMBER(4,3) not null,
  description VARCHAR2(1000)
)
tablespace "3100_STATDB"
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  RSBT_FEE_DERATE
  is '无线电台(站)收费减免依据表';
comment on column  RSBT_FEE_DERATE.guid
  is '主键';
comment on column  RSBT_FEE_DERATE.name
  is '减免依据名称';
comment on column  RSBT_FEE_DERATE.proportion
  is '减免比例，不能大于1同时也不能小于0';
comment on column  RSBT_FEE_DERATE.description
  is '减免依据描述';
alter table  RSBT_FEE_DERATE
  add constraint PK_RSBT_FEE_DERATE primary key (GUID)
  using index 
  tablespace "3100_STATDB"
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table RSBT_FEEEVERYYEAR
prompt ================================
prompt
create table  RSBT_FEEEVERYYEAR
(
  guid                  VARCHAR2(36) not null,
  org_guid              VARCHAR2(36),
  net_guid              VARCHAR2(36),
  station_guid          VARCHAR2(36),
  fee_type              NUMBER(1) not null,
  fee_sum               NUMBER(8,2) not null,
  fee_derate_proportion NUMBER(4,3),
  fee_derate_according  VARCHAR2(36),
  fee_start_date        DATE,
  fee_end_date          DATE,
  fee_pay_month         NUMBER(2) not null,
  fee_operation         VARCHAR2(40) not null,
  fee_operation_date    DATE not null,
  fee_audit             VARCHAR2(40),
  fee_audit_date        DATE,
  memo                  VARCHAR2(512)
)
tablespace "3100_STATDB"
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table  RSBT_FEEEVERYYEAR
  is '无线电台(网)年度缴费信息表';
comment on column  RSBT_FEEEVERYYEAR.guid
  is '主键';
comment on column  RSBT_FEEEVERYYEAR.org_guid
  is '缴费单位GUID';
comment on column  RSBT_FEEEVERYYEAR.net_guid
  is '缴费通信网';
comment on column  RSBT_FEEEVERYYEAR.station_guid
  is '缴费台站';
comment on column  RSBT_FEEEVERYYEAR.fee_type
  is '缴费类型';
comment on column  RSBT_FEEEVERYYEAR.fee_sum
  is '频占费收费金额';
comment on column  RSBT_FEEEVERYYEAR.fee_derate_proportion
  is '减免比例';
comment on column  RSBT_FEEEVERYYEAR.fee_derate_according
  is '减免依据';
comment on column  RSBT_FEEEVERYYEAR.fee_start_date
  is '费用计算起始日期';
comment on column  RSBT_FEEEVERYYEAR.fee_end_date
  is '费用计算终止日期';
comment on column  RSBT_FEEEVERYYEAR.fee_pay_month
  is '缴费月份';
comment on column  RSBT_FEEEVERYYEAR.fee_operation
  is '操作人';
comment on column  RSBT_FEEEVERYYEAR.fee_operation_date
  is '操作时间';
comment on column  RSBT_FEEEVERYYEAR.fee_audit
  is '审核人';
comment on column  RSBT_FEEEVERYYEAR.fee_audit_date
  is '审核时间';
comment on column  RSBT_FEEEVERYYEAR.memo
  is '备注';
alter table  RSBT_FEEEVERYYEAR
  add constraint PK_RSBT_FEEEVERYYEAR primary key (GUID)
  using index 
  tablespace "3100_STATDB"
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  RSBT_FEEEVERYYEAR
  add constraint FK_RSBT_FEE_REFERENCE_RSBT_FEE foreign key (FEE_DERATE_ACCORDING)
  references  RSBT_FEE_DERATE (GUID);
alter table  RSBT_FEEEVERYYEAR
  add constraint FK_RSBT_FEE_REFERENCE_RSBT_NET foreign key (NET_GUID)
  references  RSBT_NET (GUID);
alter table  RSBT_FEEEVERYYEAR
  add constraint FK_RSBT_FEE_REFERENCE_RSBT_ORG foreign key (ORG_GUID)
  references  RSBT_ORG (GUID);
alter table  RSBT_FEEEVERYYEAR
  add constraint FK_RSBT_FEE_REFERENCE_RSBT_STA foreign key (STATION_GUID)
  references  RSBT_STATION (GUID);

prompt
prompt Creating table RSBT_FEERECORD
prompt =============================
prompt
create table  RSBT_FEERECORD
(
  guid     VARCHAR2(36) not null,
  fee_guid VARCHAR2(36),
  fee_time DATE not null,
  fee_year NUMBER(4) not null,
  fee_sum  NUMBER(11,2) not null,
  fee_late NUMBER(11,2)
)
tablespace "3100_STATDB"
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  RSBT_FEERECORD
  is '无线电台(网)缴费记录表';
comment on column  RSBT_FEERECORD.guid
  is '主键';
comment on column  RSBT_FEERECORD.fee_guid
  is '缴费项目';
comment on column  RSBT_FEERECORD.fee_time
  is '缴费时间';
comment on column  RSBT_FEERECORD.fee_year
  is '缴费年度';
comment on column  RSBT_FEERECORD.fee_sum
  is '缴费金额';
comment on column  RSBT_FEERECORD.fee_late
  is '其中滞纳金数额';
alter table  RSBT_FEERECORD
  add constraint PK_RSBT_FEERECORD primary key (GUID)
  using index 
  tablespace "3100_STATDB"
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  RSBT_FEERECORD
  add constraint FK_RSBT_FEE_REF2_RSBT_FEE foreign key (FEE_GUID)
  references  RSBT_FEEEVERYYEAR (GUID);

prompt
prompt Creating table RSBT_FEESTANDERD
prompt ===============================
prompt
create table  RSBT_FEESTANDERD
(
  item_code  VARCHAR2(10) not null,
  item_name  VARCHAR2(100) not null,
  item_type  VARCHAR2(10) not null,
  type_name  VARCHAR2(30) not null,
  fee_pay    NUMBER(11,2) not null,
  count_mode VARCHAR2(30) not null,
  set_date   DATE,
  memo       VARCHAR2(512)
)
tablespace "3100_STATDB"
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table  RSBT_FEESTANDERD
  is '无线电台(网)缴费标准表';
comment on column  RSBT_FEESTANDERD.item_code
  is '缴费项目编号';
comment on column  RSBT_FEESTANDERD.item_name
  is '缴费项目名称';
comment on column  RSBT_FEESTANDERD.item_type
  is '缴费种类编码';
comment on column  RSBT_FEESTANDERD.type_name
  is '缴费种类名称';
comment on column  RSBT_FEESTANDERD.fee_pay
  is '缴费数额';
comment on column  RSBT_FEESTANDERD.count_mode
  is '计费方式';
comment on column  RSBT_FEESTANDERD.set_date
  is '缴费标准设定时间';
comment on column  RSBT_FEESTANDERD.memo
  is '备注';
alter table  RSBT_FEESTANDERD
  add constraint PK_RSBT_FEESTANDERD primary key (ITEM_CODE)
  using index 
  tablespace "3100_STATDB"
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table RSBT_FEEUNITRECORD
prompt =================================
prompt
create table  RSBT_FEEUNITRECORD
(
  guid          VARCHAR2(36) not null,
  org_guid      VARCHAR2(36),
  fee_time      DATE not null,
  fee_year      NUMBER(4) not null,
  fee_bill      NUMBER(11,2),
  fee_payment   NUMBER(11,2),
  fee_freq      NUMBER(11,2),
  fee_else      NUMBER(11,2),
  fee_late      NUMBER(11,2),
  fee_bill_code VARCHAR2(40),
  fee_operation VARCHAR2(40) not null,
  memo          VARCHAR2(512)
)
tablespace "3100_STATDB"
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  RSBT_FEEUNITRECORD
  is '缴费单位缴费记录表';
comment on column  RSBT_FEEUNITRECORD.guid
  is '主键';
comment on column  RSBT_FEEUNITRECORD.org_guid
  is '缴费单位';
comment on column  RSBT_FEEUNITRECORD.fee_time
  is '缴费日期';
comment on column  RSBT_FEEUNITRECORD.fee_year
  is '缴费年度';
comment on column  RSBT_FEEUNITRECORD.fee_bill
  is '应缴总费用';
comment on column  RSBT_FEEUNITRECORD.fee_payment
  is '实缴总费用';
comment on column  RSBT_FEEUNITRECORD.fee_freq
  is '其中缴纳频占费金额';
comment on column  RSBT_FEEUNITRECORD.fee_else
  is '缴纳其它费用金额';
comment on column  RSBT_FEEUNITRECORD.fee_late
  is '其中滞纳金数额';
comment on column  RSBT_FEEUNITRECORD.fee_bill_code
  is '缴费单据号码';
comment on column  RSBT_FEEUNITRECORD.fee_operation
  is '操作员';
comment on column  RSBT_FEEUNITRECORD.memo
  is '备注';
alter table  RSBT_FEEUNITRECORD
  add constraint PK_RSBT_FEEUNITRECORD primary key (GUID)
  using index 
  tablespace "3100_STATDB"
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  RSBT_FEEUNITRECORD
  add constraint FK_RSBT_FEE_REF2_RSBT_ORG foreign key (ORG_GUID)
  references  RSBT_ORG (GUID);

prompt
prompt Creating table RSBT_FEEURGENCYRECORD
prompt ====================================
prompt
create table  RSBT_FEEURGENCYRECORD
(
  guid                  VARCHAR2(36) not null,
  org_guid              VARCHAR2(36),
  fee_urgency_time      DATE not null,
  fee_year              NUMBER not null,
  fee_bill              NUMBER(11,2),
  fee_urgency_mode      VARCHAR2(40),
  fee_urgency_operation VARCHAR2(40) not null,
  fee_urgency_person    VARCHAR2(40),
  fee_urgency_file_code VARCHAR2(20),
  memo                  VARCHAR2(512)
)
tablespace "3100_STATDB"
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  RSBT_FEEURGENCYRECORD
  is '缴费单位催缴记录表';
comment on column  RSBT_FEEURGENCYRECORD.guid
  is '主键';
comment on column  RSBT_FEEURGENCYRECORD.org_guid
  is '缴费单位';
comment on column  RSBT_FEEURGENCYRECORD.fee_urgency_time
  is '催缴时间';
comment on column  RSBT_FEEURGENCYRECORD.fee_year
  is '缴费年度';
comment on column  RSBT_FEEURGENCYRECORD.fee_bill
  is '应缴总费用';
comment on column  RSBT_FEEURGENCYRECORD.fee_urgency_mode
  is '催缴方式 ';
comment on column  RSBT_FEEURGENCYRECORD.fee_urgency_operation
  is '催缴操作人员';
comment on column  RSBT_FEEURGENCYRECORD.fee_urgency_person
  is '催缴单位联系人';
comment on column  RSBT_FEEURGENCYRECORD.fee_urgency_file_code
  is '催缴文件编号';
comment on column  RSBT_FEEURGENCYRECORD.memo
  is '备注';
alter table  RSBT_FEEURGENCYRECORD
  add constraint PK_RSBT_FEEURGENCYRECORD primary key (GUID)
  using index 
  tablespace "3100_STATDB"
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  RSBT_FEEURGENCYRECORD
  add constraint FK_RSBT_FEE_REF3_RSBT_ORG foreign key (ORG_GUID)
  references  RSBT_ORG (GUID);

prompt
prompt Creating table RSBT_FREQ
prompt ========================
prompt
create table  RSBT_FREQ
(
  guid         VARCHAR2(36) not null,
  station_guid VARCHAR2(36),
  freq_type    VARCHAR2(1),
  freq_lc      NUMBER(14,7),
  freq_uc      NUMBER(14,7),
  freq_efb     NUMBER(14,7),
  freq_efe     NUMBER(14,7),
  freq_e_band  NUMBER(14,7),
  freq_rfb     NUMBER(14,7),
  freq_rfe     NUMBER(14,7),
  freq_r_band  NUMBER(14,7),
  freq_mod     VARCHAR2(8),
  freq_mb      VARCHAR2(1),
  freq_code    VARCHAR2(36)
)
tablespace "3100_STATDB"
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  RSBT_FREQ
  is '无线电台(站)频率表';
comment on column  RSBT_FREQ.guid
  is '主键';
comment on column  RSBT_FREQ.station_guid
  is 'RSBT_ STATION';
comment on column  RSBT_FREQ.freq_type
  is '信(波)道划分类型：段，波道';
comment on column  RSBT_FREQ.freq_lc
  is '中心频率(低频)';
comment on column  RSBT_FREQ.freq_uc
  is '中心频率(高频)';
comment on column  RSBT_FREQ.freq_efb
  is '发射频率下限';
comment on column  RSBT_FREQ.freq_efe
  is '发射频率上限';
comment on column  RSBT_FREQ.freq_e_band
  is '发射(必要)带宽';
comment on column  RSBT_FREQ.freq_rfb
  is '接收频率上限';
comment on column  RSBT_FREQ.freq_rfe
  is '接收频率下限';
comment on column  RSBT_FREQ.freq_r_band
  is '接收(必要)带宽';
comment on column  RSBT_FREQ.freq_mod
  is '调制方式';
comment on column  RSBT_FREQ.freq_mb
  is '主/备用频率标识';
comment on column  RSBT_FREQ.freq_code
  is '国家频率数据库对应码';
alter table  RSBT_FREQ
  add constraint PK_RSBT_FREQ primary key (GUID)
  using index 
  tablespace "3100_STATDB"
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  RSBT_FREQ
  add constraint FK_RSBT_FRE_REFERENCE_RSBT_STA foreign key (STATION_GUID)
  references  RSBT_STATION (GUID);

prompt
prompt Creating table RSBT_FREQ_T
prompt ==========================
prompt
create table  RSBT_FREQ_T
(
  guid              VARCHAR2(36) not null,
  ft_freq_no        VARCHAR2(2),
  ft_freq_timeb     DATE,
  ft_freq_timee     DATE,
  ft_freq_info_type VARCHAR2(8),
  ft_freq_hcl       VARCHAR2(20),
  ft_freq_type      VARCHAR2(1),
  ft_freq_mc        VARCHAR2(8),
  ft_freq_mc1       VARCHAR2(20),
  ft_freq_mc2       VARCHAR2(20),
  ft_freq_mc3       VARCHAR2(20),
  ft_freq_ccode     VARCHAR2(20),
  ft_freq_csgn      VARCHAR2(20),
  ft_freq_dupdn     VARCHAR2(1),
  ft_freq_unit_type VARCHAR2(8),
  ft_freq_fep       VARCHAR2(8),
  ft_freq_frp       VARCHAR2(8),
  ft_freq_epow      NUMBER(14,7),
  ft_freq_powflag   VARCHAR2(8),
  ft_freq_eirp      NUMBER(14,7),
  ft_freq_pow_max   NUMBER(10,3),
  ft_freq_pow_avg   NUMBER(10,3)
)
tablespace "3100_STATDB"
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table  RSBT_FREQ_T
  is '无线电台（站）频率冗余表';
comment on column  RSBT_FREQ_T.guid
  is 'RSBT_FREQ';
comment on column  RSBT_FREQ_T.ft_freq_no
  is '频率序号';
comment on column  RSBT_FREQ_T.ft_freq_timeb
  is '工作时间起';
comment on column  RSBT_FREQ_T.ft_freq_timee
  is '工作时间止';
comment on column  RSBT_FREQ_T.ft_freq_info_type
  is '发送信息类型';
comment on column  RSBT_FREQ_T.ft_freq_hcl
  is '呼号';
comment on column  RSBT_FREQ_T.ft_freq_type
  is '波道间隔/信道带宽';
comment on column  RSBT_FREQ_T.ft_freq_mc
  is '调制特性类型';
comment on column  RSBT_FREQ_T.ft_freq_mc1
  is '调制特性1';
comment on column  RSBT_FREQ_T.ft_freq_mc2
  is '调制特性2';
comment on column  RSBT_FREQ_T.ft_freq_mc3
  is '调制特性3';
comment on column  RSBT_FREQ_T.ft_freq_ccode
  is '扇区号';
comment on column  RSBT_FREQ_T.ft_freq_csgn
  is '扇区标识码';
comment on column  RSBT_FREQ_T.ft_freq_dupdn
  is '直放站的上行/下行标识';
comment on column  RSBT_FREQ_T.ft_freq_unit_type
  is '频率单位';
comment on column  RSBT_FREQ_T.ft_freq_fep
  is '发射极化方式';
comment on column  RSBT_FREQ_T.ft_freq_frp
  is '接收极化方式';
comment on column  RSBT_FREQ_T.ft_freq_epow
  is '发射功率W';
comment on column  RSBT_FREQ_T.ft_freq_powflag
  is '功率标识';
comment on column  RSBT_FREQ_T.ft_freq_eirp
  is 'EIRP值';
comment on column  RSBT_FREQ_T.ft_freq_pow_max
  is '峰值功率';
comment on column  RSBT_FREQ_T.ft_freq_pow_avg
  is '平均功率';
alter table  RSBT_FREQ_T
  add constraint PK_RSBT_FREQ_T primary key (GUID)
  using index 
  tablespace "3100_STATDB"
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  RSBT_FREQ_T
  add constraint FK_RSBT_FRE_REFERENCE_RSBT_FRE foreign key (GUID)
  references  RSBT_FREQ (GUID)
  novalidate;

prompt
prompt Creating table RSBT_LICENSE
prompt ===========================
prompt
create table  RSBT_LICENSE
(
  guid             VARCHAR2(36) not null,
  station_guid     VARCHAR2(36),
  app_code         VARCHAR2(14) not null,
  stat_tdi         VARCHAR2(4) not null,
  stat_app_type    VARCHAR2(8) not null,
  license_type     VARCHAR2(8) not null,
  license_code     VARCHAR2(20),
  license_org_name VARCHAR2(60),
  license_manager  VARCHAR2(60),
  license_date_b   DATE,
  license_date_e   DATE,
  license_date     DATE,
  memo             VARCHAR2(512)
)
tablespace "3100_STATDB"
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table  RSBT_LICENSE
  is '台(站)执照表';
comment on column  RSBT_LICENSE.guid
  is '主键';
comment on column  RSBT_LICENSE.station_guid
  is '台站GUID';
comment on column  RSBT_LICENSE.app_code
  is '申请表编号';
comment on column  RSBT_LICENSE.stat_tdi
  is '技术资料申报表编号';
comment on column  RSBT_LICENSE.stat_app_type
  is '技术资料申报表类型';
comment on column  RSBT_LICENSE.license_type
  is '执照类型';
comment on column  RSBT_LICENSE.license_code
  is '执照号';
comment on column  RSBT_LICENSE.license_org_name
  is '执照单位名称';
comment on column  RSBT_LICENSE.license_manager
  is '核发单位名称';
comment on column  RSBT_LICENSE.license_date_b
  is '执照有效期起';
comment on column  RSBT_LICENSE.license_date_e
  is '执照有效期止';
comment on column  RSBT_LICENSE.license_date
  is '发证时间';
comment on column  RSBT_LICENSE.memo
  is '备注';
alter table  RSBT_LICENSE
  add constraint PK_RSBT_LICENSE primary key (GUID)
  using index 
  tablespace "3100_STATDB"
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table RSBT_LINK
prompt ========================
prompt
create table  RSBT_LINK
(
  guid           VARCHAR2(36) not null,
  net_guid_a     VARCHAR2(36),
  station_guid_a VARCHAR2(36),
  guid_eaf_a     VARCHAR2(36),
  net_guid_b     VARCHAR2(36),
  station_guid_b VARCHAR2(36),
  guid_eaf_b     VARCHAR2(36)
)
tablespace "3100_STATDB"
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  RSBT_LINK
  is '无线电台(站)链路表';
comment on column  RSBT_LINK.guid
  is '主键
主键
主键';
comment on column  RSBT_LINK.net_guid_a
  is 'RSBT_ NET
RSBT_ NET
RSBT_NET';
comment on column  RSBT_LINK.station_guid_a
  is '台站AGUID';
comment on column  RSBT_LINK.guid_eaf_a
  is '设备频率与天馈线索引 GUID';
comment on column  RSBT_LINK.net_guid_b
  is 'RSBT_ NET';
comment on column  RSBT_LINK.station_guid_b
  is '台站BGUID';
comment on column  RSBT_LINK.guid_eaf_b
  is '设备频率与天馈线索引 GUID';
alter table  RSBT_LINK
  add constraint PK_RSBT_LINK primary key (GUID)
  using index 
  tablespace "3100_STATDB"
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table RSBT_STATIONSUPERVISIONRECORD
prompt ============================================
prompt
create table  RSBT_STATIONSUPERVISIONRECORD
(
  guid                       VARCHAR2(36) not null,
  station_guid               VARCHAR2(36),
  station_illegal_time       DATE not null,
  station_illegal_mode       VARCHAR2(8),
  station_supervision_status VARCHAR2(8),
  station_illegal_date       NUMBER(12,5),
  station_illegal_date_u     VARCHAR2(8),
  station_illegal_lg         NUMBER(10,7),
  station_illegal_la         NUMBER(10,7),
  station_illegal_equmode    VARCHAR2(40),
  station_punish_time        DATE not null,
  station_punish_result      VARCHAR2(80),
  memo                       VARCHAR2(512)
)
tablespace "3100_STATDB"
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  RSBT_STATIONSUPERVISIONRECORD
  is '无线电台站监管记录表';
comment on column  RSBT_STATIONSUPERVISIONRECORD.guid
  is '主键';
comment on column  RSBT_STATIONSUPERVISIONRECORD.station_guid
  is 'RSBT_ STATION';
comment on column  RSBT_STATIONSUPERVISIONRECORD.station_illegal_time
  is '台站违规及受干扰时间';
comment on column  RSBT_STATIONSUPERVISIONRECORD.station_illegal_mode
  is '台站违规及受干扰类别';
comment on column  RSBT_STATIONSUPERVISIONRECORD.station_supervision_status
  is '台站监管状态';
comment on column  RSBT_STATIONSUPERVISIONRECORD.station_illegal_date
  is '台站违规参数';
comment on column  RSBT_STATIONSUPERVISIONRECORD.station_illegal_date_u
  is '违规参数单位';
comment on column  RSBT_STATIONSUPERVISIONRECORD.station_illegal_lg
  is '违规台站经度';
comment on column  RSBT_STATIONSUPERVISIONRECORD.station_illegal_la
  is '违规台站纬度';
comment on column  RSBT_STATIONSUPERVISIONRECORD.station_illegal_equmode
  is '违规设备型号';
comment on column  RSBT_STATIONSUPERVISIONRECORD.station_punish_time
  is '违规查处时间';
comment on column  RSBT_STATIONSUPERVISIONRECORD.station_punish_result
  is '违规查处结果';
comment on column  RSBT_STATIONSUPERVISIONRECORD.memo
  is '备注';
alter table  RSBT_STATIONSUPERVISIONRECORD
  add constraint PK_RSBT_STATIONSUPERVISIONRECO primary key (GUID)
  using index 
  tablespace "3100_STATDB"
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  RSBT_STATIONSUPERVISIONRECORD
  add constraint FK_RSBT_STA_REFERENCE_RSBT_STA foreign key (STATION_GUID)
  references  RSBT_STATION (GUID);

prompt
prompt Creating table RSBT_STATION_MONITOR
prompt ===================================
prompt
create table  RSBT_STATION_MONITOR
(
  guid         VARCHAR2(36) not null,
  station_guid VARCHAR2(36),
  monitor_guid VARCHAR2(36)
)
tablespace "3100_STATDB"
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  RSBT_STATION_MONITOR
  is '无线电台站监管与监测站关联表';
comment on column  RSBT_STATION_MONITOR.guid
  is '主键';
comment on column  RSBT_STATION_MONITOR.station_guid
  is 'RSBT_ STATION';
comment on column  RSBT_STATION_MONITOR.monitor_guid
  is 'RSBT_MONITOR';
alter table  RSBT_STATION_MONITOR
  add constraint PK_RSBT_STATION_MONITOR primary key (GUID)
  using index 
  tablespace "3100_STATDB"
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  RSBT_STATION_MONITOR
  add constraint FK_RSBT_STA_REF3_RSBT_STA foreign key (STATION_GUID)
  references  RSBT_STATION (GUID);

prompt
prompt Creating table RSBT_STATION_T
prompt =============================
prompt
create table  RSBT_STATION_T
(
  guid              VARCHAR2(36) not null,
  st_time_b         DATE,
  st_time_e         DATE,
  st_lmmtr          VARCHAR2(1),
  st_user_area      VARCHAR2(80),
  st_tf_code        VARCHAR2(40),
  st_tf_trans_ca_pu VARCHAR2(8),
  st_tf_trans_ca_p  NUMBER(14,7),
  st_e_net_code     VARCHAR2(20),
  st_e_multi_addr   VARCHAR2(8),
  st_e_com_area     VARCHAR2(8),
  st_pos_type       VARCHAR2(8),
  st_e_pos          VARCHAR2(40),
  st_e_sat          VARCHAR2(40),
  st_e_lg           VARCHAR2(20),
  st_b_sgn          VARCHAR2(40),
  st_b_level        VARCHAR2(8),
  st_b_bm           VARCHAR2(8),
  st_b_edu          VARCHAR2(1),
  st_b_ic           VARCHAR2(1),
  st_b_cover_area   VARCHAR2(40),
  st_ship_type      VARCHAR2(8),
  st_call_sign      VARCHAR2(20),
  st_s_mmsi         VARCHAR2(20),
  st_s_cs           VARCHAR2(20),
  st_ship_name      VARCHAR2(80),
  st_s_pn           VARCHAR2(80),
  st_s_aaic         VARCHAR2(20),
  st_s_t            NUMBER(10,2),
  st_s_p            NUMBER(10,2),
  st_a_model        VARCHAR2(40),
  st_a_type         VARCHAR2(8),
  st_a_call         VARCHAR2(1),
  st_a_call_oi      VARCHAR2(20),
  st_a_sgn          VARCHAR2(20),
  st_a_st           NUMBER(10,2),
  st_a_piloting     VARCHAR2(1),
  st_a_nrm          VARCHAR2(40),
  st_r_wamin        VARCHAR2(20),
  st_r_wamax        VARCHAR2(20),
  st_r_emin         VARCHAR2(20),
  st_r_emax         VARCHAR2(20),
  st_c_code         VARCHAR2(40),
  st_c_sum          NUMBER(3),
  st_serv_r         NUMBER(10,3),
  st_d_tec_type     VARCHAR2(20),
  st_d_type         VARCHAR2(1),
  st_me_sat_name    VARCHAR2(80),
  st_me_sta1        VARCHAR2(80),
  st_me_sta2        VARCHAR2(80),
  st_me_sta3        VARCHAR2(80),
  st_me_stype       VARCHAR2(1),
  st_me_name1       VARCHAR2(80),
  st_me_name2       VARCHAR2(80),
  st_me_lg1         NUMBER(10,7),
  st_me_lg2         NUMBER(10,7),
  st_me_fband       NUMBER(14,7),
  st_b_type1        VARCHAR2(8),
  st_b_type2        VARCHAR2(8)
)
tablespace "3100_STATDB"
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table  RSBT_STATION_T
  is '无线电台（站）台站冗余表';
comment on column  RSBT_STATION_T.guid
  is 'RSBT_ STATION';
comment on column  RSBT_STATION_T.st_time_b
  is '工作时间起';
comment on column  RSBT_STATION_T.st_time_e
  is '工作时间止';
comment on column  RSBT_STATION_T.st_lmmtr
  is '是否机车制式电台';
comment on column  RSBT_STATION_T.st_user_area
  is '使用区域';
comment on column  RSBT_STATION_T.st_tf_code
  is '站代号';
comment on column  RSBT_STATION_T.st_tf_trans_ca_pu
  is '传输容量单位';
comment on column  RSBT_STATION_T.st_tf_trans_ca_p
  is '传输容量值';
comment on column  RSBT_STATION_T.st_e_net_code
  is '网络编号';
comment on column  RSBT_STATION_T.st_e_multi_addr
  is '多址方式';
comment on column  RSBT_STATION_T.st_e_com_area
  is '通信范围';
comment on column  RSBT_STATION_T.st_pos_type
  is '位置类型';
comment on column  RSBT_STATION_T.st_e_pos
  is '位置类型（值）';
comment on column  RSBT_STATION_T.st_e_sat
  is '空间电台（星座）名称';
comment on column  RSBT_STATION_T.st_e_lg
  is '标称轨道经度';
comment on column  RSBT_STATION_T.st_b_sgn
  is '台标';
comment on column  RSBT_STATION_T.st_b_level
  is '台站级别';
comment on column  RSBT_STATION_T.st_b_bm
  is '广播制式';
comment on column  RSBT_STATION_T.st_b_edu
  is '是否教育台';
comment on column  RSBT_STATION_T.st_b_ic
  is '是否差转台';
comment on column  RSBT_STATION_T.st_b_cover_area
  is '覆盖区域';
comment on column  RSBT_STATION_T.st_ship_type
  is '船舶种类';
comment on column  RSBT_STATION_T.st_call_sign
  is '呼号';
comment on column  RSBT_STATION_T.st_s_mmsi
  is 'MMSI号';
comment on column  RSBT_STATION_T.st_s_cs
  is '船舶登记号';
comment on column  RSBT_STATION_T.st_ship_name
  is '船舶名称';
comment on column  RSBT_STATION_T.st_s_pn
  is '船籍港名';
comment on column  RSBT_STATION_T.st_s_aaic
  is '帐务结算机构代码';
comment on column  RSBT_STATION_T.st_s_t
  is '总吨位';
comment on column  RSBT_STATION_T.st_s_p
  is '总功率';
comment on column  RSBT_STATION_T.st_a_model
  is '航空器型号';
comment on column  RSBT_STATION_T.st_a_type
  is '航空器类型';
comment on column  RSBT_STATION_T.st_a_call
  is '选呼或报呼';
comment on column  RSBT_STATION_T.st_a_call_oi
  is '呼号或其它标识';
comment on column  RSBT_STATION_T.st_a_sgn
  is '航空器识别码';
comment on column  RSBT_STATION_T.st_a_st
  is '最大起飞重量';
comment on column  RSBT_STATION_T.st_a_piloting
  is '是否按地标飞行';
comment on column  RSBT_STATION_T.st_a_nrm
  is '国籍和注册号码';
comment on column  RSBT_STATION_T.st_r_wamin
  is '工作方位角最小值';
comment on column  RSBT_STATION_T.st_r_wamax
  is '工作方位角最大值';
comment on column  RSBT_STATION_T.st_r_emin
  is '俯仰角最小值';
comment on column  RSBT_STATION_T.st_r_emax
  is '俯仰角最大值';
comment on column  RSBT_STATION_T.st_c_code
  is '基站编号(唯一）';
comment on column  RSBT_STATION_T.st_c_sum
  is '扇区数量';
comment on column  RSBT_STATION_T.st_serv_r
  is '服务半径';
comment on column  RSBT_STATION_T.st_d_tec_type
  is '技术体制';
comment on column  RSBT_STATION_T.st_d_type
  is '直放站类型';
comment on column  RSBT_STATION_T.st_me_sat_name
  is '卫星移动通信系统名称';
comment on column  RSBT_STATION_T.st_me_sta1
  is '关口站名称1';
comment on column  RSBT_STATION_T.st_me_sta2
  is '关口站名称2';
comment on column  RSBT_STATION_T.st_me_sta3
  is '关口站名称3  ';
comment on column  RSBT_STATION_T.st_me_stype
  is '星座/卫星';
comment on column  RSBT_STATION_T.st_me_name1
  is '空间电台(星座)名称1';
comment on column  RSBT_STATION_T.st_me_name2
  is '空间电台(星座)名称2';
comment on column  RSBT_STATION_T.st_me_lg1
  is '标称轨道经度1';
comment on column  RSBT_STATION_T.st_me_lg2
  is '标称轨道经度2 ';
comment on column  RSBT_STATION_T.st_me_fband
  is '使用总带宽';
comment on column  RSBT_STATION_T.st_b_type1
  is '广播电台台站类别1';
comment on column  RSBT_STATION_T.st_b_type2
  is '广播电台台站类别2';
alter table  RSBT_STATION_T
  add constraint PK_RSBT_STATION_T primary key (GUID)
  using index 
  tablespace "3100_STATDB"
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  RSBT_STATION_T
  add constraint FK_RSBT_STA_REF2_RSBT_STA foreign key (GUID)
  references  RSBT_STATION (GUID);

prompt
prompt Creating table RSBT_ST_COBJ
prompt ===========================
prompt
create table  RSBT_ST_COBJ
(
  guid         VARCHAR2(36) not null,
  station_guid VARCHAR2(36),
  obj_type     VARCHAR2(1) not null,
  obj_name     VARCHAR2(80) not null,
  obj_tdi      VARCHAR2(20)
)
tablespace "3100_STATDB"
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table  RSBT_ST_COBJ
  is '通信对象的申报表号（表H用）';
comment on column  RSBT_ST_COBJ.guid
  is '主键';
comment on column  RSBT_ST_COBJ.station_guid
  is '外键RSBT_STATION';
comment on column  RSBT_ST_COBJ.obj_type
  is '通信对象类型';
comment on column  RSBT_ST_COBJ.obj_name
  is '申请表号或名称';
comment on column  RSBT_ST_COBJ.obj_tdi
  is '技术资料表号';
alter table  RSBT_ST_COBJ
  add constraint PK_RSBT_ST_COBJ primary key (GUID)
  using index 
  tablespace "3100_STATDB"
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table  RSBT_ST_COBJ
  add constraint FK_RSBT_ST__REFERENCE_RSBT_STA foreign key (STATION_GUID)
  references  RSBT_STATION (GUID);

prompt
prompt Creating table WF_ACCSHEET
prompt ==========================
prompt
create table  WF_ACCSHEET
(
  guid        VARCHAR2(36) not null,
  acc_id      VARCHAR2(16),
  acc_date    DATE,
  dept_guid   VARCHAR2(36),
  acc_type    VARCHAR2(2),
  acc_file    VARCHAR2(1000),
  acc_opinion VARCHAR2(1000),
  memo        VARCHAR2(1000)
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column  WF_ACCSHEET.guid
  is '编号';
comment on column  WF_ACCSHEET.acc_id
  is '受理号';
comment on column  WF_ACCSHEET.acc_date
  is '受理时间';
comment on column  WF_ACCSHEET.dept_guid
  is '申请单位GUID';
comment on column  WF_ACCSHEET.acc_type
  is '业务类型';
comment on column  WF_ACCSHEET.acc_file
  is '材料提交';
comment on column  WF_ACCSHEET.acc_opinion
  is '受理意见    ';
comment on column  WF_ACCSHEET.memo
  is '备注';
alter table  WF_ACCSHEET
  add constraint PK_WF_ACCSHEET primary key (GUID)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table WF_CALLSIGN_SHIP
prompt ===============================
prompt
create table  WF_CALLSIGN_SHIP
(
  guid      VARCHAR2(36) not null,
  acc_id    VARCHAR2(16),
  app_date  DATE,
  dept_guid VARCHAR2(36),
  ship_name VARCHAR2(80),
  ship_port VARCHAR2(80),
  ship_type VARCHAR2(8),
  power     VARCHAR2(80),
  memo      VARCHAR2(1000)
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column  WF_CALLSIGN_SHIP.guid
  is '编号';
comment on column  WF_CALLSIGN_SHIP.acc_id
  is '受理号';
comment on column  WF_CALLSIGN_SHIP.app_date
  is '申请时间';
comment on column  WF_CALLSIGN_SHIP.dept_guid
  is '申请单位GUID';
comment on column  WF_CALLSIGN_SHIP.ship_name
  is '船舶名称';
comment on column  WF_CALLSIGN_SHIP.ship_port
  is '船籍港';
comment on column  WF_CALLSIGN_SHIP.ship_type
  is '船舶类型';
comment on column  WF_CALLSIGN_SHIP.power
  is '吨位/马力';
comment on column  WF_CALLSIGN_SHIP.memo
  is '备注';
alter table  WF_CALLSIGN_SHIP
  add constraint PK_WF_CALLSIGN_SHIP primary key (GUID)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table WF_UNIT
prompt ======================
prompt
create table  WF_UNIT
(
  guid          VARCHAR2(36) not null,
  unit_name     VARCHAR2(100),
  unit_code     VARCHAR2(9),
  unit_addr     VARCHAR2(36),
  unit_telphone VARCHAR2(40),
  unit_mail     VARCHAR2(50),
  unit_attn     VARCHAR2(36),
  unit_phonr    VARCHAR2(40),
  unit_zip      VARCHAR2(6),
  unit_fax      VARCHAR2(40)
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column  WF_UNIT.guid
  is '编号';
comment on column  WF_UNIT.unit_name
  is '名称';
comment on column  WF_UNIT.unit_code
  is '组织机构代码';
comment on column  WF_UNIT.unit_addr
  is '地址';
comment on column  WF_UNIT.unit_telphone
  is '联系电话';
comment on column  WF_UNIT.unit_mail
  is '邮箱';
comment on column  WF_UNIT.unit_attn
  is '联系人';
comment on column  WF_UNIT.unit_phonr
  is '手机号';
comment on column  WF_UNIT.unit_zip
  is '邮政编号';
comment on column  WF_UNIT.unit_fax
  is '传真号';
alter table  WF_UNIT
  add constraint PK_WF_UNIT primary key (GUID)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table WF_USER
prompt ======================
prompt
create table  WF_USER
(
  user_id    VARCHAR2(36) not null,
  user_name  VARCHAR2(50),
  user_mail  VARCHAR2(50),
  user_phone VARCHAR2(40),
  user_addr  VARCHAR2(100),
  user_code  VARCHAR2(20)
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  WF_USER
  is '人员信息表';
comment on column  WF_USER.user_id
  is '人员ID';
comment on column  WF_USER.user_name
  is '姓名';
comment on column  WF_USER.user_mail
  is '电子邮箱';
comment on column  WF_USER.user_phone
  is '联系电话';
comment on column  WF_USER.user_addr
  is '地址';
comment on column  WF_USER.user_code
  is '身份证号';
alter table  WF_USER
  add constraint PK_WF_USER primary key (USER_ID)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table WF_CREDIT
prompt ========================
prompt
create table  WF_CREDIT
(
  guid             VARCHAR2(36) not null,
  cred_obj_type    VARCHAR2(1) not null,
  cred_info_type   VARCHAR2(1),
  cred_obj_id1     VARCHAR2(36),
  cred_obj_id2     VARCHAR2(36),
  cred_pun_content VARCHAR2(2000),
  cred_pun_id      VARCHAR2(128),
  cred_matter_type VARCHAR2(10),
  cred_facts       VARCHAR2(2000),
  cred_date        DATE,
  cred_measures    VARCHAR2(400),
  cred_gist        VARCHAR2(400),
  cred_update_time DATE,
  cred_effective   VARCHAR2(1),
  cred_pun_org     VARCHAR2(100)
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  WF_CREDIT
  is '用户信用信息表';
comment on column  WF_CREDIT.guid
  is '唯一标识';
comment on column  WF_CREDIT.cred_obj_type
  is '相对人    0  法人   1    自然人';
comment on column  WF_CREDIT.cred_info_type
  is '信息事项 0擅设电台 1违反研制、生产、进口无线电发射设备  2干扰无线电  3 随意变更信号  4 不遵守频率管理  5 违反使用无线电台执照   6 违法销售设备 ';
comment on column  WF_CREDIT.cred_obj_id1
  is '处罚对象ID（自然人）';
comment on column  WF_CREDIT.cred_obj_id2
  is '处罚对象ID（法人）';
comment on column  WF_CREDIT.cred_pun_content
  is '处罚内容（法定代表人身份证号码）  格式为：“法定代表人身份证号码：XXXX';
comment on column  WF_CREDIT.cred_pun_id
  is '处罚文号';
comment on column  WF_CREDIT.cred_matter_type
  is '事项类型（处罚种类） 字典';
comment on column  WF_CREDIT.cred_facts
  is '违法事实（处罚事由）';
comment on column  WF_CREDIT.cred_date
  is '处罚决定日期（处罚日期）';
comment on column  WF_CREDIT.cred_measures
  is '处罚措施（处罚内容）';
comment on column  WF_CREDIT.cred_gist
  is '处罚依据';
comment on column  WF_CREDIT.cred_update_time
  is '业务更新时间';
comment on column  WF_CREDIT.cred_effective
  is '有效性  0无效  1 有效';
comment on column  WF_CREDIT.cred_pun_org
  is '处罚机关';
alter table  WF_CREDIT
  add constraint PK_WF_CREDIT primary key (GUID)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  WF_CREDIT
  add constraint FK_WF_CREDI_REFERENCE_WF_UNIT foreign key (CRED_OBJ_ID2)
  references  WF_UNIT (GUID);
alter table  WF_CREDIT
  add constraint FK_WF_CREDI_REFERENCE_WF_USER foreign key (CRED_OBJ_ID1)
  references  WF_USER (USER_ID);

prompt
prompt Creating table WF_DETECTION
prompt ===========================
prompt
create table  WF_DETECTION
(
  guid           VARCHAR2(36) not null,
  det_name       VARCHAR2(128),
  det_type       VARCHAR2(1),
  det_depart     VARCHAR2(1),
  det_compl_date DATE,
  det_compl_time VARCHAR2(2),
  det_attn       VARCHAR2(50),
  det_leader     VARCHAR2(50),
  det_content    VARCHAR2(1000),
  det_request    VARCHAR2(1000),
  det_result     VARCHAR2(1000),
  det_handler    VARCHAR2(50),
  det_status     VARCHAR2(2),
  det_memo       VARCHAR2(1000)
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  WF_DETECTION
  is '检测任务表';
comment on column  WF_DETECTION.guid
  is '唯一标识';
comment on column  WF_DETECTION.det_name
  is '任务名称';
comment on column  WF_DETECTION.det_type
  is '任务性质代码  0 常规  1专项  2特殊  3 其他';
comment on column  WF_DETECTION.det_depart
  is '下达任务部门代码     ';
comment on column  WF_DETECTION.det_compl_date
  is '完成日期';
comment on column  WF_DETECTION.det_compl_time
  is '完成日期当天的时间';
comment on column  WF_DETECTION.det_attn
  is '联系人';
comment on column  WF_DETECTION.det_leader
  is '部门领导';
comment on column  WF_DETECTION.det_content
  is '内容描述';
comment on column  WF_DETECTION.det_request
  is '具体要求';
comment on column  WF_DETECTION.det_result
  is '任务结果';
comment on column  WF_DETECTION.det_handler
  is '执行人员';
comment on column  WF_DETECTION.det_status
  is '处理状态   0未处理   1未审核  2  完成';
comment on column  WF_DETECTION.det_memo
  is '备注';
alter table  WF_DETECTION
  add constraint PK_WF_DETECTION primary key (GUID)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table WF_DETECTION_ATTECH
prompt ==================================
prompt
create table  WF_DETECTION_ATTECH
(
  file_id        VARCHAR2(36) not null,
  detection_guid VARCHAR2(36),
  filename       VARCHAR2(200),
  content        BLOB
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  WF_DETECTION_ATTECH
  is '干扰投诉受理与附件表';
comment on column  WF_DETECTION_ATTECH.file_id
  is '文件ID';
comment on column  WF_DETECTION_ATTECH.detection_guid
  is '检测任务ID';
comment on column  WF_DETECTION_ATTECH.filename
  is '附件名名称';
comment on column  WF_DETECTION_ATTECH.content
  is '附件内容';
alter table  WF_DETECTION_ATTECH
  add constraint PK_WF_DETECTION_ATTECH primary key (FILE_ID)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  WF_DETECTION_ATTECH
  add constraint FK_WF_DETEC_REFERENCE_WF_DETEC foreign key (DETECTION_GUID)
  references  WF_DETECTION (GUID);

prompt
prompt Creating table WF_INVESTIGATE
prompt =============================
prompt
create table  WF_INVESTIGATE
(
  guid              VARCHAR2(36) not null,
  inv_handle_date   DATE,
  inv_case_type     VARCHAR2(1),
  inv_source_type   VARCHAR2(1),
  inv_case_name     VARCHAR2(128),
  inv_complete_date DATE,
  inv_handler       VARCHAR2(50),
  inv_content       VARCHAR2(1000),
  inv_result        VARCHAR2(1000),
  unit_guid         VARCHAR2(36),
  inv_system_code   VARCHAR2(36),
  inv_status_type   VARCHAR2(1)
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  WF_INVESTIGATE
  is '查处执法任务表';
comment on column  WF_INVESTIGATE.guid
  is '查处执法任务编号';
comment on column  WF_INVESTIGATE.inv_handle_date
  is '处理日期';
comment on column  WF_INVESTIGATE.inv_case_type
  is '事件类型代码    ';
comment on column  WF_INVESTIGATE.inv_source_type
  is '事件来源代码 ';
comment on column  WF_INVESTIGATE.inv_case_name
  is '事件名称';
comment on column  WF_INVESTIGATE.inv_complete_date
  is '完成日期';
comment on column  WF_INVESTIGATE.inv_handler
  is '处理者';
comment on column  WF_INVESTIGATE.inv_content
  is '任务内容';
comment on column  WF_INVESTIGATE.inv_result
  is '执法结果';
comment on column  WF_INVESTIGATE.unit_guid
  is '单位ID';
comment on column  WF_INVESTIGATE.inv_system_code
  is '系统代码';
comment on column  WF_INVESTIGATE.inv_status_type
  is '处理状态   0  未接收   1未处理  2 调查环节 3立案环节 4领导审批事先告知数书  5陈述申辩  6 审批处罚决定书 7结案环节 8处理完成';
alter table  WF_INVESTIGATE
  add constraint PK_WF_INVESTIGATE primary key (GUID)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table WF_MONIT
prompt =======================
prompt
create table  WF_MONIT
(
  guid                VARCHAR2(36) not null,
  monit_name          VARCHAR2(128),
  monit_type          VARCHAR2(1),
  monit_department    VARCHAR2(1),
  monit_complete_date DATE,
  monit_complete_time VARCHAR2(2),
  monit_attn          VARCHAR2(50),
  monit_leader        VARCHAR2(50),
  monit_content       VARCHAR2(1000),
  monit_request       VARCHAR2(1000),
  monit_result        VARCHAR2(1000),
  monit_memo          VARCHAR2(1000),
  monit_handler       VARCHAR2(50)
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  WF_MONIT
  is '监测任务表';
comment on column  WF_MONIT.guid
  is '监测任务ID';
comment on column  WF_MONIT.monit_name
  is '任务名称';
comment on column  WF_MONIT.monit_type
  is '任务性质代码  0 常规  1专项  2特殊  3 其他';
comment on column  WF_MONIT.monit_department
  is '下达任务部门代码';
comment on column  WF_MONIT.monit_complete_date
  is '完成日期';
comment on column  WF_MONIT.monit_complete_time
  is '完成日期当天的时间';
comment on column  WF_MONIT.monit_attn
  is '联系人';
comment on column  WF_MONIT.monit_leader
  is '部门领导';
comment on column  WF_MONIT.monit_content
  is '内容描述';
comment on column  WF_MONIT.monit_request
  is '具体要求';
comment on column  WF_MONIT.monit_result
  is '任务结果';
comment on column  WF_MONIT.monit_memo
  is '备注';
comment on column  WF_MONIT.monit_handler
  is '执行人员';
alter table  WF_MONIT
  add constraint PK_WF_MONIT primary key (GUID)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table WF_DISTURB
prompt =========================
prompt
create table  WF_DISTURB
(
  guid                VARCHAR2(36) not null,
  unit_guid           VARCHAR2(36),
  dist_stat_addr      VARCHAR2(100),
  dist_ant_height     VARCHAR2(20),
  dist_ant_model      VARCHAR2(128),
  dist_equ            VARCHAR2(500),
  dist_license_id     VARCHAR2(36),
  dist_fm_model       VARCHAR2(128),
  dist_license_date   DATE,
  dist_freq           VARCHAR2(128),
  dist_aspect         VARCHAR2(128),
  dist_date           DATE,
  dist_time           VARCHAR2(1),
  dist_level          VARCHAR2(128),
  dist_summary        VARCHAR2(1000),
  dist_state_date     DATE,
  dist_accep_opinion  VARCHAR2(1000),
  dist_leader_opinion VARCHAR2(500),
  monit_guid          VARCHAR2(36),
  investigate_guid    VARCHAR2(36)
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  WF_DISTURB
  is '干扰投诉受理登记表';
comment on column  WF_DISTURB.guid
  is '唯一标识';
comment on column  WF_DISTURB.unit_guid
  is '单位ID';
comment on column  WF_DISTURB.dist_stat_addr
  is '设台地址';
comment on column  WF_DISTURB.dist_ant_height
  is '天线高度';
comment on column  WF_DISTURB.dist_ant_model
  is '天线方式';
comment on column  WF_DISTURB.dist_equ
  is '使用设备';
comment on column  WF_DISTURB.dist_license_id
  is '电台执照编号';
comment on column  WF_DISTURB.dist_fm_model
  is '调制方式';
comment on column  WF_DISTURB.dist_license_date
  is '验照年度';
comment on column  WF_DISTURB.dist_freq
  is '受干扰频率';
comment on column  WF_DISTURB.dist_aspect
  is '干扰制式';
comment on column  WF_DISTURB.dist_date
  is '受干扰日期';
comment on column  WF_DISTURB.dist_time
  is '受干扰时间';
comment on column  WF_DISTURB.dist_level
  is '干扰影响程度';
comment on column  WF_DISTURB.dist_summary
  is '申述内容摘要';
comment on column  WF_DISTURB.dist_state_date
  is '申述日期';
comment on column  WF_DISTURB.dist_accep_opinion
  is '受理人员意见';
comment on column  WF_DISTURB.dist_leader_opinion
  is '分管领导意见';
comment on column  WF_DISTURB.monit_guid
  is '监测任务单ID';
comment on column  WF_DISTURB.investigate_guid
  is '查处执法任务ID';
alter table  WF_DISTURB
  add constraint PK_WF_DISTURB primary key (GUID)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  WF_DISTURB
  add constraint FK_WF_DISTU_REFERENCE_WF_INVES foreign key (INVESTIGATE_GUID)
  references  WF_INVESTIGATE (GUID);
alter table  WF_DISTURB
  add constraint FK_WF_DISTU_REFERENCE_WF_MONIT foreign key (MONIT_GUID)
  references  WF_MONIT (GUID);
alter table  WF_DISTURB
  add constraint FK_WF_DISTU_REFERENCE_WF_UNIT foreign key (UNIT_GUID)
  references  WF_UNIT (GUID);

prompt
prompt Creating table WF_DISTURB_ATTECH
prompt ================================
prompt
create table  WF_DISTURB_ATTECH
(
  file_id      VARCHAR2(36) not null,
  disturb_guid VARCHAR2(36),
  filename     VARCHAR2(200),
  content      BLOB
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  WF_DISTURB_ATTECH
  is '干扰投诉受理与附件表';
comment on column  WF_DISTURB_ATTECH.file_id
  is '文件ID';
comment on column  WF_DISTURB_ATTECH.disturb_guid
  is '干扰受理登记变表';
comment on column  WF_DISTURB_ATTECH.filename
  is '附件名名称';
comment on column  WF_DISTURB_ATTECH.content
  is '附件内容';
alter table  WF_DISTURB_ATTECH
  add constraint PK_WF_DISTURB_ATTECH primary key (FILE_ID)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  WF_DISTURB_ATTECH
  add constraint FK_WF_DISTU_REFERENCE_WF_DISTU foreign key (DISTURB_GUID)
  references  WF_DISTURB (GUID);

prompt
prompt Creating table WF_GRANT_PERMIT
prompt ==============================
prompt
create table  WF_GRANT_PERMIT
(
  guid         VARCHAR2(36) not null,
  acc_id       VARCHAR2(16),
  per_no       VARCHAR2(16),
  sign_date    DATE,
  acc_type     VARCHAR2(2),
  region_use   VARCHAR2(100),
  acc_opinion  VARCHAR2(40),
  epmax_indoor VARCHAR2(40),
  epmax_hand   VARCHAR2(40),
  callsign     VARCHAR2(10),
  exp_life     VARCHAR2(20),
  exp_deadline DATE
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column  WF_GRANT_PERMIT.guid
  is '编号';
comment on column  WF_GRANT_PERMIT.acc_id
  is '受理号';
comment on column  WF_GRANT_PERMIT.per_no
  is '决定书编号';
comment on column  WF_GRANT_PERMIT.sign_date
  is '签发时间';
comment on column  WF_GRANT_PERMIT.acc_type
  is '频率用途';
comment on column  WF_GRANT_PERMIT.region_use
  is '使用区域';
comment on column  WF_GRANT_PERMIT.acc_opinion
  is '发射功率';
comment on column  WF_GRANT_PERMIT.epmax_indoor
  is '室内天线最大输出功率';
comment on column  WF_GRANT_PERMIT.epmax_hand
  is '手持台最大发射功率';
comment on column  WF_GRANT_PERMIT.callsign
  is '电台呼号';
comment on column  WF_GRANT_PERMIT.exp_life
  is '有效期';
comment on column  WF_GRANT_PERMIT.exp_deadline
  is '有效期截止时间';
alter table  WF_GRANT_PERMIT
  add constraint PK_WF_GRANT_PERMIT primary key (GUID)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table WF_IMPORT
prompt ========================
prompt
create table  WF_IMPORT
(
  guid       VARCHAR2(36) not null,
  acc_id     VARCHAR2(16),
  app_date   DATE,
  dept_guid  VARCHAR2(36),
  arr_date   DATE,
  cust_date  DATE,
  isall      VARCHAR2(8),
  contractno VARCHAR2(80),
  sign_chn   VARCHAR2(120),
  cust_arr   VARCHAR2(40),
  sign_out   VARCHAR2(80),
  deli_coun  VARCHAR2(40),
  tmp_in     VARCHAR2(80),
  use_inchn  VARCHAR2(2),
  tech_state VARCHAR2(8),
  purpose    VARCHAR2(80),
  memo       VARCHAR2(1000)
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column  WF_IMPORT.guid
  is '编号';
comment on column  WF_IMPORT.acc_id
  is '受理号';
comment on column  WF_IMPORT.app_date
  is '申请时间';
comment on column  WF_IMPORT.dept_guid
  is '申请单位GUID';
comment on column  WF_IMPORT.arr_date
  is '到货时间';
comment on column  WF_IMPORT.cust_date
  is '出关时间';
comment on column  WF_IMPORT.isall
  is '是否分批到货';
comment on column  WF_IMPORT.contractno
  is '合同号';
comment on column  WF_IMPORT.sign_chn
  is '中方签合同单位';
comment on column  WF_IMPORT.cust_arr
  is '到货海关';
comment on column  WF_IMPORT.sign_out
  is '外方签合同单位';
comment on column  WF_IMPORT.deli_coun
  is '发货国家';
comment on column  WF_IMPORT.tmp_in
  is '是否临时进关';
comment on column  WF_IMPORT.use_inchn
  is '是否在中国境内使用';
comment on column  WF_IMPORT.tech_state
  is '技术状态';
comment on column  WF_IMPORT.purpose
  is '用途';
comment on column  WF_IMPORT.memo
  is '备注';
alter table  WF_IMPORT
  add constraint PK_WF_IMPORT primary key (GUID)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table WF_IMPORT_EQUIP
prompt ==============================
prompt
create table  WF_IMPORT_EQUIP
(
  guid       VARCHAR2(36) not null,
  acc_guid   VARCHAR2(16),
  manu       VARCHAR2(120),
  goods_name VARCHAR2(120),
  model      VARCHAR2(120),
  freq_range VARCHAR2(200),
  emit_pow   NUMBER,
  pow_unit   VARCHAR2(8),
  amount     NUMBER
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column  WF_IMPORT_EQUIP.guid
  is '编号';
comment on column  WF_IMPORT_EQUIP.acc_guid
  is '受理GUID';
comment on column  WF_IMPORT_EQUIP.manu
  is '生产厂商';
comment on column  WF_IMPORT_EQUIP.goods_name
  is '商品名称';
comment on column  WF_IMPORT_EQUIP.model
  is '型号';
comment on column  WF_IMPORT_EQUIP.freq_range
  is '频率范围';
comment on column  WF_IMPORT_EQUIP.emit_pow
  is '发射功率';
comment on column  WF_IMPORT_EQUIP.pow_unit
  is '单位';
comment on column  WF_IMPORT_EQUIP.amount
  is '数量';
alter table  WF_IMPORT_EQUIP
  add constraint PK_WF_IMPORT_EQUIP primary key (GUID)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table WF_INV_ATTACH
prompt ============================
prompt
create table  WF_INV_ATTACH
(
  file_id          VARCHAR2(36) not null,
  investigate_guid VARCHAR2(36),
  filename         VARCHAR2(200),
  content          BLOB
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  WF_INV_ATTACH
  is '查处执法任务与附件表';
comment on column  WF_INV_ATTACH.file_id
  is '文件ID';
comment on column  WF_INV_ATTACH.investigate_guid
  is '查处任务ID';
comment on column  WF_INV_ATTACH.filename
  is '附件名名称';
comment on column  WF_INV_ATTACH.content
  is '附件内容';
alter table  WF_INV_ATTACH
  add constraint PK_WF_INV_ATTACH primary key (FILE_ID)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  WF_INV_ATTACH
  add constraint FK_WF_INV_A_REFERENCE_WF_INVES foreign key (INVESTIGATE_GUID)
  references  WF_INVESTIGATE (GUID);

prompt
prompt Creating table WF_SUPV
prompt ======================
prompt
create table  WF_SUPV
(
  guid          VARCHAR2(36) not null,
  supv_content  VARCHAR2(1000),
  supv_opinion  VARCHAR2(1000),
  supv_carrier  VARCHAR2(50),
  supv_pro_type VARCHAR2(1),
  supv_memo     VARCHAR2(1000),
  supv_legal    VARCHAR2(1)
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  WF_SUPV
  is '监督检查任务表';
comment on column  WF_SUPV.guid
  is '投诉任务单编号';
comment on column  WF_SUPV.supv_content
  is '任务内容';
comment on column  WF_SUPV.supv_opinion
  is '调查意见';
comment on column  WF_SUPV.supv_carrier
  is '运营商名称';
comment on column  WF_SUPV.supv_pro_type
  is '处理代码    0整改（停工），1拆除（拆天线、拆基站）';
comment on column  WF_SUPV.supv_memo
  is '备注';
comment on column  WF_SUPV.supv_legal
  is '是否合法   0不合法 1合法';
alter table  WF_SUPV
  add constraint PK_WF_SUPV primary key (GUID)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table WF_LETTER
prompt ========================
prompt
create table  WF_LETTER
(
  guid                VARCHAR2(36) not null,
  let_type            VARCHAR2(1),
  let_comp_again_name VARCHAR2(50),
  let_repeat          VARCHAR2(1),
  letter_guid         VARCHAR2(36),
  let_fb_type         VARCHAR2(1),
  let_reply_type      VARCHAR2(1),
  let_opinion         VARCHAR2(1000),
  let_if_reply        VARCHAR2(1),
  supv_guid           VARCHAR2(36),
  ledger_guid         VARCHAR2(36),
  let_memo            VARCHAR2(1000)
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  WF_LETTER
  is '信访投诉登记表';
comment on column  WF_LETTER.guid
  is '编号';
comment on column  WF_LETTER.let_type
  is '投诉人为0/行政相对人为1';
comment on column  WF_LETTER.let_comp_again_name
  is '投诉对象名称/姓名';
comment on column  WF_LETTER.let_repeat
  is '是否重复投诉  0是 1否';
comment on column  WF_LETTER.letter_guid
  is '重复登记表编号';
comment on column  WF_LETTER.let_fb_type
  is '办理情况反馈代码  0 办结 1 不予受理 2 不再受理';
comment on column  WF_LETTER.let_reply_type
  is '答复方式代码 0 电话 1 书面 2 约谈';
comment on column  WF_LETTER.let_opinion
  is '最终意见';
comment on column  WF_LETTER.let_if_reply
  is '结果回复情况     0 未回复用户    1   已回复用户';
comment on column  WF_LETTER.supv_guid
  is '监督检查任务ID';
comment on column  WF_LETTER.ledger_guid
  is '信访台账编号';
comment on column  WF_LETTER.let_memo
  is '备注';
alter table  WF_LETTER
  add constraint PK_WF_LETTER primary key (GUID)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  WF_LETTER
  add constraint FK_WF_LETTE_REFERENCE_WF_SUPV foreign key (SUPV_GUID)
  references  WF_SUPV (GUID);

prompt
prompt Creating table WF_LEDGER
prompt ========================
prompt
create table  WF_LEDGER
(
  guid            VARCHAR2(36) not null,
  leg_corp_code   VARCHAR2(20),
  leg_case_type   VARCHAR2(1),
  user_guid       VARCHAR2(36),
  leg_comp_addr   VARCHAR2(100),
  leg_obj_type    VARCHAR2(1),
  leg_addr_code   VARCHAR2(1),
  leg_obj_id1     VARCHAR2(36),
  leg_obj_id2     VARCHAR2(36),
  leg_source_type VARCHAR2(1),
  leg_content     VARCHAR2(1000),
  leg_rnr_date    DATE,
  leg_comp_date   DATE,
  leg_situation   VARCHAR2(1000),
  leg_result_type VARCHAR2(1),
  leg_unit        VARCHAR2(100),
  leg_reply_date  DATE,
  leg_cor_id      VARCHAR2(36),
  leg_compl_date  DATE,
  leg_guid        VARCHAR2(36),
  leg_name1       VARCHAR2(50),
  leg_name2       VARCHAR2(50),
  leg_memo        VARCHAR2(1000)
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  WF_LEDGER
  is '信访投诉台账信息表';
comment on column  WF_LEDGER.guid
  is '编号';
comment on column  WF_LEDGER.leg_corp_code
  is '法人代表号';
comment on column  WF_LEDGER.leg_case_type
  is '案件类型代码 1：基站投诉  2：广播干扰 广播信号投诉  3：业余无线电投诉   4：其它投诉';
comment on column  WF_LEDGER.user_guid
  is '投诉人ID';
comment on column  WF_LEDGER.leg_comp_addr
  is '投诉地址';
comment on column  WF_LEDGER.leg_obj_type
  is '投诉对象类型  0  个人  1 单位';
comment on column  WF_LEDGER.leg_addr_code
  is '投诉对象所在区县代码';
comment on column  WF_LEDGER.leg_obj_id1
  is '投诉对象ID（自然人）';
comment on column  WF_LEDGER.leg_obj_id2
  is '投诉对象ID（法人）';
comment on column  WF_LEDGER.leg_source_type
  is '投诉来源代码    0来访 1信访 2电访 3网站 4局长信箱  5代表12345 6监督检查 7其他';
comment on column  WF_LEDGER.leg_content
  is '投诉内容';
comment on column  WF_LEDGER.leg_rnr_date
  is '受理响应日期';
comment on column  WF_LEDGER.leg_comp_date
  is '投诉产生日期';
comment on column  WF_LEDGER.leg_situation
  is '检查的情况描述';
comment on column  WF_LEDGER.leg_result_type
  is '检查处理结果分类   0整改（停工） 1拆除（拆天线、拆基站）2 其他';
comment on column  WF_LEDGER.leg_unit
  is '被检单位';
comment on column  WF_LEDGER.leg_reply_date
  is '回复投诉人的时间';
comment on column  WF_LEDGER.leg_cor_id
  is '责令整改编号';
comment on column  WF_LEDGER.leg_compl_date
  is '投诉处理完毕时间(投诉闭环时间)';
comment on column  WF_LEDGER.leg_guid
  is '投诉登记表编号';
comment on column  WF_LEDGER.leg_name1
  is '经办人';
comment on column  WF_LEDGER.leg_name2
  is '负责人';
comment on column  WF_LEDGER.leg_memo
  is '备注';
alter table  WF_LEDGER
  add constraint PK_WF_LEDGER primary key (GUID)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  WF_LEDGER
  add constraint FK_WF_LEDGE_REFERENCE_WF_LETTE foreign key (LEG_GUID)
  references  WF_LETTER (GUID);
alter table  WF_LEDGER
  add constraint FK_WF_LEDGE_REFERENCE_WF_UNIT foreign key (LEG_OBJ_ID2)
  references  WF_UNIT (GUID);
alter table  WF_LEDGER
  add constraint FK_WF_LEDGE_REFERENCE_WF_USER foreign key (LEG_OBJ_ID1)
  references  WF_USER (USER_ID);

prompt
prompt Creating table WF_MONIT_ATTACH
prompt ==============================
prompt
create table  WF_MONIT_ATTACH
(
  file_id    VARCHAR2(36) not null,
  monit_guid VARCHAR2(36),
  filename   VARCHAR2(200),
  content    BLOB
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  WF_MONIT_ATTACH
  is '监督检查任务与附件表';
comment on column  WF_MONIT_ATTACH.file_id
  is '文件ID';
comment on column  WF_MONIT_ATTACH.monit_guid
  is '监测任务ID';
comment on column  WF_MONIT_ATTACH.filename
  is '附件名名称';
comment on column  WF_MONIT_ATTACH.content
  is '附件内容';
alter table  WF_MONIT_ATTACH
  add constraint PK_WF_MONIT_ATTACH primary key (FILE_ID)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  WF_MONIT_ATTACH
  add constraint FK_WF_MONIT_REFERENCE_WF_MONIT foreign key (MONIT_GUID)
  references  WF_MONIT (GUID);

prompt
prompt Creating table WF_NOTGRANT_PERMIT
prompt =================================
prompt
create table  WF_NOTGRANT_PERMIT
(
  guid       VARCHAR2(36) not null,
  acc_id     VARCHAR2(16),
  per_no     VARCHAR2(16),
  sign_date  DATE,
  acc_type   VARCHAR2(200),
  region_use VARCHAR2(200),
  memo       VARCHAR2(200)
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column  WF_NOTGRANT_PERMIT.guid
  is '编号';
comment on column  WF_NOTGRANT_PERMIT.acc_id
  is '受理号';
comment on column  WF_NOTGRANT_PERMIT.per_no
  is '决定书编号';
comment on column  WF_NOTGRANT_PERMIT.sign_date
  is '签发时间';
comment on column  WF_NOTGRANT_PERMIT.acc_type
  is '拒绝理由';
comment on column  WF_NOTGRANT_PERMIT.region_use
  is '拒绝法规条文';
comment on column  WF_NOTGRANT_PERMIT.memo
  is '备注';
alter table  WF_NOTGRANT_PERMIT
  add constraint PK_WF_NOTGRANT_PERMIT primary key (GUID)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table WF_PUNISH
prompt ========================
prompt
create table  WF_PUNISH
(
  guid                  VARCHAR2(36) not null,
  punish_enty_id        INTEGER,
  punish_code           VARCHAR2(128),
  punish_unit           VARCHAR2(400),
  punish_corp           VARCHAR2(400) not null,
  punish_org_code       VARCHAR2(200),
  punish_reg_no         VARCHAR2(200),
  punish_corp_addr      VARCHAR2(1000),
  punish_zip            VARCHAR2(100),
  punish_tel            VARCHAR2(200),
  punish_person         VARCHAR2(400),
  punish_person_title   VARCHAR2(400),
  punish_illeg_date     DATE,
  punish_illeg_addr     VARCHAR2(400),
  apunish_rea_code      VARCHAR2(20),
  punish_illeg_context  VARCHAR2(2000),
  punish_illeg_evid     VARCHAR2(400),
  punish_illeg_rule     VARCHAR2(400),
  punish_basis          VARCHAR2(400),
  punish_measures       VARCHAR2(400),
  punish_date           DATE,
  punish_busi_upd_time  DATE not null,
  punish_limit          VARCHAR2(400),
  punish_validity       VARCHAR2(1),
  punish_team           VARCHAR2(400),
  punish_unit_property  VARCHAR2(128),
  punish_tax_code       VARCHAR2(20),
  punish_content        VARCHAR2(2000),
  punish_spot_test_type VARCHAR2(128),
  punish_ann_reason     VARCHAR2(128),
  punish_from_dept_id   VARCHAR2(10) not null,
  punish_uni_sc_id      VARCHAR2(100),
  punish_er_reason      VARCHAR2(400) not null
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  WF_PUNISH
  is '行政处罚数据表';
comment on column  WF_PUNISH.guid
  is '对应的问题数据的主键';
comment on column  WF_PUNISH.punish_enty_id
  is '法人库处罚数据序号';
comment on column  WF_PUNISH.punish_code
  is '处罚通知书编号';
comment on column  WF_PUNISH.punish_unit
  is '处罚机关';
comment on column  WF_PUNISH.punish_corp
  is '被处罚单位';
comment on column  WF_PUNISH.punish_org_code
  is '组织机构代码';
comment on column  WF_PUNISH.punish_reg_no
  is '注册号';
comment on column  WF_PUNISH.punish_corp_addr
  is '地址（生产经营地址）';
comment on column  WF_PUNISH.punish_zip
  is '邮编';
comment on column  WF_PUNISH.punish_tel
  is '联系电话';
comment on column  WF_PUNISH.punish_person
  is '法定代表人 负责人';
comment on column  WF_PUNISH.punish_person_title
  is '职务';
comment on column  WF_PUNISH.punish_illeg_date
  is '违法时间';
comment on column  WF_PUNISH.punish_illeg_addr
  is '违法地点';
comment on column  WF_PUNISH.apunish_rea_code
  is '违法地点区划（参见问题数据和修正数据xml格式定义开发手册 附录G-资质、处罚区划字典';
comment on column  WF_PUNISH.punish_illeg_context
  is '违法事实';
comment on column  WF_PUNISH.punish_illeg_evid
  is '证据';
comment on column  WF_PUNISH.punish_illeg_rule
  is '违反规定';
comment on column  WF_PUNISH.punish_basis
  is '处罚依据';
comment on column  WF_PUNISH.punish_measures
  is '处罚措施';
comment on column  WF_PUNISH.punish_date
  is '处罚决定时间';
comment on column  WF_PUNISH.punish_busi_upd_time
  is '业务更新时间';
comment on column  WF_PUNISH.punish_limit
  is '履罚期限';
comment on column  WF_PUNISH.punish_validity
  is '有效性  0无效   1有效';
comment on column  WF_PUNISH.punish_team
  is '受处罚单位和集体名称';
comment on column  WF_PUNISH.punish_unit_property
  is '被处罚单位性质';
comment on column  WF_PUNISH.punish_tax_code
  is '税务登记号';
comment on column  WF_PUNISH.punish_content
  is '处罚内容';
comment on column  WF_PUNISH.punish_spot_test_type
  is '抽查类别';
comment on column  WF_PUNISH.punish_ann_reason
  is '通告原因';
comment on column  WF_PUNISH.punish_from_dept_id
  is '委办局编号参见问题数据和修正数据xml格式定义开发手册 附录G-资质、处罚区划字典';
comment on column  WF_PUNISH.punish_uni_sc_id
  is '统一社会信用代码';
comment on column  WF_PUNISH.punish_er_reason
  is '问题数据的原因';
alter table  WF_PUNISH
  add constraint PK_WF_PUNISH primary key (GUID)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table WF_QUALIFICATION
prompt ===============================
prompt
create table  WF_QUALIFICATION
(
  guid                   VARCHAR2(36) not null,
  qual_license_id        VARCHAR2(20),
  qual_corp_info_id      VARCHAR2(20),
  qual_entity_id         VARCHAR2(21),
  qual_organ_code        VARCHAR2(10),
  qual_license_type      VARCHAR2(6) not null,
  qual_unique_code       VARCHAR2(128),
  qual_bureau_code       VARCHAR2(10) not null,
  qual_license_stat      VARCHAR2(4),
  qual_license_code      VARCHAR2(128) not null,
  qual_license_date      DATE,
  qual_unit_name         VARCHAR2(128) not null,
  qual_start_date        DATE,
  qual_end_date          DATE,
  qual_person_name       VARCHAR2(128),
  qual_business_scope    VARCHAR2(2000),
  qual_unit_addr         VARCHAR2(128),
  qual_business_addr     VARCHAR2(128),
  qual_unit_person       VARCHAR2(128),
  quali_level            VARCHAR2(128),
  qual_manage_org        VARCHAR2(128),
  qual_reg_no            VARCHAR2(1024),
  qual_busi_upd_time     DATE,
  qual_unit_prop         VARCHAR2(128),
  qual_issue_org         VARCHAR2(128),
  qual_perm_context      VARCHAR2(4000),
  qual_person_title      VARCHAR2(128),
  qual_person_tel        VARCHAR2(128),
  qual_unit_person_title VARCHAR2(128),
  qual_unit_person_tel   VARCHAR2(40),
  qual_zip               VARCHAR2(6),
  qual_qual_other_unit   VARCHAR2(128),
  qual_other_organ_code  VARCHAR2(128),
  columarea_coden_33     VARCHAR2(20),
  qual_perm_scope        VARCHAR2(1024),
  qual_perm_content      CLOB,
  qual_license_name      VARCHAR2(128),
  qual_pro_name          VARCHAR2(128),
  qual_pro_model         VARCHAR2(128),
  qual_pro_standard      VARCHAR2(128),
  qual_pro_accuracy      VARCHAR2(128),
  qual_validity          VARCHAR2(1),
  qual_uni_sc_id         VARCHAR2(18),
  qual_er_reason         VARCHAR2(400) not null
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  WF_QUALIFICATION
  is '资质数据表';
comment on column  WF_QUALIFICATION.guid
  is '对应的问题数据的主键';
comment on column  WF_QUALIFICATION.qual_license_id
  is '数据中心许可证唯一序号';
comment on column  WF_QUALIFICATION.qual_corp_info_id
  is '数据中心法人实体序号';
comment on column  WF_QUALIFICATION.qual_entity_id
  is '企业唯一标识（工商）';
comment on column  WF_QUALIFICATION.qual_organ_code
  is '组织结构代码';
comment on column  WF_QUALIFICATION.qual_license_type
  is '许可证事项名称代码（登录法人库系统法人信息目录管理菜单查看）';
comment on column  WF_QUALIFICATION.qual_unique_code
  is '资质信息委办局唯一标识';
comment on column  WF_QUALIFICATION.qual_bureau_code
  is '委办局编号（参见问题数据和修正数据xml格式定义开发手册 附录G-单位字典）';
comment on column  WF_QUALIFICATION.qual_license_stat
  is '许可证号状态（参见问题数据和修正数据xml格式定义开发手册 附录G-资质状态字典）';
comment on column  WF_QUALIFICATION.qual_license_code
  is '许可证号';
comment on column  WF_QUALIFICATION.qual_license_date
  is '发证日期';
comment on column  WF_QUALIFICATION.qual_unit_name
  is '法人名称';
comment on column  WF_QUALIFICATION.qual_start_date
  is '有效日期(起)';
comment on column  WF_QUALIFICATION.qual_end_date
  is '有效日期(止)';
comment on column  WF_QUALIFICATION.qual_person_name
  is '法定代表人';
comment on column  WF_QUALIFICATION.qual_business_scope
  is '经营范围';
comment on column  WF_QUALIFICATION.qual_unit_addr
  is '单位地址';
comment on column  WF_QUALIFICATION.qual_business_addr
  is '经营地址';
comment on column  WF_QUALIFICATION.qual_unit_person
  is '负责人';
comment on column  WF_QUALIFICATION.quali_level
  is '资质等级';
comment on column  WF_QUALIFICATION.qual_manage_org
  is '主管机关';
comment on column  WF_QUALIFICATION.qual_reg_no
  is '注册号';
comment on column  WF_QUALIFICATION.qual_busi_upd_time
  is '业务发布时间';
comment on column  WF_QUALIFICATION.qual_unit_prop
  is '单位性质';
comment on column  WF_QUALIFICATION.qual_issue_org
  is '发证机关';
comment on column  WF_QUALIFICATION.qual_perm_context
  is '许可内容';
comment on column  WF_QUALIFICATION.qual_person_title
  is '法定代表人职务 职称';
comment on column  WF_QUALIFICATION.qual_person_tel
  is '法定代表人电话';
comment on column  WF_QUALIFICATION.qual_unit_person_title
  is '负责人职务  职称';
comment on column  WF_QUALIFICATION.qual_unit_person_tel
  is '联系电话';
comment on column  WF_QUALIFICATION.qual_zip
  is '邮编';
comment on column  WF_QUALIFICATION.qual_qual_other_unit
  is '涉及单位名称';
comment on column  WF_QUALIFICATION.qual_other_organ_code
  is '涉及单位组织机构代码';
comment on column  WF_QUALIFICATION.columarea_coden_33
  is '颁发单位区划（参见问题数据和修正数据xml格式定义开发手册  附录G-资质、处罚区划字典）';
comment on column  WF_QUALIFICATION.qual_perm_scope
  is '许可范围';
comment on column  WF_QUALIFICATION.qual_perm_content
  is '行政许可决定书内容';
comment on column  WF_QUALIFICATION.qual_license_name
  is '证件名称';
comment on column  WF_QUALIFICATION.qual_pro_name
  is '产品名称';
comment on column  WF_QUALIFICATION.qual_pro_model
  is '型号';
comment on column  WF_QUALIFICATION.qual_pro_standard
  is '规格';
comment on column  WF_QUALIFICATION.qual_pro_accuracy
  is '准确度';
comment on column  WF_QUALIFICATION.qual_validity
  is '有效性 0无效  1 有效';
comment on column  WF_QUALIFICATION.qual_uni_sc_id
  is '统一社会信用代码';
comment on column  WF_QUALIFICATION.qual_er_reason
  is '问题数据的原因';
alter table  WF_QUALIFICATION
  add constraint PK_WF_QUALIFICATION primary key (GUID)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table WF_SUPV_ATTACH
prompt =============================
prompt
create table  WF_SUPV_ATTACH
(
  file_id   VARCHAR2(36) not null,
  supv_guid VARCHAR2(36),
  filename  VARCHAR2(200),
  content   BLOB
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  WF_SUPV_ATTACH
  is '监督检查任务与附件表';
comment on column  WF_SUPV_ATTACH.file_id
  is '文件ID';
comment on column  WF_SUPV_ATTACH.supv_guid
  is '监督检查任务ID';
comment on column  WF_SUPV_ATTACH.filename
  is '附件名名称';
comment on column  WF_SUPV_ATTACH.content
  is '附件内容';
alter table  WF_SUPV_ATTACH
  add constraint PK_WF_SUPV_ATTACH primary key (FILE_ID)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;
alter table  WF_SUPV_ATTACH
  add constraint FK_WF_SUPV__REFERENCE_WF_SUPV foreign key (SUPV_GUID)
  references  WF_SUPV (GUID);

prompt
prompt Creating table WF_UNION
prompt =======================
prompt
create table  WF_UNION
(
  guid              VARCHAR2(36) not null,
  union_addr1       VARCHAR2(100),
  union_person_list VARCHAR2(1000),
  union_purpose     VARCHAR2(1024),
  union_equ         VARCHAR2(1024),
  union_content     VARCHAR2(4000),
  union_result1     VARCHAR2(1024),
  union_opinion     VARCHAR2(300)
)
tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table  WF_UNION
  is '联合执法方案表';
comment on column  WF_UNION.guid
  is '联合执法方案编号';
comment on column  WF_UNION.union_addr1
  is '执法地点';
comment on column  WF_UNION.union_person_list
  is '人员名单';
comment on column  WF_UNION.union_purpose
  is '目的';
comment on column  WF_UNION.union_equ
  is '使用设备';
comment on column  WF_UNION.union_content
  is '方案内容';
comment on column  WF_UNION.union_result1
  is '处理情况';
comment on column  WF_UNION.union_opinion
  is '领导审核意见';
alter table  WF_UNION
  add constraint PK_WF_UNION primary key (GUID)
  using index 
  tablespace RMIP_PROCESSDB
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating sequence ACT_EVT_LOG_SEQ
prompt =================================
prompt
create sequence  ACT_EVT_LOG_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence HIBERNATE_SEQUENCE
prompt ====================================
prompt
create sequence  HIBERNATE_SEQUENCE
minvalue 1
maxvalue 9999999999999999999999999999
start with 41
increment by 1
cache 20;


spool off
