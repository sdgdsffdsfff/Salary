select emp.name,sum(t.gzl) as gzl from
(
select 
sm_m.engineer_sign as fwry,
sm_m.user_define02 as gzl
from sm_maintain sm_m 
where sm_m.user_define01 is not null
and to_char(sm_m.FINISH_DATE,'yyyy-mm-dd')>='2014-12-01'
and to_char(sm_m.FINISH_DATE,'yyyy-mm-dd')<='2014-12-31'
union all
select 
pv_v.fee as fwry,
pv_v.user_define02 as gzl
from pv_visit_bill pv_v 
where pv_v.user_define01 is not null
and to_char(pv_v.VISIT_START_DATE,'yyyy-mm-dd')>='2014-12-01'
and to_char(pv_v.VISIT_START_DATE,'yyyy-mm-dd')<='2014-12-31'
) t
left join sys_employee emp
on emp.employee_id = t.fwry
where t.fwry in
(select emp2.employee_id from sys_employee emp2 where emp2.engineers_no is not null)
group by emp.name
