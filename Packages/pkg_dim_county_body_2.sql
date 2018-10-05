create or replace package body pkg_dim_county as
---------------------------------------
procedure p_set_dim_county is
   begin
       -- Logging --
       delete dim_county;
       
       insert into dim_county
          (
            county_sk
          , state_code
          , county_code
          , county_name
          , start_date
          )
       select 
               seq_county.nextval
             , state_code
             , county_code
             , area_name
             , to_date('01-JAN-1900', 'DD-MON-YYYY')
        from
             county_ext
       where 
             county_code       <> '000'  -- Exclude States, Cities
         and 
             county_sub_code   = '00000' -- Exclude Towns
         and 
             state_code        <> 72     -- Exclide Puerto Rico
      ;
       
       commit;
       -- Exception --
         -- Error Logging --
   end p_set_dim_county;
---------------------------------------
end pkg_dim_county;
/