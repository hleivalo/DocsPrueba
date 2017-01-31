--
-- Create Database Script
--   Database Version            : 11.2.0.1.0
--   Database Compatible Level   : 11.2.0.0.0
--   Toad Version                : 12.8.0.49
--   DB Connect String           : PRUEBA_HL
--   Script Created by           : HLEIVA
--   Script Created at           : 31/01/2017 2:55:54
--   Notes                       : 
--

/* InitPRUEBA_H.ora file begins here.

#####################################################
# Created by Toad
# 31/01/2017 2:55:54
# Note: Only non-default parameters are listed here.
#####################################################

audit_file_dest = "C:\APP\ORA_DB\ADMIN\PRUEBA_HL\ADUMP" 
audit_trail = "DB" 
compatible = "11.2.0.0.0" 
control_files = (C:\APP\ORA_DB\FILE_DB\PRUEBA_HL\CONTROL01.CTL, C:\APP\ORA_DB\FLASH_RECOVERY_AREA\PRUEBA_HL\CONTROL02.CTL) 
db_block_size = 8192 
db_domain = "" 
db_name = "Prueba_H" 
db_recovery_file_dest = "C:\app\ora_db\flash_recovery_area" 
db_recovery_file_dest_size = 4102029312 
db_unique_name = "Prueba_HL" 
diagnostic_dest = "C:\APP\ORA_DB" 
dispatchers = "(PROTOCOL=TCP) (SERVICE=PruebaHLXDB)" 
local_listener = "LISTENER_PRUEBAHL" 
memory_target = 3405774848 
nls_language = "SPANISH" 
nls_territory = "SPAIN" 
open_cursors = 300 
processes = 150 
remote_login_passwordfile = "EXCLUSIVE" 
undo_tablespace = "UNDOTBS1" 

InitPRUEBA_H.ora file ends here. */


CREATE TABLESPACE SYSAUX DATAFILE 
  'C:\APP\ORA_DB\FILE_DB\PRUEBA_HL\SYSAUX01.DBF' SIZE 520M AUTOEXTEND ON NEXT 10M MAXSIZE UNLIMITED
LOGGING
ONLINE
EXTENT MANAGEMENT LOCAL AUTOALLOCATE
BLOCKSIZE 8K
SEGMENT SPACE MANAGEMENT AUTO
FLASHBACK ON;


CREATE TABLESPACE SYSTEM DATAFILE 
  'C:\APP\ORA_DB\FILE_DB\PRUEBA_HL\SYSTEM01.DBF' SIZE 680M AUTOEXTEND ON NEXT 10M MAXSIZE UNLIMITED
LOGGING
ONLINE
EXTENT MANAGEMENT LOCAL AUTOALLOCATE
BLOCKSIZE 8K
FLASHBACK ON;


CREATE TEMPORARY TABLESPACE TEMP TEMPFILE 
  'C:\APP\ORA_DB\FILE_DB\PRUEBA_HL\TEMP01.DBF' SIZE 192M AUTOEXTEND ON NEXT 640K MAXSIZE UNLIMITED
TABLESPACE GROUP ''
EXTENT MANAGEMENT LOCAL UNIFORM SIZE 1M;


CREATE UNDO TABLESPACE UNDOTBS1 DATAFILE 
  'C:\APP\ORA_DB\FILE_DB\PRUEBA_HL\UNDOTBS01.DBF' SIZE 380M AUTOEXTEND ON NEXT 5M MAXSIZE UNLIMITED
ONLINE
RETENTION NOGUARANTEE
BLOCKSIZE 8K
FLASHBACK ON;


CREATE TABLESPACE USERS DATAFILE 
  'C:\APP\ORA_DB\FILE_DB\PRUEBA_HL\USERS01.DBF' SIZE 685M AUTOEXTEND ON NEXT 1280K MAXSIZE UNLIMITED
LOGGING
ONLINE
EXTENT MANAGEMENT LOCAL AUTOALLOCATE
BLOCKSIZE 8K
SEGMENT SPACE MANAGEMENT AUTO
FLASHBACK ON;


ALTER DATABASE ADD LOGFILE GROUP 1(
  'C:\APP\ORA_DB\FILE_DB\PRUEBA_HL\REDO01.LOG')
    SIZE 50M;


ALTER DATABASE ADD LOGFILE GROUP 2(
  'C:\APP\ORA_DB\FILE_DB\PRUEBA_HL\REDO02.LOG')
    SIZE 50M;


ALTER DATABASE ADD LOGFILE GROUP 3(
  'C:\APP\ORA_DB\FILE_DB\PRUEBA_HL\REDO03.LOG')
    SIZE 50M;


CREATE PROFILE "DEFAULT" LIMIT
  SESSIONS_PER_USER UNLIMITED
  CPU_PER_SESSION UNLIMITED
  CPU_PER_CALL UNLIMITED
  CONNECT_TIME UNLIMITED
  IDLE_TIME UNLIMITED
  LOGICAL_READS_PER_SESSION UNLIMITED
  LOGICAL_READS_PER_CALL UNLIMITED
  COMPOSITE_LIMIT UNLIMITED
  PRIVATE_SGA UNLIMITED
  FAILED_LOGIN_ATTEMPTS 10
  PASSWORD_LIFE_TIME 180
  PASSWORD_REUSE_TIME UNLIMITED
  PASSWORD_REUSE_MAX UNLIMITED
  PASSWORD_LOCK_TIME 1
  PASSWORD_GRACE_TIME 7
  PASSWORD_VERIFY_FUNCTION NULL;


CREATE PROFILE MONITORING_PROFILE LIMIT
  SESSIONS_PER_USER DEFAULT
  CPU_PER_SESSION DEFAULT
  CPU_PER_CALL DEFAULT
  CONNECT_TIME DEFAULT
  IDLE_TIME DEFAULT
  LOGICAL_READS_PER_SESSION DEFAULT
  LOGICAL_READS_PER_CALL DEFAULT
  COMPOSITE_LIMIT DEFAULT
  PRIVATE_SGA DEFAULT
  FAILED_LOGIN_ATTEMPTS UNLIMITED
  PASSWORD_LIFE_TIME DEFAULT
  PASSWORD_REUSE_TIME DEFAULT
  PASSWORD_REUSE_MAX DEFAULT
  PASSWORD_LOCK_TIME DEFAULT
  PASSWORD_GRACE_TIME DEFAULT
  PASSWORD_VERIFY_FUNCTION DEFAULT;


CREATE ROLE ADM_PARALLEL_EXECUTE_TASK NOT IDENTIFIED;



CREATE ROLE APEX_ADMINISTRATOR_ROLE NOT IDENTIFIED;



CREATE ROLE AQ_ADMINISTRATOR_ROLE NOT IDENTIFIED;

-- System privileges granted to AQ_ADMINISTRATOR_ROLE
BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE    => SYS.DBMS_RULE_ADM.CREATE_EVALUATION_CONTEXT_OBJ,
  GRANTEE      => 'AQ_ADMINISTRATOR_ROLE',
  GRANT_OPTION => TRUE);
END;
/
BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE    => SYS.DBMS_RULE_ADM.CREATE_RULE_OBJ,
  GRANTEE      => 'AQ_ADMINISTRATOR_ROLE',
  GRANT_OPTION => TRUE);
END;
/
BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE    => SYS.DBMS_RULE_ADM.CREATE_RULE_SET_OBJ,
  GRANTEE      => 'AQ_ADMINISTRATOR_ROLE',
  GRANT_OPTION => TRUE);
END;
/
BEGIN
SYS.DBMS_AQADM.GRANT_SYSTEM_PRIVILEGE (
  PRIVILEGE    => 'DEQUEUE_ANY',
  GRANTEE      => 'AQ_ADMINISTRATOR_ROLE',
  ADMIN_OPTION => TRUE);
END;
/
BEGIN
SYS.DBMS_AQADM.GRANT_SYSTEM_PRIVILEGE (
  PRIVILEGE    => 'ENQUEUE_ANY',
  GRANTEE      => 'AQ_ADMINISTRATOR_ROLE',
  ADMIN_OPTION => TRUE);
END;
/
BEGIN
SYS.DBMS_AQADM.GRANT_SYSTEM_PRIVILEGE (
  PRIVILEGE    => 'MANAGE_ANY',
  GRANTEE      => 'AQ_ADMINISTRATOR_ROLE',
  ADMIN_OPTION => TRUE);
END;
/



CREATE ROLE AQ_USER_ROLE NOT IDENTIFIED;



CREATE ROLE AUTHENTICATEDUSER NOT IDENTIFIED;



CREATE ROLE CONNECT NOT IDENTIFIED;

-- System privileges granted to CONNECT
GRANT CREATE SESSION TO CONNECT;



CREATE ROLE CSW_USR_ROLE IDENTIFIED BY VALUES 'F79FD2B778DEA3AA';



CREATE ROLE CTXAPP NOT IDENTIFIED;



CREATE ROLE CWM_USER NOT IDENTIFIED;



CREATE ROLE DBFS_ROLE NOT IDENTIFIED;



CREATE ROLE DELETE_CATALOG_ROLE NOT IDENTIFIED;



CREATE ROLE EJBCLIENT NOT IDENTIFIED;



CREATE ROLE GATHER_SYSTEM_STATISTICS NOT IDENTIFIED;



CREATE ROLE GLOBAL_AQ_USER_ROLE IDENTIFIED GLOBALLY;



CREATE ROLE HS_ADMIN_EXECUTE_ROLE NOT IDENTIFIED;



CREATE ROLE HS_ADMIN_SELECT_ROLE NOT IDENTIFIED;



CREATE ROLE JAVA_ADMIN NOT IDENTIFIED;



CREATE ROLE JAVADEBUGPRIV NOT IDENTIFIED;

-- System privileges granted to JAVADEBUGPRIV
GRANT DEBUG ANY PROCEDURE TO JAVADEBUGPRIV;
GRANT DEBUG CONNECT SESSION TO JAVADEBUGPRIV;



CREATE ROLE JAVA_DEPLOY NOT IDENTIFIED;



CREATE ROLE JAVAIDPRIV NOT IDENTIFIED;



CREATE ROLE JAVAUSERPRIV NOT IDENTIFIED;



CREATE ROLE JMXSERVER NOT IDENTIFIED;



CREATE ROLE MGMT_USER NOT IDENTIFIED;

-- System privileges granted to MGMT_USER
GRANT CREATE SESSION TO MGMT_USER;



CREATE ROLE OEM_ADVISOR NOT IDENTIFIED;

-- System privileges granted to OEM_ADVISOR
GRANT ADMINISTER SQL TUNING SET TO OEM_ADVISOR;
GRANT ADVISOR TO OEM_ADVISOR;
GRANT CREATE JOB TO OEM_ADVISOR;



CREATE ROLE OLAP_DBA NOT IDENTIFIED;

-- System privileges granted to OLAP_DBA
GRANT CREATE ANY CUBE TO OLAP_DBA;
GRANT CREATE ANY CUBE BUILD PROCESS TO OLAP_DBA;
GRANT CREATE ANY CUBE DIMENSION TO OLAP_DBA;
GRANT CREATE ANY MEASURE FOLDER TO OLAP_DBA;
GRANT CREATE ANY TABLE TO OLAP_DBA;
GRANT CREATE ANY VIEW TO OLAP_DBA;
GRANT CREATE JOB TO OLAP_DBA;
GRANT CREATE SEQUENCE TO OLAP_DBA;
GRANT DELETE ANY CUBE DIMENSION TO OLAP_DBA;
GRANT DELETE ANY MEASURE FOLDER TO OLAP_DBA;
GRANT DELETE ANY TABLE TO OLAP_DBA;
GRANT DROP ANY CUBE TO OLAP_DBA;
GRANT DROP ANY CUBE BUILD PROCESS TO OLAP_DBA;
GRANT DROP ANY CUBE DIMENSION TO OLAP_DBA;
GRANT DROP ANY MEASURE FOLDER TO OLAP_DBA;
GRANT DROP ANY TABLE TO OLAP_DBA;
GRANT DROP ANY VIEW TO OLAP_DBA;
GRANT INSERT ANY CUBE DIMENSION TO OLAP_DBA;
GRANT INSERT ANY MEASURE FOLDER TO OLAP_DBA;
GRANT INSERT ANY TABLE TO OLAP_DBA;
GRANT SELECT ANY CUBE TO OLAP_DBA;
GRANT SELECT ANY CUBE DIMENSION TO OLAP_DBA;
GRANT SELECT ANY TABLE TO OLAP_DBA;
GRANT UPDATE ANY CUBE TO OLAP_DBA;
GRANT UPDATE ANY CUBE BUILD PROCESS TO OLAP_DBA;
GRANT UPDATE ANY CUBE DIMENSION TO OLAP_DBA;
GRANT UPDATE ANY TABLE TO OLAP_DBA;



CREATE ROLE OLAPI_TRACE_USER NOT IDENTIFIED;



CREATE ROLE OLAP_USER NOT IDENTIFIED;

-- System privileges granted to OLAP_USER
GRANT CREATE CUBE TO OLAP_USER;
GRANT CREATE CUBE BUILD PROCESS TO OLAP_USER;
GRANT CREATE CUBE DIMENSION TO OLAP_USER;
GRANT CREATE JOB TO OLAP_USER;
GRANT CREATE MEASURE FOLDER TO OLAP_USER;
GRANT CREATE SEQUENCE TO OLAP_USER;
GRANT CREATE TABLE TO OLAP_USER;
GRANT CREATE VIEW TO OLAP_USER;



CREATE ROLE OLAP_XS_ADMIN NOT IDENTIFIED;



CREATE ROLE ORDADMIN NOT IDENTIFIED;



CREATE ROLE OWB$CLIENT IDENTIFIED BY VALUES '13D492A4459DFE0D';

-- System privileges granted to OWB$CLIENT
GRANT ALTER SESSION TO OWB$CLIENT;
GRANT ANALYZE ANY TO OWB$CLIENT;
GRANT CREATE DATABASE LINK TO OWB$CLIENT;
GRANT CREATE DIMENSION TO OWB$CLIENT;
GRANT CREATE INDEXTYPE TO OWB$CLIENT;
GRANT CREATE MATERIALIZED VIEW TO OWB$CLIENT;
GRANT CREATE PROCEDURE TO OWB$CLIENT;
GRANT CREATE SEQUENCE TO OWB$CLIENT;
GRANT CREATE SESSION TO OWB$CLIENT;
GRANT CREATE SYNONYM TO OWB$CLIENT;
GRANT CREATE TYPE TO OWB$CLIENT;



CREATE ROLE OWB_DESIGNCENTER_VIEW NOT IDENTIFIED;



CREATE ROLE OWB_USER NOT IDENTIFIED;



CREATE ROLE RECOVERY_CATALOG_OWNER NOT IDENTIFIED;

-- System privileges granted to RECOVERY_CATALOG_OWNER
GRANT ALTER SESSION TO RECOVERY_CATALOG_OWNER;
GRANT CREATE CLUSTER TO RECOVERY_CATALOG_OWNER;
GRANT CREATE DATABASE LINK TO RECOVERY_CATALOG_OWNER;
GRANT CREATE PROCEDURE TO RECOVERY_CATALOG_OWNER;
GRANT CREATE SEQUENCE TO RECOVERY_CATALOG_OWNER;
GRANT CREATE SESSION TO RECOVERY_CATALOG_OWNER;
GRANT CREATE SYNONYM TO RECOVERY_CATALOG_OWNER;
GRANT CREATE TABLE TO RECOVERY_CATALOG_OWNER;
GRANT CREATE TRIGGER TO RECOVERY_CATALOG_OWNER;
GRANT CREATE TYPE TO RECOVERY_CATALOG_OWNER;
GRANT CREATE VIEW TO RECOVERY_CATALOG_OWNER;



CREATE ROLE RESOURCE NOT IDENTIFIED;

-- System privileges granted to RESOURCE
GRANT CREATE CLUSTER TO RESOURCE;
GRANT CREATE INDEXTYPE TO RESOURCE;
GRANT CREATE OPERATOR TO RESOURCE;
GRANT CREATE PROCEDURE TO RESOURCE;
GRANT CREATE SEQUENCE TO RESOURCE;
GRANT CREATE TABLE TO RESOURCE;
GRANT CREATE TRIGGER TO RESOURCE;
GRANT CREATE TYPE TO RESOURCE;



CREATE ROLE SCHEDULER_ADMIN NOT IDENTIFIED;

-- System privileges granted to SCHEDULER_ADMIN
GRANT CREATE ANY JOB TO SCHEDULER_ADMIN WITH ADMIN OPTION;
GRANT CREATE EXTERNAL JOB TO SCHEDULER_ADMIN WITH ADMIN OPTION;
GRANT CREATE JOB TO SCHEDULER_ADMIN WITH ADMIN OPTION;
GRANT EXECUTE ANY CLASS TO SCHEDULER_ADMIN WITH ADMIN OPTION;
GRANT EXECUTE ANY PROGRAM TO SCHEDULER_ADMIN WITH ADMIN OPTION;
GRANT MANAGE SCHEDULER TO SCHEDULER_ADMIN WITH ADMIN OPTION;



CREATE ROLE SELECT_CATALOG_ROLE NOT IDENTIFIED;

-- Roles granted to SELECT_CATALOG_ROLE
GRANT HS_ADMIN_SELECT_ROLE TO SELECT_CATALOG_ROLE;



CREATE ROLE SPATIAL_CSW_ADMIN IDENTIFIED BY VALUES '093913703800E437';



CREATE ROLE SPATIAL_WFS_ADMIN NOT IDENTIFIED;



CREATE ROLE WFS_USR_ROLE IDENTIFIED BY VALUES '094C14AA84362687';



CREATE ROLE WM_ADMIN_ROLE NOT IDENTIFIED;



CREATE ROLE XDBADMIN NOT IDENTIFIED;



CREATE ROLE XDB_SET_INVOKER NOT IDENTIFIED;



CREATE ROLE XDB_WEBSERVICES NOT IDENTIFIED;



CREATE ROLE XDB_WEBSERVICES_OVER_HTTP NOT IDENTIFIED;



CREATE ROLE XDB_WEBSERVICES_WITH_PUBLIC NOT IDENTIFIED;



CREATE ROLLBACK SEGMENT SYSTEM
  TABLESPACE SYSTEM
  STORAGE    (
              INITIAL          112K
              NEXT             56K
              MINEXTENTS       1
              MAXEXTENTS       32765
             );
ALTER ROLLBACK SEGMENT SYSTEM ONLINE;


CREATE OR REPLACE DIRECTORY 
DATA_PUMP_DIR AS 
'C:\app\ora_db\product\11.2.0\dbhome_1/rdbms/log/';


CREATE OR REPLACE DIRECTORY 
ORACLE_OCM_CONFIG_DIR AS 
'C:\app\ora_db\product\11.2.0\dbhome_1/ccr/state';


CREATE OR REPLACE DIRECTORY 
XMLDIR AS 
'c:\ade\aime_dadvfh0169\oracle/rdbms/xml';


begin
  sys.dbms_resource_manager.clear_pending_area();
  sys.dbms_resource_manager.create_pending_area();
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'AUTO_TASK_CONSUMER_GROUP'
     ,comment                      => 'System maintenance task consumer group'
     ,mgmt_mth                     => 'ROUND-ROBIN'
     ,category                     => 'OTHER');
  sys.dbms_resource_manager.submit_pending_area();
end;
/



begin
  sys.dbms_resource_manager.clear_pending_area();
  sys.dbms_resource_manager.create_pending_area();
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'DEFAULT_CONSUMER_GROUP'
     ,comment                      => 'Consumer group for users not assigned to any consumer group'
     ,mgmt_mth                     => 'ROUND-ROBIN'
     ,category                     => 'OTHER');
  sys.dbms_resource_manager.submit_pending_area();
end;
/

begin
  sys.dbms_resource_manager.clear_pending_area();
  sys.dbms_resource_manager.create_pending_area();
  sys.dbms_resource_manager_privs.grant_switch_consumer_group (
      grantee_name                 => 'PUBLIC'
     ,consumer_group               => 'DEFAULT_CONSUMER_GROUP'
     ,grant_option                 => TRUE);
  sys.dbms_resource_manager.submit_pending_area();
end;
/




begin
  sys.dbms_resource_manager.clear_pending_area();
  sys.dbms_resource_manager.create_pending_area();
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'LOW_GROUP'
     ,comment                      => 'Consumer group for low-priority sessions'
     ,mgmt_mth                     => 'ROUND-ROBIN'
     ,category                     => 'OTHER');
  sys.dbms_resource_manager.submit_pending_area();
end;
/

begin
  sys.dbms_resource_manager.clear_pending_area();
  sys.dbms_resource_manager.create_pending_area();
  sys.dbms_resource_manager_privs.grant_switch_consumer_group (
      grantee_name                 => 'PUBLIC'
     ,consumer_group               => 'LOW_GROUP'
     ,grant_option                 => FALSE);
  sys.dbms_resource_manager.submit_pending_area();
end;
/




begin
  sys.dbms_resource_manager.clear_pending_area();
  sys.dbms_resource_manager.create_pending_area();
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$APPQOS_4'
     ,comment                      => 'Consumer group for Application QOS'
     ,mgmt_mth                     => 'ROUND-ROBIN'
     ,category                     => 'INTERACTIVE');
  sys.dbms_resource_manager.submit_pending_area();
end;
/



begin
  sys.dbms_resource_manager.clear_pending_area();
  sys.dbms_resource_manager.create_pending_area();
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$APPQOS_5'
     ,comment                      => 'Consumer group for Application QOS'
     ,mgmt_mth                     => 'ROUND-ROBIN'
     ,category                     => 'INTERACTIVE');
  sys.dbms_resource_manager.submit_pending_area();
end;
/



begin
  sys.dbms_resource_manager.clear_pending_area();
  sys.dbms_resource_manager.create_pending_area();
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$APPQOS_6'
     ,comment                      => 'Consumer group for Application QOS'
     ,mgmt_mth                     => 'ROUND-ROBIN'
     ,category                     => 'INTERACTIVE');
  sys.dbms_resource_manager.submit_pending_area();
end;
/



begin
  sys.dbms_resource_manager.clear_pending_area();
  sys.dbms_resource_manager.create_pending_area();
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$APPQOS_7'
     ,comment                      => 'Consumer group for Application QOS'
     ,mgmt_mth                     => 'ROUND-ROBIN'
     ,category                     => 'INTERACTIVE');
  sys.dbms_resource_manager.submit_pending_area();
end;
/



declare

    function plan_exists(PlanName VARCHAR2) RETURN BOOLEAN is
      aPlan dba_rsrc_plans.plan%TYPE;
    begin
      begin
        Select plan
        into   aPlan
        from   dba_rsrc_plans
        where  nvl(status, 'x') <> 'PENDING'
        and    plan = PlanName;
        Return  True;
      exception
        when no_data_found then
          Return False;
      end;
    end;

begin
  sys.dbms_resource_manager.clear_pending_area();
  sys.dbms_resource_manager.create_pending_area();
  sys.dbms_resource_manager.create_plan (
      plan                         => 'APPQOS_PLAN'
     ,mgmt_mth                     => 'EMPHASIS'
     ,active_sess_pool_mth         => 'ACTIVE_SESS_POOL_ABSOLUTE'
     ,parallel_degree_limit_mth    => 'PARALLEL_DEGREE_LIMIT_ABSOLUTE'
     ,queueing_mth                 => 'FIFO_TIMEOUT'
     ,comment                      => 'Plan for Application QOS Management that provides a fixed set of allocations to the consumer groups that Application QOS uses to manage workload resource allocation.'
     ,sub_plan                      => FALSE);
  if Not Plan_Exists('ORA$AUTOTASK_SUB_PLAN') then
    sys.dbms_resource_manager.create_plan (
      plan                         => 'ORA$AUTOTASK_SUB_PLAN'
     ,mgmt_mth                     => 'EMPHASIS'
     ,active_sess_pool_mth         => 'ACTIVE_SESS_POOL_ABSOLUTE'
     ,parallel_degree_limit_mth    => 'PARALLEL_DEGREE_LIMIT_ABSOLUTE'
     ,queueing_mth                 => 'FIFO_TIMEOUT'
     ,comment                      => 'Default sub-plan for automated maintenance tasks.  A directive to this sub-plan should be included in every top-level plan to manage the resources consumed by the automated maintenance tasks.'
     ,sub_plan                      => TRUE);
  if Not Plan_Exists('ORA$AUTOTASK_HIGH_SUB_PLAN') then
    sys.dbms_resource_manager.create_plan (
      plan                         => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,mgmt_mth                     => 'EMPHASIS'
     ,active_sess_pool_mth         => 'ACTIVE_SESS_POOL_ABSOLUTE'
     ,parallel_degree_limit_mth    => 'PARALLEL_DEGREE_LIMIT_ABSOLUTE'
     ,queueing_mth                 => 'FIFO_TIMEOUT'
     ,comment                      => 'Default sub-plan for high-priority, automated maintenance tasks.  This sub-plan is referenced by ORA$AUTOTASK_SUB_PLAN and should not be referenced directly.'
     ,sub_plan                      => TRUE);
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_HEALTH_GROUP'
     ,comment                      => 'Consumer group for health checks');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_HEALTH_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 25
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for health check tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_SQL_GROUP'
     ,comment                      => 'Consumer group for SQL tuning');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_SQL_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 25
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for SQL tuning tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_SPACE_GROUP'
     ,comment                      => 'Consumer group for space management advisors');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_SPACE_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 25
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for space management advisory tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_STATS_GROUP'
     ,comment                      => 'Consumer group for gathering optimizer statistics');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_STATS_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 25
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for gathering optimizer statistics tasks'  );
  end if;
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,switch_estimate              => FALSE
     ,mgmt_p2                      => 100
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for high-priority automated tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_URGENT_GROUP'
     ,comment                      => 'Consumer group for urgent maintenance tasks ');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_URGENT_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 100
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for urgent automated tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_MEDIUM_GROUP'
     ,comment                      => 'Consumer group for medium-priority maintenance tasks ');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_MEDIUM_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p3                      => 100
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for medium-priority automated tasks'  );
  end if;
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'APPQOS_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_SUB_PLAN'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 5
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for automated maintenance tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$DIAGNOSTICS'
     ,comment                      => 'Consumer group for diagnostics');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'APPQOS_PLAN'
     ,group_or_subplan             => 'ORA$DIAGNOSTICS'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 5
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for automated diagnostic tasks'  );
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'APPQOS_PLAN'
     ,group_or_subplan             => 'OTHER_GROUPS'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 90
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for all other operations'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$APPQOS_0'
     ,comment                      => 'Consumer group for Application QOS');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'APPQOS_PLAN'
     ,group_or_subplan             => 'ORA$APPQOS_0'
     ,switch_estimate              => FALSE
     ,mgmt_p2                      => 56
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for first QOS group'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$APPQOS_1'
     ,comment                      => 'Consumer group for Application QOS');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'APPQOS_PLAN'
     ,group_or_subplan             => 'ORA$APPQOS_1'
     ,switch_estimate              => FALSE
     ,mgmt_p2                      => 26
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for second QOS group'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$APPQOS_2'
     ,comment                      => 'Consumer group for Application QOS');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'APPQOS_PLAN'
     ,group_or_subplan             => 'ORA$APPQOS_2'
     ,switch_estimate              => FALSE
     ,mgmt_p2                      => 12
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for third QOS group'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$APPQOS_3'
     ,comment                      => 'Consumer group for Application QOS');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'APPQOS_PLAN'
     ,group_or_subplan             => 'ORA$APPQOS_3'
     ,switch_estimate              => FALSE
     ,mgmt_p2                      => 5
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for fourth QOS group'  );
  sys.dbms_resource_manager.submit_pending_area();
end;
/


declare

    function plan_exists(PlanName VARCHAR2) RETURN BOOLEAN is
      aPlan dba_rsrc_plans.plan%TYPE;
    begin
      begin
        Select plan
        into   aPlan
        from   dba_rsrc_plans
        where  nvl(status, 'x') <> 'PENDING'
        and    plan = PlanName;
        Return  True;
      exception
        when no_data_found then
          Return False;
      end;
    end;

begin
  sys.dbms_resource_manager.clear_pending_area();
  sys.dbms_resource_manager.create_pending_area();
  sys.dbms_resource_manager.create_plan (
      plan                         => 'DEFAULT_MAINTENANCE_PLAN'
     ,mgmt_mth                     => 'EMPHASIS'
     ,active_sess_pool_mth         => 'ACTIVE_SESS_POOL_ABSOLUTE'
     ,parallel_degree_limit_mth    => 'PARALLEL_DEGREE_LIMIT_ABSOLUTE'
     ,queueing_mth                 => 'FIFO_TIMEOUT'
     ,comment                      => 'Default plan for maintenance windows that prioritizes SYS_GROUP operations and allocates the remaining 5% to diagnostic operations and 25% to automated maintenance operations.'
     ,sub_plan                      => FALSE);
  if Not Plan_Exists('ORA$AUTOTASK_SUB_PLAN') then
    sys.dbms_resource_manager.create_plan (
      plan                         => 'ORA$AUTOTASK_SUB_PLAN'
     ,mgmt_mth                     => 'EMPHASIS'
     ,active_sess_pool_mth         => 'ACTIVE_SESS_POOL_ABSOLUTE'
     ,parallel_degree_limit_mth    => 'PARALLEL_DEGREE_LIMIT_ABSOLUTE'
     ,queueing_mth                 => 'FIFO_TIMEOUT'
     ,comment                      => 'Default sub-plan for automated maintenance tasks.  A directive to this sub-plan should be included in every top-level plan to manage the resources consumed by the automated maintenance tasks.'
     ,sub_plan                      => TRUE);
  if Not Plan_Exists('ORA$AUTOTASK_HIGH_SUB_PLAN') then
    sys.dbms_resource_manager.create_plan (
      plan                         => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,mgmt_mth                     => 'EMPHASIS'
     ,active_sess_pool_mth         => 'ACTIVE_SESS_POOL_ABSOLUTE'
     ,parallel_degree_limit_mth    => 'PARALLEL_DEGREE_LIMIT_ABSOLUTE'
     ,queueing_mth                 => 'FIFO_TIMEOUT'
     ,comment                      => 'Default sub-plan for high-priority, automated maintenance tasks.  This sub-plan is referenced by ORA$AUTOTASK_SUB_PLAN and should not be referenced directly.'
     ,sub_plan                      => TRUE);
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_HEALTH_GROUP'
     ,comment                      => 'Consumer group for health checks');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_HEALTH_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 25
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for health check tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_SQL_GROUP'
     ,comment                      => 'Consumer group for SQL tuning');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_SQL_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 25
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for SQL tuning tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_SPACE_GROUP'
     ,comment                      => 'Consumer group for space management advisors');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_SPACE_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 25
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for space management advisory tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_STATS_GROUP'
     ,comment                      => 'Consumer group for gathering optimizer statistics');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_STATS_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 25
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for gathering optimizer statistics tasks'  );
  end if;
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,switch_estimate              => FALSE
     ,mgmt_p2                      => 100
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for high-priority automated tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_URGENT_GROUP'
     ,comment                      => 'Consumer group for urgent maintenance tasks ');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_URGENT_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 100
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for urgent automated tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_MEDIUM_GROUP'
     ,comment                      => 'Consumer group for medium-priority maintenance tasks ');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_MEDIUM_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p3                      => 100
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for medium-priority automated tasks'  );
  end if;
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'DEFAULT_MAINTENANCE_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_SUB_PLAN'
     ,switch_estimate              => FALSE
     ,mgmt_p2                      => 25
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for automated maintenance tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$DIAGNOSTICS'
     ,comment                      => 'Consumer group for diagnostics');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'DEFAULT_MAINTENANCE_PLAN'
     ,group_or_subplan             => 'ORA$DIAGNOSTICS'
     ,switch_estimate              => FALSE
     ,mgmt_p2                      => 5
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for automated diagnostic tasks'  );
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'DEFAULT_MAINTENANCE_PLAN'
     ,group_or_subplan             => 'OTHER_GROUPS'
     ,switch_estimate              => FALSE
     ,mgmt_p2                      => 70
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for all other operations'  );
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'DEFAULT_MAINTENANCE_PLAN'
     ,group_or_subplan             => 'SYS_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 75
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for system operations'  );
  sys.dbms_resource_manager.submit_pending_area();
