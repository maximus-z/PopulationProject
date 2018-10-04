create or replace package body pkg_dim_state as
---------------------------------------
procedure p_set_dim_state is
begin
    -- Logging --
    delete dim_state;
    INSERT
    INTO dim_state
      (
        region_code,
        division_code,
        state_code,
        state_name,
        start_date
      )
    SELECT region,
      division,
      state,
      name,
      to_date('01-JAN-1900', 'DD-MON-YYYY')
    FROM state_ext
    WHERE state <> '00';
    
    commit;
    -- Exception --
      -- Error Logging --
end p_set_dim_state;
---------------------------------------
end pkg_dim_state;
/