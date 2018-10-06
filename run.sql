truncate table fact_population;
begin
   pkg_dim_state.p_set_dim_state;
   pkg_dim_county.p_set_dim_county;
   pkg_dim_metropolitan.p_set_dim_metropolitan;
   pkg_fact_population.p_set_fact_population;
end;
/