end;
/


declare

    function plan_exists(PlanName VARCHAR2) RETURN BOOLEAN is
      aPlan dba_rsrc_plans.plan%TYPE;
    begin
      begin
        Select plan
        into   aPlan
        from   dba_rsrc_plans
        where  nvl(status, 'x') <> 'PENDING'
        and    plan = PlanName;
        Return  True;
      exception
        when no_data_found then
          Return False;
      end;
    end;

begin
  sys.dbms_resource_manager.clear_pending_area();
  sys.dbms_resource_manager.create_pending_area();
  sys.dbms_resource_manager.create_plan (
      plan                         => 'DEFAULT_PLAN'
     ,mgmt_mth                     => 'EMPHASIS'
     ,active_sess_pool_mth         => 'ACTIVE_SESS_POOL_ABSOLUTE'
     ,parallel_degree_limit_mth    => 'PARALLEL_DEGREE_LIMIT_ABSOLUTE'
     ,queueing_mth                 => 'FIFO_TIMEOUT'
     ,comment                      => 'Default, basic, pre-defined plan that prioritizes SYS_GROUP operations and allocates minimal resources for automated maintenance and diagnostics operations.'
     ,sub_plan                      => FALSE);
  if Not Plan_Exists('ORA$AUTOTASK_SUB_PLAN') then
    sys.dbms_resource_manager.create_plan (
      plan                         => 'ORA$AUTOTASK_SUB_PLAN'
     ,mgmt_mth                     => 'EMPHASIS'
     ,active_sess_pool_mth         => 'ACTIVE_SESS_POOL_ABSOLUTE'
     ,parallel_degree_limit_mth    => 'PARALLEL_DEGREE_LIMIT_ABSOLUTE'
     ,queueing_mth                 => 'FIFO_TIMEOUT'
     ,comment                      => 'Default sub-plan for automated maintenance tasks.  A directive to this sub-plan should be included in every top-level plan to manage the resources consumed by the automated maintenance tasks.'
     ,sub_plan                      => TRUE);
  if Not Plan_Exists('ORA$AUTOTASK_HIGH_SUB_PLAN') then
    sys.dbms_resource_manager.create_plan (
      plan                         => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,mgmt_mth                     => 'EMPHASIS'
     ,active_sess_pool_mth         => 'ACTIVE_SESS_POOL_ABSOLUTE'
     ,parallel_degree_limit_mth    => 'PARALLEL_DEGREE_LIMIT_ABSOLUTE'
     ,queueing_mth                 => 'FIFO_TIMEOUT'
     ,comment                      => 'Default sub-plan for high-priority, automated maintenance tasks.  This sub-plan is referenced by ORA$AUTOTASK_SUB_PLAN and should not be referenced directly.'
     ,sub_plan                      => TRUE);
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_HEALTH_GROUP'
     ,comment                      => 'Consumer group for health checks');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_HEALTH_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 25
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for health check tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_SQL_GROUP'
     ,comment                      => 'Consumer group for SQL tuning');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_SQL_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 25
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for SQL tuning tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_SPACE_GROUP'
     ,comment                      => 'Consumer group for space management advisors');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_SPACE_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 25
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for space management advisory tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_STATS_GROUP'
     ,comment                      => 'Consumer group for gathering optimizer statistics');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_STATS_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 25
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for gathering optimizer statistics tasks'  );
  end if;
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,switch_estimate              => FALSE
     ,mgmt_p2                      => 100
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for high-priority automated tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_URGENT_GROUP'
     ,comment                      => 'Consumer group for urgent maintenance tasks ');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_URGENT_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 100
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for urgent automated tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_MEDIUM_GROUP'
     ,comment                      => 'Consumer group for medium-priority maintenance tasks ');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_MEDIUM_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p3                      => 100
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for medium-priority automated tasks'  );
  end if;
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'DEFAULT_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_SUB_PLAN'
     ,switch_estimate              => FALSE
     ,mgmt_p2                      => 5
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for automated maintenance tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$DIAGNOSTICS'
     ,comment                      => 'Consumer group for diagnostics');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'DEFAULT_PLAN'
     ,group_or_subplan             => 'ORA$DIAGNOSTICS'
     ,switch_estimate              => FALSE
     ,mgmt_p2                      => 5
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for automated diagnostic tasks'  );
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'DEFAULT_PLAN'
     ,group_or_subplan             => 'OTHER_GROUPS'
     ,switch_estimate              => FALSE
     ,mgmt_p2                      => 90
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for all other operations'  );
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'DEFAULT_PLAN'
     ,group_or_subplan             => 'SYS_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 75
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for system operations'  );
  sys.dbms_resource_manager.submit_pending_area();
end;
/


declare

    function plan_exists(PlanName VARCHAR2) RETURN BOOLEAN is
      aPlan dba_rsrc_plans.plan%TYPE;
    begin
      begin
        Select plan
        into   aPlan
        from   dba_rsrc_plans
        where  nvl(status, 'x') <> 'PENDING'
        and    plan = PlanName;
        Return  True;
      exception
        when no_data_found then
          Return False;
      end;
    end;

begin
  sys.dbms_resource_manager.clear_pending_area();
  sys.dbms_resource_manager.create_pending_area();
  sys.dbms_resource_manager.create_plan (
      plan                         => 'DSS_PLAN'
     ,mgmt_mth                     => 'EMPHASIS'
     ,active_sess_pool_mth         => 'ACTIVE_SESS_POOL_ABSOLUTE'
     ,parallel_degree_limit_mth    => 'PARALLEL_DEGREE_LIMIT_ABSOLUTE'
     ,queueing_mth                 => 'FIFO_TIMEOUT'
     ,comment                      => 'Example plan for DSS workloads that prioritizes DSS queries over ETL.'
     ,sub_plan                      => FALSE);
  if Not Plan_Exists('ORA$AUTOTASK_SUB_PLAN') then
    sys.dbms_resource_manager.create_plan (
      plan                         => 'ORA$AUTOTASK_SUB_PLAN'
     ,mgmt_mth                     => 'EMPHASIS'
     ,active_sess_pool_mth         => 'ACTIVE_SESS_POOL_ABSOLUTE'
     ,parallel_degree_limit_mth    => 'PARALLEL_DEGREE_LIMIT_ABSOLUTE'
     ,queueing_mth                 => 'FIFO_TIMEOUT'
     ,comment                      => 'Default sub-plan for automated maintenance tasks.  A directive to this sub-plan should be included in every top-level plan to manage the resources consumed by the automated maintenance tasks.'
     ,sub_plan                      => TRUE);
  if Not Plan_Exists('ORA$AUTOTASK_HIGH_SUB_PLAN') then
    sys.dbms_resource_manager.create_plan (
      plan                         => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,mgmt_mth                     => 'EMPHASIS'
     ,active_sess_pool_mth         => 'ACTIVE_SESS_POOL_ABSOLUTE'
     ,parallel_degree_limit_mth    => 'PARALLEL_DEGREE_LIMIT_ABSOLUTE'
     ,queueing_mth                 => 'FIFO_TIMEOUT'
     ,comment                      => 'Default sub-plan for high-priority, automated maintenance tasks.  This sub-plan is referenced by ORA$AUTOTASK_SUB_PLAN and should not be referenced directly.'
     ,sub_plan                      => TRUE);
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_HEALTH_GROUP'
     ,comment                      => 'Consumer group for health checks');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_HEALTH_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 25
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for health check tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_SQL_GROUP'
     ,comment                      => 'Consumer group for SQL tuning');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_SQL_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 25
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for SQL tuning tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_SPACE_GROUP'
     ,comment                      => 'Consumer group for space management advisors');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_SPACE_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 25
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for space management advisory tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_STATS_GROUP'
     ,comment                      => 'Consumer group for gathering optimizer statistics');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_STATS_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 25
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for gathering optimizer statistics tasks'  );
  end if;
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,switch_estimate              => FALSE
     ,mgmt_p2                      => 100
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for high-priority automated tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_URGENT_GROUP'
     ,comment                      => 'Consumer group for urgent maintenance tasks ');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_URGENT_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 100
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for urgent automated tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_MEDIUM_GROUP'
     ,comment                      => 'Consumer group for medium-priority maintenance tasks ');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_MEDIUM_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p3                      => 100
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for medium-priority automated tasks'  );
  end if;
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'DSS_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_SUB_PLAN'
     ,switch_estimate              => FALSE
     ,mgmt_p2                      => 5
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for Oracle automated tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'DSS_GROUP'
     ,comment                      => 'Consumer group for DSS queries');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'DSS_PLAN'
     ,group_or_subplan             => 'DSS_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p3                      => 75
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for DSS_GROUP'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'DSS_CRITICAL_GROUP'
     ,comment                      => 'Consumer group for critical DSS queries');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'DSS_PLAN'
     ,group_or_subplan             => 'DSS_CRITICAL_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p2                      => 75
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for DSS_CRITICAL_GROUP'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'BATCH_GROUP'
     ,comment                      => 'Consumer group for batch operations');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'DSS_PLAN'
     ,group_or_subplan             => 'BATCH_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p4                      => 45
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for BATCH_GROUP'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$DIAGNOSTICS'
     ,comment                      => 'Consumer group for diagnostics');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'DSS_PLAN'
     ,group_or_subplan             => 'ORA$DIAGNOSTICS'
     ,switch_estimate              => FALSE
     ,mgmt_p2                      => 5
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for Oracle diagnostics'  );
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'DSS_PLAN'
     ,group_or_subplan             => 'OTHER_GROUPS'
     ,switch_estimate              => FALSE
     ,mgmt_p4                      => 10
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for unclassified activity'  );
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'DSS_PLAN'
     ,group_or_subplan             => 'SYS_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 75
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for SYS_GROUP'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ETL_GROUP'
     ,comment                      => 'Consumer group for ETL');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'DSS_PLAN'
     ,group_or_subplan             => 'ETL_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p4                      => 45
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for ETL_GROUP'  );
  sys.dbms_resource_manager.submit_pending_area();
end;
/


declare

    function plan_exists(PlanName VARCHAR2) RETURN BOOLEAN is
      aPlan dba_rsrc_plans.plan%TYPE;
    begin
      begin
        Select plan
        into   aPlan
        from   dba_rsrc_plans
        where  nvl(status, 'x') <> 'PENDING'
        and    plan = PlanName;
        Return  True;
      exception
        when no_data_found then
          Return False;
      end;
    end;

begin
  sys.dbms_resource_manager.clear_pending_area();
  sys.dbms_resource_manager.create_pending_area();
  sys.dbms_resource_manager.create_plan (
      plan                         => 'ETL_CRITICAL_PLAN'
     ,mgmt_mth                     => 'EMPHASIS'
     ,active_sess_pool_mth         => 'ACTIVE_SESS_POOL_ABSOLUTE'
     ,parallel_degree_limit_mth    => 'PARALLEL_DEGREE_LIMIT_ABSOLUTE'
     ,queueing_mth                 => 'FIFO_TIMEOUT'
     ,comment                      => 'Example plan for DSS workloads that prioritizes ETL and critical DSS queries.'
     ,sub_plan                      => FALSE);
  if Not Plan_Exists('ORA$AUTOTASK_SUB_PLAN') then
    sys.dbms_resource_manager.create_plan (
      plan                         => 'ORA$AUTOTASK_SUB_PLAN'
     ,mgmt_mth                     => 'EMPHASIS'
     ,active_sess_pool_mth         => 'ACTIVE_SESS_POOL_ABSOLUTE'
     ,parallel_degree_limit_mth    => 'PARALLEL_DEGREE_LIMIT_ABSOLUTE'
     ,queueing_mth                 => 'FIFO_TIMEOUT'
     ,comment                      => 'Default sub-plan for automated maintenance tasks.  A directive to this sub-plan should be included in every top-level plan to manage the resources consumed by the automated maintenance tasks.'
     ,sub_plan                      => TRUE);
  if Not Plan_Exists('ORA$AUTOTASK_HIGH_SUB_PLAN') then
    sys.dbms_resource_manager.create_plan (
      plan                         => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,mgmt_mth                     => 'EMPHASIS'
     ,active_sess_pool_mth         => 'ACTIVE_SESS_POOL_ABSOLUTE'
     ,parallel_degree_limit_mth    => 'PARALLEL_DEGREE_LIMIT_ABSOLUTE'
     ,queueing_mth                 => 'FIFO_TIMEOUT'
     ,comment                      => 'Default sub-plan for high-priority, automated maintenance tasks.  This sub-plan is referenced by ORA$AUTOTASK_SUB_PLAN and should not be referenced directly.'
     ,sub_plan                      => TRUE);
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_HEALTH_GROUP'
     ,comment                      => 'Consumer group for health checks');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_HEALTH_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 25
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for health check tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_SQL_GROUP'
     ,comment                      => 'Consumer group for SQL tuning');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_SQL_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 25
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for SQL tuning tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_SPACE_GROUP'
     ,comment                      => 'Consumer group for space management advisors');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_SPACE_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 25
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for space management advisory tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_STATS_GROUP'
     ,comment                      => 'Consumer group for gathering optimizer statistics');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_STATS_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 25
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for gathering optimizer statistics tasks'  );
  end if;
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,switch_estimate              => FALSE
     ,mgmt_p2                      => 100
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for high-priority automated tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_URGENT_GROUP'
     ,comment                      => 'Consumer group for urgent maintenance tasks ');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_URGENT_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 100
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for urgent automated tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_MEDIUM_GROUP'
     ,comment                      => 'Consumer group for medium-priority maintenance tasks ');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_MEDIUM_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p3                      => 100
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for medium-priority automated tasks'  );
  end if;
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ETL_CRITICAL_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_SUB_PLAN'
     ,switch_estimate              => FALSE
     ,mgmt_p2                      => 3
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for Oracle automated tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'DSS_GROUP'
     ,comment                      => 'Consumer group for DSS queries');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ETL_CRITICAL_PLAN'
     ,group_or_subplan             => 'DSS_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p2                      => 10
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for DSS_GROUP'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'DSS_CRITICAL_GROUP'
     ,comment                      => 'Consumer group for critical DSS queries');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ETL_CRITICAL_PLAN'
     ,group_or_subplan             => 'DSS_CRITICAL_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p2                      => 35
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for DSS_CRITICAL_GROUP'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'BATCH_GROUP'
     ,comment                      => 'Consumer group for batch operations');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ETL_CRITICAL_PLAN'
     ,group_or_subplan             => 'BATCH_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p2                      => 10
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for BATCH_GROUP'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$DIAGNOSTICS'
     ,comment                      => 'Consumer group for diagnostics');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ETL_CRITICAL_PLAN'
     ,group_or_subplan             => 'ORA$DIAGNOSTICS'
     ,switch_estimate              => FALSE
     ,mgmt_p2                      => 3
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for Oracle diagnostics'  );
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ETL_CRITICAL_PLAN'
     ,group_or_subplan             => 'OTHER_GROUPS'
     ,switch_estimate              => FALSE
     ,mgmt_p2                      => 3
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for unclassified activity'  );
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ETL_CRITICAL_PLAN'
     ,group_or_subplan             => 'SYS_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 75
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for SYS_GROUP'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ETL_GROUP'
     ,comment                      => 'Consumer group for ETL');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ETL_CRITICAL_PLAN'
     ,group_or_subplan             => 'ETL_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p2                      => 35
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for ETL_GROUP'  );
  sys.dbms_resource_manager.submit_pending_area();
end;
/


declare

    function plan_exists(PlanName VARCHAR2) RETURN BOOLEAN is
      aPlan dba_rsrc_plans.plan%TYPE;
    begin
      begin
        Select plan
        into   aPlan
        from   dba_rsrc_plans
        where  nvl(status, 'x') <> 'PENDING'
        and    plan = PlanName;
        Return  True;
      exception
        when no_data_found then
          Return False;
      end;
    end;

begin
  sys.dbms_resource_manager.clear_pending_area();
  sys.dbms_resource_manager.create_pending_area();
  sys.dbms_resource_manager.create_plan (
      plan                         => 'INTERNAL_PLAN'
     ,mgmt_mth                     => 'EMPHASIS'
     ,active_sess_pool_mth         => 'ACTIVE_SESS_POOL_ABSOLUTE'
     ,parallel_degree_limit_mth    => 'PARALLEL_DEGREE_LIMIT_ABSOLUTE'
     ,queueing_mth                 => 'FIFO_TIMEOUT'
     ,comment                      => 'Internally-used plan for disabling the resource manager.'
     ,sub_plan                      => FALSE);
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'INTERNAL_PLAN'
     ,group_or_subplan             => 'OTHER_GROUPS'
     ,switch_estimate              => FALSE
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for all other operations'  );
  sys.dbms_resource_manager.submit_pending_area();
end;
/


declare

    function plan_exists(PlanName VARCHAR2) RETURN BOOLEAN is
      aPlan dba_rsrc_plans.plan%TYPE;
    begin
      begin
        Select plan
        into   aPlan
        from   dba_rsrc_plans
        where  nvl(status, 'x') <> 'PENDING'
        and    plan = PlanName;
        Return  True;
      exception
        when no_data_found then
          Return False;
      end;
    end;

begin
  sys.dbms_resource_manager.clear_pending_area();
  sys.dbms_resource_manager.create_pending_area();
  sys.dbms_resource_manager.create_plan (
      plan                         => 'INTERNAL_QUIESCE'
     ,mgmt_mth                     => 'EMPHASIS'
     ,active_sess_pool_mth         => 'ACTIVE_SESS_POOL_ABSOLUTE'
     ,parallel_degree_limit_mth    => 'PARALLEL_DEGREE_LIMIT_ABSOLUTE'
     ,queueing_mth                 => 'FIFO_TIMEOUT'
     ,comment                      => 'Plan for quiescing the database.  This plan cannot be activated directly.  To activate, use the quiesce command.'
     ,sub_plan                      => FALSE);
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'INTERNAL_QUIESCE'
     ,group_or_subplan             => 'OTHER_GROUPS'
     ,active_sess_pool_p1          => 0
     ,switch_estimate              => FALSE
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for all other operations'  );
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'INTERNAL_QUIESCE'
     ,group_or_subplan             => 'SYS_GROUP'
     ,switch_estimate              => FALSE
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for system operations'  );
  sys.dbms_resource_manager.submit_pending_area();
end;
/


declare

    function plan_exists(PlanName VARCHAR2) RETURN BOOLEAN is
      aPlan dba_rsrc_plans.plan%TYPE;
    begin
      begin
        Select plan
        into   aPlan
        from   dba_rsrc_plans
        where  nvl(status, 'x') <> 'PENDING'
        and    plan = PlanName;
        Return  True;
      exception
        when no_data_found then
          Return False;
      end;
    end;

begin
  sys.dbms_resource_manager.clear_pending_area();
  sys.dbms_resource_manager.create_pending_area();
  sys.dbms_resource_manager.create_plan (
      plan                         => 'MIXED_WORKLOAD_PLAN'
     ,mgmt_mth                     => 'EMPHASIS'
     ,active_sess_pool_mth         => 'ACTIVE_SESS_POOL_ABSOLUTE'
     ,parallel_degree_limit_mth    => 'PARALLEL_DEGREE_LIMIT_ABSOLUTE'
     ,queueing_mth                 => 'FIFO_TIMEOUT'
     ,comment                      => 'Example plan for a mixed workload that prioritizes interactive operations over batch operations.'
     ,sub_plan                      => FALSE);
  if Not Plan_Exists('ORA$AUTOTASK_SUB_PLAN') then
    sys.dbms_resource_manager.create_plan (
      plan                         => 'ORA$AUTOTASK_SUB_PLAN'
     ,mgmt_mth                     => 'EMPHASIS'
     ,active_sess_pool_mth         => 'ACTIVE_SESS_POOL_ABSOLUTE'
     ,parallel_degree_limit_mth    => 'PARALLEL_DEGREE_LIMIT_ABSOLUTE'
     ,queueing_mth                 => 'FIFO_TIMEOUT'
     ,comment                      => 'Default sub-plan for automated maintenance tasks.  A directive to this sub-plan should be included in every top-level plan to manage the resources consumed by the automated maintenance tasks.'
     ,sub_plan                      => TRUE);
  if Not Plan_Exists('ORA$AUTOTASK_HIGH_SUB_PLAN') then
    sys.dbms_resource_manager.create_plan (
      plan                         => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,mgmt_mth                     => 'EMPHASIS'
     ,active_sess_pool_mth         => 'ACTIVE_SESS_POOL_ABSOLUTE'
     ,parallel_degree_limit_mth    => 'PARALLEL_DEGREE_LIMIT_ABSOLUTE'
     ,queueing_mth                 => 'FIFO_TIMEOUT'
     ,comment                      => 'Default sub-plan for high-priority, automated maintenance tasks.  This sub-plan is referenced by ORA$AUTOTASK_SUB_PLAN and should not be referenced directly.'
     ,sub_plan                      => TRUE);
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_HEALTH_GROUP'
     ,comment                      => 'Consumer group for health checks');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_HEALTH_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 25
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for health check tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_SQL_GROUP'
     ,comment                      => 'Consumer group for SQL tuning');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_SQL_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 25
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for SQL tuning tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_SPACE_GROUP'
     ,comment                      => 'Consumer group for space management advisors');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_SPACE_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 25
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for space management advisory tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_STATS_GROUP'
     ,comment                      => 'Consumer group for gathering optimizer statistics');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_STATS_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 25
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for gathering optimizer statistics tasks'  );
  end if;
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_HIGH_SUB_PLAN'
     ,switch_estimate              => FALSE
     ,mgmt_p2                      => 100
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for high-priority automated tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_URGENT_GROUP'
     ,comment                      => 'Consumer group for urgent maintenance tasks ');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_URGENT_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 100
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for urgent automated tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$AUTOTASK_MEDIUM_GROUP'
     ,comment                      => 'Consumer group for medium-priority maintenance tasks ');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'ORA$AUTOTASK_SUB_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_MEDIUM_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p3                      => 100
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for medium-priority automated tasks'  );
  end if;
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'MIXED_WORKLOAD_PLAN'
     ,group_or_subplan             => 'ORA$AUTOTASK_SUB_PLAN'
     ,switch_estimate              => FALSE
     ,mgmt_p2                      => 5
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for automated maintenance tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'BATCH_GROUP'
     ,comment                      => 'Consumer group for batch operations');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'MIXED_WORKLOAD_PLAN'
     ,group_or_subplan             => 'BATCH_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p3                      => 100
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for batch operations'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'ORA$DIAGNOSTICS'
     ,comment                      => 'Consumer group for diagnostics');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'MIXED_WORKLOAD_PLAN'
     ,group_or_subplan             => 'ORA$DIAGNOSTICS'
     ,switch_estimate              => FALSE
     ,mgmt_p2                      => 5
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for automated diagnostic tasks'  );
  sys.dbms_resource_manager.create_consumer_group (
      consumer_group               => 'INTERACTIVE_GROUP'
     ,comment                      => 'Consumer group for interactive, OLTP operations');
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'MIXED_WORKLOAD_PLAN'
     ,group_or_subplan             => 'INTERACTIVE_GROUP'
     ,switch_group                 => 'BATCH_GROUP'
     ,switch_time                  => 60
     ,switch_estimate              => FALSE
     ,mgmt_p2                      => 85
     ,switch_for_call              => TRUE
     ,comment                      => 'Directive for interactive operations'  );
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'MIXED_WORKLOAD_PLAN'
     ,group_or_subplan             => 'OTHER_GROUPS'
     ,switch_estimate              => FALSE
     ,mgmt_p2                      => 5
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for all other operations'  );
  sys.dbms_resource_manager.create_plan_directive (
      plan                         => 'MIXED_WORKLOAD_PLAN'
     ,group_or_subplan             => 'SYS_GROUP'
     ,switch_estimate              => FALSE
     ,mgmt_p1                      => 75
     ,switch_for_call              => FALSE
     ,comment                      => 'Directive for system operations'  );
  sys.dbms_resource_manager.submit_pending_area();
end;
/


CREATE USER ANONYMOUS
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE SYSAUX
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  PASSWORD EXPIRE
  ACCOUNT LOCK;
  -- 1 System Privilege for ANONYMOUS 
  GRANT CREATE SESSION TO ANONYMOUS;
  -- 2 Object Privileges for ANONYMOUS 
    GRANT EXECUTE ON APEX_030200.WWV_FLOW_EPG_INCLUDE_MODULES TO ANONYMOUS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, FLASHBACK ON FLOWS_FILES.WWV_FLOW_FILE_OBJECTS$ TO ANONYMOUS;


CREATE USER APEX_PUBLIC_USER
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE USERS
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  PASSWORD EXPIRE
  ACCOUNT LOCK;
  -- 1 System Privilege for APEX_PUBLIC_USER 
  GRANT CREATE SESSION TO APEX_PUBLIC_USER;
  -- 1 Object Privilege for APEX_PUBLIC_USER 
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, FLASHBACK ON FLOWS_FILES.WWV_FLOW_FILE_OBJECTS$ TO APEX_PUBLIC_USER;


CREATE USER APEX_030200
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE SYSAUX
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  PASSWORD EXPIRE
  ACCOUNT LOCK;
  -- 2 Roles for APEX_030200 
  GRANT CONNECT TO APEX_030200 WITH ADMIN OPTION;
  GRANT RESOURCE TO APEX_030200 WITH ADMIN OPTION;
  ALTER USER APEX_030200 DEFAULT ROLE ALL;
  -- 26 System Privileges for APEX_030200 
  GRANT ALTER DATABASE TO APEX_030200;
  GRANT ALTER SESSION TO APEX_030200;
  GRANT ALTER SYSTEM TO APEX_030200;
  GRANT ALTER USER TO APEX_030200;
  GRANT CREATE ANY CONTEXT TO APEX_030200 WITH ADMIN OPTION;
  GRANT CREATE CLUSTER TO APEX_030200 WITH ADMIN OPTION;
  GRANT CREATE DIMENSION TO APEX_030200 WITH ADMIN OPTION;
  GRANT CREATE INDEXTYPE TO APEX_030200 WITH ADMIN OPTION;
  GRANT CREATE JOB TO APEX_030200 WITH ADMIN OPTION;
  GRANT CREATE MATERIALIZED VIEW TO APEX_030200 WITH ADMIN OPTION;
  GRANT CREATE OPERATOR TO APEX_030200 WITH ADMIN OPTION;
  GRANT CREATE PROCEDURE TO APEX_030200 WITH ADMIN OPTION;
  GRANT CREATE PUBLIC SYNONYM TO APEX_030200;
  GRANT CREATE ROLE TO APEX_030200;
  GRANT CREATE SEQUENCE TO APEX_030200 WITH ADMIN OPTION;
  GRANT CREATE SYNONYM TO APEX_030200 WITH ADMIN OPTION;
  GRANT CREATE TABLE TO APEX_030200 WITH ADMIN OPTION;
  GRANT CREATE TABLESPACE TO APEX_030200;
  GRANT CREATE TRIGGER TO APEX_030200 WITH ADMIN OPTION;
  GRANT CREATE TYPE TO APEX_030200 WITH ADMIN OPTION;
  GRANT CREATE USER TO APEX_030200;
  GRANT CREATE VIEW TO APEX_030200 WITH ADMIN OPTION;
  GRANT DROP PUBLIC SYNONYM TO APEX_030200;
  GRANT DROP TABLESPACE TO APEX_030200;
  GRANT DROP USER TO APEX_030200;
  GRANT UNLIMITED TABLESPACE TO APEX_030200 WITH ADMIN OPTION;
  -- 96 Object Privileges for APEX_030200 
    GRANT EXECUTE ON CTXSYS.CTX_DDL TO APEX_030200 WITH GRANT OPTION;
    GRANT EXECUTE ON CTXSYS.CTX_DOC TO APEX_030200 WITH GRANT OPTION;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, FLASHBACK ON FLOWS_FILES.WWV_FLOW_FILE_OBJECTS$ TO APEX_030200 WITH GRANT OPTION;
    GRANT SELECT ON SYS.ALL_COL_COMMENTS TO APEX_030200;
    GRANT SELECT ON SYS.ALL_CONS_COLUMNS TO APEX_030200;
    GRANT SELECT ON SYS.ALL_CONSTRAINTS TO APEX_030200;
    GRANT SELECT ON SYS.ALL_DEPENDENCIES TO APEX_030200;
    GRANT SELECT ON SYS.ALL_ERRORS TO APEX_030200;
    GRANT SELECT ON SYS.ALL_IND_COLUMNS TO APEX_030200;
    GRANT SELECT ON SYS.ALL_OBJECTS TO APEX_030200;
    GRANT SELECT ON SYS.ALL_SEQUENCES TO APEX_030200;
    GRANT SELECT ON SYS.ALL_SYNONYMS TO APEX_030200;
    GRANT SELECT ON SYS.ALL_TAB_COLUMNS TO APEX_030200;
    GRANT SELECT ON SYS.ALL_TAB_COMMENTS TO APEX_030200;
    GRANT SELECT ON SYS.ALL_TABLES TO APEX_030200;
    GRANT SELECT ON SYS.ALL_TRIGGERS TO APEX_030200;
    GRANT SELECT ON SYS.ALL_USERS TO APEX_030200;
    GRANT SELECT ON SYS.ALL_VIEWS TO APEX_030200;
    GRANT SELECT ON SYS.ARGUMENT$ TO APEX_030200;
    GRANT SELECT ON SYS.DBA_ARGUMENTS TO APEX_030200;
    GRANT SELECT ON SYS.DBA_COL_COMMENTS TO APEX_030200;
    GRANT SELECT ON SYS.DBA_COL_PRIVS TO APEX_030200;
    GRANT SELECT ON SYS.DBA_CONS_COLUMNS TO APEX_030200;
    GRANT SELECT ON SYS.DBA_CONSTRAINTS TO APEX_030200;
    GRANT SELECT ON SYS.DBA_DATA_FILES TO APEX_030200;
    GRANT SELECT ON SYS.DBA_DB_LINKS TO APEX_030200;
    GRANT SELECT ON SYS.DBA_DEPENDENCIES TO APEX_030200;
    GRANT SELECT ON SYS.DBA_ERRORS TO APEX_030200;
    GRANT SELECT ON SYS.DBA_EXTENTS TO APEX_030200;
    GRANT SELECT ON SYS.DBA_FEATURE_USAGE_STATISTICS TO APEX_030200;
    GRANT SELECT ON SYS.DBA_FREE_SPACE TO APEX_030200;
    GRANT SELECT ON SYS.DBA_IND_COLUMNS TO APEX_030200;
    GRANT SELECT ON SYS.DBA_INDEXES TO APEX_030200;
    GRANT SELECT ON SYS.DBA_IND_EXPRESSIONS TO APEX_030200;
    GRANT SELECT ON SYS.DBA_JOBS TO APEX_030200;
    GRANT SELECT ON SYS.DBA_LOCK TO APEX_030200;
    GRANT SELECT ON SYS.DBA_OBJECTS TO APEX_030200;
    GRANT SELECT ON SYS.DBA_PROCEDURES TO APEX_030200;
    GRANT SELECT ON SYS.DBA_PROFILES TO APEX_030200;
    GRANT SELECT ON SYS.DBA_RECYCLEBIN TO APEX_030200;
    GRANT SELECT ON SYS.DBA_ROLE_PRIVS TO APEX_030200;
    GRANT SELECT ON SYS.DBA_ROLLBACK_SEGS TO APEX_030200;
    GRANT SELECT ON SYS.DBA_RSRC_PLAN_DIRECTIVES TO APEX_030200;
    GRANT SELECT ON SYS.DBA_SEGMENTS TO APEX_030200;
    GRANT SELECT ON SYS.DBA_SEQUENCES TO APEX_030200;
    GRANT SELECT ON SYS.DBA_SNAPSHOTS TO APEX_030200;
    GRANT SELECT ON SYS.DBA_SOURCE TO APEX_030200;
    GRANT SELECT ON SYS.DBA_SYNONYMS TO APEX_030200;
    GRANT SELECT ON SYS.DBA_SYS_PRIVS TO APEX_030200;
    GRANT SELECT ON SYS.DBA_TAB_COLUMNS TO APEX_030200;
    GRANT SELECT ON SYS.DBA_TAB_COMMENTS TO APEX_030200;
    GRANT SELECT ON SYS.DBA_TABLES TO APEX_030200;
    GRANT SELECT ON SYS.DBA_TABLESPACES TO APEX_030200;
    GRANT SELECT ON SYS.DBA_TAB_PRIVS TO APEX_030200;
    GRANT SELECT ON SYS.DBA_TRIGGER_COLS TO APEX_030200;
    GRANT SELECT ON SYS.DBA_TRIGGERS TO APEX_030200;
    GRANT SELECT ON SYS.DBA_TYPES TO APEX_030200;
    GRANT SELECT ON SYS.DBA_USERS TO APEX_030200;
    GRANT SELECT ON SYS.DBA_VIEWS TO APEX_030200;
    GRANT EXECUTE ON SYS.DBMS_CRYPTO TO APEX_030200;
    GRANT EXECUTE ON SYS.DBMS_FLASHBACK TO APEX_030200;
    GRANT EXECUTE ON SYS.DBMS_JOB TO APEX_030200;
    GRANT EXECUTE ON SYS.DBMS_LOB TO APEX_030200;
    GRANT EXECUTE ON SYS.DBMS_LOCK TO APEX_030200;
    GRANT EXECUTE ON SYS.DBMS_OBFUSCATION_TOOLKIT TO APEX_030200;
    GRANT EXECUTE ON SYS.DBMS_RANDOM TO APEX_030200;
    GRANT EXECUTE ON SYS.DBMS_REGISTRY TO APEX_030200;
    GRANT EXECUTE ON SYS.DBMS_RLS TO APEX_030200 WITH GRANT OPTION;
    GRANT SELECT ON SYS.OBJ$ TO APEX_030200;
    GRANT SELECT ON SYS.SEG$ TO APEX_030200;
    GRANT SELECT ON SYS.TS$ TO APEX_030200;
    GRANT SELECT ON SYS.USER$ TO APEX_030200;
    GRANT SELECT ON SYS.USER_ROLE_PRIVS TO APEX_030200;
    GRANT SELECT ON SYS.USER_SYS_PRIVS TO APEX_030200;
    GRANT EXECUTE ON SYS.UTL_FILE TO APEX_030200;
    GRANT EXECUTE ON SYS.UTL_HTTP TO APEX_030200;
    GRANT EXECUTE ON SYS.UTL_SMTP TO APEX_030200;
    GRANT SELECT ON SYS.V_$DATABASE TO APEX_030200;
    GRANT SELECT ON SYS.V_$INSTANCE TO APEX_030200;
    GRANT SELECT ON SYS.V_$LOCKED_OBJECT TO APEX_030200;
    GRANT SELECT ON SYS.V_$MYSTAT TO APEX_030200;
    GRANT SELECT ON SYS.V_$OPEN_CURSOR TO APEX_030200;
    GRANT SELECT ON SYS.V_$PARAMETER TO APEX_030200;
    GRANT SELECT ON SYS.V_$PROCESS TO APEX_030200;
    GRANT SELECT ON SYS.V_$SESS_IO TO APEX_030200;
    GRANT SELECT ON SYS.V_$SESSION TO APEX_030200;
    GRANT SELECT ON SYS.V_$SESSION_WAIT TO APEX_030200;
    GRANT SELECT ON SYS.V_$SESSTAT TO APEX_030200;
    GRANT SELECT ON SYS.V_$SQL TO APEX_030200;
    GRANT SELECT ON SYS.V_$SQL_PLAN TO APEX_030200;
    GRANT SELECT ON SYS.V_$STATNAME TO APEX_030200;
    GRANT SELECT ON SYS.V_$SYSSTAT TO APEX_030200;
    GRANT SELECT ON SYS.V_$TIMER TO APEX_030200;
    GRANT EXECUTE ON SYS.WWV_DBMS_SQL TO APEX_030200;
    GRANT EXECUTE ON SYS.WWV_FLOW_KEY TO APEX_030200;
    GRANT EXECUTE ON SYS.WWV_FLOW_VAL TO APEX_030200;


