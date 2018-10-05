drop table unemployment_ext;

create table unemployment_ext
  (  
    state_code                  varchar2(200)
  , county_code                 varchar2(200)
  , year_code                   varchar2(200)
  , force                       varchar2(200)
  , employed                    varchar2(200)
  , unemployed                  varchar2(200)
  )
  organization external
      (type oracle_loader
       default directory sourceload
       access parameters
       (
         records delimited by newline
         skip 6
         fields LDRTRIM
          (
          state_code (19:22) CHAR(2),
          county_code (26:29) CHAR(3),
          year_code (82:86) char(4),
          force (91:10) char(9),
          employed(104:113) char(9),
          unemployed(117:124) char(7)
         )
        )
       location ('laucnty10.txt','laucnty11.txt', 'laucnty12.txt','laucnty13.txt','laucnty14.txt','laucnty15.txt','laucnty16.txt','laucnty17.txt')
      )
;
