drop table dim_state;

create table dim_state
  (
    state_sk             number                                                             not null
  , region_code          varchar2(1)                                                        not null
  , division_code        varchar2(1)                                                        not null
  , state_code           varchar2(2)                                                        not null
  , state_name           varchar2(200)                                                      not null
  , start_date           date                                                               not null
  , end_date             date           default     to_date('31-DEC-2999', 'DD-MON-YYYY')   not null
  , is_active            varchar2(1)    default     'Y'                                     not null
  , created_on           date           default     sysdate                                 not null
  , created_by           varchar2(30)   default     sys_context('USERENV', 'OS_USER')       not null
  , modified_on          date
  , modified_by          varchar2(30)
  )
;
