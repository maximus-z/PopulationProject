create or replace package body pkg_dim_metropolitan as
---------------------------------------
procedure p_set_dim_metropolitan is
   begin
       -- Logging --
       delete dim_metropolitan;
       
       insert into dim_metropolitan
          (
            metropolitan_sk
          , state_code
          , county_code
          , metrplrn_name
          , start_date
          )
      select 
               seq_metropol.nextval
             , fips_state_code
             , fips_county_code
             , nvl(csa_title,'N/A')
             , to_date('01-JAN-1900', 'DD-MON-YYYY')
        from
             metropolitan_ext
       where 
             fips_state_code        <> 72     -- Exclide Puerto Rico
      ;
       
      commit;
      exception 
         when others then
            -- Error Logging --
         raise_application_error(-20101, 'Dimension load is failed');   
   end p_set_dim_metropolitan;
---------------------------------------
end pkg_dim_metropolitan;
/