CREATE USER APPQOSSYS
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE SYSAUX
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  PASSWORD EXPIRE
  ACCOUNT LOCK;
  -- 3 System Privileges for APPQOSSYS 
  BEGIN
SYS.DBMS_RESOURCE_MANAGER_PRIVS.GRANT_SYSTEM_PRIVILEGE
  (GRANTEE_NAME   => 'APPQOSSYS', 
   PRIVILEGE_NAME => 'ADMINISTER_RESOURCE_MANAGER',
   ADMIN_OPTION   => FALSE);
END;
/
  GRANT ALTER SESSION TO APPQOSSYS;
  GRANT CREATE SESSION TO APPQOSSYS;
  -- 1 Tablespace Quota for APPQOSSYS 
  ALTER USER APPQOSSYS QUOTA UNLIMITED ON SYSAUX;
  -- 8 Object Privileges for APPQOSSYS 
    GRANT SELECT ON SYS.DBA_RSRC_CONSUMER_GROUPS TO APPQOSSYS;
    GRANT SELECT ON SYS.DBA_RSRC_GROUP_MAPPINGS TO APPQOSSYS;
    GRANT EXECUTE ON SYS.DBMS_WLM TO APPQOSSYS;
    GRANT SELECT ON SYS.V_$LICENSE TO APPQOSSYS;
    GRANT SELECT ON SYS.V_$OSSTAT TO APPQOSSYS;
    GRANT SELECT ON SYS.V_$PROCESS TO APPQOSSYS;
    GRANT SELECT ON SYS.V_$SESSION TO APPQOSSYS;
    GRANT SELECT ON SYS.V_$WLM_PCMETRIC TO APPQOSSYS;


CREATE USER CTXSYS
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE SYSAUX
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  PASSWORD EXPIRE
  ACCOUNT LOCK;
  -- 2 Roles for CTXSYS 
  GRANT CTXAPP TO CTXSYS WITH ADMIN OPTION;
  GRANT RESOURCE TO CTXSYS;
  ALTER USER CTXSYS DEFAULT ROLE ALL;
  -- 7 System Privileges for CTXSYS 
  GRANT ALTER SESSION TO CTXSYS;
  GRANT CREATE PUBLIC SYNONYM TO CTXSYS;
  GRANT CREATE SESSION TO CTXSYS;
  GRANT CREATE SYNONYM TO CTXSYS;
  GRANT CREATE VIEW TO CTXSYS;
  GRANT DROP PUBLIC SYNONYM TO CTXSYS;
  GRANT UNLIMITED TABLESPACE TO CTXSYS;
  -- 52 Object Privileges for CTXSYS 
    GRANT SELECT ON SYS.ARGUMENT$ TO CTXSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.CCOL$ TO CTXSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.CDEF$ TO CTXSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.COL$ TO CTXSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.COLTYPE$ TO CTXSYS;
    GRANT SELECT ON SYS.CON$ TO CTXSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.DBA_COLL_TYPES TO CTXSYS;
    GRANT SELECT ON SYS.DBA_CONS_COLUMNS TO CTXSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.DBA_CONSTRAINTS TO CTXSYS;
    GRANT SELECT ON SYS.DBA_DB_LINKS TO CTXSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.DBA_INDEXTYPES TO CTXSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.DBA_JOBS TO CTXSYS;
    GRANT SELECT ON SYS.DBA_JOBS_RUNNING TO CTXSYS;
    GRANT SELECT ON SYS.DBA_OBJECTS TO CTXSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.DBA_ROLE_PRIVS TO CTXSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.DBA_ROLES TO CTXSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.DBA_SYNONYMS TO CTXSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.DBA_SYS_PRIVS TO CTXSYS;
    GRANT SELECT ON SYS.DBA_TAB_COLS TO CTXSYS;
    GRANT SELECT ON SYS.DBA_TAB_COLUMNS TO CTXSYS;
    GRANT SELECT ON SYS.DBA_TABLES TO CTXSYS;
    GRANT SELECT ON SYS.DBA_TAB_PARTITIONS TO CTXSYS;
    GRANT SELECT ON SYS.DBA_TAB_PRIVS TO CTXSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.DBA_TYPE_ATTRS TO CTXSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.DBA_TYPES TO CTXSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.DBA_USERS TO CTXSYS;
    GRANT EXECUTE ON SYS.DBMS_LOCK TO CTXSYS;
    GRANT EXECUTE ON SYS.DBMS_PIPE TO CTXSYS;
    GRANT EXECUTE ON SYS.DBMS_REGISTRY TO CTXSYS;
    GRANT SELECT ON SYS.GV_$DB_OBJECT_CACHE TO CTXSYS;
    GRANT SELECT ON SYS.GV_$PARAMETER TO CTXSYS;
    GRANT SELECT ON SYS.HIST_HEAD$ TO CTXSYS;
    GRANT SELECT ON SYS.ICOL$ TO CTXSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.IND$ TO CTXSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.INDPART$ TO CTXSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.LOB$ TO CTXSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.LOBFRAG$ TO CTXSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.OBJ$ TO CTXSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.PARTOBJ$ TO CTXSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.SNAP$ TO CTXSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.SYN$ TO CTXSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.SYSAUTH$ TO CTXSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.TAB$ TO CTXSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.TABPART$ TO CTXSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.TS$ TO CTXSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.USER$ TO CTXSYS WITH GRANT OPTION;
    GRANT EXECUTE ON SYS.VALIDATE_CONTEXT TO CTXSYS;
    GRANT SELECT ON SYS.VIEW$ TO CTXSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.V_$PARAMETER TO CTXSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.V_$RESOURCE TO CTXSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.V_$SESSION TO CTXSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.V_$THREAD TO CTXSYS WITH GRANT OPTION;


CREATE USER DIP
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE USERS
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  PASSWORD EXPIRE
  ACCOUNT LOCK;
  -- 1 System Privilege for DIP 
  GRANT CREATE SESSION TO DIP;


CREATE USER EXFSYS
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE SYSAUX
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  PASSWORD EXPIRE
  ACCOUNT LOCK;
  -- 1 Role for EXFSYS 
  GRANT RESOURCE TO EXFSYS;
  ALTER USER EXFSYS DEFAULT ROLE ALL;
  -- 9 System Privileges for EXFSYS 
  GRANT ADMINISTER DATABASE TRIGGER TO EXFSYS;
  GRANT CREATE ANY TRIGGER TO EXFSYS;
  GRANT CREATE INDEXTYPE TO EXFSYS;
  GRANT CREATE JOB TO EXFSYS;
  GRANT CREATE LIBRARY TO EXFSYS;
  GRANT CREATE OPERATOR TO EXFSYS;
  GRANT CREATE SESSION TO EXFSYS;
  GRANT MANAGE SCHEDULER TO EXFSYS;
  GRANT UNLIMITED TABLESPACE TO EXFSYS;
  -- 8 Object Privileges for EXFSYS 
    GRANT SELECT ON SYS.DBA_TAB_COLUMNS TO EXFSYS;
    GRANT EXECUTE ON SYS.DBMS_CHANGE_NOTIFICATION TO EXFSYS;
    GRANT EXECUTE ON SYS.DBMS_JOB TO EXFSYS;
    GRANT EXECUTE ON SYS.DBMS_LOCK TO EXFSYS;
    GRANT EXECUTE ON SYS.DBMS_REGISTRY TO EXFSYS;
    GRANT EXECUTE ON SYS.DBMS_SCHEDULER TO EXFSYS;
    GRANT EXECUTE ON SYS.DBMS_SYS_ERROR TO EXFSYS;
    GRANT EXECUTE ON SYS.EXF$DBMS_EXPFIL_SYSPACK TO EXFSYS;


CREATE USER FLOWS_FILES
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE SYSAUX
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  PASSWORD EXPIRE
  ACCOUNT LOCK;
  -- 1 System Privilege for FLOWS_FILES 
  GRANT CREATE SYNONYM TO FLOWS_FILES;
  -- 1 Tablespace Quota for FLOWS_FILES 
  ALTER USER FLOWS_FILES QUOTA UNLIMITED ON SYSAUX;
  -- 6 Object Privileges for FLOWS_FILES 
    GRANT EXECUTE ON APEX_030200.WWV_FLOW TO FLOWS_FILES;
    GRANT SELECT ON APEX_030200.WWV_FLOW_COMPANIES TO FLOWS_FILES;
  GRANT REFERENCES (PROVISIONING_COMPANY_ID) ON APEX_030200.WWV_FLOW_COMPANIES TO FLOWS_FILES;
    GRANT EXECUTE ON APEX_030200.WWV_FLOW_FILE_API TO FLOWS_FILES;
    GRANT EXECUTE ON APEX_030200.WWV_FLOW_FILE_OBJECT_ID TO FLOWS_FILES;
    GRANT EXECUTE ON APEX_030200.WWV_FLOW_ID TO FLOWS_FILES;
    GRANT EXECUTE ON APEX_030200.WWV_FLOW_SECURITY TO FLOWS_FILES;


CREATE USER MDDATA
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE USERS
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  PASSWORD EXPIRE
  ACCOUNT LOCK;
  -- 2 Roles for MDDATA 
  GRANT CONNECT TO MDDATA;
  GRANT RESOURCE TO MDDATA;
  ALTER USER MDDATA DEFAULT ROLE ALL;
  -- 1 System Privilege for MDDATA 
  GRANT UNLIMITED TABLESPACE TO MDDATA;


CREATE USER MDSYS
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE SYSAUX
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  PASSWORD EXPIRE
  ACCOUNT LOCK;
  -- 2 Roles for MDSYS 
  GRANT CONNECT TO MDSYS;
  GRANT RESOURCE TO MDSYS;
  ALTER USER MDSYS DEFAULT ROLE ALL;
  -- 19 System Privileges for MDSYS 
  GRANT ALTER ANY TABLE TO MDSYS;
  GRANT CREATE ANY TRIGGER TO MDSYS;
  GRANT CREATE INDEXTYPE TO MDSYS;
  GRANT CREATE LIBRARY TO MDSYS;
  GRANT CREATE OPERATOR TO MDSYS;
  GRANT CREATE PROCEDURE TO MDSYS;
  GRANT CREATE PUBLIC SYNONYM TO MDSYS;
  GRANT CREATE SEQUENCE TO MDSYS;
  GRANT CREATE SESSION TO MDSYS;
  GRANT CREATE TABLE TO MDSYS;
  GRANT CREATE TYPE TO MDSYS;
  GRANT CREATE VIEW TO MDSYS;
  GRANT DELETE ANY TABLE TO MDSYS;
  GRANT DROP ANY TRIGGER TO MDSYS;
  GRANT DROP PUBLIC SYNONYM TO MDSYS;
  GRANT FLASHBACK ANY TABLE TO MDSYS;
  GRANT SELECT ANY TABLE TO MDSYS;
  GRANT UNLIMITED TABLESPACE TO MDSYS;
  GRANT UPDATE ANY TABLE TO MDSYS;
  -- 27 Object Privileges for MDSYS 
    GRANT SELECT ON SYS.DBA_ALL_TABLES TO MDSYS;
    GRANT SELECT ON SYS.DBA_CONS_COLUMNS TO MDSYS;
    GRANT SELECT ON SYS.DBA_CONSTRAINTS TO MDSYS;
    GRANT SELECT ON SYS.DBA_IND_COLUMNS TO MDSYS;
    GRANT SELECT ON SYS.DBA_INDEXES TO MDSYS;
    GRANT SELECT ON SYS.DBA_JAVA_CLASSES TO MDSYS;
    GRANT SELECT ON SYS.DBA_OBJECTS TO MDSYS;
    GRANT SELECT ON SYS.DBA_OBJECT_TABLES TO MDSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.DBA_REGISTRY TO MDSYS;
    GRANT SELECT ON SYS.DBA_ROLE_PRIVS TO MDSYS;
    GRANT SELECT ON SYS.DBA_SYNONYMS TO MDSYS;
    GRANT SELECT ON SYS.DBA_TAB_COLUMNS TO MDSYS;
    GRANT SELECT ON SYS.DBA_TABLES TO MDSYS;
    GRANT SELECT ON SYS.DBA_TABLESPACES TO MDSYS;
    GRANT SELECT ON SYS.DBA_TAB_PRIVS TO MDSYS;
    GRANT SELECT ON SYS.DBA_TRIGGERS TO MDSYS;
    GRANT SELECT ON SYS.DBA_TYPE_ATTRS TO MDSYS;
    GRANT SELECT ON SYS.DBA_TYPES TO MDSYS;
    GRANT SELECT ON SYS.DBA_VIEWS TO MDSYS WITH GRANT OPTION;
    GRANT EXECUTE ON SYS.DBMS_LOCK TO MDSYS;
    GRANT EXECUTE ON SYS.DBMS_REGISTRY TO MDSYS;
    GRANT EXECUTE ON SYS.DBMS_SYSTEM TO MDSYS;
    GRANT DELETE, INSERT ON SYS.EXPDEPACT$ TO MDSYS;
    GRANT DELETE, INSERT ON SYS.EXPDEPOBJ$ TO MDSYS;
    GRANT DELETE, INSERT ON SYS.EXPPKGACT$ TO MDSYS;
    GRANT DELETE, INSERT ON SYS.EXPPKGOBJ$ TO MDSYS;
    GRANT SELECT ON SYS.KOPM$ TO MDSYS;
  -- 5 Java Privileges for MDSYS 
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'MDSYS'
    ,permission_type   => 'SYS:java.io.FilePermission'
    ,permission_name   => 'md/jlib/*'
    ,permission_action => 'read'
    ,key               => KEYNUM
    );
  SYS.DBMS_JAVA.DISABLE_PERMISSION
    (key => KEYNUM);
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'MDSYS'
    ,permission_type   => 'SYS:java.io.FilePermission'
    ,permission_name   => 'sdo/demo/georaster/jlibs/*'
    ,permission_action => 'read'
    ,key               => KEYNUM
    );
  SYS.DBMS_JAVA.DISABLE_PERMISSION
    (key => KEYNUM);
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'MDSYS'
    ,permission_type   => 'SYS:java.io.FilePermission'
    ,permission_name   => 'md\jlib\*'
    ,permission_action => 'read'
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'MDSYS'
    ,permission_type   => 'SYS:java.io.FilePermission'
    ,permission_name   => 'sdo\demo\georaster\jlibs\*'
    ,permission_action => 'read'
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'MDSYS'
    ,permission_type   => 'SYS:java.lang.RuntimePermission'
    ,permission_name   => 'getClassLoader'
    ,permission_action => ''
    ,key               => KEYNUM
    );
END;
/


CREATE USER MGMT_VIEW
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE SYSTEM
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  ACCOUNT LOCK;
  -- 1 Role for MGMT_VIEW 
  GRANT MGMT_USER TO MGMT_VIEW;
  ALTER USER MGMT_VIEW DEFAULT ROLE ALL;
  -- 4 Object Privileges for MGMT_VIEW 
    GRANT EXECUTE ON SYSMAN.MGMT_IP_TGT_GUID_ARRAY TO MGMT_VIEW;
    GRANT SELECT ON SYSMAN.MGMT_MESSAGES TO MGMT_VIEW;
    GRANT EXECUTE ON SYSMAN.MGMT_VIEW_UTIL TO MGMT_VIEW;
    GRANT EXECUTE ON SYSMAN.SETEMVIEWUSERCONTEXT TO MGMT_VIEW;


CREATE USER OLAPSYS
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE SYSAUX
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  PASSWORD EXPIRE
  ACCOUNT LOCK;
  -- 2 Roles for OLAPSYS 
  GRANT OLAP_DBA TO OLAPSYS;
  GRANT RESOURCE TO OLAPSYS;
  ALTER USER OLAPSYS DEFAULT ROLE ALL;
  -- 13 System Privileges for OLAPSYS 
  GRANT CREATE ANY DIMENSION TO OLAPSYS;
  GRANT CREATE ANY SYNONYM TO OLAPSYS;
  GRANT CREATE PROCEDURE TO OLAPSYS;
  GRANT CREATE PUBLIC SYNONYM TO OLAPSYS;
  GRANT CREATE SEQUENCE TO OLAPSYS;
  GRANT CREATE TABLE TO OLAPSYS;
  GRANT CREATE VIEW TO OLAPSYS;
  GRANT DROP ANY DIMENSION TO OLAPSYS;
  GRANT DROP ANY SYNONYM TO OLAPSYS;
  GRANT DROP PUBLIC SYNONYM TO OLAPSYS;
  GRANT SELECT ANY DICTIONARY TO OLAPSYS;
  GRANT SELECT ANY TABLE TO OLAPSYS;
  GRANT UNLIMITED TABLESPACE TO OLAPSYS;
  -- 1 Tablespace Quota for OLAPSYS 
  ALTER USER OLAPSYS QUOTA UNLIMITED ON SYSAUX;
  -- 34 Object Privileges for OLAPSYS 
    GRANT SELECT ON SYS.ALL_AW_PROP_NAME TO OLAPSYS;
    GRANT SELECT ON SYS.ALL_AWS TO OLAPSYS;
    GRANT SELECT ON SYS.AW$ TO OLAPSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.AW_PROP$ TO OLAPSYS;
    GRANT SELECT ON SYS.CCOL$ TO OLAPSYS;
    GRANT SELECT ON SYS.CDEF$ TO OLAPSYS;
    GRANT SELECT ON SYS.COL$ TO OLAPSYS;
    GRANT SELECT ON SYS.CON$ TO OLAPSYS;
    GRANT SELECT ON SYS.DBA_CONSTRAINTS TO OLAPSYS;
    GRANT SELECT ON SYS.DBA_OBJECTS TO OLAPSYS;
    GRANT SELECT ON SYS.DBA_ROLE_PRIVS TO OLAPSYS;
    GRANT SELECT ON SYS.DBA_ROLES TO OLAPSYS;
    GRANT SELECT ON SYS.DBA_TABLES TO OLAPSYS;
    GRANT SELECT ON SYS.DBA_USERS TO OLAPSYS;
    GRANT EXECUTE ON SYS.DBMS_AW_LIB TO OLAPSYS;
    GRANT EXECUTE ON SYS.DBMS_LOCK TO OLAPSYS;
    GRANT EXECUTE ON SYS.DBMS_REGISTRY TO OLAPSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.DEPENDENCY$ TO OLAPSYS;
    GRANT SELECT ON SYS.DIM$ TO OLAPSYS;
    GRANT SELECT ON SYS.DIMATTR$ TO OLAPSYS;
    GRANT SELECT ON SYS.DIMJOINKEY$ TO OLAPSYS;
    GRANT SELECT ON SYS.DIMLEVEL$ TO OLAPSYS;
    GRANT SELECT ON SYS.DIMLEVELKEY$ TO OLAPSYS;
    GRANT SELECT ON SYS.HIER$ TO OLAPSYS;
    GRANT SELECT ON SYS.HIERLEVEL$ TO OLAPSYS;
    GRANT SELECT ON SYS.OBJ$ TO OLAPSYS;
    GRANT SELECT ON SYS.OBJAUTH$ TO OLAPSYS;
    GRANT SELECT ON SYS.SYN$ TO OLAPSYS;
    GRANT SELECT ON SYS.SYSAUTH$ TO OLAPSYS;
    GRANT SELECT ON SYS.V_$ENABLEDPRIVS TO OLAPSYS;
    GRANT SELECT ON SYS.VIEW$ TO OLAPSYS;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SYSTEM.MVIEW$_ADV_INDEX TO OLAPSYS;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SYSTEM.MVIEW$_ADV_OUTPUT TO OLAPSYS;
    GRANT DELETE, INSERT, SELECT, UPDATE ON SYSTEM.MVIEW$_ADV_PARTITION TO OLAPSYS;


CREATE USER ORACLE_OCM
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE USERS
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  PASSWORD EXPIRE
  ACCOUNT LOCK;
  -- 1 System Privilege for ORACLE_OCM 
  GRANT SELECT ANY DICTIONARY TO ORACLE_OCM;
  -- 3 Object Privileges for ORACLE_OCM 
    GRANT EXECUTE ON SYS.DBMS_SCHEDULER TO ORACLE_OCM;
    GRANT READ, WRITE ON DIRECTORY ORACLE_OCM_CONFIG_DIR TO ORACLE_OCM;
    GRANT EXECUTE ON SYS.UTL_FILE TO ORACLE_OCM;


CREATE USER ORDDATA
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE SYSAUX
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  PASSWORD EXPIRE
  ACCOUNT LOCK;
  -- 1 System Privilege for ORDDATA 
  GRANT UNLIMITED TABLESPACE TO ORDDATA;


CREATE USER ORDPLUGINS
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE SYSAUX
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  PASSWORD EXPIRE
  ACCOUNT LOCK;
  -- 2 Object Privileges for ORDPLUGINS 
    GRANT EXECUTE ON ORDSYS.ORDIMERRORCODES TO ORDPLUGINS;
    GRANT EXECUTE ON ORDSYS.ORDUTIL_PRV TO ORDPLUGINS;


CREATE USER ORDSYS
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE SYSAUX
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  PASSWORD EXPIRE
  ACCOUNT LOCK;
  -- 1 Role for ORDSYS 
  GRANT JAVAUSERPRIV TO ORDSYS;
  ALTER USER ORDSYS DEFAULT ROLE ALL;
  -- 1 System Privilege for ORDSYS 
  GRANT UNLIMITED TABLESPACE TO ORDSYS;
  -- 116 Object Privileges for ORDSYS 
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_ANON_ACTION_TYPES TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_ANON_ATTRS TO ORDSYS;
    GRANT ALTER, SELECT ON ORDDATA.ORDDCM_ANON_ATTRS_SEQ TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_ANON_ATTRS_TMP TO ORDSYS;
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON ORDDATA.ORDDCM_ANON_ATTRS_USR TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_ANON_ATTRS_WRK TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_ANON_RULES TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_ANON_RULES_TMP TO ORDSYS;
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON ORDDATA.ORDDCM_ANON_RULES_USR TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_ANON_RULES_WRK TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_ANON_RULE_TYPES TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_CT_ACTION TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_CT_ACTION_TMP TO ORDSYS;
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON ORDDATA.ORDDCM_CT_ACTION_USR TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_CT_ACTION_WRK TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_CT_DAREFS TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_CT_DAREFS_TMP TO ORDSYS;
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON ORDDATA.ORDDCM_CT_DAREFS_USR TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_CT_DAREFS_WRK TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_CT_LOCATORPATHS TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_CT_LOCATORPATHS_TMP TO ORDSYS;
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON ORDDATA.ORDDCM_CT_LOCATORPATHS_USR TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_CT_LOCATORPATHS_WRK TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_CT_MACRO_DEP TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_CT_MACRO_DEP_WRK TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_CT_MACRO_PAR TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_CT_MACRO_PAR_WRK TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_CT_PRED TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_CT_PRED_OPRD TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_CT_PRED_OPRD_TMP TO ORDSYS;
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON ORDDATA.ORDDCM_CT_PRED_OPRD_USR TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_CT_PRED_OPRD_WRK TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_CT_PRED_PAR TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_CT_PRED_PAR_TMP TO ORDSYS;
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON ORDDATA.ORDDCM_CT_PRED_PAR_USR TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_CT_PRED_PAR_WRK TO ORDSYS;
    GRANT ALTER, SELECT ON ORDDATA.ORDDCM_CT_PRED_SEQ TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_CT_PRED_SET TO ORDSYS;
    GRANT ALTER, SELECT ON ORDDATA.ORDDCM_CT_PRED_SET_SEQ TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_CT_PRED_SET_TMP TO ORDSYS;
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON ORDDATA.ORDDCM_CT_PRED_SET_USR TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_CT_PRED_SET_WRK TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_CT_PRED_TMP TO ORDSYS;
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON ORDDATA.ORDDCM_CT_PRED_USR TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_CT_PRED_WRK TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_CT_VLD_MSG TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_DATA_MODEL TO ORDSYS;
    GRANT ALTER, SELECT ON ORDDATA.ORDDCM_DATA_MODEL_SEQ TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_DATA_MODEL_WRK TO ORDSYS;
    GRANT ALTER, SELECT ON ORDDATA.ORDDCM_DICT_A_DA_ID_SEQ TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_DICT_ATTRS TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_DICT_ATTRS_TMP TO ORDSYS;
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON ORDDATA.ORDDCM_DICT_ATTRS_USR TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_DICT_ATTRS_WRK TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_DOC_REFS TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_DOC_REFS_TMP TO ORDSYS;
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON ORDDATA.ORDDCM_DOC_REFS_USR TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_DOC_REFS_WRK TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_DOCS TO ORDSYS;
    GRANT ALTER, SELECT ON ORDDATA.ORDDCM_DOCS_ID_SEQ TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_DOCS_TMP TO ORDSYS;
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON ORDDATA.ORDDCM_DOCS_USR TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_DOCS_WRK TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_DOC_TYPES TO ORDSYS;
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON ORDDATA.ORDDCM_DOCUMENT_REFS TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_INSTALL_DOCS TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_INTERNAL_TAGS TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_MAPPED_PATHS TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_MAPPED_PATHS_TMP TO ORDSYS;
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON ORDDATA.ORDDCM_MAPPED_PATHS_USR TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_MAPPED_PATHS_WRK TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_MAPPING_DOCS TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_MAPPING_DOCS_TMP TO ORDSYS;
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON ORDDATA.ORDDCM_MAPPING_DOCS_USR TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_MAPPING_DOCS_WRK TO ORDSYS;
    GRANT ALTER, SELECT ON ORDDATA.ORDDCM_MPD_P_MPID_SEQ TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_PREFS_DEF_VALUES_TAB TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_PREFS_LOOKUP TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_PREFS_VALID_VALUES_TAB TO ORDSYS;
    GRANT ALTER, SELECT ON ORDDATA.ORDDCM_PRV_A_PA_ID_SEQ TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_PRV_ATTRS TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_PRV_ATTRS_TMP TO ORDSYS;
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON ORDDATA.ORDDCM_PRV_ATTRS_USR TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_PRV_ATTRS_WRK TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_RT_PREF_PARAMS TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_RT_PREF_PARAMS_TMP TO ORDSYS;
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON ORDDATA.ORDDCM_RT_PREF_PARAMS_USR TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_RT_PREF_PARAMS_WRK TO ORDSYS;
    GRANT ALTER, SELECT ON ORDDATA.ORDDCM_RT_PREF_P_PPID_SEQ TO ORDSYS;
    GRANT ALTER, SELECT ON ORDDATA.ORDDCM_STD_A_SA_ID_SEQ TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_STD_ATTRS TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_STD_ATTRS_TMP TO ORDSYS;
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON ORDDATA.ORDDCM_STD_ATTRS_USR TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_STD_ATTRS_WRK TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_STORED_TAGS TO ORDSYS;
    GRANT ALTER, SELECT ON ORDDATA.ORDDCM_STOREDTAGS_STID_SEQ TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_STORED_TAGS_TMP TO ORDSYS;
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON ORDDATA.ORDDCM_STORED_TAGS_USR TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_STORED_TAGS_WRK TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_UID_DEFS TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_UID_DEFS_TMP TO ORDSYS;
    GRANT ALTER, SELECT ON ORDDATA.ORDDCM_UID_DEFS_UDID_SEQ TO ORDSYS;
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON ORDDATA.ORDDCM_UID_DEFS_USR TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_UID_DEFS_WRK TO ORDSYS;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON ORDDATA.ORDDCM_VR_DT_MAP TO ORDSYS;
    GRANT EXECUTE ON ORDSYS.ORDIMERRORCODES TO ORDSYS;
    GRANT SELECT ON SYS.DBA_INDEXES TO ORDSYS;
    GRANT SELECT ON SYS.DBA_OBJECT_TABLES TO ORDSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.DBA_TAB_COLS TO ORDSYS;
    GRANT SELECT ON SYS.DBA_TABLES TO ORDSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.DBA_VIEWS TO ORDSYS WITH GRANT OPTION;
    GRANT EXECUTE ON SYS.DBMS_LOCK TO ORDSYS;
    GRANT DELETE, INSERT ON SYS.EXPDEPACT$ TO ORDSYS;
    GRANT DELETE, INSERT ON SYS.EXPDEPOBJ$ TO ORDSYS;
    GRANT DELETE, INSERT ON SYS.EXPPKGACT$ TO ORDSYS;
    GRANT DELETE, INSERT ON SYS.EXPPKGOBJ$ TO ORDSYS;
  -- 4 Java Privileges for ORDSYS 
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'ORDSYS'
    ,permission_type   => 'SYS:java.lang.RuntimePermission'
    ,permission_name   => 'getClassLoader'
    ,permission_action => ''
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'ORDSYS'
    ,permission_type   => 'SYS:java.util.logging.LoggingPermission'
    ,permission_name   => 'control'
    ,permission_action => ''
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'ORDSYS'
    ,permission_type   => 'SYS:java.lang.RuntimePermission'
    ,permission_name   => 'loadLibrary.ordim11'
    ,permission_action => ''
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'ORDSYS'
    ,permission_type   => 'SYS:java.lang.RuntimePermission'
    ,permission_name   => 'loadLibrary.oraordim11'
    ,permission_action => ''
    ,key               => KEYNUM
    );
