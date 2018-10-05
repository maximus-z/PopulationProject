drop table metropolitan_ext;

create table metropolitan_ext
  (  
    cbsa_code                 varchar2(200)
  , metrpltn_divsn_code       varchar2(200)
  , csa_code                  varchar2(200)
  , cbsa_title                varchar2(200)
  , metrplrn_stat_area        varchar2(200)
  , metrpltn_dvsn_title       varchar2(200)
  , csa_title                 varchar2(200)
  , county_equivalent         varchar2(200)
  , state_name                varchar2(200)
  , fips_state_code           varchar2(200)
  , fips_county_code          varchar2(200)
  , central_county            varchar2(200)
  )
  organization external
      (type oracle_loader
       default directory sourceload
       access parameters
        (
         records delimited by newline
         skip 1
         fields terminated by ','
         optionally enclosed by '"'
        )
       location ('Metropolitan.csv')
      )
;
