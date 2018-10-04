drop table population_ext;

create table population_ext
  (  
    GEO_id                      varchar2(200)
  , GEO_id2                     varchar2(200)
  , GEO_display_label           varchar2(200)
  , rescen42010                 varchar2(200)
  , resbase42010                varchar2(200)
  , respop72010                 varchar2(200)
  , respop72011                 varchar2(200)
  , respop72012                 varchar2(200)
  , respop72013                 varchar2(200)
  , respop72014                 varchar2(200)
  , respop72015                 varchar2(200)
  , respop72016                 varchar2(200)
  , respop72017                 varchar2(200)
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
       location ('Population.csv')
      )
;