END;
/


CREATE USER OUTLN
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE SYSTEM
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  PASSWORD EXPIRE
  ACCOUNT LOCK;
  -- 1 Role for OUTLN 
  GRANT RESOURCE TO OUTLN;
  ALTER USER OUTLN DEFAULT ROLE ALL;
  -- 3 System Privileges for OUTLN 
  GRANT CREATE SESSION TO OUTLN;
  GRANT EXECUTE ANY PROCEDURE TO OUTLN;
  GRANT UNLIMITED TABLESPACE TO OUTLN;
  -- 1 Object Privilege for OUTLN 
    GRANT EXECUTE ON SYS.OUTLN_PKG TO OUTLN;


CREATE USER OWBSYS
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE SYSAUX
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  PASSWORD EXPIRE
  ACCOUNT LOCK;
  -- 10 Roles for OWBSYS 
  GRANT AQ_ADMINISTRATOR_ROLE TO OWBSYS;
  GRANT AQ_USER_ROLE TO OWBSYS;
  GRANT CONNECT TO OWBSYS WITH ADMIN OPTION;
  GRANT CWM_USER TO OWBSYS WITH ADMIN OPTION;
  GRANT JAVA_ADMIN TO OWBSYS;
  GRANT JAVAUSERPRIV TO OWBSYS;
  GRANT OLAP_USER TO OWBSYS WITH ADMIN OPTION;
  GRANT OWB$CLIENT TO OWBSYS WITH ADMIN OPTION;
  GRANT OWB_DESIGNCENTER_VIEW TO OWBSYS WITH ADMIN OPTION;
  GRANT OWB_USER TO OWBSYS WITH ADMIN OPTION;
  ALTER USER OWBSYS DEFAULT ROLE ALL;
  -- 22 System Privileges for OWBSYS 
  GRANT ALTER SESSION TO OWBSYS WITH ADMIN OPTION;
  GRANT ALTER USER TO OWBSYS;
  GRANT CREATE ANY CONTEXT TO OWBSYS;
  GRANT CREATE ANY TRIGGER TO OWBSYS WITH ADMIN OPTION;
  GRANT CREATE DATABASE LINK TO OWBSYS WITH ADMIN OPTION;
  GRANT CREATE DIMENSION TO OWBSYS WITH ADMIN OPTION;
  GRANT CREATE EXTERNAL JOB TO OWBSYS;
  GRANT CREATE INDEXTYPE TO OWBSYS WITH ADMIN OPTION;
  GRANT CREATE JOB TO OWBSYS WITH ADMIN OPTION;
  GRANT CREATE MATERIALIZED VIEW TO OWBSYS WITH ADMIN OPTION;
  GRANT CREATE PROCEDURE TO OWBSYS WITH ADMIN OPTION;
  GRANT CREATE PUBLIC SYNONYM TO OWBSYS;
  GRANT CREATE SEQUENCE TO OWBSYS WITH ADMIN OPTION;
  GRANT CREATE SESSION TO OWBSYS WITH ADMIN OPTION;
  GRANT CREATE SYNONYM TO OWBSYS WITH ADMIN OPTION;
  GRANT CREATE TABLE TO OWBSYS WITH ADMIN OPTION;
  GRANT CREATE TRIGGER TO OWBSYS WITH ADMIN OPTION;
  GRANT CREATE TYPE TO OWBSYS WITH ADMIN OPTION;
  GRANT CREATE VIEW TO OWBSYS WITH ADMIN OPTION;
  GRANT DROP PUBLIC SYNONYM TO OWBSYS;
  GRANT GLOBAL QUERY REWRITE TO OWBSYS WITH ADMIN OPTION;
  GRANT UNLIMITED TABLESPACE TO OWBSYS WITH ADMIN OPTION;
  -- 33 Object Privileges for OWBSYS 
    GRANT EXECUTE ON OLAPSYS.DBMS_AWM TO OWBSYS WITH GRANT OPTION;
    GRANT ALTER, SELECT ON OLAPSYS.XML_LOADID_SEQUENCE TO OWBSYS WITH GRANT OPTION;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON OLAPSYS.XML_LOAD_LOG TO OWBSYS WITH GRANT OPTION;
    GRANT EXECUTE ON SYS.AQ$_AGENT TO OWBSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.DBA_ADVISOR_LOG TO OWBSYS;
    GRANT SELECT ON SYS.DBA_APPLY_ERROR TO OWBSYS;
    GRANT SELECT ON SYS.DBA_DATA_FILES TO OWBSYS;
    GRANT SELECT ON SYS.DBA_FREE_SPACE TO OWBSYS;
    GRANT SELECT ON SYS.DBA_ROLE_PRIVS TO OWBSYS;
    GRANT SELECT ON SYS.DBA_SYNONYMS TO OWBSYS;
    GRANT SELECT ON SYS.DBA_TABLES TO OWBSYS;
    GRANT SELECT ON SYS.DBA_TABLESPACES TO OWBSYS;
    GRANT EXECUTE ON SYS.DBMS_AQ TO OWBSYS WITH GRANT OPTION;
    GRANT EXECUTE ON SYS.DBMS_AQADM TO OWBSYS WITH GRANT OPTION;
    GRANT EXECUTE ON SYS.DBMS_AQ_BQVIEW TO OWBSYS;
    GRANT EXECUTE ON SYS.DBMS_CAPTURE_ADM TO OWBSYS;
    GRANT EXECUTE ON SYS.DBMS_CRYPTO TO OWBSYS WITH GRANT OPTION;
    GRANT EXECUTE ON SYS.DBMS_JOB TO OWBSYS;
    GRANT EXECUTE ON SYS.DBMS_LOB TO OWBSYS WITH GRANT OPTION;
    GRANT EXECUTE ON SYS.DBMS_LOCK TO OWBSYS;
    GRANT SELECT ON SYS.DBMS_LOCK_ALLOCATED TO OWBSYS;
    GRANT EXECUTE ON SYS.DBMS_REGISTRY TO OWBSYS;
    GRANT EXECUTE ON SYS.DBMS_SNAPSHOT TO OWBSYS;
    GRANT EXECUTE ON SYS.DBMS_STREAMS_ADM TO OWBSYS;
    GRANT SELECT ON SYS.GV_$SESSION TO OWBSYS WITH GRANT OPTION;
    GRANT EXECUTE ON SYS.INTERACTIONEXECUTE TO OWBSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.V_$ACTIVE_INSTANCES TO OWBSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.V_$INSTANCE TO OWBSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.V_$LOCK TO OWBSYS;
    GRANT SELECT ON SYS.V_$MYSTAT TO OWBSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.V_$PARAMETER TO OWBSYS;
    GRANT SELECT ON SYS.V_$SESSION TO OWBSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.V_$SYSTEM_PARAMETER TO OWBSYS;
  -- 10 Java Privileges for OWBSYS 
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'OWBSYS'
    ,permission_type   => 'SYS:java.io.FilePermission'
    ,permission_name   => 'owb/bin/unix/NAStart.sh'
    ,permission_action => 'execute'
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'OWBSYS'
    ,permission_type   => 'SYS:java.io.FilePermission'
    ,permission_name   => 'owb/bin/win32/NAStart.bat'
    ,permission_action => 'execute'
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'OWBSYS'
    ,permission_type   => 'SYS:java.io.FilePermission'
    ,permission_name   => 'owb/bin/admin/rtrepos.properties'
    ,permission_action => 'read,write'
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'OWBSYS'
    ,permission_type   => 'SYS:java.io.FilePermission'
    ,permission_name   => 'OWB/BIN/ADMIN/RTREPOS.PROPERTIES'
    ,permission_action => 'read,write'
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'OWBSYS'
    ,permission_type   => 'SYS:java.io.FilePermission'
    ,permission_name   => 'owb/bin/unix/run_service.sh'
    ,permission_action => 'read,execute'
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'OWBSYS'
    ,permission_type   => 'SYS:java.io.FilePermission'
    ,permission_name   => 'OWB/BIN/WIN32/RUN_SERVICE.BAT'
    ,permission_action => 'read,execute'
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'OWBSYS'
    ,permission_type   => 'SYS:java.io.FilePermission'
    ,permission_name   => 'owb/bin/win32/run_service.bat'
    ,permission_action => 'read,execute'
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'OWBSYS'
    ,permission_type   => 'SYS:java.util.PropertyPermission'
    ,permission_name   => '*'
    ,permission_action => 'read,write'
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'OWBSYS'
    ,permission_type   => 'SYS:java.lang.RuntimePermission'
    ,permission_name   => '*'
    ,permission_action => 'writeFileDescriptor'
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'OWBSYS'
    ,permission_type   => 'SYS:java.net.SocketPermission'
    ,permission_name   => '*'
    ,permission_action => 'connect'
    ,key               => KEYNUM
    );
END;
/


CREATE USER OWBSYS_AUDIT
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE SYSAUX
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  PASSWORD EXPIRE
  ACCOUNT LOCK;
  -- 2 System Privileges for OWBSYS_AUDIT 
  GRANT ALTER SESSION TO OWBSYS_AUDIT;
  GRANT CREATE SESSION TO OWBSYS_AUDIT;


CREATE USER SCOTT
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE USERS
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  PASSWORD EXPIRE
  ACCOUNT LOCK;
  -- 2 Roles for SCOTT 
  GRANT CONNECT TO SCOTT;
  GRANT RESOURCE TO SCOTT;
  ALTER USER SCOTT DEFAULT ROLE ALL;
  -- 1 System Privilege for SCOTT 
  GRANT UNLIMITED TABLESPACE TO SCOTT;


CREATE USER SI_INFORMTN_SCHEMA
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE SYSAUX
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  PASSWORD EXPIRE
  ACCOUNT LOCK;
  -- 1 System Privilege for SI_INFORMTN_SCHEMA 
  GRANT UNLIMITED TABLESPACE TO SI_INFORMTN_SCHEMA;


CREATE USER SPATIAL_CSW_ADMIN_USR
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE USERS
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  PASSWORD EXPIRE
  ACCOUNT LOCK;
  -- 3 Roles for SPATIAL_CSW_ADMIN_USR 
  GRANT CONNECT TO SPATIAL_CSW_ADMIN_USR;
  GRANT RESOURCE TO SPATIAL_CSW_ADMIN_USR;
  GRANT SPATIAL_CSW_ADMIN TO SPATIAL_CSW_ADMIN_USR WITH ADMIN OPTION;
  ALTER USER SPATIAL_CSW_ADMIN_USR DEFAULT ROLE ALL;
  -- 8 System Privileges for SPATIAL_CSW_ADMIN_USR 
  GRANT ALTER ANY ROLE TO SPATIAL_CSW_ADMIN_USR;
  GRANT CREATE ANY DIRECTORY TO SPATIAL_CSW_ADMIN_USR;
  GRANT CREATE LIBRARY TO SPATIAL_CSW_ADMIN_USR;
  GRANT CREATE PROCEDURE TO SPATIAL_CSW_ADMIN_USR;
  GRANT CREATE ROLE TO SPATIAL_CSW_ADMIN_USR;
  GRANT DROP ANY ROLE TO SPATIAL_CSW_ADMIN_USR;
  GRANT GRANT ANY ROLE TO SPATIAL_CSW_ADMIN_USR;
  GRANT UNLIMITED TABLESPACE TO SPATIAL_CSW_ADMIN_USR;
  -- 14 Object Privileges for SPATIAL_CSW_ADMIN_USR 
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON MDSYS.CSW_CAPABILITIESINFO$ TO SPATIAL_CSW_ADMIN_USR;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON MDSYS.CSW_DOMAININFO$ TO SPATIAL_CSW_ADMIN_USR;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON MDSYS.CSW_HARVESTMETADATA$ TO SPATIAL_CSW_ADMIN_USR;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON MDSYS.CSW_PLUGIN_MAP$ TO SPATIAL_CSW_ADMIN_USR;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON MDSYS.CSW_RECORDDOMAINUPDATED$ TO SPATIAL_CSW_ADMIN_USR;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON MDSYS.CSW_RECORDTABLEMDUPDATED$ TO SPATIAL_CSW_ADMIN_USR;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON MDSYS.CSW_RECORDTABLEUPDATED$ TO SPATIAL_CSW_ADMIN_USR;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON MDSYS.CSW_RECORD_TYPES$ TO SPATIAL_CSW_ADMIN_USR;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON MDSYS.CSW_RECORDVIEWMAP$ TO SPATIAL_CSW_ADMIN_USR;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON MDSYS.CSW_RTXSDINFO$ TO SPATIAL_CSW_ADMIN_USR;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON MDSYS.CSW_TRG_TABLE_TEMP$ TO SPATIAL_CSW_ADMIN_USR;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON MDSYS.RO_TABLE TO SPATIAL_CSW_ADMIN_USR;
    GRANT ALTER, SELECT ON MDSYS.RT_SQ$ TO SPATIAL_CSW_ADMIN_USR;
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON MDSYS.USER_SDO_GEOM_METADATA TO SPATIAL_CSW_ADMIN_USR;


CREATE USER SPATIAL_WFS_ADMIN_USR
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE USERS
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  PASSWORD EXPIRE
  ACCOUNT LOCK;
  -- 3 Roles for SPATIAL_WFS_ADMIN_USR 
  GRANT CONNECT TO SPATIAL_WFS_ADMIN_USR;
  GRANT RESOURCE TO SPATIAL_WFS_ADMIN_USR;
  GRANT SPATIAL_WFS_ADMIN TO SPATIAL_WFS_ADMIN_USR WITH ADMIN OPTION;
  ALTER USER SPATIAL_WFS_ADMIN_USR DEFAULT ROLE ALL;
  -- 8 System Privileges for SPATIAL_WFS_ADMIN_USR 
  GRANT ALTER ANY ROLE TO SPATIAL_WFS_ADMIN_USR;
  GRANT CREATE ANY DIRECTORY TO SPATIAL_WFS_ADMIN_USR;
  GRANT CREATE LIBRARY TO SPATIAL_WFS_ADMIN_USR;
  GRANT CREATE PROCEDURE TO SPATIAL_WFS_ADMIN_USR;
  GRANT CREATE ROLE TO SPATIAL_WFS_ADMIN_USR;
  GRANT DROP ANY ROLE TO SPATIAL_WFS_ADMIN_USR;
  GRANT GRANT ANY ROLE TO SPATIAL_WFS_ADMIN_USR;
  GRANT UNLIMITED TABLESPACE TO SPATIAL_WFS_ADMIN_USR;
  -- 27 Object Privileges for SPATIAL_WFS_ADMIN_USR 
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON MDSYS.CURRENTSESSIONTOKENMAP$ TO SPATIAL_WFS_ADMIN_USR;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON MDSYS.CURRENTSESSIONTOKENMAP_T$ TO SPATIAL_WFS_ADMIN_USR;
    GRANT ALTER, SELECT ON MDSYS.FT_SQ$ TO SPATIAL_WFS_ADMIN_USR;
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON MDSYS.ROWTOKENMAP$ TO SPATIAL_WFS_ADMIN_USR;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON MDSYS.ROWTOKENMAP_T$ TO SPATIAL_WFS_ADMIN_USR;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON MDSYS.R_TABLE TO SPATIAL_WFS_ADMIN_USR;
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON MDSYS.TOKENSESSIONMAP$ TO SPATIAL_WFS_ADMIN_USR;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON MDSYS.TOKENSESSIONMAP_T$ TO SPATIAL_WFS_ADMIN_USR;
    GRANT ALTER, SELECT ON MDSYS.TOKEN_SQ$ TO SPATIAL_WFS_ADMIN_USR;
    GRANT DELETE, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK, MERGE VIEW ON MDSYS.USER_SDO_GEOM_METADATA TO SPATIAL_WFS_ADMIN_USR;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON MDSYS.WFS_CAPABILITIESINFO$ TO SPATIAL_WFS_ADMIN_USR;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON MDSYS.WFS_FEATUREINSTANCEMETADATA$ TO SPATIAL_WFS_ADMIN_USR;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON MDSYS.WFS_FEATURETABLEMDUPDATED$ TO SPATIAL_WFS_ADMIN_USR;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON MDSYS.WFS_FEATURETABLEUPDATED$ TO SPATIAL_WFS_ADMIN_USR;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON MDSYS.WFS_FEATURETYPE$ TO SPATIAL_WFS_ADMIN_USR;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON MDSYS.WFS_FEATURETYPEATTRS$ TO SPATIAL_WFS_ADMIN_USR;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON MDSYS.WFS_FEATURETYPECOMPLEXTAGS$ TO SPATIAL_WFS_ADMIN_USR;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON MDSYS.WFS_FEATURETYPENESTEDSDOS$ TO SPATIAL_WFS_ADMIN_USR;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON MDSYS.WFS_FEATURETYPESIMPLETAGATTRS$ TO SPATIAL_WFS_ADMIN_USR;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON MDSYS.WFS_FEATURETYPETAGS$ TO SPATIAL_WFS_ADMIN_USR;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON MDSYS.WFS_FEATURETYPEXMLCOLINFO$ TO SPATIAL_WFS_ADMIN_USR;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON MDSYS.WFS_FTTYPECOMPLEXTAGATTRS$ TO SPATIAL_WFS_ADMIN_USR;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON MDSYS.WFS_FTXSDINFO$ TO SPATIAL_WFS_ADMIN_USR;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON MDSYS.WFS_PROC_MAP$ TO SPATIAL_WFS_ADMIN_USR;
    GRANT ALTER, SELECT ON MDSYS.WFS_PROC_SQ$ TO SPATIAL_WFS_ADMIN_USR;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON MDSYS.WFS_TRG_TABLE_TEMP$ TO SPATIAL_WFS_ADMIN_USR;
    GRANT ALTER, SELECT ON MDSYS.XMLINFO_SQ$ TO SPATIAL_WFS_ADMIN_USR;


CREATE USER SYSMAN
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE SYSAUX
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  ACCOUNT UNLOCK;
  -- 3 Roles for SYSMAN 
  GRANT MGMT_USER TO SYSMAN WITH ADMIN OPTION;
  GRANT RESOURCE TO SYSMAN;
  GRANT SELECT_CATALOG_ROLE TO SYSMAN WITH ADMIN OPTION;
  ALTER USER SYSMAN DEFAULT ROLE ALL;
  -- 4 System Privileges for SYSMAN 
  GRANT ALTER SESSION TO SYSMAN;
  GRANT CREATE PUBLIC SYNONYM TO SYSMAN;
  GRANT SELECT ANY DICTIONARY TO SYSMAN;
  GRANT UNLIMITED TABLESPACE TO SYSMAN;
  -- 1 Tablespace Quota for SYSMAN 
  ALTER USER SYSMAN QUOTA UNLIMITED ON SYSAUX;
  -- 20 Object Privileges for SYSMAN 
    GRANT DELETE, INSERT, SELECT, UPDATE ON SYS.AUX_STATS$ TO SYSMAN;
    GRANT EXECUTE ON SYS.DBMS_AQ TO SYSMAN;
    GRANT EXECUTE ON SYS.DBMS_AQ_BQVIEW TO SYSMAN;
    GRANT EXECUTE ON SYS.DBMS_CRYPTO TO SYSMAN;
    GRANT EXECUTE ON SYS.DBMS_JOB TO SYSMAN;
    GRANT EXECUTE ON SYS.DBMS_LOB TO SYSMAN WITH GRANT OPTION;
    GRANT EXECUTE ON SYS.DBMS_LOCK TO SYSMAN;
    GRANT EXECUTE ON SYS.DBMS_REDEFINITION TO SYSMAN;
    GRANT EXECUTE ON SYS.DBMS_REGISTRY TO SYSMAN;
    GRANT EXECUTE ON SYS.DBMS_SHARED_POOL TO SYSMAN;
    GRANT EXECUTE ON SYS.DBMS_UTILITY TO SYSMAN;
    GRANT EXECUTE ON SYS.DBMS_WORKLOAD_REPOSITORY TO SYSMAN;
    GRANT SELECT ON SYS.QT66557_BUFFER TO SYSMAN;
    GRANT SELECT ON SYS.QT66874_BUFFER TO SYSMAN;
    GRANT SELECT ON SYS.QT66910_BUFFER TO SYSMAN;
    GRANT SELECT ON SYS.QT69930_BUFFER TO SYSMAN;
    GRANT SELECT ON SYS.QT69940_BUFFER TO SYSMAN;
    GRANT SELECT ON SYS.QT70039_BUFFER TO SYSMAN;
    GRANT SELECT ON SYS.USER_TAB_COLUMNS TO SYSMAN;
    GRANT EXECUTE ON SYS.UTL_FILE TO SYSMAN;


CREATE USER WMSYS
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE SYSAUX
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  PASSWORD EXPIRE
  ACCOUNT LOCK;
  -- 3 Roles for WMSYS 
  GRANT CONNECT TO WMSYS;
  GRANT RESOURCE TO WMSYS;
  GRANT WM_ADMIN_ROLE TO WMSYS WITH ADMIN OPTION;
  ALTER USER WMSYS DEFAULT ROLE ALL;
  -- 29 System Privileges for WMSYS 
  GRANT ADMINISTER DATABASE TRIGGER TO WMSYS;
  GRANT ALTER ANY INDEX TO WMSYS;
  GRANT ALTER ANY PROCEDURE TO WMSYS;
  GRANT ALTER ANY TABLE TO WMSYS;
  GRANT ALTER ANY TRIGGER TO WMSYS;
  GRANT ALTER USER TO WMSYS;
  GRANT CREATE ANY INDEX TO WMSYS;
  GRANT CREATE ANY PROCEDURE TO WMSYS;
  GRANT CREATE ANY TABLE TO WMSYS;
  GRANT CREATE ANY TRIGGER TO WMSYS;
  GRANT CREATE ANY VIEW TO WMSYS;
  GRANT CREATE PUBLIC SYNONYM TO WMSYS;
  GRANT CREATE ROLE TO WMSYS;
  GRANT CREATE SEQUENCE TO WMSYS;
  GRANT DELETE ANY TABLE TO WMSYS;
  GRANT DROP ANY INDEX TO WMSYS;
  GRANT DROP ANY PROCEDURE TO WMSYS;
  GRANT DROP ANY TABLE TO WMSYS;
  GRANT DROP ANY TRIGGER TO WMSYS;
  GRANT DROP ANY VIEW TO WMSYS;
  GRANT DROP PUBLIC SYNONYM TO WMSYS;
  GRANT EXECUTE ANY PROCEDURE TO WMSYS;
  GRANT EXECUTE ANY TYPE TO WMSYS;
  GRANT INSERT ANY TABLE TO WMSYS;
  GRANT LOCK ANY TABLE TO WMSYS;
  GRANT SELECT ANY DICTIONARY TO WMSYS WITH ADMIN OPTION;
  GRANT SELECT ANY TABLE TO WMSYS;
  GRANT UNLIMITED TABLESPACE TO WMSYS;
  GRANT UPDATE ANY TABLE TO WMSYS;
  -- 14 Object Privileges for WMSYS 
    GRANT EXECUTE ON SYS.AQ$_HISTORY TO WMSYS WITH GRANT OPTION;
    GRANT SELECT ON SYS.DBA_VIEWS TO WMSYS WITH GRANT OPTION;
    GRANT EXECUTE ON SYS.DBMS_AQ TO WMSYS;
    GRANT EXECUTE ON SYS.DBMS_AQADM TO WMSYS;
    GRANT EXECUTE ON SYS.DBMS_AQ_BQVIEW TO WMSYS;
    GRANT EXECUTE ON SYS.DBMS_DEFER_SYS TO WMSYS;
    GRANT EXECUTE ON SYS.DBMS_LOB TO WMSYS WITH GRANT OPTION;
    GRANT EXECUTE ON SYS.DBMS_LOCK TO WMSYS;
    GRANT EXECUTE ON SYS.DBMS_REGISTRY TO WMSYS;
    GRANT EXECUTE ON SYS.DBMS_REPCAT TO WMSYS;
    GRANT EXECUTE ON SYS.DBMS_RLS TO WMSYS;
    GRANT EXECUTE ON SYS.DBMS_UTILITY TO WMSYS;
    GRANT SELECT ON SYS.QT13374_BUFFER TO WMSYS;
    GRANT EXECUTE ON SYS.UTL_FILE TO WMSYS;


CREATE USER XDB
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE SYSAUX
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  PASSWORD EXPIRE
  ACCOUNT LOCK;
  -- 3 Roles for XDB 
  GRANT CTXAPP TO XDB;
  GRANT JAVAUSERPRIV TO XDB;
  GRANT RESOURCE TO XDB;
  ALTER USER XDB DEFAULT ROLE ALL;
  -- 10 System Privileges for XDB 
  GRANT ALTER SESSION TO XDB;
  GRANT CREATE INDEXTYPE TO XDB;
  GRANT CREATE LIBRARY TO XDB;
  GRANT CREATE OPERATOR TO XDB;
  GRANT CREATE PUBLIC SYNONYM TO XDB;
  GRANT CREATE SESSION TO XDB;
  GRANT CREATE VIEW TO XDB;
  GRANT DROP PUBLIC SYNONYM TO XDB;
  GRANT QUERY REWRITE TO XDB;
  GRANT UNLIMITED TABLESPACE TO XDB;
  -- 16 Object Privileges for XDB 
    GRANT EXECUTE ON CTXSYS.CTX_DDL TO XDB;
    GRANT EXECUTE ON CTXSYS.CTX_OUTPUT TO XDB;
    GRANT EXECUTE ON SYS.CHECK_UPGRADE TO XDB;
    GRANT EXECUTE ON SYS.DBMS_NETWORK_ACL_ADMIN TO XDB;
    GRANT EXECUTE ON SYS.DBMS_REGISTRY TO XDB;
    GRANT EXECUTE ON SYS.DBMS_RLS TO XDB;
    GRANT EXECUTE ON SYS.DBMS_STREAMS_CONTROL_ADM TO XDB;
    GRANT EXECUTE ON SYS.DBMS_XDSUTL TO XDB;
    GRANT EXECUTE ON SYS.DBMS_XS_DATA_SECURITY_EVENTS TO XDB;
    GRANT EXECUTE ON SYS.DBMS_XS_MTCACHE TO XDB;
    GRANT EXECUTE ON SYS.DBMS_XS_MTCACHE_FFI TO XDB;
    GRANT EXECUTE ON SYS.DBMS_XS_PRINCIPAL_EVENTS_INT TO XDB;
    GRANT EXECUTE ON SYS.DBMS_XS_ROLESET_EVENTS_INT TO XDB;
    GRANT EXECUTE ON SYS.DBMS_XS_SECCLASS_EVENTS TO XDB;
    GRANT EXECUTE ON SYS.SET_TABLESPACE TO XDB;
    GRANT SELECT ON SYS.USER$ TO XDB;


CREATE USER XS$NULL
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE USERS
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  PASSWORD EXPIRE
  ACCOUNT LOCK;



BEGIN
  SYS.DBMS_SCHEDULER.CREATE_JOB_CLASS
    (
      job_class_name          => 'DEFAULT_JOB_CLASS'
     ,resource_consumer_group => NULL
     ,service                 => NULL
     ,logging_level           => SYS.DBMS_SCHEDULER.LOGGING_RUNS
     ,log_history             => NULL
     ,comments                => 'This is the default job class.'
    );
END;
/


BEGIN
  SYS.DBMS_SCHEDULER.CREATE_JOB_CLASS
    (
      job_class_name          => 'DBMS_JOB$'
     ,resource_consumer_group => NULL
     ,service                 => NULL
     ,logging_level           => SYS.DBMS_SCHEDULER.LOGGING_OFF
     ,log_history             => NULL
     ,comments                => 'This is the job class for jobs created through DBMS_JOB.'
    );
END;
/


BEGIN
  SYS.DBMS_SCHEDULER.CREATE_JOB_CLASS
    (
      job_class_name          => 'ORA$AT_JCURG_OS'
     ,resource_consumer_group => 'ORA$AUTOTASK_URGENT_GROUP'
     ,service                 => NULL
     ,logging_level           => SYS.DBMS_SCHEDULER.LOGGING_FULL
     ,log_history             => 1000000
     ,comments                => 'auto optimizer stats collection'
    );
END;
/


BEGIN
  SYS.DBMS_SCHEDULER.CREATE_JOB_CLASS
    (
      job_class_name          => 'ORA$AT_JCNRM_OS'
     ,resource_consumer_group => 'ORA$AUTOTASK_STATS_GROUP'
     ,service                 => NULL
     ,logging_level           => SYS.DBMS_SCHEDULER.LOGGING_FULL
     ,log_history             => 1000000
     ,comments                => 'auto optimizer stats collection'
    );
