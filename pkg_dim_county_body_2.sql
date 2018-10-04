create or replace package body pkg_dim_county as
---------------------------------------
procedure p_set_dim_county is
begin
    -- Logging --
    delete dim_county;
    INSERT
    INTO dim_county
      (
        state_code,
        county_code,
        county_name,
        start_date
      )
    SELECT 
      state_code,
      county_code,
      area_name,
      to_date('01-JAN-1900', 'DD-MON-YYYY')
    FROM county_ext
    WHERE county_code       <> '000' 
      AND county_sub_code   = '00000'
      AND state_code        <> 72
   ;
    
    commit;
    -- Exception --
      -- Error Logging --
end p_set_dim_county;
---------------------------------------
end pkg_dim_county;
/