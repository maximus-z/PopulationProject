create or replace package body pkg_dim_state as
---------------------------------------
   procedure p_set_dim_state is
      begin
       -- Logging --
         delete dim_state;
   
         insert into dim_state 
            (
               state_sk
             , region_code
             , division_code
             , state_code
             , state_name
             , start_date
            )
         select
                seq_state.nextval
              , region
              , division
              , state
              , name
              , to_date('01-JAN-1900', 'DD-MON-YYYY')
         from
               state_ext
        where
               state <> '00' -- Exclude regions and devisions
        ;
        commit;
       -- Exception --
         -- Error Logging --
   end p_set_dim_state;
---------------------------------------
end pkg_dim_state;
/