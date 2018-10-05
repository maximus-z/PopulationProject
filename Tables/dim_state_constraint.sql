alter table dim_state add primary key(state_sk);
alter table dim_state add constraint dim_state_uk1  unique (county_code, start_date, is_active);
alter table dim_state add constraint dim_state_chk1 check  (is_active in ('Y', 'N'));