select emp.cCode as EMP_CODE,emp.cName as EMP_NAME,
SUM(dis2main.ITWBXS) as ITWBXS,
SUM(dis2main.CYHZSXS) as CYHZSXS,
SUM(dis2main.QYGLRJXS) as QYGLRJXS,
SUM(dis2main.WBZJXS) as WBZJXS,
SUM(dis2main.ECXSHJ) as ECXSHJ
from (
select dis2.cEmpGUID as EMP_CODE,SUM(dis2.iReceiveTotal) as ITWBXS,0 as CYHZSXS,0 as QYGLRJXS,0 as WBZJXS,0 as ECXSHJ from (
select * from(
select distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line
left join SA_Dispatch dis_main
on dis_line.cHeadGUID=dis_main.cGUID
left join AP_PaymentDetail apdetail
on apdetail.cHeadRelationGUID=dis_line.cHeadGUID
left join AP_Payment appay
on apdetail.cPaymentGUID=appay.cGUID
where appay.dVouDate between :daystart and :dayend ) dis1
left join CM_Material cmm
on cmm.cGUID=dis1.cMatGUID
where exists (
select '0' from (
select '325494471094859278' as cGUID
union
select cmc1.cGUID from CM_MatClass cmc1 
where cmc1.cParentID='325494471094859278' ) cmc2
where cmm.cMatCGUID=cmc2.cGUID ) ) dis2 group by dis2.cEmpGUID
union all
select dis2.cEmpGUID as EMP_CODE,0 as ITWBXS,SUM(dis2.iReceiveTotal) as CYHZSXS,0 as QYGLRJXS,0 as WBZJXS,0 as ECXSHJ from (
select * from(
select distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line
left join SA_Dispatch dis_main
on dis_line.cHeadGUID=dis_main.cGUID
left join AP_PaymentDetail apdetail
on apdetail.cHeadRelationGUID=dis_line.cHeadGUID
left join AP_Payment appay
on apdetail.cPaymentGUID=appay.cGUID
where appay.dVouDate between :daystart and :dayend ) dis1
left join CM_Material cmm
on cmm.cGUID=dis1.cMatGUID
where exists (
select '0' from (
select '174537133500134577' as cGUID
union
select cmc1.cGUID from CM_MatClass cmc1 
where cmc1.cParentID='174537133500134577' ) cmc2
where cmm.cMatCGUID=cmc2.cGUID ) ) dis2 group by dis2.cEmpGUID
union all
select dis2.cEmpGUID as EMP_CODE,0 as ITWBXS,0 as CYHZSXS,SUM(dis2.iReceiveTotal) as QYGLRJXS,0 as WBZJXS,0 as ECXSHJ from (
select * from(
select distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line
left join SA_Dispatch dis_main
on dis_line.cHeadGUID=dis_main.cGUID
left join AP_PaymentDetail apdetail
on apdetail.cHeadRelationGUID=dis_line.cHeadGUID
left join AP_Payment appay
on apdetail.cPaymentGUID=appay.cGUID
where appay.dVouDate between :daystart and :dayend ) dis1
left join CM_Material cmm
on cmm.cGUID=dis1.cMatGUID
where exists (
select '0' from (
select '174537133500134588' as cGUID
union
select cmc1.cGUID from CM_MatClass cmc1 
where cmc1.cParentID='174537133500134588' ) cmc2
where cmm.cMatCGUID=cmc2.cGUID ) ) dis2 group by dis2.cEmpGUID
union all
select dis2.cEmpGUID as EMP_CODE,0 as ITWBXS,0 as CYHZSXS,0 as QYGLRJXS,SUM(dis2.iReceiveTotal) as WBZJXS,0 as ECXSHJ from (
select * from(
select distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line
left join SA_Dispatch dis_main
on dis_line.cHeadGUID=dis_main.cGUID
left join AP_PaymentDetail apdetail
on apdetail.cHeadRelationGUID=dis_line.cHeadGUID
left join AP_Payment appay
on apdetail.cPaymentGUID=appay.cGUID
where appay.dVouDate between :daystart and :dayend ) dis1
left join CM_Material cmm
on cmm.cGUID=dis1.cMatGUID
where exists (
select '0' from (
select '174537133500153932' as cGUID
union
select cmc1.cGUID from CM_MatClass cmc1 
where cmc1.cParentID='174537133500153932' ) cmc2
where cmm.cMatCGUID=cmc2.cGUID ) ) dis2 group by dis2.cEmpGUID
union all
select dis2.cEmpGUID as EMP_CODE,0 as ITWBXS,0 as CYHZSXS,0 as QYGLRJXS,0 as WBZJXS,SUM(dis2.iReceiveTotal) as ECXSHJ from (
select * from(
select distinct dis_line.cGUID as dis_line_cGUID,dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line
left join SA_Dispatch dis_main
on dis_line.cHeadGUID=dis_main.cGUID
left join AP_PaymentDetail apdetail
on apdetail.cHeadRelationGUID=dis_line.cHeadGUID
left join AP_Payment appay
on apdetail.cPaymentGUID=appay.cGUID
where appay.dVouDate between :daystart and :dayend ) dis1
left join CM_Material cmm
on cmm.cGUID=dis1.cMatGUID
where not exists ( select '0' from (
select '174537133500157028' as cGUID
union
select '174537133500139232' as cGUID
union
select '174537133500134708' as cGUID
union
select '174537133500139235' as cGUID
union
select '174537133500139241' as cGUID
union
select cGUID from CM_MatClass cmct1
where cmct1.cParentID='174537133500157028'
union
select cGUID from CM_MatClass cmct2
where cmct2.cParentID='174537133500139232'
union
select cGUID from CM_MatClass cmct3
where cmct3.cParentID='174537133500134708'
union
select cGUID from CM_MatClass cmct4
where cmct4.cParentID='174537133500139235'
union
select cGUID from CM_MatClass cmct5
where cmct5.cParentID='174537133500139241'
) cmc1 where cmc1.cGUID=cmm.cMatCGUID))dis2 group by dis2.cEmpGUID) dis2main
left join CM_Employee emp
on emp.cGUID=dis2main.EMP_CODE
where emp.cCode is not null
group by emp.cCode,emp.cName