END;
/


BEGIN
  SYS.DBMS_SCHEDULER.CREATE_JOB_CLASS
    (
      job_class_name          => 'ORA$AT_JCMED_OS'
     ,resource_consumer_group => 'ORA$AUTOTASK_MEDIUM_GROUP'
     ,service                 => NULL
     ,logging_level           => SYS.DBMS_SCHEDULER.LOGGING_FULL
     ,log_history             => 1000000
     ,comments                => 'auto optimizer stats collection'
    );
END;
/


BEGIN
  SYS.DBMS_SCHEDULER.CREATE_JOB_CLASS
    (
      job_class_name          => 'ORA$AT_JCURG_SA'
     ,resource_consumer_group => 'ORA$AUTOTASK_URGENT_GROUP'
     ,service                 => NULL
     ,logging_level           => SYS.DBMS_SCHEDULER.LOGGING_FULL
     ,log_history             => 1000000
     ,comments                => 'auto space advisor'
    );
END;
/


BEGIN
  SYS.DBMS_SCHEDULER.CREATE_JOB_CLASS
    (
      job_class_name          => 'ORA$AT_JCNRM_SA'
     ,resource_consumer_group => 'ORA$AUTOTASK_SPACE_GROUP'
     ,service                 => NULL
     ,logging_level           => SYS.DBMS_SCHEDULER.LOGGING_FULL
     ,log_history             => 1000000
     ,comments                => 'auto space advisor'
    );
END;
/


BEGIN
  SYS.DBMS_SCHEDULER.CREATE_JOB_CLASS
    (
      job_class_name          => 'ORA$AT_JCMED_SA'
     ,resource_consumer_group => 'ORA$AUTOTASK_MEDIUM_GROUP'
     ,service                 => NULL
     ,logging_level           => SYS.DBMS_SCHEDULER.LOGGING_FULL
     ,log_history             => 1000000
     ,comments                => 'auto space advisor'
    );
END;
/


BEGIN
  SYS.DBMS_SCHEDULER.CREATE_JOB_CLASS
    (
      job_class_name          => 'ORA$AT_JCURG_SQ'
     ,resource_consumer_group => 'ORA$AUTOTASK_URGENT_GROUP'
     ,service                 => NULL
     ,logging_level           => SYS.DBMS_SCHEDULER.LOGGING_FULL
     ,log_history             => 1000000
     ,comments                => 'sql tuning advisor'
    );
END;
/


BEGIN
  SYS.DBMS_SCHEDULER.CREATE_JOB_CLASS
    (
      job_class_name          => 'ORA$AT_JCNRM_SQ'
     ,resource_consumer_group => 'ORA$AUTOTASK_SQL_GROUP'
     ,service                 => NULL
     ,logging_level           => SYS.DBMS_SCHEDULER.LOGGING_FULL
     ,log_history             => 1000000
     ,comments                => 'sql tuning advisor'
    );
END;
/


BEGIN
  SYS.DBMS_SCHEDULER.CREATE_JOB_CLASS
    (
      job_class_name          => 'ORA$AT_JCMED_SQ'
     ,resource_consumer_group => 'ORA$AUTOTASK_MEDIUM_GROUP'
     ,service                 => NULL
     ,logging_level           => SYS.DBMS_SCHEDULER.LOGGING_FULL
     ,log_history             => 1000000
     ,comments                => 'sql tuning advisor'
    );
END;
/


BEGIN
  SYS.DBMS_SCHEDULER.CREATE_JOB_CLASS
    (
      job_class_name          => 'AQ$_PROPAGATION_JOB_CLASS'
     ,resource_consumer_group => NULL
     ,service                 => NULL
     ,logging_level           => SYS.DBMS_SCHEDULER.LOGGING_RUNS
     ,log_history             => NULL
     ,comments                => 'Default job class for AQ propagation jobs'
    );
END;
/


BEGIN
  SYS.DBMS_SCHEDULER.CREATE_JOB_CLASS
    (
      job_class_name          => 'XMLDB_NFS_JOBCLASS'
     ,resource_consumer_group => NULL
     ,service                 => NULL
     ,log_history             => NULL
     ,comments                => NULL
    );
END;
/

BEGIN
  SYS.DBMS_SCHEDULER.CREATE_WINDOW
    (
       window_name     => 'MONDAY_WINDOW'
      ,start_date      => NULL
      ,repeat_interval => 'freq=daily;byday=MON;byhour=22;byminute=0; bysecond=0'
      ,end_date        => NULL
      ,resource_plan   => 'DEFAULT_MAINTENANCE_PLAN'
      ,duration        => to_dsInterval('+000 04:00:00')
      ,window_priority => 'LOW'
      ,comments        => 'Monday window for maintenance tasks'
    );
  SYS.DBMS_SCHEDULER.ENABLE
    (name => 'SYS.MONDAY_WINDOW');

END;
/


BEGIN
  SYS.DBMS_SCHEDULER.CREATE_WINDOW
    (
       window_name     => 'TUESDAY_WINDOW'
      ,start_date      => NULL
      ,repeat_interval => 'freq=daily;byday=TUE;byhour=22;byminute=0; bysecond=0'
      ,end_date        => NULL
      ,resource_plan   => 'DEFAULT_MAINTENANCE_PLAN'
      ,duration        => to_dsInterval('+000 04:00:00')
      ,window_priority => 'LOW'
      ,comments        => 'Tuesday window for maintenance tasks'
    );
  SYS.DBMS_SCHEDULER.ENABLE
    (name => 'SYS.TUESDAY_WINDOW');

END;
/


BEGIN
  SYS.DBMS_SCHEDULER.CREATE_WINDOW
    (
       window_name     => 'WEDNESDAY_WINDOW'
      ,start_date      => NULL
      ,repeat_interval => 'freq=daily;byday=WED;byhour=22;byminute=0; bysecond=0'
      ,end_date        => NULL
      ,resource_plan   => 'DEFAULT_MAINTENANCE_PLAN'
      ,duration        => to_dsInterval('+000 04:00:00')
      ,window_priority => 'LOW'
      ,comments        => 'Wednesday window for maintenance tasks'
    );
  SYS.DBMS_SCHEDULER.ENABLE
    (name => 'SYS.WEDNESDAY_WINDOW');

END;
/


BEGIN
  SYS.DBMS_SCHEDULER.CREATE_WINDOW
    (
       window_name     => 'THURSDAY_WINDOW'
      ,start_date      => NULL
      ,repeat_interval => 'freq=daily;byday=THU;byhour=22;byminute=0; bysecond=0'
      ,end_date        => NULL
      ,resource_plan   => 'DEFAULT_MAINTENANCE_PLAN'
      ,duration        => to_dsInterval('+000 04:00:00')
      ,window_priority => 'LOW'
      ,comments        => 'Thursday window for maintenance tasks'
    );
  SYS.DBMS_SCHEDULER.ENABLE
    (name => 'SYS.THURSDAY_WINDOW');

END;
/


BEGIN
  SYS.DBMS_SCHEDULER.CREATE_WINDOW
    (
       window_name     => 'FRIDAY_WINDOW'
      ,start_date      => NULL
      ,repeat_interval => 'freq=daily;byday=FRI;byhour=22;byminute=0; bysecond=0'
      ,end_date        => NULL
      ,resource_plan   => 'DEFAULT_MAINTENANCE_PLAN'
      ,duration        => to_dsInterval('+000 04:00:00')
      ,window_priority => 'LOW'
      ,comments        => 'Friday window for maintenance tasks'
    );
  SYS.DBMS_SCHEDULER.ENABLE
    (name => 'SYS.FRIDAY_WINDOW');

END;
/


BEGIN
  SYS.DBMS_SCHEDULER.CREATE_WINDOW
    (
       window_name     => 'SATURDAY_WINDOW'
      ,start_date      => NULL
      ,repeat_interval => 'freq=daily;byday=SAT;byhour=6;byminute=0; bysecond=0'
      ,end_date        => NULL
      ,resource_plan   => 'DEFAULT_MAINTENANCE_PLAN'
      ,duration        => to_dsInterval('+000 20:00:00')
      ,window_priority => 'LOW'
      ,comments        => 'Saturday window for maintenance tasks'
    );
  SYS.DBMS_SCHEDULER.ENABLE
    (name => 'SYS.SATURDAY_WINDOW');

END;
/


BEGIN
  SYS.DBMS_SCHEDULER.CREATE_WINDOW
    (
       window_name     => 'SUNDAY_WINDOW'
      ,start_date      => NULL
      ,repeat_interval => 'freq=daily;byday=SUN;byhour=6;byminute=0; bysecond=0'
      ,end_date        => NULL
      ,resource_plan   => 'DEFAULT_MAINTENANCE_PLAN'
      ,duration        => to_dsInterval('+000 20:00:00')
      ,window_priority => 'LOW'
      ,comments        => 'Sunday window for maintenance tasks'
    );
  SYS.DBMS_SCHEDULER.ENABLE
    (name => 'SYS.SUNDAY_WINDOW');

END;
/


BEGIN
  SYS.DBMS_SCHEDULER.CREATE_WINDOW
    (
       window_name     => 'WEEKNIGHT_WINDOW'
      ,start_date      => NULL
      ,repeat_interval => 'freq=daily;byday=MON,TUE,WED,THU,FRI;byhour=22;byminute=0; bysecond=0'
      ,end_date        => NULL
      ,resource_plan   => NULL
      ,duration        => to_dsInterval('+000 08:00:00')
      ,window_priority => 'LOW'
      ,comments        => 'Weeknight window - for compatibility only'
    );
  SYS.DBMS_SCHEDULER.DISABLE
    (name => 'SYS.WEEKNIGHT_WINDOW');

END;
/


BEGIN
  SYS.DBMS_SCHEDULER.CREATE_WINDOW
    (
       window_name     => 'WEEKEND_WINDOW'
      ,start_date      => NULL
      ,repeat_interval => 'freq=daily;byday=SAT;byhour=0;byminute=0;bysecond=0'
      ,end_date        => NULL
      ,resource_plan   => NULL
      ,duration        => to_dsInterval('+002 00:00:00')
      ,window_priority => 'LOW'
      ,comments        => 'Weekend window - for compatibility only'
    );
  SYS.DBMS_SCHEDULER.DISABLE
    (name => 'SYS.WEEKEND_WINDOW');

END;
/


BEGIN
  SYS.DBMS_SCHEDULER.CREATE_WINDOW_GROUP
    (
       group_name     => 'MAINTENANCE_WINDOW_GROUP'
      ,window_list    => NULL
      ,comments       => 'Window group for Automated Maintenance'
    );
  SYS.DBMS_SCHEDULER.ENABLE
    (name => 'SYS.MAINTENANCE_WINDOW_GROUP');
END;
/
BEGIN
  DBMS_SCHEDULER.ADD_WINDOW_GROUP_MEMBER
    (group_name  => 'SYS.MAINTENANCE_WINDOW_GROUP',
     window_list => 'MONDAY_WINDOW');
END;
/
BEGIN
  DBMS_SCHEDULER.ADD_WINDOW_GROUP_MEMBER
    (group_name  => 'SYS.MAINTENANCE_WINDOW_GROUP',
     window_list => 'TUESDAY_WINDOW');
END;
/
BEGIN
  DBMS_SCHEDULER.ADD_WINDOW_GROUP_MEMBER
    (group_name  => 'SYS.MAINTENANCE_WINDOW_GROUP',
     window_list => 'WEDNESDAY_WINDOW');
END;
/
BEGIN
  DBMS_SCHEDULER.ADD_WINDOW_GROUP_MEMBER
    (group_name  => 'SYS.MAINTENANCE_WINDOW_GROUP',
     window_list => 'THURSDAY_WINDOW');
END;
/
BEGIN
  DBMS_SCHEDULER.ADD_WINDOW_GROUP_MEMBER
    (group_name  => 'SYS.MAINTENANCE_WINDOW_GROUP',
     window_list => 'FRIDAY_WINDOW');
END;
/
BEGIN
  DBMS_SCHEDULER.ADD_WINDOW_GROUP_MEMBER
    (group_name  => 'SYS.MAINTENANCE_WINDOW_GROUP',
     window_list => 'SATURDAY_WINDOW');
END;
/
BEGIN
  DBMS_SCHEDULER.ADD_WINDOW_GROUP_MEMBER
    (group_name  => 'SYS.MAINTENANCE_WINDOW_GROUP',
     window_list => 'SUNDAY_WINDOW');
END;
/


BEGIN
  SYS.DBMS_SCHEDULER.CREATE_WINDOW_GROUP
    (
       group_name     => 'ORA$AT_WGRP_OS'
      ,window_list    => NULL
      ,comments       => 'auto optimizer stats collection'
    );
  SYS.DBMS_SCHEDULER.ENABLE
    (name => 'SYS.ORA$AT_WGRP_OS');
END;
/
BEGIN
  DBMS_SCHEDULER.ADD_WINDOW_GROUP_MEMBER
    (group_name  => 'SYS.ORA$AT_WGRP_OS',
     window_list => 'MONDAY_WINDOW');
END;
/
BEGIN
  DBMS_SCHEDULER.ADD_WINDOW_GROUP_MEMBER
    (group_name  => 'SYS.ORA$AT_WGRP_OS',
     window_list => 'TUESDAY_WINDOW');
END;
/
BEGIN
  DBMS_SCHEDULER.ADD_WINDOW_GROUP_MEMBER
    (group_name  => 'SYS.ORA$AT_WGRP_OS',
     window_list => 'WEDNESDAY_WINDOW');
END;
/
BEGIN
  DBMS_SCHEDULER.ADD_WINDOW_GROUP_MEMBER
    (group_name  => 'SYS.ORA$AT_WGRP_OS',
     window_list => 'THURSDAY_WINDOW');
END;
/
BEGIN
  DBMS_SCHEDULER.ADD_WINDOW_GROUP_MEMBER
    (group_name  => 'SYS.ORA$AT_WGRP_OS',
     window_list => 'FRIDAY_WINDOW');
END;
/
BEGIN
  DBMS_SCHEDULER.ADD_WINDOW_GROUP_MEMBER
    (group_name  => 'SYS.ORA$AT_WGRP_OS',
     window_list => 'SATURDAY_WINDOW');
END;
/
BEGIN
  DBMS_SCHEDULER.ADD_WINDOW_GROUP_MEMBER
    (group_name  => 'SYS.ORA$AT_WGRP_OS',
     window_list => 'SUNDAY_WINDOW');
END;
/


BEGIN
  SYS.DBMS_SCHEDULER.CREATE_WINDOW_GROUP
    (
       group_name     => 'ORA$AT_WGRP_SA'
      ,window_list    => NULL
      ,comments       => 'auto space advisor'
    );
  SYS.DBMS_SCHEDULER.ENABLE
    (name => 'SYS.ORA$AT_WGRP_SA');
END;
/
BEGIN
  DBMS_SCHEDULER.ADD_WINDOW_GROUP_MEMBER
    (group_name  => 'SYS.ORA$AT_WGRP_SA',
     window_list => 'MONDAY_WINDOW');
END;
/
BEGIN
  DBMS_SCHEDULER.ADD_WINDOW_GROUP_MEMBER
    (group_name  => 'SYS.ORA$AT_WGRP_SA',
     window_list => 'TUESDAY_WINDOW');
END;
/
BEGIN
  DBMS_SCHEDULER.ADD_WINDOW_GROUP_MEMBER
    (group_name  => 'SYS.ORA$AT_WGRP_SA',
     window_list => 'WEDNESDAY_WINDOW');
END;
/
BEGIN
  DBMS_SCHEDULER.ADD_WINDOW_GROUP_MEMBER
    (group_name  => 'SYS.ORA$AT_WGRP_SA',
     window_list => 'THURSDAY_WINDOW');
END;
/
BEGIN
  DBMS_SCHEDULER.ADD_WINDOW_GROUP_MEMBER
    (group_name  => 'SYS.ORA$AT_WGRP_SA',
     window_list => 'FRIDAY_WINDOW');
END;
/
BEGIN
  DBMS_SCHEDULER.ADD_WINDOW_GROUP_MEMBER
    (group_name  => 'SYS.ORA$AT_WGRP_SA',
     window_list => 'SATURDAY_WINDOW');
END;
/
BEGIN
  DBMS_SCHEDULER.ADD_WINDOW_GROUP_MEMBER
    (group_name  => 'SYS.ORA$AT_WGRP_SA',
     window_list => 'SUNDAY_WINDOW');
END;
/


BEGIN
  SYS.DBMS_SCHEDULER.CREATE_WINDOW_GROUP
    (
       group_name     => 'ORA$AT_WGRP_SQ'
      ,window_list    => NULL
      ,comments       => 'sql tuning advisor'
    );
  SYS.DBMS_SCHEDULER.ENABLE
    (name => 'SYS.ORA$AT_WGRP_SQ');
END;
/
BEGIN
  DBMS_SCHEDULER.ADD_WINDOW_GROUP_MEMBER
    (group_name  => 'SYS.ORA$AT_WGRP_SQ',
     window_list => 'MONDAY_WINDOW');
END;
/
BEGIN
  DBMS_SCHEDULER.ADD_WINDOW_GROUP_MEMBER
    (group_name  => 'SYS.ORA$AT_WGRP_SQ',
     window_list => 'TUESDAY_WINDOW');
END;
/
BEGIN
  DBMS_SCHEDULER.ADD_WINDOW_GROUP_MEMBER
    (group_name  => 'SYS.ORA$AT_WGRP_SQ',
     window_list => 'WEDNESDAY_WINDOW');
END;
/
BEGIN
  DBMS_SCHEDULER.ADD_WINDOW_GROUP_MEMBER
    (group_name  => 'SYS.ORA$AT_WGRP_SQ',
     window_list => 'THURSDAY_WINDOW');
END;
/
BEGIN
  DBMS_SCHEDULER.ADD_WINDOW_GROUP_MEMBER
    (group_name  => 'SYS.ORA$AT_WGRP_SQ',
     window_list => 'FRIDAY_WINDOW');
END;
/
BEGIN
  DBMS_SCHEDULER.ADD_WINDOW_GROUP_MEMBER
    (group_name  => 'SYS.ORA$AT_WGRP_SQ',
     window_list => 'SATURDAY_WINDOW');
END;
/
BEGIN
  DBMS_SCHEDULER.ADD_WINDOW_GROUP_MEMBER
    (group_name  => 'SYS.ORA$AT_WGRP_SQ',
     window_list => 'SUNDAY_WINDOW');
END;
/


CREATE OR REPLACE TRIGGER EXFSYS.expfil_alterexptab_maint after alter or
        rename on database
DISABLE
declare 
        objown    VARCHAR2(32); 
        objnm     VARCHAR2(32);
        dcobjnum  NUMBER := null;
        newname   VARCHAR2(32) := null;
        eccnt     NUMBER;
        CURSOR cur1 (towner VARCHAR2, tname VARCHAR2) IS 
          select exscolnm, exstabobj from exf$exprset where exsowner = 
             towner and exstabnm = tname;
      begin 
        objown := DICTIONARY_OBJ_OWNER; 
        objnm := DICTIONARY_OBJ_NAME;

        if (DICTIONARY_OBJ_OWNER = 'EXFSYS') then
          return;
        end if;

        if (DICTIONARY_OBJ_TYPE != 'TABLE') then 
          return;
        end if;

        -- would just skip the loop if no rows found => not an expr table --
        for c1 in cur1(objown, objnm) loop
          if (newname is null) then 
          begin 
            newname := sys.exf$dbms_expfil_syspack.get_tab_name(c1.exstabobj);
          exception
            when others then
              dbms_job.submit(eccnt, 
                'begin exfsys.dbms_expfil_dr.rename_table_maint('||
                   c1.exstabobj||'); end;'); 
              return; -- bug on system trigger : 2355231 --
          end;
          end if;

          if ((newname is null or                   -- not a rename tab --
               (newname is not null and newname = objnm)) and
              sys.exf$dbms_expfil_syspack.tab_column_exists(objown, objnm, 
                           c1.exscolnm) = 0) then 
            dcobjnum := c1.exstabobj;   -- indicates that the column is drpd

            -- the expression column was dropped or marked unusable. --
            -- drop the expression column (dictionary) --
            delete from exf$exprset where exsowner = objown and 
              exstabnm = objnm and exscolnm = c1.exscolnm;
          end if;                                            
        end loop;

        -- if this was a drop column and one of the expression sets was 
        -- dropped, the export dep obj dict should be maintained if this 
        -- is the last expression column in the table --
        if (dcobjnum is not null) then 
          -- Count the number of expression columns left in td  he table --
          select count(*) into eccnt from exf$exprset where
                            exsowner = objown and exstabnm = objnm;

          -- this was the last expression column in the table. 
          if (eccnt = 0) then 
            -- Clear the entry from the dependent action list --
            -- auto commit after delete from expdepact$ --
            sys.exf$dbms_expfil_syspack.clr_exp_depaction(dcobjnum);
          end if;        
        end if;
        -- if the name of the table storing expression changes, update dict
        -- accordingly --
        if (newname is not null and newname != objnm) then 
          -- could be updating 0 or 1 or more rows --
          update exf$exprset set exstabnm = newname where exsowner = objown
            and exstabnm = objnm;
          -- see if there is an index or stats etc., for this table --
          if (SQL%ROWCOUNT > 0) then 
            update exf$expsetprivs set esexptab = newname where 
              esowner = objown and esexptab = objnm;
            update exf$expsetstats set esettable = newname where 
              esetowner = objown and esettable = objnm;
            update exf$idxsecobj set idxesettab = newname where
              idxowner = objown and idxesettab = objnm;
            update exf$esetidxparam set esettabn = newname where
              esetowner = objown and esettabn = objnm;
          end if;
        end if;
        return;
      exception when others then null;
      end;
/
SHOW ERRORS;


CREATE OR REPLACE TRIGGER EXFSYS.expfil_dropobj_maint before drop on database
DISABLE
declare 
        objown VARCHAR2(32); 
        objnm  VARCHAR2(32);
        attsetc  number;
        tabobjn  number := null;
        
        CURSOR cur2 (tabown VARCHAR2) is 
          select distinct(exstabobj) tobjn from exf$exprset where 
            exsowner = tabown;
      begin 
        objown := DICTIONARY_OBJ_OWNER; 
        objnm := DICTIONARY_OBJ_NAME;

        if (DICTIONARY_OBJ_OWNER = 'EXFSYS') then 
          return;
        end if;
          exfsys.adm_rlmgr_systrig.pre_dropobj_maint(DICTIONARY_OBJ_OWNER,
                              DICTIONARY_OBJ_NAME, DICTIONARY_OBJ_TYPE); 
      
        if (DICTIONARY_OBJ_TYPE = 'TABLE') then 
          begin 
            -- only one row expected --
            select distinct(exstabobj) into tabobjn from exf$exprset where
              exsowner = objown and exstabnm = objnm;
            if (tabobjn is not null) then 
              sys.exf$dbms_expfil_syspack.clr_exp_depaction(tabobjn);
            end if;
            delete from exf$exprset where exsowner = objown and 
              exstabnm = objnm;
          exception 
            when no_data_found then 
              null;
          end;
          return;
        elsif (DICTIONARY_OBJ_TYPE = 'TYPE' or 
               DICTIONARY_OBJ_TYPE = 'TYPE BODY') then 
          if (dbms_expfil_utl.db_operation_type =
              dbms_expfil_utl.OP_DROP_USER or
              dbms_expfil_utl.db_operation_type =
              dbms_expfil_utl.EXF_MAINT_OP) then
            return;                   --- return is dropping the user ---
          end if;

          select count(*) into attsetc from exf$attrset where atsowner 
             = objown and atsname = objnm; 
          if (attsetc != 0) then 
            dbms_expfil_utl.error_out(38473);
          end if;
          return;
        elsif (DICTIONARY_OBJ_TYPE = 'USER') then
          if (objnm = 'EXFSYS') then 
            return;
          end if;
          -- set the drop user context; no error dropping types --
          dbms_expfil_utl.db_operation_type :=
                       dbms_expfil_utl.OP_DROP_USER;
        end if;
      exception when others then 
        -- recognize all the errors that are valid to throw --
        if (SQLCODE = -38473 or SQLCODE = -41657 or SQLCODE = -41701 or 
            SQLCODE = -41705) then
          raise;
        end if;
      end;
/
SHOW ERRORS;


CREATE OR REPLACE TRIGGER EXFSYS.expfil_dropusr_maint after drop on database
DISABLE
declare 
        objnm VARCHAR2(32);
        CURSOR cur1 (tabown VARCHAR2) is 
          select distinct(exstabobj) tobjn from exf$exprset where 
            exsowner = tabown and exstabnm is not null;
      begin 
        objnm := DICTIONARY_OBJ_NAME;
        if (DICTIONARY_OBJ_TYPE != 'USER') then 
          return;
        end if;

        -- user being dropped is not EXFSYS --
        if (objnm = 'EXFSYS') then
          return;
        end if;
        dbms_expfil_utl.db_operation_type := dbms_expfil_utl.NO_SIG_OPER;

        for c1 in cur1 (objnm) loop 
          sys.exf$dbms_expfil_syspack.clr_exp_depaction(c1.tobjn); 
        end loop;
        delete from exf$exprset where exsowner = objnm;
        delete from exf$attrset where atsowner = objnm;
        delete from exf$expsetprivs where esgrantee = objnm;
      exception when others then null;
      end;
/
SHOW ERRORS;


CREATE OR REPLACE TRIGGER EXFSYS.expfil_restrict_typeevolve before alter
       or create on database
DISABLE
declare 
        objown VARCHAR2(32);
        objnm  VARCHAR2(32);
        attsetc  number;
      begin 
        objown := DICTIONARY_OBJ_OWNER; 
        objnm := DICTIONARY_OBJ_NAME;
 
        if (DICTIONARY_OBJ_OWNER = 'EXFSYS') then
          return;
        end if;

        if (DICTIONARY_OBJ_TYPE != 'TYPE') then
          return;
        end if;

        -- see if the ADT is used for an attribute set --
        select count(*) into attsetc from exf$attrset where atsowner
           = objown and atsname = objnm;

        -- if the type is being created because of add_elementary_attr
        -- operation, let it go --
        if (attsetc != 0 and dbms_expfil_utl.db_operation_type !=
            dbms_expfil_utl.EXF_MAINT_OP) then
          -- we are about to throw the error; just check if this 
          -- attribute set is invalid due to evolution of one of its 
          -- embedded types with INVALIDATE option. If this is the case, 
          -- the system trigger will be invoked next time the ADT is 
          -- being used with status = INVALID --
          if (sys.exf$dbms_expfil_syspack.get_typelv_status(objown,objnm) 
                  = 'VALID') then 
            dbms_expfil_utl.error_out(38476); -- no doubt; has to be error --
          end if; 
        end if;
      exception when others then 
        if (SQLCODE = -38476) then raise; end if;
      end;
/
SHOW ERRORS;


CREATE OR REPLACE TRIGGER EXFSYS.rlmgr_truncate_maint before truncate on 
        database
DISABLE
declare 
        objown VARCHAR2(32);
        objnm  VARCHAR2(32);
        rcpcknm VARCHAR2(32);
        obcnt   NUMBER;
      begin 
        objown := DICTIONARY_OBJ_OWNER; 
        objnm := DICTIONARY_OBJ_NAME;
 
        if (DICTIONARY_OBJ_OWNER = 'EXFSYS') then
          return;
        end if;
        if (DICTIONARY_OBJ_TYPE = 'TABLE') then 
        begin
          select evst_name into rcpcknm from exfsys.rlm$eventstruct where
          evst_owner = objown and evst_prct = objnm; 
          select count(*) into obcnt from rlm$primevttypemap where 
             rset_owner = objown and prim_evntst = rcpcknm; 
          if (obcnt > 0) then
            dbms_rlmgr_dr.raise_error(41701); 
          end if;
        exception 
          when no_data_found then 
            null;
          when others then 
            if (SQLCODE = -01422) then
            begin
              select evst_name into rcpcknm from exfsys.rlm$eventstruct where 
                evst_owner = objown and evst_prct = objnm 
                and evst_name like 'RLM$PCTTA_%';
              dbms_rlmgr_dr.raise_error(41701);
            exception
              when no_data_found then null;
            end;
            end if;
            raise;
        end;
        begin
          select rset_pack into rcpcknm from rlm$ruleset where 
            rset_owner = objown and rset_name = objnm and 
             bitand(rset_prop, 4) = 4; 
          sys.exf$dbms_expfil_syspack.parse_proc_as_owner(objown, 
              rcpcknm, 'TRUNCATE_RCTAB', 0); 
        exception 
          when no_data_found then 
             null;
          when others then 
            raise; 
        end;
        end if;
      end;
/
SHOW ERRORS;


CREATE OR REPLACE TRIGGER MDSYS.sdo_drop_user
after drop on DATABASE
declare
   stmt varchar2(200);
   cnt number;
BEGIN
     if sys.dbms_standard.dictionary_obj_type = 'USER' THEN
       stmt := 'DELETE FROM SDO_GEOM_METADATA_TABLE ' ||
     ' WHERE SDO_OWNER = :owner ';
       EXECUTE IMMEDIATE stmt USING sys.dbms_standard.dictionary_obj_name;

       stmt := 'DELETE FROM SDO_MAPS_TABLE ' ||
    ' WHERE SDO_OWNER = :owner ';
       EXECUTE IMMEDIATE stmt USING sys.dbms_standard.dictionary_obj_name;

       stmt := 'DELETE FROM SDO_CACHED_MAPS_TABLE ' ||
    ' WHERE SDO_OWNER = :owner ';
       EXECUTE IMMEDIATE stmt USING sys.dbms_standard.dictionary_obj_name;

       stmt := 'DELETE FROM SDO_STYLES_TABLE ' ||
    ' WHERE SDO_OWNER = :owner ';
       EXECUTE IMMEDIATE stmt USING sys.dbms_standard.dictionary_obj_name;

       stmt := 'DELETE FROM SDO_THEMES_TABLE ' ||
   ' WHERE SDO_OWNER = :owner ';
       EXECUTE IMMEDIATE stmt USING sys.dbms_standard.dictionary_obj_name;

       stmt := 'DELETE FROM SDO_LRS_METADATA_TABLE ' ||
   ' WHERE SDO_OWNER = :owner ';
       EXECUTE IMMEDIATE stmt USING sys.dbms_standard.dictionary_obj_name;

       stmt := 'DELETE FROM SDO_TOPO_METADATA_TABLE ' ||
   ' WHERE SDO_OWNER = :owner ';
       EXECUTE IMMEDIATE stmt USING sys.dbms_standard.dictionary_obj_name;

       stmt := 'DELETE FROM SDO_ANNOTATION_TEXT_METADATA ' ||
   ' WHERE F_TABLE_SCHEMA = :owner ';
       EXECUTE IMMEDIATE stmt USING sys.dbms_standard.dictionary_obj_name;
    end if;
end;
/
SHOW ERRORS;


CREATE OR REPLACE TRIGGER MDSYS.sdo_geor_addl_trigger
after ddl on database
declare
 TYPE attrs_cur IS REF CURSOR;
 m_cur       attrs_cur;
 m_event   varchar2(512);
 m_user    varchar2(512);
 m_owner   varchar2(512);
 m_user1   varchar2(512);
 m_type    varchar2(512);
 m_name    varchar2(5120);
 m_column  varchar2(5120);
 m_cnt     NUMBER;
 m_stmt    varchar2(512);
 m_ret     varchar2(3000);
 m_ret1     varchar2(512);
 m_o_stmt VARCHAR2(5120);
