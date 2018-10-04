alter table dim_metropolitan add primary key(metropolitan_sk);
alter table dim_metropolitan add constraint dim_metropolitan_uk1  unique (state_code, county_code, start_date, is_active);
alter table dim_metropolitan add constraint dim_metropolitan_chk1 check  (is_active in ('Y', 'N'));