alter table dim_county add primary key(county_sk);
alter table dim_county add constraint dim_county_uk1  unique (state_code, county_code, start_date, is_active);
alter table dim_county add constraint dim_county_chk1 check  (is_active in ('Y', 'N'));