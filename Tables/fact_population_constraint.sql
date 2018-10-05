alter table fact_population add constraint fact_population_fk1 foreign key (state_sk) references dim_state(state_sk);
alter table fact_population add constraint fact_population_fk2 foreign key (county_sk) references dim_county(county_sk);
