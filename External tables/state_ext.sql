drop table state_ext;

create table state_ext
  ( region             varchar2(200)
  , division           varchar2(200)
  , state              varchar2(200)
  , name               varchar2(200)
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
       location ('State.csv')
      )
;