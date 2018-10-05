drop table fact_population;

create table fact_population
  (
    year                 varchar2(4)                                                        not null
  , state_sk             number                                                             not null
  , county_sk            number                                                             not null
  , total_qty            number                                                             not null
  , force_qty            number                                                             not null
  , employed_qty         number                                                             not null
  , unemployed_qty       number                                                             not null
  , created_on           date           default     sysdate                                 not null
  , created_by           varchar2(30)   default     sys_context('USERENV', 'OS_USER')       not null
  )
;
