select 
        unt.year
      , dct.county_sk
      , 0                  total_qty
      , unt.force          force_qty
      , unt.employed       employed_qty
      , unt.unemployed     unemployed_qty
      , dct.state_code,  dct.county_code
  from 
      unemployment_ext unt
   inner join
      dim_county       dct
   on
     unt.state_code    = dct.state_code
   and
      unt.county_code  = dct.county_code
  and
      dct.is_active    = 'Y'
  order by dct.state_code,  dct.county_code   ;