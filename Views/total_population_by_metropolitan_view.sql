create or replace view total_popln_by_mtrpltn_view as
select 
        fp.year                  year
      , dmn.metrplrn_name        metrplrn_name
      , sum(fp.total_qty)        total_qty
  from
        fact_population  fp
 inner join
        dim_county       dct
    on
        fp.county_sk      = dct.county_sk
 inner join
        dim_metropolitan dmn
    on
        dmn.state_code   = dct.state_code
   and
        dmn.county_code  = dct.county_code
   and
        dmn.is_active    = 'Y'
 group by
        fp.year
      , dmn.metrplrn_name
 order by
        dmn.metrplrn_name
      , fp.year
;
