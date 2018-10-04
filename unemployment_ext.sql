drop table unemployment_ext;

create table unemployment_ext
  (  
    cn_code                     varchar2(200)
  , state_code                  varchar2(200)
  , county_code                 varchar2(200)
  , county_name                 varchar2(200)
  , year                        varchar2(200)
  , empty_column                varchar2(200)
  , force                       varchar2(200)
  , employed                    varchar2(200)
  , unemployed                  varchar2(200)
  , ratio                       varchar2(200)
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
       location ('Unemployment.csv')
      )
;
