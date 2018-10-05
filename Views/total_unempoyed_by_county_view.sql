create or replace view total_unempl_by_county_view as
select 
        fp.year                                        year
      , dct.county_name                                county_name
      , fp.total_qty                                   total_qty
      , round(fp.unemployed_qty/fp.force_qty*100, 2)   unemployed_ratio
  from
        fact_population  fp
 inner join
        dim_county       dct
    on
        fp.county_sk      = dct.county_sk
 order by
        dct.county_name
      , fp.year
;