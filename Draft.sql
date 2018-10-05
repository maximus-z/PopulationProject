 insert into FACT_POPULATION
      (
         year
       , state_sk
       , county_sk
       , total_qty
       , force_qty
       , employed_qty
       , unemployed_qty
      )
with unt as 
(
select 
        unt.year
      , dct.county_sk
      , to_number(trim(unt.force),'999G999G999','NLS_NUMERIC_CHARACTERS =''.,''')         force_qty
      , to_number(trim(unt.employed),'999G999G999','NLS_NUMERIC_CHARACTERS =''.,''')      employed_qty
      , to_number(trim(unt.unemployed),'999G999G999','NLS_NUMERIC_CHARACTERS =''.,''')    unemployed_qty
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
)
, ppl_pvt as (
select
        substr(geo_id, instr(geo_id, 'US')+2, length(geo_id))        county_code
      , year                                                         year
      , to_number(replace(trim(total_qty), chr(13)))                       total_qty
  from
        population_ext 
        unpivot 
        (
          total_qty
            for year in
                       (
                          respop72010 as 2010
                        , respop72011 as 2011
                        , respop72012 as 2012
                        , respop72013 as 2013
                        , respop72014 as 2014
                        , respop72015 as 2015
                        , respop72016 as 2016
                        , respop72017 as 2017
                       )
        )
)
, ppl_total as (
select ppl_pvt.year, ppl_pvt.total_qty, dct.county_sk, dct.state_code
  from 
        ppl_pvt
inner join 
        dim_county       dct
   on
      ppl_pvt.county_code  = dct.state_code||dct.county_code
  and
      dct.is_active    = 'Y'
      )
 select 
         ppl_total.year
       , dst.state_sk
       , ppl_total.county_sk
       , ppl_total.total_qty
       , unt.force_qty
       , unt.employed_qty
       , unt.unemployed_qty
   from
        ppl_total
 inner join 
        unt
     on
        ppl_total.year     = unt.year
    and
        ppl_total.county_sk = unt.county_sk
 inner join 
       dim_state        dst
    on
       dst.state_code   = ppl_total.state_code
   and
      dst.is_active    = 'Y';
  