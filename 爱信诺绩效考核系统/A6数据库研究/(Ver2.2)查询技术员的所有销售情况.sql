/****************二次销售部分****************/

--(Ver2.2)根据收款日期和物品类别id来查询技术员的所有销售情况
select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (
select dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line
left join SA_Dispatch dis_main
on dis_line.cHeadGUID=dis_main.cGUID
left join AP_PaymentDetail apdetail
on apdetail.cHeadRelationGUID=dis_line.cHeadGUID
left join AP_Payment appay
on apdetail.cPaymentGUID=appay.cGUID
where appay.dVouDate between :daystart and :dayend) dis2
left join CM_Employee emp
on emp.cGUID=dis2.cEmpGUID
group by emp.cCode,emp.cName



--(Ver2.2)根据收款日期和物品类别id来查询技术员的"IT服务外包"销售情况
select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (
select * from(
select dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line
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
where cmm.cMatCGUID=cmc2.cGUID ) ) dis2
left join CM_Employee emp
on emp.cGUID=dis2.cEmpGUID
group by emp.cCode,emp.cName


--(Ver2.2)根据收款日期和物品类别id来查询技术员的"产业化产品"销售情况
select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (
select * from(
select dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line
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
where cmm.cMatCGUID=cmc2.cGUID ) ) dis2
left join CM_Employee emp
on emp.cGUID=dis2.cEmpGUID
group by emp.cCode,emp.cName

--(Ver2.2)根据收款日期和物品类别id来查询技术员的"企业管理软件"销售情况
select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (
select * from(
select dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line
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
where cmm.cMatCGUID=cmc2.cGUID ) ) dis2
left join CM_Employee emp
on emp.cGUID=dis2.cEmpGUID
group by emp.cCode,emp.cName

--(Ver2.2)根据收款日期和物品类别id来查询技术员的"文本组件"销售情况
select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (
select * from(
select dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line
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
where cmm.cMatCGUID=cmc2.cGUID ) ) dis2
left join CM_Employee emp
on emp.cGUID=dis2.cEmpGUID
group by emp.cCode,emp.cName

--(Ver2.2)根据收款日期和物品类别id来查询技术员的--剔除"服务费"的销售情况
select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (
select * from(
select dis_main.cEmpGUID,dis_line.cMatGUID,dis_line.iReceiveTotal from SA_DispatchLine dis_line
left join SA_Dispatch dis_main
on dis_line.cHeadGUID=dis_main.cGUID
left join AP_PaymentDetail apdetail
on apdetail.cHeadRelationGUID=dis_line.cHeadGUID
left join AP_Payment appay
on apdetail.cPaymentGUID=appay.cGUID
where appay.dVouDate between :daystart and :dayend ) dis1
left join CM_Material cmm
on cmm.cGUID=dis1.cMatGUID
where cmm.cGUID!='174537133500157028' ) dis2
left join CM_Employee emp
on emp.cGUID=dis2.cEmpGUID
group by emp.cCode,emp.cName



/****************专项奖励部分****************/
--初始化专项奖励:发票查询软件:174537133500153929
select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (
select * from(
select dis_main.cEmpGUID,dis_line.cMatGUID,case when dis_line.iReceiveTotal>=780 then 50 else 0 end as iReceiveTotal from SA_DispatchLine dis_line
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
select '174537133500153929' as cGUID
union
select cmc1.cGUID from CM_MatClass cmc1 
where cmc1.cParentID='174537133500153929' ) cmc2
where cmm.cMatCGUID=cmc2.cGUID ) ) dis2
left join CM_Employee emp
on emp.cGUID=dis2.cEmpGUID
group by emp.cCode,emp.cName


--初始化专项奖励:企业管理软件:174537133500134588
select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (
select * from(
select dis_main.cEmpGUID,dis_line.cMatGUID,case when dis_line.iTaxPrice<=3000 then 200*dis_line.iQTY else dis_line.iReceiveTotal*0.05 end as iReceiveTotal from SA_DispatchLine dis_line
left join SA_Dispatch dis_main
on dis_line.cHeadGUID=dis_main.cGUID
left join AP_PaymentDetail apdetail
on apdetail.cHeadRelationGUID=dis_line.cHeadGUID
left join AP_Payment appay
on apdetail.cPaymentGUID=appay.cGUID
where appay.dVouDate between :daystart and :dayend 
and dis_line.iReceiveTotal>0) dis1
left join CM_Material cmm
on cmm.cGUID=dis1.cMatGUID
where exists (
select '0' from (
select '174537133500134588' as cGUID
union
select cmc1.cGUID from CM_MatClass cmc1 
where cmc1.cParentID='174537133500134588' ) cmc2
where cmm.cMatCGUID=cmc2.cGUID ) ) dis2
left join CM_Employee emp
on emp.cGUID=dis2.cEmpGUID
group by emp.cCode,emp.cName


--初始化专项奖励:产业化招生:174537133500134577
select emp.cCode as EMP_CODE,emp.cName AS EMP_NAME,SUM(dis2.iReceiveTotal) as MONEY from (
select * from(
select dis_main.cEmpGUID,dis_line.cMatGUID,(dis_line.iQTY*100) as iReceiveTotal from SA_DispatchLine dis_line
left join SA_Dispatch dis_main
on dis_line.cHeadGUID=dis_main.cGUID
left join AP_PaymentDetail apdetail
on apdetail.cHeadRelationGUID=dis_line.cHeadGUID
left join AP_Payment appay
on apdetail.cPaymentGUID=appay.cGUID
where appay.dVouDate between :daystart and :dayend 
and dis_line.iReceiveTotal>0) dis1
left join CM_Material cmm
on cmm.cGUID=dis1.cMatGUID
where exists (
select '0' from (
select '174537133500134577' as cGUID
union
select cmc1.cGUID from CM_MatClass cmc1 
where cmc1.cParentID='174537133500134577' ) cmc2
where cmm.cMatCGUID=cmc2.cGUID ) ) dis2
left join CM_Employee emp
on emp.cGUID=dis2.cEmpGUID
group by emp.cCode,emp.cName

