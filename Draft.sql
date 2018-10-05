select * from state_ext;
select * from dim_state;
--
select * from county_ext;
select * from dim_county;
--
select * from metropolitan_ext;

select * from unemployment_ext;

select * from population_ext;


begin
   --pkg_dim_state.p_set_dim_state;
   --pkg_dim_county.p_set_dim_county;
   pkg_fact_population.p_set_fact_population;
end;
/

select * from fact_population;
select * from TOTAL_POPLN_BY_MTRPLTN_VIEW;
select * from TOTAL_UNEMPL_BY_COUNTY_VIEW;