begin

 m_stmt:='select sys.dbms_standard.dictionary_obj_type from dual';
 execute immediate m_stmt into m_type;
 if(not (m_type='TABLE' or m_type='TRIGGER' or m_type='USER'))
 then
   return;
 end if;

 m_stmt:='select sys.dbms_standard.sysevent from dual';
 execute immediate m_stmt into m_event;

 m_stmt:='select SYS_CONTEXT(''USERENV'',''SESSION_USER'') from dual';
 execute immediate m_stmt into m_user;

 m_stmt:='select sys.dbms_standard.login_user  from dual';
 execute immediate m_stmt into m_user1;

 m_stmt:='select sys.dbms_standard.dictionary_obj_owner from dual';
 execute immediate m_stmt into m_owner;

 m_stmt:='select sys.dbms_standard.dictionary_obj_name from dual';
 execute immediate m_stmt into m_name;









 if (m_owner!='MDSYS' and m_owner!='SYS' and m_type='TABLE' and m_event='CREATE')
 then
   m_stmt:='select sdo_geor_def.listAllGeoRasterFieldsStr(:1,:2) from dual';
   execute immediate m_stmt  into m_ret  using SYS.DBMS_ASSERT.SCHEMA_NAME(m_owner),SYS.DBMS_ASSERT.SIMPLE_SQL_NAME(m_name);
   m_ret:=trim(m_ret);
   while (length(m_ret)!=0) loop
     if (instr(m_ret,' $$__## ')!=0)
     then
       m_ret1:=trim(substr(m_ret,1,instr(m_ret,' $$__## ')-1));
       m_ret:=trim(substr(m_ret,instr(m_ret,' $$__## ')+8));
     else
       m_ret1:=trim(m_ret);
       m_ret:='';
     end if;
     m_stmt:='begin SDO_GEOR_UTL.createDMLTrigger(:1,:2); end;';
    execute immediate m_stmt using m_owner||'.'||m_name,SYS.DBMS_ASSERT.QUALIFIED_SQL_NAME(m_ret1);
   end loop;
   return;
 end if;






















  if (m_name!='MDSYS' and m_type='USER' and m_event='DROP')
  then
     m_stmt:='call sdo_geor_def.doDropUserAndTable()';
     execute immediate m_stmt;
  end if;

  if (m_owner!='MDSYS' and m_owner!='SYS' and m_type='TABLE' and m_event='DROP')
  then
     m_stmt:='call sdo_geor_def.doDropUserAndTable()';
     execute immediate m_stmt;
  end if;

  if (m_owner!='MDSYS' and m_owner!='SYS' and m_type='TABLE' and m_event='TRUNCATE')
  then
     m_stmt:='call sdo_geor_def.doTruncateTable()';
     execute immediate m_stmt;
  end if;

  if (m_owner!='MDSYS' and m_owner!='SYS' and m_type='TABLE' and m_event='ALTER')
  then
     m_stmt:='call sdo_geor_def.doAlterRenameTable()';
     execute immediate m_stmt;
  end if;

  if (m_owner!='MDSYS' and m_owner!='SYS' and m_type='TABLE' and m_event='RENAME')
  then
     m_stmt:='call sdo_geor_def.doRenameTable()';
     execute immediate m_stmt;
  end if;






 if (m_event='DROP' and m_type='TABLE')
 then
   m_stmt:='delete from sdo_geor_ddl__table$$ where id=2';
   EXECUTE IMMEDIATE m_stmt;
 end if;

 if (m_type='USER' and m_event='DROP')
 then
   m_stmt:='delete from sdo_geor_ddl__table$$';
   EXECUTE IMMEDIATE m_stmt;
 end if;

 Exception
   when others then
     if(sqlcode=-13391)
     then
       m_stmt:=sqlerrm;
       m_stmt:=substr(m_stmt,11);
       m_stmt:='call mderr.raise_md_error(''MD'', ''SDO'', -13391,'''||m_stmt||''')';
       execute immediate m_stmt;
     end if;
end;
/
SHOW ERRORS;


CREATE OR REPLACE TRIGGER MDSYS.sdo_geor_bddl_trigger
before ddl on database
declare
 TYPE attrs_cur IS REF CURSOR;
 m_cur       attrs_cur;
 m_event varchar2(512);
 m_user  varchar2(512);
 m_owner varchar2(512);
 m_user1 varchar2(512);
 m_type  varchar2(512);
 m_stmt  varchar2(512);
 m_name  varchar2(5120);
 m_column varchar2(5120);
 m_cnt   NUMBER;
 m_stmt1 varchar2(512);
 m_var   varchar2(512);
 m_o_stmt VARCHAR2(5120);
PRAGMA AUTONOMOUS_TRANSACTION;
begin

 m_stmt:='select sys.dbms_standard.dictionary_obj_type from dual';
 execute immediate m_stmt into m_type;
 if(not (m_type='TABLE' or m_type='TRIGGER' or m_type='USER'))
 then
   return;
 end if;

 m_stmt:='select sys.dbms_standard.sysevent from dual';
 execute immediate m_stmt into m_event;

 m_stmt:='select SYS_CONTEXT(''USERENV'',''SESSION_USER'') from dual';
 execute immediate m_stmt into m_user;

 m_stmt:='select SYS_CONTEXT(''USERENV'',''CURRENT_USER'') from dual';
 execute immediate m_stmt into m_user1;

 m_stmt:='select sys.dbms_standard.dictionary_obj_owner from dual';
 execute immediate m_stmt into m_owner;

 m_stmt:='select sys.dbms_standard.dictionary_obj_name from dual';
 execute immediate m_stmt into m_name;

 m_stmt:='select sdo_geor_def.getSqlText from dual';
 execute immediate m_stmt into m_o_stmt;






  if (m_owner!='MDSYS' and m_owner!='SYS' and m_type='TABLE' and m_event='ALTER')
  then
    m_stmt:='select column_name from dba_tab_columns where owner=:1 and table_name=:2';
    open m_cur for m_stmt using m_owner,m_name;
    loop
      fetch m_cur into m_column;
      exit when m_cur%NOTFOUND;
      m_stmt:='select sdo_geor_def.isDropColumn(:1) from dual';
      execute immediate m_stmt into m_stmt1 using SYS.DBMS_ASSERT.SIMPLE_SQL_NAME(m_column);
      if (trim(m_stmt1)='TRUE')
      then
        m_stmt:='begin sdo_geor_def.doAlterDropColumn(:1,:2,:3); end;';
        execute immediate m_stmt using SYS.DBMS_ASSERT.SCHEMA_NAME(m_owner),SYS.DBMS_ASSERT.SIMPLE_SQL_NAME(m_name),SYS.DBMS_ASSERT.SIMPLE_SQL_NAME(m_column);
      end if;
    end loop;
  end if;







 if (m_event='DROP' and m_type='USER')
 then
   m_stmt:='insert into sdo_geor_ddl__table$$ values (1)';
   EXECUTE IMMEDIATE m_stmt;
   commit;
 end if;

 if (m_event='DROP' and m_type='TABLE')
 then
   m_stmt:='select count(*) from sdo_geor_sysdata_table where sdo_owner=:1 and RDT_TABLE_NAME=:2';
   EXECUTE IMMEDIATE m_stmt into m_cnt using m_owner,m_name;
   if(m_cnt!=0)
   then
     m_stmt:='select count(*) from sdo_geor_ddl__table$$';
     EXECUTE IMMEDIATE m_stmt into m_cnt;
     if((m_cnt=0)and (m_user!='SYS' and m_user!='SYSTEM' and m_user!='MDSYS'and m_owner!='MDSYS' and m_owner!='SYS'))
     then
        m_stmt:='call mderr.raise_md_error(''MD'', ''SDO'', -13391, ''The referenced raster data table(RDT) cannot be dropped.'')';
        execute immediate m_stmt;
     end if;
   end if;

   m_stmt:='insert into sdo_geor_ddl__table$$ values (2)';
   EXECUTE IMMEDIATE m_stmt;
   commit;
 end if;

 if(m_user='SYS' or m_user='SYSTEM' or m_user='MDSYS'
   or m_owner='MDSYS' or m_owner='SYS')
 then
   return;
 end if;


 if (m_event='RENAME' and m_type='TABLE')
 then

   m_stmt:='select count(*) from sdo_geor_sysdata_table where sdo_owner=:1 and RDT_TABLE_NAME=:2';
   EXECUTE IMMEDIATE m_stmt into m_cnt using m_owner,m_name;
   if(m_cnt!=0)
   then
     m_stmt:='select count(*) from sdo_geor_ddl__table$$';
     EXECUTE IMMEDIATE m_stmt into m_cnt;
     if(m_cnt=0)
     then
        m_stmt:='call mderr.raise_md_error(''MD'', ''SDO'', -13391, ''The referenced raster data table(RDT) cannot be renamed directly.'')';
        execute immediate m_stmt;
     end if;
   end if;

 end if;

 if (m_type='TRIGGER' and m_event='DROP')
 then
   m_stmt:='select REGEXP_SUBSTR(:1,''GRDMLTR_.+'',1,1,''i'') from dual';
   EXECUTE IMMEDIATE m_stmt into m_var using m_name;
   if(m_var is null)
   then
     return;
   end if;
   m_stmt:='select count(*) from sdo_geor_ddl__table$$';
   EXECUTE IMMEDIATE m_stmt into m_cnt;
   if(m_cnt=0)
   then
     m_stmt:='call mderr.raise_md_error(''MD'', ''SDO'', -13391, ''GeoRaster DML triggers cannot be dropped.'')';
     execute immediate m_stmt;
   end if;
 end if;

 if (m_type='TRIGGER' and m_event='ALTER')
 then
   m_o_stmt:=upper(trim(m_o_stmt));
   if(instr(m_o_stmt,' COMPILE ')>0 or instr(m_o_stmt,' ENABLE ')>0
     or substr(m_o_stmt,length(m_o_stmt)-8,8)=' COMPILE' or substr(m_o_stmt,length(m_o_stmt)-7,7)=' ENABLE' )
   then
     return;
   end if;
   m_stmt:='select REGEXP_SUBSTR(:1,''GRDMLTR_.+'',1,1,''i'') from dual';
   EXECUTE IMMEDIATE m_stmt into m_var using m_name;
   if(m_var is null)
   then
     return;
   end if;
   m_stmt:='select count(*) from sdo_geor_ddl__table$$';
   EXECUTE IMMEDIATE m_stmt into m_cnt;
   if(m_cnt=0)
   then
     m_stmt:='call mderr.raise_md_error(''MD'', ''SDO'', -13391, ''GeoRaster DML triggers cannot be altered.'')';
     execute immediate m_stmt;
   end if;
 end if;

 if (m_type='TRIGGER' and m_event='CREATE')
 then
   m_stmt:='select REGEXP_SUBSTR(:1,''GRDMLTR_.+'',1,1,''i'') from dual';
   EXECUTE IMMEDIATE m_stmt into m_var using m_name;
   if(m_var is null)
   then
     return;
   end if;
   m_stmt:='select count(*) from sdo_geor_ddl__table$$';
   EXECUTE IMMEDIATE m_stmt into m_cnt;
   if(m_cnt=0)
   then
     m_stmt:='call mderr.raise_md_error(''MD'', ''SDO'', -13391, ''GeoRaster reserved names cannot be used to create regular triggers.'')';
     execute immediate m_stmt;
   end if;
 end if;

 Exception
   when others then
     if(sqlcode=-13391)
     then
       m_stmt:=sqlerrm;
       m_stmt:=substr(m_stmt,11);
       m_stmt:='call mderr.raise_md_error(''MD'', ''SDO'', -13391,'''||m_stmt||''')';
       execute immediate m_stmt;
     end if;
end;
/
SHOW ERRORS;


CREATE OR REPLACE TRIGGER MDSYS.sdo_geor_err_trigger
after SERVERERROR on database
declare
  m_stmt  varchar2(512);
begin
   m_stmt:='delete from sdo_geor_ddl__table$$';
   EXECUTE IMMEDIATE m_stmt;
   EXCEPTION
     WHEN OTHERS THEN
       NULL;
end;
/
SHOW ERRORS;


CREATE OR REPLACE TRIGGER MDSYS.SDO_NETWORK_DROP_USER
AFTER DROP ON DATABASE
DECLARE
  stmt    VARCHAR2(256);
BEGIN

  IF  sys.dbms_standard.dictionary_obj_type = 'USER'  THEN
    stmt := 'DELETE FROM SDO_NETWORK_METADATA_TABLE WHERE SDO_OWNER = :name';
    EXECUTE IMMEDIATE stmt using NLS_UPPER(sys.dbms_standard.dictionary_obj_name);

    stmt := 'DELETE FROM SDO_NETWORK_CONSTRAINTS WHERE SDO_OWNER = :name';
    EXECUTE IMMEDIATE stmt using NLS_UPPER(sys.dbms_standard.dictionary_obj_name);

    stmt := 'DELETE FROM SDO_NETWORK_LOCKS_WM WHERE SDO_OWNER = :name';
    EXECUTE IMMEDIATE stmt using NLS_UPPER(sys.dbms_standard.dictionary_obj_name);

    stmt := 'DELETE FROM SDO_NETWORK_USER_DATA WHERE SDO_OWNER = :name';
    EXECUTE IMMEDIATE stmt using NLS_UPPER(sys.dbms_standard.dictionary_obj_name);

    --lrg-3417773
    stmt := 'DELETE FROM SDO_NETWORK_HISTORIES WHERE OWNER = :name';
    EXECUTE IMMEDIATE stmt using NLS_UPPER(sys.dbms_standard.dictionary_obj_name);

    stmt := 'DELETE FROM SDO_NETWORK_TIMESTAMPS WHERE OWNER = :name';
    EXECUTE IMMEDIATE stmt using NLS_UPPER(sys.dbms_standard.dictionary_obj_name);
  END IF;
END ;
/
SHOW ERRORS;


CREATE OR REPLACE TRIGGER MDSYS.sdo_st_syn_create
  BEFORE CREATE ON DATABASE
declare
 error boolean;
  st_syn_detected EXCEPTION;
   PRAGMA EXCEPTION_INIT(st_syn_detected, -995);
 BEGIN
   if((sys.dbms_standard.dictionary_obj_type!='SYNONYM')or(sys.dbms_standard.dictionary_obj_owner!='PUBLIC'))
   then
     return;
   end if;
   error :=
      CASE sys.dbms_standard.dictionary_obj_name
         WHEN 'ST_GEOMETRY' THEN TRUE
         WHEN 'ST_SURFACE' THEN TRUE
         WHEN 'ST_POLYGON' THEN TRUE
         WHEN 'ST_POINT' THEN TRUE
         WHEN 'ST_MULTISURFACE' THEN TRUE
         WHEN 'ST_MULTIPOINT' THEN TRUE
         WHEN 'ST_MULTILINESTRING' THEN TRUE
         WHEN 'ST_MULTICURVE' THEN TRUE
         WHEN 'ST_LINESTRING' THEN TRUE
         WHEN 'ST_GEOMCOLLECTION' THEN TRUE
         WHEN 'ST_CURVE' THEN TRUE
         WHEN 'ST_CURVEPOLYGON' THEN TRUE
         WHEN 'ST_COMPOUNDCURVE' THEN TRUE
         WHEN 'ST_CIRCULARSTRING' THEN TRUE
         WHEN 'ST_INTERSECTS' THEN TRUE
         WHEN 'ST_RELATE' THEN TRUE
         WHEN 'ST_TOUCH' THEN TRUE
         WHEN 'ST_CONTAINS' THEN TRUE
         WHEN 'ST_COVERS' THEN TRUE
         WHEN 'ST_COVEREDBY' THEN TRUE
         WHEN 'ST_INSIDE' THEN TRUE
         WHEN 'ST_OVERLAP' THEN TRUE
         WHEN 'ST_OVERLAPS' THEN TRUE
         WHEN 'ST_EQUAL' THEN TRUE
         WHEN 'ST_OVERLAPBDYDISJOINT' THEN TRUE
         WHEN 'ST_OVERLAPBDYINTERSECT' THEN TRUE
         WHEN 'ST_GEOMETRY_ARRAY' THEN TRUE
         WHEN 'ST_POINT_ARRAY' THEN TRUE
         WHEN 'ST_CURVE_ARRAY' THEN TRUE
         WHEN 'ST_SURFACE_ARRAY' THEN TRUE
         WHEN 'ST_LINESTRING_ARRAY' THEN TRUE
         WHEN 'ST_POLYGON_ARRAY' THEN TRUE
         ELSE FALSE
      END;

   if(error) then
     raise st_syn_detected;

   end if;
 END;
/
SHOW ERRORS;


CREATE OR REPLACE TRIGGER MDSYS.sdo_topo_drop_ftbl
  BEFORE DROP ON DATABASE
DECLARE
    cnt        NUMBER;
    stmt       VARCHAR(500);
    topology   VARCHAR(100);
    REG_TBL    EXCEPTION;

  BEGIN
    if(sys.dbms_standard.dictionary_obj_type != 'TABLE')
    then
      return;
    end if;
    stmt := 'SELECT  topology ' ||
     '  FROM  SDO_TOPO_METADATA_TABLE a, TABLE(a.Topo_Geometry_Layers) b ' ||
            '  WHERE b.owner = :owner AND b.table_name = :tab ' ;
    EXECUTE IMMEDIATE stmt into topology
      USING sys.dbms_standard.DICTIONARY_OBJ_OWNER,sys.dbms_standard.DICTIONARY_OBJ_NAME;
    RAISE REG_TBL;

    EXCEPTION
      WHEN REG_TBL THEN
        MDSYS.MDERR.raise_md_error(
         'MD', 'SDO', -13199,
         'Need use delete_topo_geometry_layer() to deregister table '
         || sys.dbms_standard.DICTIONARY_OBJ_NAME || ' from topology ' || topology ||
         ' before drop it');
      WHEN OTHERS THEN
        RETURN;
  END;
/
SHOW ERRORS;


CREATE OR REPLACE TRIGGER SYSMAN.MGMT_STARTUP AFTER STARTUP ON DATABASE
BEGIN
  -- Pin all PLSQL in the SYSMAN schema in memory
  EMD_MAINTENANCE.PIN_PLSQL;
EXCEPTION
  -- Trap all exceptions so database startup will not be impacted
  -- by errors.  Called routines should handle errors appropriately.
  WHEN OTHERS THEN
    NULL;
END;
/
SHOW ERRORS;


CREATE OR REPLACE TRIGGER WMSYS.NO_VM_DDL before alter or create or drop or rename on database
DISABLE
WHEN (
(sys.sysevent in ('ALTER', 'RENAME') and sys.dictionary_obj_type in ('INDEX','TABLE')) or
        (sys.sysevent = 'CREATE' and sys.dictionary_obj_type in ( 'PROCEDURE', 'TRIGGER', 'VIEW')) or
        (sys.sysevent = 'DROP' and sys.dictionary_obj_type in ('INDEX', 'PROCEDURE', 'ROLE', 'TABLE', 'TRIGGER', 'TYPE', 'USER', 'VIEW'))
      )
declare
  s_event varchar2(100) := sys.sysevent ;
  validStack integer ;
begin










  if (sys_context('lt_ctx', 'allowDDLOperation')='true') then
    return ;
  end if ;

  if (sys_context('lt_ctx', 'validStack') is null or sys_context('lt_ctx', 'validStack') != 'YES') then
    validStack := 0 ;
  else
    validStack := 1 ;
  end if ;

  if (s_event='CREATE') then
    execute immediate 'call wmsys.no_vm_create_proc(:1,:2,:3,:4)'
      using sys.dictionary_obj_type, sys.dictionary_obj_name, sys.dictionary_obj_owner, validStack ;
  elsif (s_event='DROP') then
    execute immediate 'call wmsys.no_vm_drop_proc(:1,:2,:3,:4)'
      using sys.dictionary_obj_type, sys.dictionary_obj_name, sys.dictionary_obj_owner, validStack ;
  elsif (s_event in ('ALTER', 'RENAME')) then
    execute immediate 'call wmsys.no_vm_alter_proc(:1,:2,:3,:4)'
      using sys.dictionary_obj_type, sys.dictionary_obj_name, sys.dictionary_obj_owner, validStack ;
  end if ;
end;
/
SHOW ERRORS;


CREATE OR REPLACE TRIGGER WMSYS.NO_VM_DROP_A after drop on database
DISABLE
WHEN (
sys.dictionary_obj_type in ('USER')
      )
begin
  execute immediate 'call wmsys.lt_ctx_pkg.allowDDLOperation(''false'')' ;



end;
/
SHOW ERRORS;


CREATE ROLE EXECUTE_CATALOG_ROLE NOT IDENTIFIED;

-- Roles granted to EXECUTE_CATALOG_ROLE
GRANT HS_ADMIN_EXECUTE_ROLE TO EXECUTE_CATALOG_ROLE;



CREATE ROLE EXP_FULL_DATABASE NOT IDENTIFIED;

-- System privileges granted to EXP_FULL_DATABASE
BEGIN
SYS.DBMS_RESOURCE_MANAGER_PRIVS.GRANT_SYSTEM_PRIVILEGE
  (GRANTEE_NAME   => 'EXP_FULL_DATABASE', 
   PRIVILEGE_NAME => 'ADMINISTER_RESOURCE_MANAGER',
   ADMIN_OPTION   => FALSE);
END;
/
GRANT ADMINISTER SQL MANAGEMENT OBJECT TO EXP_FULL_DATABASE;
GRANT BACKUP ANY TABLE TO EXP_FULL_DATABASE;
GRANT CREATE SESSION TO EXP_FULL_DATABASE;
GRANT CREATE TABLE TO EXP_FULL_DATABASE;
GRANT EXECUTE ANY PROCEDURE TO EXP_FULL_DATABASE;
GRANT EXECUTE ANY TYPE TO EXP_FULL_DATABASE;
GRANT READ ANY FILE GROUP TO EXP_FULL_DATABASE;
GRANT RESUMABLE TO EXP_FULL_DATABASE;
GRANT SELECT ANY SEQUENCE TO EXP_FULL_DATABASE;
GRANT SELECT ANY TABLE TO EXP_FULL_DATABASE;

-- Roles granted to EXP_FULL_DATABASE
GRANT EXECUTE_CATALOG_ROLE TO EXP_FULL_DATABASE;
GRANT SELECT_CATALOG_ROLE TO EXP_FULL_DATABASE;



CREATE ROLE HS_ADMIN_ROLE NOT IDENTIFIED;

-- Roles granted to HS_ADMIN_ROLE
GRANT HS_ADMIN_EXECUTE_ROLE TO HS_ADMIN_ROLE;
GRANT HS_ADMIN_SELECT_ROLE TO HS_ADMIN_ROLE;



CREATE ROLE IMP_FULL_DATABASE NOT IDENTIFIED;

-- System privileges granted to IMP_FULL_DATABASE
GRANT ADMINISTER DATABASE TRIGGER TO IMP_FULL_DATABASE;
BEGIN
SYS.DBMS_RESOURCE_MANAGER_PRIVS.GRANT_SYSTEM_PRIVILEGE
  (GRANTEE_NAME   => 'IMP_FULL_DATABASE', 
   PRIVILEGE_NAME => 'ADMINISTER_RESOURCE_MANAGER',
   ADMIN_OPTION   => FALSE);
END;
/
GRANT ADMINISTER SQL MANAGEMENT OBJECT TO IMP_FULL_DATABASE;
GRANT ALTER ANY PROCEDURE TO IMP_FULL_DATABASE;
GRANT ALTER ANY TABLE TO IMP_FULL_DATABASE;
GRANT ALTER ANY TRIGGER TO IMP_FULL_DATABASE;
GRANT ALTER ANY TYPE TO IMP_FULL_DATABASE;
GRANT ALTER DATABASE TO IMP_FULL_DATABASE;
GRANT ALTER PROFILE TO IMP_FULL_DATABASE;
GRANT ALTER RESOURCE COST TO IMP_FULL_DATABASE;
GRANT ALTER USER TO IMP_FULL_DATABASE;
GRANT ANALYZE ANY TO IMP_FULL_DATABASE;
GRANT AUDIT ANY TO IMP_FULL_DATABASE;
GRANT AUDIT SYSTEM TO IMP_FULL_DATABASE;
GRANT BECOME USER TO IMP_FULL_DATABASE;
GRANT COMMENT ANY TABLE TO IMP_FULL_DATABASE;
GRANT CREATE ANY CLUSTER TO IMP_FULL_DATABASE;
GRANT CREATE ANY CONTEXT TO IMP_FULL_DATABASE;
GRANT CREATE ANY DIMENSION TO IMP_FULL_DATABASE;
GRANT CREATE ANY DIRECTORY TO IMP_FULL_DATABASE;
GRANT CREATE ANY INDEX TO IMP_FULL_DATABASE;
GRANT CREATE ANY INDEXTYPE TO IMP_FULL_DATABASE;
GRANT CREATE ANY LIBRARY TO IMP_FULL_DATABASE;
GRANT CREATE ANY MATERIALIZED VIEW TO IMP_FULL_DATABASE;
GRANT CREATE ANY OPERATOR TO IMP_FULL_DATABASE;
GRANT CREATE ANY PROCEDURE TO IMP_FULL_DATABASE;
GRANT CREATE ANY SEQUENCE TO IMP_FULL_DATABASE;
GRANT CREATE ANY SQL PROFILE TO IMP_FULL_DATABASE;
GRANT CREATE ANY SYNONYM TO IMP_FULL_DATABASE;
GRANT CREATE ANY TABLE TO IMP_FULL_DATABASE;
GRANT CREATE ANY TRIGGER TO IMP_FULL_DATABASE;
GRANT CREATE ANY TYPE TO IMP_FULL_DATABASE;
GRANT CREATE ANY VIEW TO IMP_FULL_DATABASE;
GRANT CREATE DATABASE LINK TO IMP_FULL_DATABASE;
GRANT CREATE PROFILE TO IMP_FULL_DATABASE;
GRANT CREATE PUBLIC DATABASE LINK TO IMP_FULL_DATABASE;
GRANT CREATE PUBLIC SYNONYM TO IMP_FULL_DATABASE;
GRANT CREATE ROLE TO IMP_FULL_DATABASE;
GRANT CREATE ROLLBACK SEGMENT TO IMP_FULL_DATABASE;
GRANT CREATE SESSION TO IMP_FULL_DATABASE;
GRANT CREATE TABLESPACE TO IMP_FULL_DATABASE;
GRANT CREATE USER TO IMP_FULL_DATABASE;
GRANT DELETE ANY TABLE TO IMP_FULL_DATABASE;
GRANT DROP ANY CLUSTER TO IMP_FULL_DATABASE;
GRANT DROP ANY CONTEXT TO IMP_FULL_DATABASE;
GRANT DROP ANY DIMENSION TO IMP_FULL_DATABASE;
GRANT DROP ANY DIRECTORY TO IMP_FULL_DATABASE;
GRANT DROP ANY INDEX TO IMP_FULL_DATABASE;
GRANT DROP ANY INDEXTYPE TO IMP_FULL_DATABASE;
GRANT DROP ANY LIBRARY TO IMP_FULL_DATABASE;
GRANT DROP ANY MATERIALIZED VIEW TO IMP_FULL_DATABASE;
GRANT DROP ANY OPERATOR TO IMP_FULL_DATABASE;
GRANT DROP ANY OUTLINE TO IMP_FULL_DATABASE;
GRANT DROP ANY PROCEDURE TO IMP_FULL_DATABASE;
GRANT DROP ANY ROLE TO IMP_FULL_DATABASE;
GRANT DROP ANY SEQUENCE TO IMP_FULL_DATABASE;
GRANT DROP ANY SQL PROFILE TO IMP_FULL_DATABASE;
GRANT DROP ANY SYNONYM TO IMP_FULL_DATABASE;
GRANT DROP ANY TABLE TO IMP_FULL_DATABASE;
GRANT DROP ANY TRIGGER TO IMP_FULL_DATABASE;
GRANT DROP ANY TYPE TO IMP_FULL_DATABASE;
GRANT DROP ANY VIEW TO IMP_FULL_DATABASE;
GRANT DROP PROFILE TO IMP_FULL_DATABASE;
GRANT DROP PUBLIC DATABASE LINK TO IMP_FULL_DATABASE;
GRANT DROP PUBLIC SYNONYM TO IMP_FULL_DATABASE;
GRANT DROP ROLLBACK SEGMENT TO IMP_FULL_DATABASE;
GRANT DROP TABLESPACE TO IMP_FULL_DATABASE;
GRANT DROP USER TO IMP_FULL_DATABASE;
GRANT EXECUTE ANY OPERATOR TO IMP_FULL_DATABASE;
GRANT EXECUTE ANY PROCEDURE TO IMP_FULL_DATABASE;
GRANT EXECUTE ANY TYPE TO IMP_FULL_DATABASE;
GRANT GLOBAL QUERY REWRITE TO IMP_FULL_DATABASE;
GRANT GRANT ANY OBJECT PRIVILEGE TO IMP_FULL_DATABASE;
GRANT GRANT ANY PRIVILEGE TO IMP_FULL_DATABASE;
GRANT GRANT ANY ROLE TO IMP_FULL_DATABASE;
GRANT INSERT ANY TABLE TO IMP_FULL_DATABASE;
BEGIN
SYS.DBMS_AQADM.GRANT_SYSTEM_PRIVILEGE (
  PRIVILEGE    => 'MANAGE_ANY',
  GRANTEE      => 'IMP_FULL_DATABASE',
  ADMIN_OPTION => FALSE);
END;
/
GRANT RESUMABLE TO IMP_FULL_DATABASE;
GRANT SELECT ANY TABLE TO IMP_FULL_DATABASE;
GRANT UPDATE ANY TABLE TO IMP_FULL_DATABASE;

-- Roles granted to IMP_FULL_DATABASE
GRANT EXECUTE_CATALOG_ROLE TO IMP_FULL_DATABASE;
GRANT SELECT_CATALOG_ROLE TO IMP_FULL_DATABASE;



CREATE ROLE JAVASYSPRIV NOT IDENTIFIED;

-- Roles granted to JAVASYSPRIV
GRANT JAVAUSERPRIV TO JAVASYSPRIV;



CREATE ROLE LOGSTDBY_ADMINISTRATOR NOT IDENTIFIED;

-- System privileges granted to LOGSTDBY_ADMINISTRATOR
GRANT UNLIMITED TABLESPACE TO LOGSTDBY_ADMINISTRATOR;

-- Roles granted to LOGSTDBY_ADMINISTRATOR
GRANT RESOURCE TO LOGSTDBY_ADMINISTRATOR;



CREATE ROLE OEM_MONITOR NOT IDENTIFIED;

-- System privileges granted to OEM_MONITOR
GRANT ADVISOR TO OEM_MONITOR;
GRANT ANALYZE ANY TO OEM_MONITOR;
GRANT ANALYZE ANY DICTIONARY TO OEM_MONITOR;
GRANT CREATE JOB TO OEM_MONITOR;
GRANT CREATE SESSION TO OEM_MONITOR;
BEGIN
SYS.DBMS_AQADM.GRANT_SYSTEM_PRIVILEGE (
  PRIVILEGE    => 'MANAGE_ANY',
  GRANTEE      => 'OEM_MONITOR',
  ADMIN_OPTION => FALSE);
END;
/
GRANT SELECT ANY DICTIONARY TO OEM_MONITOR;

-- Roles granted to OEM_MONITOR
GRANT SELECT_CATALOG_ROLE TO OEM_MONITOR;



CREATE USER DBSNMP
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE SYSAUX
  TEMPORARY TABLESPACE TEMP
  PROFILE MONITORING_PROFILE
  ACCOUNT UNLOCK;
  -- 1 Role for DBSNMP 
  GRANT OEM_MONITOR TO DBSNMP;
  ALTER USER DBSNMP DEFAULT ROLE ALL;
  -- 4 System Privileges for DBSNMP 
  GRANT CREATE PROCEDURE TO DBSNMP;
  GRANT CREATE TABLE TO DBSNMP;
  GRANT SELECT ANY DICTIONARY TO DBSNMP;
  GRANT UNLIMITED TABLESPACE TO DBSNMP;
  -- 4 Object Privileges for DBSNMP 
    GRANT SELECT ON APPQOSSYS.WLM_CLASSIFIER_PLAN TO DBSNMP;
    GRANT SELECT ON APPQOSSYS.WLM_METRICS_STREAM TO DBSNMP;
    GRANT EXECUTE ON SYS.DBMS_MANAGEMENT_PACKS TO DBSNMP;
    GRANT EXECUTE ON SYS.DBMS_SERVER_ALERT TO DBSNMP;


CREATE ROLE DATAPUMP_EXP_FULL_DATABASE NOT IDENTIFIED;

-- System privileges granted to DATAPUMP_EXP_FULL_DATABASE
GRANT CREATE SESSION TO DATAPUMP_EXP_FULL_DATABASE;
GRANT CREATE TABLE TO DATAPUMP_EXP_FULL_DATABASE;

-- Roles granted to DATAPUMP_EXP_FULL_DATABASE
GRANT EXP_FULL_DATABASE TO DATAPUMP_EXP_FULL_DATABASE;



CREATE ROLE DATAPUMP_IMP_FULL_DATABASE NOT IDENTIFIED;

-- System privileges granted to DATAPUMP_IMP_FULL_DATABASE
GRANT ALTER DATABASE TO DATAPUMP_IMP_FULL_DATABASE;
GRANT ALTER PROFILE TO DATAPUMP_IMP_FULL_DATABASE;
GRANT ALTER RESOURCE COST TO DATAPUMP_IMP_FULL_DATABASE;
GRANT ALTER USER TO DATAPUMP_IMP_FULL_DATABASE;
GRANT AUDIT ANY TO DATAPUMP_IMP_FULL_DATABASE;
GRANT AUDIT SYSTEM TO DATAPUMP_IMP_FULL_DATABASE;
GRANT CREATE PROFILE TO DATAPUMP_IMP_FULL_DATABASE;
GRANT CREATE SESSION TO DATAPUMP_IMP_FULL_DATABASE;
GRANT DELETE ANY TABLE TO DATAPUMP_IMP_FULL_DATABASE;
GRANT EXECUTE ANY OPERATOR TO DATAPUMP_IMP_FULL_DATABASE;
GRANT GRANT ANY OBJECT PRIVILEGE TO DATAPUMP_IMP_FULL_DATABASE;
GRANT GRANT ANY PRIVILEGE TO DATAPUMP_IMP_FULL_DATABASE;
GRANT GRANT ANY ROLE TO DATAPUMP_IMP_FULL_DATABASE;
GRANT SELECT ANY TABLE TO DATAPUMP_IMP_FULL_DATABASE;

-- Roles granted to DATAPUMP_IMP_FULL_DATABASE
GRANT EXP_FULL_DATABASE TO DATAPUMP_IMP_FULL_DATABASE;
GRANT IMP_FULL_DATABASE TO DATAPUMP_IMP_FULL_DATABASE;



CREATE ROLE DBA NOT IDENTIFIED;

-- System privileges granted to DBA
GRANT ADMINISTER ANY SQL TUNING SET TO DBA WITH ADMIN OPTION;
GRANT ADMINISTER DATABASE TRIGGER TO DBA WITH ADMIN OPTION;
BEGIN
SYS.DBMS_RESOURCE_MANAGER_PRIVS.GRANT_SYSTEM_PRIVILEGE
  (GRANTEE_NAME   => 'DBA', 
   PRIVILEGE_NAME => 'ADMINISTER_RESOURCE_MANAGER',
   ADMIN_OPTION   => TRUE);
END;
/
GRANT ADMINISTER SQL MANAGEMENT OBJECT TO DBA WITH ADMIN OPTION;
GRANT ADMINISTER SQL TUNING SET TO DBA WITH ADMIN OPTION;
GRANT ADVISOR TO DBA WITH ADMIN OPTION;
GRANT ALTER ANY ASSEMBLY TO DBA WITH ADMIN OPTION;
GRANT ALTER ANY CLUSTER TO DBA WITH ADMIN OPTION;
GRANT ALTER ANY CUBE TO DBA WITH ADMIN OPTION;
GRANT ALTER ANY CUBE DIMENSION TO DBA WITH ADMIN OPTION;
GRANT ALTER ANY DIMENSION TO DBA WITH ADMIN OPTION;
GRANT ALTER ANY EDITION TO DBA WITH ADMIN OPTION;
BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE    => SYS.DBMS_RULE_ADM.ALTER_ANY_EVALUATION_CONTEXT,
  GRANTEE      => 'DBA',
  GRANT_OPTION => TRUE);
END;
/
GRANT ALTER ANY INDEX TO DBA WITH ADMIN OPTION;
GRANT ALTER ANY INDEXTYPE TO DBA WITH ADMIN OPTION;
GRANT ALTER ANY LIBRARY TO DBA WITH ADMIN OPTION;
GRANT ALTER ANY MATERIALIZED VIEW TO DBA WITH ADMIN OPTION;
GRANT ALTER ANY MINING MODEL TO DBA WITH ADMIN OPTION;
GRANT ALTER ANY OPERATOR TO DBA WITH ADMIN OPTION;
GRANT ALTER ANY OUTLINE TO DBA WITH ADMIN OPTION;
GRANT ALTER ANY PROCEDURE TO DBA WITH ADMIN OPTION;
GRANT ALTER ANY ROLE TO DBA WITH ADMIN OPTION;
BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE    => SYS.DBMS_RULE_ADM.ALTER_ANY_RULE,
  GRANTEE      => 'DBA',
  GRANT_OPTION => TRUE);
END;
/
BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE    => SYS.DBMS_RULE_ADM.ALTER_ANY_RULE_SET,
  GRANTEE      => 'DBA',
  GRANT_OPTION => TRUE);
END;
/
GRANT ALTER ANY SEQUENCE TO DBA WITH ADMIN OPTION;
GRANT ALTER ANY SQL PROFILE TO DBA WITH ADMIN OPTION;
GRANT ALTER ANY TABLE TO DBA WITH ADMIN OPTION;
GRANT ALTER ANY TRIGGER TO DBA WITH ADMIN OPTION;
GRANT ALTER ANY TYPE TO DBA WITH ADMIN OPTION;
GRANT ALTER DATABASE TO DBA WITH ADMIN OPTION;
GRANT ALTER PROFILE TO DBA WITH ADMIN OPTION;
GRANT ALTER RESOURCE COST TO DBA WITH ADMIN OPTION;
GRANT ALTER ROLLBACK SEGMENT TO DBA WITH ADMIN OPTION;
GRANT ALTER SESSION TO DBA WITH ADMIN OPTION;
GRANT ALTER SYSTEM TO DBA WITH ADMIN OPTION;
GRANT ALTER TABLESPACE TO DBA WITH ADMIN OPTION;
GRANT ALTER USER TO DBA WITH ADMIN OPTION;
GRANT ANALYZE ANY TO DBA WITH ADMIN OPTION;
GRANT ANALYZE ANY DICTIONARY TO DBA WITH ADMIN OPTION;
GRANT AUDIT ANY TO DBA WITH ADMIN OPTION;
GRANT AUDIT SYSTEM TO DBA WITH ADMIN OPTION;
GRANT BACKUP ANY TABLE TO DBA WITH ADMIN OPTION;
GRANT BECOME USER TO DBA WITH ADMIN OPTION;
GRANT CHANGE NOTIFICATION TO DBA WITH ADMIN OPTION;
GRANT COMMENT ANY MINING MODEL TO DBA WITH ADMIN OPTION;
GRANT COMMENT ANY TABLE TO DBA WITH ADMIN OPTION;
GRANT CREATE ANY ASSEMBLY TO DBA WITH ADMIN OPTION;
GRANT CREATE ANY CLUSTER TO DBA WITH ADMIN OPTION;
GRANT CREATE ANY CONTEXT TO DBA WITH ADMIN OPTION;
GRANT CREATE ANY CUBE TO DBA WITH ADMIN OPTION;
GRANT CREATE ANY CUBE BUILD PROCESS TO DBA WITH ADMIN OPTION;
GRANT CREATE ANY CUBE DIMENSION TO DBA WITH ADMIN OPTION;
GRANT CREATE ANY DIMENSION TO DBA WITH ADMIN OPTION;
GRANT CREATE ANY DIRECTORY TO DBA WITH ADMIN OPTION;
GRANT CREATE ANY EDITION TO DBA WITH ADMIN OPTION;
BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE    => SYS.DBMS_RULE_ADM.CREATE_ANY_EVALUATION_CONTEXT,
  GRANTEE      => 'DBA',
  GRANT_OPTION => TRUE);
END;
/
GRANT CREATE ANY INDEX TO DBA WITH ADMIN OPTION;
GRANT CREATE ANY INDEXTYPE TO DBA WITH ADMIN OPTION;
GRANT CREATE ANY JOB TO DBA WITH ADMIN OPTION;
GRANT CREATE ANY LIBRARY TO DBA WITH ADMIN OPTION;
GRANT CREATE ANY MATERIALIZED VIEW TO DBA WITH ADMIN OPTION;
GRANT CREATE ANY MEASURE FOLDER TO DBA WITH ADMIN OPTION;
GRANT CREATE ANY MINING MODEL TO DBA WITH ADMIN OPTION;
GRANT CREATE ANY OPERATOR TO DBA WITH ADMIN OPTION;
GRANT CREATE ANY OUTLINE TO DBA WITH ADMIN OPTION;
GRANT CREATE ANY PROCEDURE TO DBA WITH ADMIN OPTION;
BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE    => SYS.DBMS_RULE_ADM.CREATE_ANY_RULE,
  GRANTEE      => 'DBA',
  GRANT_OPTION => TRUE);
END;
/
BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE    => SYS.DBMS_RULE_ADM.CREATE_ANY_RULE_SET,
  GRANTEE      => 'DBA',
  GRANT_OPTION => TRUE);
END;
/
GRANT CREATE ANY SEQUENCE TO DBA WITH ADMIN OPTION;
GRANT CREATE ANY SQL PROFILE TO DBA WITH ADMIN OPTION;
GRANT CREATE ANY SYNONYM TO DBA WITH ADMIN OPTION;
GRANT CREATE ANY TABLE TO DBA WITH ADMIN OPTION;
GRANT CREATE ANY TRIGGER TO DBA WITH ADMIN OPTION;
GRANT CREATE ANY TYPE TO DBA WITH ADMIN OPTION;
GRANT CREATE ANY VIEW TO DBA WITH ADMIN OPTION;
GRANT CREATE ASSEMBLY TO DBA WITH ADMIN OPTION;
GRANT CREATE CLUSTER TO DBA WITH ADMIN OPTION;
GRANT CREATE CUBE TO DBA WITH ADMIN OPTION;
GRANT CREATE CUBE BUILD PROCESS TO DBA WITH ADMIN OPTION;
GRANT CREATE CUBE DIMENSION TO DBA WITH ADMIN OPTION;
GRANT CREATE DATABASE LINK TO DBA WITH ADMIN OPTION;
GRANT CREATE DIMENSION TO DBA WITH ADMIN OPTION;
BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE    => SYS.DBMS_RULE_ADM.CREATE_EVALUATION_CONTEXT_OBJ,
  GRANTEE      => 'DBA',
  GRANT_OPTION => TRUE);
END;
/
GRANT CREATE EXTERNAL JOB TO DBA WITH ADMIN OPTION;
GRANT CREATE INDEXTYPE TO DBA WITH ADMIN OPTION;
GRANT CREATE JOB TO DBA WITH ADMIN OPTION;
GRANT CREATE LIBRARY TO DBA WITH ADMIN OPTION;
GRANT CREATE MATERIALIZED VIEW TO DBA WITH ADMIN OPTION;
GRANT CREATE MEASURE FOLDER TO DBA WITH ADMIN OPTION;
GRANT CREATE MINING MODEL TO DBA WITH ADMIN OPTION;
GRANT CREATE OPERATOR TO DBA WITH ADMIN OPTION;
GRANT CREATE PROCEDURE TO DBA WITH ADMIN OPTION;
GRANT CREATE PROFILE TO DBA WITH ADMIN OPTION;
GRANT CREATE PUBLIC DATABASE LINK TO DBA WITH ADMIN OPTION;
GRANT CREATE PUBLIC SYNONYM TO DBA WITH ADMIN OPTION;
GRANT CREATE ROLE TO DBA WITH ADMIN OPTION;
GRANT CREATE ROLLBACK SEGMENT TO DBA WITH ADMIN OPTION;
BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE    => SYS.DBMS_RULE_ADM.CREATE_RULE_OBJ,
  GRANTEE      => 'DBA',
  GRANT_OPTION => TRUE);
END;
/
BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE    => SYS.DBMS_RULE_ADM.CREATE_RULE_SET_OBJ,
  GRANTEE      => 'DBA',
  GRANT_OPTION => TRUE);
END;
/
GRANT CREATE SEQUENCE TO DBA WITH ADMIN OPTION;
GRANT CREATE SESSION TO DBA WITH ADMIN OPTION;
GRANT CREATE SYNONYM TO DBA WITH ADMIN OPTION;
GRANT CREATE TABLE TO DBA WITH ADMIN OPTION;
GRANT CREATE TABLESPACE TO DBA WITH ADMIN OPTION;
GRANT CREATE TRIGGER TO DBA WITH ADMIN OPTION;
GRANT CREATE TYPE TO DBA WITH ADMIN OPTION;
GRANT CREATE USER TO DBA WITH ADMIN OPTION;
GRANT CREATE VIEW TO DBA WITH ADMIN OPTION;
GRANT DEBUG ANY PROCEDURE TO DBA WITH ADMIN OPTION;
GRANT DEBUG CONNECT SESSION TO DBA WITH ADMIN OPTION;
GRANT DELETE ANY CUBE DIMENSION TO DBA WITH ADMIN OPTION;
GRANT DELETE ANY MEASURE FOLDER TO DBA WITH ADMIN OPTION;
GRANT DELETE ANY TABLE TO DBA WITH ADMIN OPTION;
BEGIN
SYS.DBMS_AQADM.GRANT_SYSTEM_PRIVILEGE (
  PRIVILEGE    => 'DEQUEUE_ANY',
  GRANTEE      => 'DBA',
  ADMIN_OPTION => TRUE);
END;
/
GRANT DROP ANY ASSEMBLY TO DBA WITH ADMIN OPTION;
GRANT DROP ANY CLUSTER TO DBA WITH ADMIN OPTION;
GRANT DROP ANY CONTEXT TO DBA WITH ADMIN OPTION;
GRANT DROP ANY CUBE TO DBA WITH ADMIN OPTION;
GRANT DROP ANY CUBE BUILD PROCESS TO DBA WITH ADMIN OPTION;
GRANT DROP ANY CUBE DIMENSION TO DBA WITH ADMIN OPTION;
GRANT DROP ANY DIMENSION TO DBA WITH ADMIN OPTION;
GRANT DROP ANY DIRECTORY TO DBA WITH ADMIN OPTION;
GRANT DROP ANY EDITION TO DBA WITH ADMIN OPTION;
BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE    => SYS.DBMS_RULE_ADM.DROP_ANY_EVALUATION_CONTEXT,
  GRANTEE      => 'DBA',
  GRANT_OPTION => TRUE);
END;
/
GRANT DROP ANY INDEX TO DBA WITH ADMIN OPTION;
GRANT DROP ANY INDEXTYPE TO DBA WITH ADMIN OPTION;
GRANT DROP ANY LIBRARY TO DBA WITH ADMIN OPTION;
GRANT DROP ANY MATERIALIZED VIEW TO DBA WITH ADMIN OPTION;
GRANT DROP ANY MEASURE FOLDER TO DBA WITH ADMIN OPTION;
GRANT DROP ANY MINING MODEL TO DBA WITH ADMIN OPTION;
GRANT DROP ANY OPERATOR TO DBA WITH ADMIN OPTION;
GRANT DROP ANY OUTLINE TO DBA WITH ADMIN OPTION;
GRANT DROP ANY PROCEDURE TO DBA WITH ADMIN OPTION;
GRANT DROP ANY ROLE TO DBA WITH ADMIN OPTION;
BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE    => SYS.DBMS_RULE_ADM.DROP_ANY_RULE,
  GRANTEE      => 'DBA',
  GRANT_OPTION => TRUE);
END;
/
BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE    => SYS.DBMS_RULE_ADM.DROP_ANY_RULE_SET,
  GRANTEE      => 'DBA',
  GRANT_OPTION => TRUE);
END;
/
GRANT DROP ANY SEQUENCE TO DBA WITH ADMIN OPTION;
GRANT DROP ANY SQL PROFILE TO DBA WITH ADMIN OPTION;
GRANT DROP ANY SYNONYM TO DBA WITH ADMIN OPTION;
GRANT DROP ANY TABLE TO DBA WITH ADMIN OPTION;
GRANT DROP ANY TRIGGER TO DBA WITH ADMIN OPTION;
GRANT DROP ANY TYPE TO DBA WITH ADMIN OPTION;
GRANT DROP ANY VIEW TO DBA WITH ADMIN OPTION;
GRANT DROP PROFILE TO DBA WITH ADMIN OPTION;
GRANT DROP PUBLIC DATABASE LINK TO DBA WITH ADMIN OPTION;
GRANT DROP PUBLIC SYNONYM TO DBA WITH ADMIN OPTION;
GRANT DROP ROLLBACK SEGMENT TO DBA WITH ADMIN OPTION;
GRANT DROP TABLESPACE TO DBA WITH ADMIN OPTION;
GRANT DROP USER TO DBA WITH ADMIN OPTION;
BEGIN
SYS.DBMS_AQADM.GRANT_SYSTEM_PRIVILEGE (
  PRIVILEGE    => 'ENQUEUE_ANY',
  GRANTEE      => 'DBA',
  ADMIN_OPTION => TRUE);
END;
/
GRANT EXECUTE ANY ASSEMBLY TO DBA WITH ADMIN OPTION;
GRANT EXECUTE ANY CLASS TO DBA WITH ADMIN OPTION;
BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE    => SYS.DBMS_RULE_ADM.EXECUTE_ANY_EVALUATION_CONTEXT,
  GRANTEE      => 'DBA',
  GRANT_OPTION => TRUE);
END;
/
GRANT EXECUTE ANY INDEXTYPE TO DBA WITH ADMIN OPTION;
GRANT EXECUTE ANY LIBRARY TO DBA WITH ADMIN OPTION;
GRANT EXECUTE ANY OPERATOR TO DBA WITH ADMIN OPTION;
GRANT EXECUTE ANY PROCEDURE TO DBA WITH ADMIN OPTION;
GRANT EXECUTE ANY PROGRAM TO DBA WITH ADMIN OPTION;
BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE    => SYS.DBMS_RULE_ADM.EXECUTE_ANY_RULE,
  GRANTEE      => 'DBA',
  GRANT_OPTION => TRUE);
END;
/
BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE    => SYS.DBMS_RULE_ADM.EXECUTE_ANY_RULE_SET,
  GRANTEE      => 'DBA',
  GRANT_OPTION => TRUE);
END;
/
GRANT EXECUTE ANY TYPE TO DBA WITH ADMIN OPTION;
GRANT EXECUTE ASSEMBLY TO DBA WITH ADMIN OPTION;
GRANT EXPORT FULL DATABASE TO DBA WITH ADMIN OPTION;
GRANT FLASHBACK ANY TABLE TO DBA WITH ADMIN OPTION;
GRANT FLASHBACK ARCHIVE ADMINISTER TO DBA WITH ADMIN OPTION;
GRANT FORCE ANY TRANSACTION TO DBA WITH ADMIN OPTION;
GRANT FORCE TRANSACTION TO DBA WITH ADMIN OPTION;
GRANT GLOBAL QUERY REWRITE TO DBA WITH ADMIN OPTION;
GRANT GRANT ANY OBJECT PRIVILEGE TO DBA WITH ADMIN OPTION;
GRANT GRANT ANY PRIVILEGE TO DBA WITH ADMIN OPTION;
GRANT GRANT ANY ROLE TO DBA WITH ADMIN OPTION;
GRANT IMPORT FULL DATABASE TO DBA WITH ADMIN OPTION;
GRANT INSERT ANY CUBE DIMENSION TO DBA WITH ADMIN OPTION;
GRANT INSERT ANY MEASURE FOLDER TO DBA WITH ADMIN OPTION;
GRANT INSERT ANY TABLE TO DBA WITH ADMIN OPTION;
GRANT LOCK ANY TABLE TO DBA WITH ADMIN OPTION;
GRANT MANAGE ANY FILE GROUP TO DBA WITH ADMIN OPTION;
BEGIN
SYS.DBMS_AQADM.GRANT_SYSTEM_PRIVILEGE (
  PRIVILEGE    => 'MANAGE_ANY',
  GRANTEE      => 'DBA',
  ADMIN_OPTION => TRUE);
END;
/
GRANT MANAGE FILE GROUP TO DBA WITH ADMIN OPTION;
GRANT MANAGE SCHEDULER TO DBA WITH ADMIN OPTION;
GRANT MANAGE TABLESPACE TO DBA WITH ADMIN OPTION;
GRANT MERGE ANY VIEW TO DBA WITH ADMIN OPTION;
GRANT ON COMMIT REFRESH TO DBA WITH ADMIN OPTION;
GRANT QUERY REWRITE TO DBA WITH ADMIN OPTION;
GRANT READ ANY FILE GROUP TO DBA WITH ADMIN OPTION;
GRANT RESTRICTED SESSION TO DBA WITH ADMIN OPTION;
GRANT RESUMABLE TO DBA WITH ADMIN OPTION;
GRANT SELECT ANY CUBE TO DBA WITH ADMIN OPTION;
GRANT SELECT ANY CUBE DIMENSION TO DBA WITH ADMIN OPTION;
GRANT SELECT ANY DICTIONARY TO DBA WITH ADMIN OPTION;
GRANT SELECT ANY MINING MODEL TO DBA WITH ADMIN OPTION;
GRANT SELECT ANY SEQUENCE TO DBA WITH ADMIN OPTION;
GRANT SELECT ANY TABLE TO DBA WITH ADMIN OPTION;
GRANT SELECT ANY TRANSACTION TO DBA WITH ADMIN OPTION;
GRANT UNDER ANY TABLE TO DBA WITH ADMIN OPTION;
GRANT UNDER ANY TYPE TO DBA WITH ADMIN OPTION;
GRANT UNDER ANY VIEW TO DBA WITH ADMIN OPTION;
GRANT UNLIMITED TABLESPACE TO DBA WITH ADMIN OPTION;
GRANT UPDATE ANY CUBE TO DBA WITH ADMIN OPTION;
GRANT UPDATE ANY CUBE BUILD PROCESS TO DBA WITH ADMIN OPTION;
GRANT UPDATE ANY CUBE DIMENSION TO DBA WITH ADMIN OPTION;
GRANT UPDATE ANY TABLE TO DBA WITH ADMIN OPTION;

-- Roles granted to DBA
GRANT DATAPUMP_EXP_FULL_DATABASE TO DBA;
GRANT DATAPUMP_IMP_FULL_DATABASE TO DBA;
GRANT DELETE_CATALOG_ROLE TO DBA WITH ADMIN OPTION;
GRANT EXECUTE_CATALOG_ROLE TO DBA WITH ADMIN OPTION;
GRANT EXP_FULL_DATABASE TO DBA;
GRANT GATHER_SYSTEM_STATISTICS TO DBA;
GRANT IMP_FULL_DATABASE TO DBA;
GRANT JAVA_ADMIN TO DBA;
GRANT JAVA_DEPLOY TO DBA;
GRANT OLAP_DBA TO DBA;
GRANT OLAP_XS_ADMIN TO DBA;
GRANT SCHEDULER_ADMIN TO DBA WITH ADMIN OPTION;
GRANT SELECT_CATALOG_ROLE TO DBA WITH ADMIN OPTION;
GRANT WM_ADMIN_ROLE TO DBA;
GRANT XDBADMIN TO DBA;
GRANT XDB_SET_INVOKER TO DBA;



CREATE USER HLEIVA
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE USERS
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  ACCOUNT UNLOCK;
  -- 1 Role for HLEIVA 
  GRANT DBA TO HLEIVA;
  ALTER USER HLEIVA DEFAULT ROLE ALL;
  -- 1 System Privilege for HLEIVA 
  GRANT UNLIMITED TABLESPACE TO HLEIVA;


CREATE USER SYS
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE SYSTEM
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  ACCOUNT UNLOCK;
  -- 53 Roles for SYS 
  GRANT ADM_PARALLEL_EXECUTE_TASK TO SYS WITH ADMIN OPTION;
  GRANT APEX_ADMINISTRATOR_ROLE TO SYS WITH ADMIN OPTION;
  GRANT AQ_ADMINISTRATOR_ROLE TO SYS WITH ADMIN OPTION;
  GRANT AQ_USER_ROLE TO SYS WITH ADMIN OPTION;
  GRANT AUTHENTICATEDUSER TO SYS WITH ADMIN OPTION;
  GRANT CONNECT TO SYS WITH ADMIN OPTION;
  GRANT CSW_USR_ROLE TO SYS WITH ADMIN OPTION;
  GRANT CTXAPP TO SYS WITH ADMIN OPTION;
  GRANT CWM_USER TO SYS WITH ADMIN OPTION;
  GRANT DATAPUMP_EXP_FULL_DATABASE TO SYS WITH ADMIN OPTION;
  GRANT DATAPUMP_IMP_FULL_DATABASE TO SYS WITH ADMIN OPTION;
  GRANT DBA TO SYS WITH ADMIN OPTION;
  GRANT DBFS_ROLE TO SYS WITH ADMIN OPTION;
  GRANT DELETE_CATALOG_ROLE TO SYS WITH ADMIN OPTION;
  GRANT EJBCLIENT TO SYS WITH ADMIN OPTION;
  GRANT EXECUTE_CATALOG_ROLE TO SYS WITH ADMIN OPTION;
  GRANT EXP_FULL_DATABASE TO SYS WITH ADMIN OPTION;
  GRANT GATHER_SYSTEM_STATISTICS TO SYS WITH ADMIN OPTION;
  GRANT HS_ADMIN_EXECUTE_ROLE TO SYS WITH ADMIN OPTION;
  GRANT HS_ADMIN_ROLE TO SYS WITH ADMIN OPTION;
  GRANT HS_ADMIN_SELECT_ROLE TO SYS WITH ADMIN OPTION;
  GRANT IMP_FULL_DATABASE TO SYS WITH ADMIN OPTION;
  GRANT JAVA_ADMIN TO SYS WITH ADMIN OPTION;
  GRANT JAVADEBUGPRIV TO SYS WITH ADMIN OPTION;
  GRANT JAVA_DEPLOY TO SYS WITH ADMIN OPTION;
  GRANT JAVAIDPRIV TO SYS WITH ADMIN OPTION;
  GRANT JAVASYSPRIV TO SYS WITH ADMIN OPTION;
  GRANT JAVAUSERPRIV TO SYS WITH ADMIN OPTION;
  GRANT JMXSERVER TO SYS WITH ADMIN OPTION;
  GRANT LOGSTDBY_ADMINISTRATOR TO SYS WITH ADMIN OPTION;
  GRANT MGMT_USER TO SYS WITH ADMIN OPTION;
  GRANT OEM_ADVISOR TO SYS WITH ADMIN OPTION;
  GRANT OEM_MONITOR TO SYS WITH ADMIN OPTION;
  GRANT OLAP_DBA TO SYS WITH ADMIN OPTION;
  GRANT OLAPI_TRACE_USER TO SYS WITH ADMIN OPTION;
  GRANT OLAP_USER TO SYS WITH ADMIN OPTION;
  GRANT OLAP_XS_ADMIN TO SYS WITH ADMIN OPTION;
  GRANT ORDADMIN TO SYS WITH ADMIN OPTION;
  GRANT OWB$CLIENT TO SYS WITH ADMIN OPTION;
  GRANT OWB_DESIGNCENTER_VIEW TO SYS WITH ADMIN OPTION;
  GRANT OWB_USER TO SYS WITH ADMIN OPTION;
  GRANT RECOVERY_CATALOG_OWNER TO SYS WITH ADMIN OPTION;
  GRANT RESOURCE TO SYS WITH ADMIN OPTION;
  GRANT SCHEDULER_ADMIN TO SYS WITH ADMIN OPTION;
  GRANT SELECT_CATALOG_ROLE TO SYS WITH ADMIN OPTION;
  GRANT SPATIAL_CSW_ADMIN TO SYS WITH ADMIN OPTION;
  GRANT SPATIAL_WFS_ADMIN TO SYS WITH ADMIN OPTION;
  GRANT WFS_USR_ROLE TO SYS WITH ADMIN OPTION;
  GRANT XDBADMIN TO SYS WITH ADMIN OPTION;
  GRANT XDB_SET_INVOKER TO SYS WITH ADMIN OPTION;
  GRANT XDB_WEBSERVICES TO SYS WITH ADMIN OPTION;
  GRANT XDB_WEBSERVICES_OVER_HTTP TO SYS WITH ADMIN OPTION;
  GRANT XDB_WEBSERVICES_WITH_PUBLIC TO SYS WITH ADMIN OPTION;
  ALTER USER SYS DEFAULT ROLE ALL;
  -- 200 System Privileges for SYS 
  GRANT ADMINISTER ANY SQL TUNING SET TO SYS;
  GRANT ADMINISTER DATABASE TRIGGER TO SYS;
  BEGIN
SYS.DBMS_RESOURCE_MANAGER_PRIVS.GRANT_SYSTEM_PRIVILEGE
  (GRANTEE_NAME   => 'SYS', 
   PRIVILEGE_NAME => 'ADMINISTER_RESOURCE_MANAGER',
   ADMIN_OPTION   => FALSE);
END;
/
  GRANT ADMINISTER SQL MANAGEMENT OBJECT TO SYS;
  GRANT ADMINISTER SQL TUNING SET TO SYS;
  GRANT ADVISOR TO SYS;
  GRANT ALTER ANY ASSEMBLY TO SYS;
  GRANT ALTER ANY CLUSTER TO SYS;
  GRANT ALTER ANY CUBE TO SYS;
  GRANT ALTER ANY CUBE DIMENSION TO SYS;
  GRANT ALTER ANY DIMENSION TO SYS;
  GRANT ALTER ANY EDITION TO SYS;
  BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE    => SYS.DBMS_RULE_ADM.ALTER_ANY_EVALUATION_CONTEXT,
  GRANTEE      => 'SYS',
  GRANT_OPTION => TRUE);
END;
/
  GRANT ALTER ANY INDEX TO SYS;
  GRANT ALTER ANY INDEXTYPE TO SYS;
  GRANT ALTER ANY LIBRARY TO SYS;
  GRANT ALTER ANY MATERIALIZED VIEW TO SYS;
  GRANT ALTER ANY MINING MODEL TO SYS;
  GRANT ALTER ANY OPERATOR TO SYS;
  GRANT ALTER ANY OUTLINE TO SYS;
  GRANT ALTER ANY PROCEDURE TO SYS;
  GRANT ALTER ANY ROLE TO SYS;
  BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE    => SYS.DBMS_RULE_ADM.ALTER_ANY_RULE,
  GRANTEE      => 'SYS',
  GRANT_OPTION => TRUE);
END;
/
  BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE    => SYS.DBMS_RULE_ADM.ALTER_ANY_RULE_SET,
  GRANTEE      => 'SYS',
  GRANT_OPTION => TRUE);
END;
/
  GRANT ALTER ANY SEQUENCE TO SYS;
  GRANT ALTER ANY SQL PROFILE TO SYS;
  GRANT ALTER ANY TABLE TO SYS;
  GRANT ALTER ANY TRIGGER TO SYS;
  GRANT ALTER ANY TYPE TO SYS;
  GRANT ALTER DATABASE TO SYS;
  GRANT ALTER PROFILE TO SYS;
  GRANT ALTER RESOURCE COST TO SYS;
  GRANT ALTER ROLLBACK SEGMENT TO SYS;
  GRANT ALTER SESSION TO SYS;
  GRANT ALTER SYSTEM TO SYS;
  GRANT ALTER TABLESPACE TO SYS;
  GRANT ALTER USER TO SYS;
  GRANT ANALYZE ANY TO SYS;
  GRANT AUDIT ANY TO SYS;
  GRANT AUDIT SYSTEM TO SYS;
  GRANT BACKUP ANY TABLE TO SYS;
  GRANT BECOME USER TO SYS;
  GRANT CHANGE NOTIFICATION TO SYS;
  GRANT COMMENT ANY MINING MODEL TO SYS;
  GRANT COMMENT ANY TABLE TO SYS;
  GRANT CREATE ANY ASSEMBLY TO SYS;
  GRANT CREATE ANY CLUSTER TO SYS;
  GRANT CREATE ANY CONTEXT TO SYS;
  GRANT CREATE ANY CUBE TO SYS;
  GRANT CREATE ANY CUBE BUILD PROCESS TO SYS;
  GRANT CREATE ANY CUBE DIMENSION TO SYS;
  GRANT CREATE ANY DIMENSION TO SYS;
  GRANT CREATE ANY DIRECTORY TO SYS;
  GRANT CREATE ANY EDITION TO SYS;
  BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE    => SYS.DBMS_RULE_ADM.CREATE_ANY_EVALUATION_CONTEXT,
  GRANTEE      => 'SYS',
  GRANT_OPTION => TRUE);
END;
/
  GRANT CREATE ANY INDEX TO SYS;
  GRANT CREATE ANY INDEXTYPE TO SYS;
  GRANT CREATE ANY JOB TO SYS;
  GRANT CREATE ANY LIBRARY TO SYS;
  GRANT CREATE ANY MATERIALIZED VIEW TO SYS;
  GRANT CREATE ANY MEASURE FOLDER TO SYS;
  GRANT CREATE ANY MINING MODEL TO SYS;
  GRANT CREATE ANY OPERATOR TO SYS;
  GRANT CREATE ANY OUTLINE TO SYS;
  GRANT CREATE ANY PROCEDURE TO SYS;
  BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE    => SYS.DBMS_RULE_ADM.CREATE_ANY_RULE,
  GRANTEE      => 'SYS',
  GRANT_OPTION => TRUE);
END;
/
  BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE    => SYS.DBMS_RULE_ADM.CREATE_ANY_RULE_SET,
  GRANTEE      => 'SYS',
  GRANT_OPTION => TRUE);
END;
/
  GRANT CREATE ANY SEQUENCE TO SYS;
  GRANT CREATE ANY SQL PROFILE TO SYS;
  GRANT CREATE ANY SYNONYM TO SYS;
  GRANT CREATE ANY TABLE TO SYS;
  GRANT CREATE ANY TRIGGER TO SYS;
  GRANT CREATE ANY TYPE TO SYS;
  GRANT CREATE ANY VIEW TO SYS;
  GRANT CREATE ASSEMBLY TO SYS;
  GRANT CREATE CLUSTER TO SYS;
  GRANT CREATE CUBE TO SYS;
  GRANT CREATE CUBE BUILD PROCESS TO SYS;
  GRANT CREATE CUBE DIMENSION TO SYS;
  GRANT CREATE DATABASE LINK TO SYS;
  GRANT CREATE DIMENSION TO SYS;
  BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE    => SYS.DBMS_RULE_ADM.CREATE_EVALUATION_CONTEXT_OBJ,
  GRANTEE      => 'SYS',
  GRANT_OPTION => TRUE);
END;
/
  GRANT CREATE EXTERNAL JOB TO SYS;
  GRANT CREATE INDEXTYPE TO SYS;
  GRANT CREATE JOB TO SYS;
  GRANT CREATE LIBRARY TO SYS;
  GRANT CREATE MATERIALIZED VIEW TO SYS;
  GRANT CREATE MEASURE FOLDER TO SYS;
  GRANT CREATE MINING MODEL TO SYS;
  GRANT CREATE OPERATOR TO SYS;
  GRANT CREATE PROCEDURE TO SYS;
  GRANT CREATE PROFILE TO SYS;
  GRANT CREATE PUBLIC DATABASE LINK TO SYS;
  GRANT CREATE PUBLIC SYNONYM TO SYS;
  GRANT CREATE ROLE TO SYS;
  GRANT CREATE ROLLBACK SEGMENT TO SYS;
  BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE    => SYS.DBMS_RULE_ADM.CREATE_RULE_OBJ,
  GRANTEE      => 'SYS',
  GRANT_OPTION => TRUE);
END;
/
  BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE    => SYS.DBMS_RULE_ADM.CREATE_RULE_SET_OBJ,
  GRANTEE      => 'SYS',
  GRANT_OPTION => TRUE);
END;
/
  GRANT CREATE SEQUENCE TO SYS;
  GRANT CREATE SESSION TO SYS;
  GRANT CREATE SYNONYM TO SYS;
  GRANT CREATE TABLE TO SYS;
  GRANT CREATE TABLESPACE TO SYS;
  GRANT CREATE TRIGGER TO SYS;
  GRANT CREATE TYPE TO SYS;
  GRANT CREATE USER TO SYS;
  GRANT CREATE VIEW TO SYS;
  GRANT DEBUG ANY PROCEDURE TO SYS;
  GRANT DEBUG CONNECT SESSION TO SYS;
  GRANT DELETE ANY CUBE DIMENSION TO SYS;
  GRANT DELETE ANY MEASURE FOLDER TO SYS;
  GRANT DELETE ANY TABLE TO SYS;
  BEGIN
SYS.DBMS_AQADM.GRANT_SYSTEM_PRIVILEGE (
  PRIVILEGE    => 'DEQUEUE_ANY',
  GRANTEE      => 'SYS',
  ADMIN_OPTION => TRUE);
END;
/
  GRANT DROP ANY ASSEMBLY TO SYS;
  GRANT DROP ANY CLUSTER TO SYS;
  GRANT DROP ANY CONTEXT TO SYS;
  GRANT DROP ANY CUBE TO SYS;
  GRANT DROP ANY CUBE BUILD PROCESS TO SYS;
  GRANT DROP ANY CUBE DIMENSION TO SYS;
  GRANT DROP ANY DIMENSION TO SYS;
  GRANT DROP ANY DIRECTORY TO SYS;
  GRANT DROP ANY EDITION TO SYS;
  BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE    => SYS.DBMS_RULE_ADM.DROP_ANY_EVALUATION_CONTEXT,
  GRANTEE      => 'SYS',
  GRANT_OPTION => TRUE);
END;
/
  GRANT DROP ANY INDEX TO SYS;
  GRANT DROP ANY INDEXTYPE TO SYS;
  GRANT DROP ANY LIBRARY TO SYS;
  GRANT DROP ANY MATERIALIZED VIEW TO SYS;
  GRANT DROP ANY MEASURE FOLDER TO SYS;
  GRANT DROP ANY MINING MODEL TO SYS;
  GRANT DROP ANY OPERATOR TO SYS;
  GRANT DROP ANY OUTLINE TO SYS;
  GRANT DROP ANY PROCEDURE TO SYS;
  GRANT DROP ANY ROLE TO SYS;
  BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE    => SYS.DBMS_RULE_ADM.DROP_ANY_RULE,
  GRANTEE      => 'SYS',
  GRANT_OPTION => TRUE);
END;
/
  BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE    => SYS.DBMS_RULE_ADM.DROP_ANY_RULE_SET,
  GRANTEE      => 'SYS',
  GRANT_OPTION => TRUE);
END;
/
  GRANT DROP ANY SEQUENCE TO SYS;
  GRANT DROP ANY SQL PROFILE TO SYS;
  GRANT DROP ANY SYNONYM TO SYS;
  GRANT DROP ANY TABLE TO SYS;
  GRANT DROP ANY TRIGGER TO SYS;
  GRANT DROP ANY TYPE TO SYS;
  GRANT DROP ANY VIEW TO SYS;
  GRANT DROP PROFILE TO SYS;
  GRANT DROP PUBLIC DATABASE LINK TO SYS;
  GRANT DROP PUBLIC SYNONYM TO SYS;
  GRANT DROP ROLLBACK SEGMENT TO SYS;
  GRANT DROP TABLESPACE TO SYS;
  GRANT DROP USER TO SYS;
  BEGIN
SYS.DBMS_AQADM.GRANT_SYSTEM_PRIVILEGE (
  PRIVILEGE    => 'ENQUEUE_ANY',
  GRANTEE      => 'SYS',
  ADMIN_OPTION => TRUE);
END;
/
  GRANT EXECUTE ANY ASSEMBLY TO SYS;
  GRANT EXECUTE ANY CLASS TO SYS;
  BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE    => SYS.DBMS_RULE_ADM.EXECUTE_ANY_EVALUATION_CONTEXT,
  GRANTEE      => 'SYS',
  GRANT_OPTION => TRUE);
END;
/
  GRANT EXECUTE ANY INDEXTYPE TO SYS;
  GRANT EXECUTE ANY LIBRARY TO SYS;
  GRANT EXECUTE ANY OPERATOR TO SYS;
  GRANT EXECUTE ANY PROCEDURE TO SYS;
  GRANT EXECUTE ANY PROGRAM TO SYS;
  BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE    => SYS.DBMS_RULE_ADM.EXECUTE_ANY_RULE,
  GRANTEE      => 'SYS',
  GRANT_OPTION => TRUE);
END;
/
  BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE    => SYS.DBMS_RULE_ADM.EXECUTE_ANY_RULE_SET,
  GRANTEE      => 'SYS',
  GRANT_OPTION => TRUE);
END;
/
  GRANT EXECUTE ANY TYPE TO SYS;
  GRANT EXECUTE ASSEMBLY TO SYS;
  GRANT EXPORT FULL DATABASE TO SYS;
  GRANT FLASHBACK ANY TABLE TO SYS;
  GRANT FLASHBACK ARCHIVE ADMINISTER TO SYS;
  GRANT FORCE ANY TRANSACTION TO SYS;
  GRANT FORCE TRANSACTION TO SYS;
  GRANT GLOBAL QUERY REWRITE TO SYS;
  GRANT GRANT ANY OBJECT PRIVILEGE TO SYS;
  GRANT GRANT ANY PRIVILEGE TO SYS;
  GRANT GRANT ANY ROLE TO SYS;
  GRANT IMPORT FULL DATABASE TO SYS;
  GRANT INSERT ANY CUBE DIMENSION TO SYS;
  GRANT INSERT ANY MEASURE FOLDER TO SYS;
  GRANT INSERT ANY TABLE TO SYS;
  GRANT LOCK ANY TABLE TO SYS;
  GRANT MANAGE ANY FILE GROUP TO SYS;
  BEGIN
SYS.DBMS_AQADM.GRANT_SYSTEM_PRIVILEGE (
  PRIVILEGE    => 'MANAGE_ANY',
  GRANTEE      => 'SYS',
  ADMIN_OPTION => TRUE);
END;
/
  GRANT MANAGE FILE GROUP TO SYS;
  GRANT MANAGE SCHEDULER TO SYS;
  GRANT MANAGE TABLESPACE TO SYS;
  GRANT MERGE ANY VIEW TO SYS;
  GRANT ON COMMIT REFRESH TO SYS;
  GRANT QUERY REWRITE TO SYS;
  GRANT READ ANY FILE GROUP TO SYS;
  GRANT RESTRICTED SESSION TO SYS;
  GRANT RESUMABLE TO SYS;
  GRANT SELECT ANY CUBE TO SYS;
  GRANT SELECT ANY CUBE DIMENSION TO SYS;
  GRANT SELECT ANY MINING MODEL TO SYS;
  GRANT SELECT ANY SEQUENCE TO SYS;
  GRANT SELECT ANY TABLE TO SYS WITH ADMIN OPTION;
  GRANT SELECT ANY TRANSACTION TO SYS;
  GRANT UNDER ANY TABLE TO SYS;
  GRANT UNDER ANY TYPE TO SYS;
  GRANT UNDER ANY VIEW TO SYS;
  GRANT UNLIMITED TABLESPACE TO SYS;
  GRANT UPDATE ANY CUBE TO SYS;
  GRANT UPDATE ANY CUBE BUILD PROCESS TO SYS;
  GRANT UPDATE ANY CUBE DIMENSION TO SYS;
  GRANT UPDATE ANY TABLE TO SYS;
  -- 9 Object Privileges for SYS 
    GRANT SELECT ON OUTLN.OL$ TO SYS WITH GRANT OPTION;
    GRANT SELECT ON OUTLN.OL$HINTS TO SYS WITH GRANT OPTION;
    GRANT SELECT ON OUTLN.OL$NODES TO SYS WITH GRANT OPTION;
    GRANT SELECT ON SYSTEM.DEF$_AQCALL TO SYS WITH GRANT OPTION;
    GRANT SELECT ON SYSTEM.DEF$_CALLDEST TO SYS WITH GRANT OPTION;
    GRANT SELECT ON SYSTEM.DEF$_DESTINATION TO SYS WITH GRANT OPTION;
    GRANT SELECT ON SYSTEM.DEF$_ERROR TO SYS WITH GRANT OPTION;
    GRANT SELECT ON SYSTEM.REPCAT$_REPPROP TO SYS WITH GRANT OPTION;
    GRANT SELECT ON SYSTEM.REPCAT$_REPSCHEMA TO SYS WITH GRANT OPTION;
  -- 29 Java Privileges for SYS 
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'SYS'
    ,permission_type   => 'SYS:java.lang.RuntimePermission'
    ,permission_name   => 'createClassLoader'
    ,permission_action => ''
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_POLICY_PERMISSION(
     grantee           => 'SYS'
    ,permission_schema => 'SYS'
    ,permission_type   => 'oracle.aurora.rdbms.security.PolicyTablePermission'
    ,permission_name   => '0:oracle.aurora.rdbms.security.PolicyTablePermission#*'
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'SYS'
    ,permission_type   => 'SYS:java.net.NetPermission'
    ,permission_name   => '*'
    ,permission_action => ''
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'SYS'
    ,permission_type   => 'SYS:java.security.SecurityPermission'
    ,permission_name   => '*'
    ,permission_action => ''
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'SYS'
    ,permission_type   => 'SYS:javax.net.ssl.SSLPermission'
    ,permission_name   => '*'
    ,permission_action => ''
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'SYS'
    ,permission_type   => 'SYS:java.util.PropertyPermission'
    ,permission_name   => '*'
    ,permission_action => 'write'
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'SYS'
    ,permission_type   => 'SYS:java.lang.reflect.ReflectPermission'
    ,permission_name   => '*'
    ,permission_action => ''
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'SYS'
    ,permission_type   => 'SYS:java.lang.RuntimePermission'
    ,permission_name   => '*'
    ,permission_action => ''
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'SYS'
    ,permission_type   => 'SYS:java.security.AllPermission'
    ,permission_name   => '*'
    ,permission_action => ''
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'SYS'
    ,permission_type   => 'SYS:java.lang.RuntimePermission'
    ,permission_name   => 'loadLibrary.xaNative'
    ,permission_action => ''
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'SYS'
    ,permission_type   => 'SYS:java.lang.RuntimePermission'
    ,permission_name   => 'loadLibrary.corejava'
    ,permission_action => ''
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'SYS'
    ,permission_type   => 'SYS:java.lang.RuntimePermission'
    ,permission_name   => 'loadLibrary.jox10oraawt'
    ,permission_action => ''
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'SYS'
    ,permission_type   => 'SYS:java.lang.RuntimePermission'
    ,permission_name   => 'loadLibrary.oraioser'
    ,permission_action => ''
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'SYS'
    ,permission_type   => 'SYS:java.lang.RuntimePermission'
    ,permission_name   => 'loadLibrary.corejava_d'
    ,permission_action => ''
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'SYS'
    ,permission_type   => 'SYS:java.lang.RuntimePermission'
    ,permission_name   => 'loadLibrary.orajaas'
    ,permission_action => ''
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'SYS'
    ,permission_type   => 'SYS:oracle.aurora.security.JServerPermission'
    ,permission_name   => '*'
    ,permission_action => ''
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'SYS'
    ,permission_type   => 'SYS:oracle.aurora.security.JServerPermission'
    ,permission_name   => 'LoadClassInPackage.java.*'
    ,permission_action => ''
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'SYS'
    ,permission_type   => 'SYS:oracle.aurora.security.JServerPermission'
    ,permission_name   => 'LoadClassInPackage.oracle.aurora.*'
    ,permission_action => ''
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'SYS'
    ,permission_type   => 'SYS:oracle.aurora.security.JServerPermission'
    ,permission_name   => 'LoadClassInPackage.oracle.jdbc.*'
    ,permission_action => ''
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'SYS'
    ,permission_type   => 'SYS:java.util.logging.LoggingPermission'
    ,permission_name   => 'control'
    ,permission_action => ''
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'SYS'
    ,permission_type   => 'SYS:javax.security.auth.AuthPermission'
    ,permission_name   => '*'
    ,permission_action => ''
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'SYS'
    ,permission_type   => 'SYS:javax.management.MBeanServerPermission'
    ,permission_name   => '*'
    ,permission_action => ''
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'SYS'
    ,permission_type   => 'SYS:javax.management.MBeanTrustPermission'
    ,permission_name   => '*'
    ,permission_action => ''
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'SYS'
    ,permission_type   => 'SYS:javax.management.ManagementPermission'
    ,permission_name   => '*'
    ,permission_action => ''
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'SYS'
    ,permission_type   => 'SYS:javax.management.MBeanPermission'
    ,permission_name   => '*'
    ,permission_action => ''
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'SYS'
    ,permission_type   => 'SYS:javax.security.auth.kerberos.ServicePermission'
    ,permission_name   => '*'
    ,permission_action => 'accept,initiate'
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'SYS'
    ,permission_type   => 'SYS:oracle.aurora.rdbms.HandlePermission'
    ,permission_name   => '*'
    ,permission_action => '*'
    ,key               => KEYNUM
    );
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_POLICY_PERMISSION(
     grantee           => 'SYS'
    ,permission_schema => 'SYS'
    ,permission_type   => 'oracle.aurora.rdbms.security.PolicyTablePermission'
    ,permission_name   => '0:java.lang.RuntimePermission#loadLibrary.ordim11'
    ,key               => KEYNUM
    );
  SYS.DBMS_JAVA.DISABLE_PERMISSION
    (key => KEYNUM);
END;
/
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_POLICY_PERMISSION(
     grantee           => 'SYS'
    ,permission_schema => 'SYS'
    ,permission_type   => 'oracle.aurora.rdbms.security.PolicyTablePermission'
    ,permission_name   => '0:java.lang.RuntimePermission#loadLibrary.oraordim11'
    ,key               => KEYNUM
    );
  SYS.DBMS_JAVA.DISABLE_PERMISSION
    (key => KEYNUM);
END;
/


CREATE USER SYSTEM
  IDENTIFIED BY <password>
  DEFAULT TABLESPACE SYSTEM
  TEMPORARY TABLESPACE TEMP
  PROFILE DEFAULT
  ACCOUNT UNLOCK;
  -- 3 Roles for SYSTEM 
  GRANT AQ_ADMINISTRATOR_ROLE TO SYSTEM WITH ADMIN OPTION;
  GRANT DBA TO SYSTEM WITH ADMIN OPTION;
  GRANT MGMT_USER TO SYSTEM;
  ALTER USER SYSTEM DEFAULT ROLE ALL;
  -- 5 System Privileges for SYSTEM 
  GRANT CREATE MATERIALIZED VIEW TO SYSTEM;
  GRANT CREATE TABLE TO SYSTEM;
  GRANT GLOBAL QUERY REWRITE TO SYSTEM;
  GRANT SELECT ANY TABLE TO SYSTEM;
  GRANT UNLIMITED TABLESPACE TO SYSTEM WITH ADMIN OPTION;
  -- 30 Object Privileges for SYSTEM 
    GRANT EXECUTE ON SYS.CHECK_UPGRADE TO SYSTEM;
    GRANT EXECUTE ON SYS.DBMS_ALERT TO SYSTEM;
    GRANT EXECUTE ON SYS.DBMS_AQ TO SYSTEM WITH GRANT OPTION;
    GRANT EXECUTE ON SYS.DBMS_AQADM TO SYSTEM WITH GRANT OPTION;
    GRANT EXECUTE ON SYS.DBMS_AQELM TO SYSTEM WITH GRANT OPTION;
    GRANT EXECUTE ON SYS.DBMS_AQ_IMPORT_INTERNAL TO SYSTEM WITH GRANT OPTION;
    GRANT EXECUTE ON SYS.DBMS_DEFER_IMPORT_INTERNAL TO SYSTEM;
    GRANT EXECUTE ON SYS.DBMS_REPCAT TO SYSTEM;
    GRANT EXECUTE ON SYS.DBMS_RULE_EXIMP TO SYSTEM WITH GRANT OPTION;
    GRANT EXECUTE ON SYS.DBMS_SYS_ERROR TO SYSTEM;
    GRANT EXECUTE ON SYS.DBMS_TRANSFORM_EXIMP TO SYSTEM WITH GRANT OPTION;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON SYS.INCEXP TO SYSTEM;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON SYS.INCFIL TO SYSTEM;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON SYS.INCVID TO SYSTEM;
    GRANT EXECUTE ON SYS.SET_TABLESPACE TO SYSTEM;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON XDB.XDB$ACL TO SYSTEM WITH GRANT OPTION;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON XDB.XDB$CHECKOUTS TO SYSTEM WITH GRANT OPTION;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON XDB.XDB$CONFIG TO SYSTEM WITH GRANT OPTION;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON XDB.XDB$D_LINK TO SYSTEM WITH GRANT OPTION;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON XDB.XDB$H_INDEX TO SYSTEM WITH GRANT OPTION;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON XDB.XDB$H_LINK TO SYSTEM WITH GRANT OPTION;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON XDB.XDB$NLOCKS TO SYSTEM WITH GRANT OPTION;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON XDB.XDB$RESCONFIG TO SYSTEM WITH GRANT OPTION;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON XDB.XDB$RESOURCE TO SYSTEM WITH GRANT OPTION;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON XDB.XDB$WORKSPACE TO SYSTEM WITH GRANT OPTION;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON XDB.X$PT4O5GVJW67C95OB541F393D17GP TO SYSTEM WITH GRANT OPTION;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON XDB.XS$DATA_SECURITY TO SYSTEM WITH GRANT OPTION;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON XDB.XS$PRINCIPALS TO SYSTEM WITH GRANT OPTION;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON XDB.XS$ROLESETS TO SYSTEM WITH GRANT OPTION;
    GRANT ALTER, DELETE, INDEX, INSERT, REFERENCES, SELECT, UPDATE, ON COMMIT REFRESH, QUERY REWRITE, DEBUG, FLASHBACK ON XDB.XS$SECURITYCLASS TO SYSTEM WITH GRANT OPTION;
  -- 1 Java Privilege for SYSTEM 
DECLARE
 KEYNUM NUMBER;
BEGIN
  SYS.DBMS_JAVA.GRANT_PERMISSION(
     grantee           => 'SYSTEM'
    ,permission_type   => 'SYS:java.io.FilePermission'
    ,permission_name   => '<<ALL FILES>>'
    ,permission_action => 'read'
    ,key               => KEYNUM
    );
END;
/
  -- 1 Resoure Group Privilege for SYSTEM 
BEGIN
  SYS.DBMS_RESOURCE_MANAGER.clear_pending_area();
  SYS.DBMS_RESOURCE_MANAGER.create_pending_area();
  SYS.DBMS_RESOURCE_MANAGER_PRIVS.GRANT_SWITCH_CONSUMER_GROUP
    ('SYSTEM','SYS_GROUP',FALSE);
  SYS.DBMS_RESOURCE_MANAGER.submit_pending_area();
END;
/
BEGIN
  SYS.DBMS_RESOURCE_MANAGER.SET_INITIAL_CONSUMER_GROUP
    ('SYSTEM','SYS_GROUP');
END;
/


CREATE OR REPLACE TRIGGER SYS.aw_drop_trg AFTER DROP ON DATABASE
BEGIN
  aw_drop_proc(ora_dict_obj_type, ora_dict_obj_name, ora_dict_obj_owner);
END;
/
SHOW ERRORS;


CREATE OR REPLACE TRIGGER SYS.aw_ren_trg AFTER RENAME ON DATABASE
BEGIN
  aw_ren_proc(ora_dict_obj_type, ora_dict_obj_name, ora_dict_obj_owner);
END;
/
SHOW ERRORS;


CREATE OR REPLACE TRIGGER SYS.aw_trunc_trg AFTER TRUNCATE ON DATABASE
BEGIN
  aw_trunc_proc(ora_dict_obj_type, ora_dict_obj_name, ora_dict_obj_owner);
END;
/
SHOW ERRORS;


CREATE OR REPLACE TRIGGER SYS.CDC_ALTER_CTABLE_BEFORE
  BEFORE
    ALTER ON DATABASE
DISABLE
BEGIN
      /* NOP UNLESS A TABLE OBJECT */
      IF dictionary_obj_type = 'TABLE'
      THEN
        sys.dbms_cdc_ipublish.change_table_trigger(dictionary_obj_owner,dictionary_obj_name,sysevent);
      END IF;
      END;
/
SHOW ERRORS;


CREATE OR REPLACE TRIGGER SYS.CDC_CREATE_CTABLE_AFTER
  AFTER
    CREATE ON DATABASE
DISABLE
BEGIN
      /* NOP UNLESS A TABLE OBJECT */
      IF dictionary_obj_type = 'TABLE'
      THEN
        sys.dbms_cdc_ipublish.change_table_trigger(dictionary_obj_owner,dictionary_obj_name,sysevent);
      END IF;
      END;
/
SHOW ERRORS;


CREATE OR REPLACE TRIGGER SYS.CDC_CREATE_CTABLE_BEFORE
  BEFORE
    CREATE ON DATABASE
DISABLE
BEGIN
      /* NOP UNLESS A TABLE OBJECT */
      IF dictionary_obj_type = 'TABLE'
      THEN
        sys.dbms_cdc_ipublish.change_table_trigger(dictionary_obj_owner,dictionary_obj_name,'LOCK');
      END IF;
      END;
/
SHOW ERRORS;


CREATE OR REPLACE TRIGGER SYS.CDC_DROP_CTABLE_BEFORE
  BEFORE
    DROP ON DATABASE
DISABLE
BEGIN
      /* NOP UNLESS A TABLE OBJECT */
      IF dictionary_obj_type = 'TABLE'
      THEN
        sys.dbms_cdc_ipublish.change_table_trigger(dictionary_obj_owner,dictionary_obj_name,sysevent);
      END IF;
      END;
/
SHOW ERRORS;


CREATE OR REPLACE TRIGGER SYS.OlapiShutdownTrigger BEFORE SHUTDOWN ON DATABASE
DECLARE openMode V$DATABASE.open_mode%TYPE;
          olapOn BOOLEAN;
          histRetention BOOLEAN;
          sessionCount NUMBER;
          histID NUMBER;
  BEGIN

  SELECT open_mode INTO openMode FROM V$DATABASE;
  IF (openMode != 'READ WRITE') THEN
    histRetention := FALSE;
    OlapiHistoryRetention(olapOn, histRetention, sessionCount);
    RETURN;
  END IF;

  OlapiHistoryRetention(olapOn, histRetention, sessionCount);
  IF (olapOn AND histRetention) THEN



    BEGIN
    SELECT MAX(hist_id) INTO histID FROM Olapi_History;
    IF (histRetention) THEN
      UPDATE Olapi_History SET collecting_stop_time = CURRENT_TIMESTAMP WHERE
        inst_id = SYS_CONTEXT('USERENV', 'Instance') AND hist_id = histID;
    END IF;
    UPDATE Olapi_History SET stop_time = CURRENT_TIMESTAMP,
      session_count = sessionCount WHERE
      inst_id = SYS_CONTEXT('USERENV', 'Instance') AND hist_id = histID;
    EXCEPTION


    WHEN OTHERS THEN
      RETURN;
    END;
  END IF;
  END;
/
SHOW ERRORS;


CREATE OR REPLACE TRIGGER SYS.OlapiStartupTrigger AFTER STARTUP ON DATABASE
DECLARE openMode V$DATABASE.open_mode%TYPE;
          olapOn BOOLEAN;
          histRetention BOOLEAN;
          hist_id NUMBER;
          sessionCount NUMBER;
  BEGIN

  SELECT open_mode INTO openMode FROM V$DATABASE;
  IF (openMode != 'READ WRITE') THEN
    histRetention := FALSE;
    OlapiHistoryRetention(olapOn, histRetention, sessionCount);
    RETURN;
  END IF;

  OlapiHistoryRetention(olapOn, histRetention, hist_id);
  IF (olapOn AND histRetention) THEN
    BEGIN
    SELECT Olapi_History_Seq.NEXTVAL INTO hist_id FROM DUAL;


    INSERT INTO Olapi_History VALUES(SYS_CONTEXT('USERENV', 'Instance'),
      hist_id, CURRENT_TIMESTAMP, NULL, NULL, 0);
    EXCEPTION


    WHEN OTHERS THEN
      histRetention := FALSE;
      OlapiHistoryRetention(olapOn, histRetention, sessionCount);
    END;
  END IF;
  END;
/
SHOW ERRORS;


CREATE OR REPLACE TRIGGER SYS.XDB_PI_TRIG
BEFORE DROP OR TRUNCATE on DATABASE
BEGIN
  BEGIN
    IF (sys.is_vpd_enabled(sys.dictionary_obj_owner, sys.dictionary_obj_name, xdb.DBMS_XDBZ.IS_ENABLED_CONTENTS)) THEN
      xdb.XDB_PITRIG_PKG.pitrig_truncate(sys.dictionary_obj_owner, sys.dictionary_obj_name);
    ELSIF (sys.is_vpd_enabled(sys.dictionary_obj_owner, sys.dictionary_obj_name, xdb.DBMS_XDBZ.IS_ENABLED_RESMETADATA)) THEN
      xdb.XDB_PITRIG_PKG.pitrig_dropmetadata(sys.dictionary_obj_owner, sys.dictionary_obj_name);
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
     null;
  END;
END;
/
SHOW ERRORS;