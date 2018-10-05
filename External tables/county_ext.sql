drop table county_ext;

create table county_ext
  ( summary_level               varchar2(200)
  , state_code                  varchar2(200)
  , county_code                 varchar2(200)
  , county_sub_code             varchar2(200)
  , place_code                  varchar2(200)
  , consl_city_code             varchar2(200)
  , area_name                   varchar2(200)
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
       location ('County.csv')
      )
;