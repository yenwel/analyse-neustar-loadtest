select plti.test_name,p.phase_number, p.is_ramp, o.*,t.* /* count(*)*/
  from loadtestrslt.`object` as o 
  inner join loadtestrslt.parent_load_test_info as plti on (o.test_region_id = plti.test_region_id)
  inner join loadtestrslt.tx as t on (o.tx_id  = t.tx_id and o.test_region_id = t.test_region_id)
  inner join loadtestrslt.phases as p on (p.phase_number = t.phase_number and p.test_region_id = t.test_region_id);

select count(*) from   loadtestrslt.`object`
