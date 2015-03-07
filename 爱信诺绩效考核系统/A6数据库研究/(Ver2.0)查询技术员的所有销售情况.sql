--(Ver1.0)根据收款日期和物品类别id来查询技术员的销售情况
select emp.cCode as EMP_CODE,emp.cName as EMP_NAME,SUM(dis.iTotal) as MONEY from (
select dis_main.cEmpGUID,dis_line.iTotal from SA_DispatchLine dis_line
left join BILL_GEN_RELATION_MAIN relation
on dis_line.cHeadGUID=relation.cSMainID
left join SA_Dispatch dis_main
on dis_line.cHeadGUID=dis_main.cGUID
left join AP_Payment appay
on relation.cDMainID=appay.cGUID
left join CM_Material material
on dis_line.cMatGUID=material.cGUID
left join CM_MatClass matclass
on material.cMatCGUID=matclass.cGUID
where dis_main.cBillCode like 'FH%'
and appay.cVouCode like 'SK%'
and appay.dAuditDate between '2014-11-01' and '2014-11-30'
and matclass.cGUID in (
select '174537133500153932' as cGUID
union all
select cGUID from CM_MatClass
where cParentID='174537133500153932')) dis
left join CM_Employee emp
on dis.cEmpGUID=emp.cGUID
group by emp.cCode,emp.cName


--(Ver2.0)根据收款日期和物品类别id来查询技术员的销售情况
select emp.cCode as EMP_CODE,emp.cName as EMP_NAME,SUM(dis.iTotal) as MONEY from (
select dis_main.cEmpGUID,dis_line.iTotal from SA_DispatchLine dis_line
left join BILL_GEN_RELATION_MAIN relation
on dis_line.cHeadGUID=relation.cSMainID
left join SA_Dispatch dis_main
on dis_line.cHeadGUID=dis_main.cGUID
left join AP_Payment appay
on relation.cDMainID=appay.cGUID
left join CM_Material material
on dis_line.cMatGUID=material.cGUID
left join CM_MatClass matclass
on material.cMatCGUID=matclass.cGUID
where dis_main.cBillCode like 'FH%'
and appay.cVouCode like 'SK%'
and appay.dAuditDate between '2014-11-01' and '2014-11-30'
and exists (
select '1' from (
select '174537133500153932' as cGUID
union all
select cGUID from CM_MatClass
where cParentID='174537133500153932') cmc where cmc.cGUID=matclass.cGUID)) dis
left join CM_Employee emp
on dis.cEmpGUID=emp.cGUID
group by emp.cCode,emp.cName


--(Ver2.0)根据收款日期和物品类别id来查询技术员的专项奖励--发票查询软件
select emp.cCode as EMP_CODE,emp.cName as EMP_NAME,SUM(dis.cTotal) as MONEY from (
select dis_main.cEmpGUID,case when dis_line.iTotal>=780 then 50 else 0 end as cTotal from SA_DispatchLine dis_line
left join BILL_GEN_RELATION_MAIN relation
on dis_line.cHeadGUID=relation.cSMainID
left join SA_Dispatch dis_main
on dis_line.cHeadGUID=dis_main.cGUID
left join AP_Payment appay
on relation.cDMainID=appay.cGUID
left join CM_Material material
on dis_line.cMatGUID=material.cGUID
left join CM_MatClass matclass
on material.cMatCGUID=matclass.cGUID
where dis_main.cBillCode like 'FH%'
and appay.cVouCode like 'SK%'
and appay.dAuditDate between '2014-11-01' and '2014-11-30'
and exists (
select '1' from (
select '174537133500153929' as cGUID
union all
select cGUID from CM_MatClass
where cParentID='174537133500153929') cmc where cmc.cGUID=matclass.cGUID)) dis
left join CM_Employee emp
on dis.cEmpGUID=emp.cGUID
group by emp.cCode,emp.cName



--(Ver2.0)根据收款日期和物品类别id来查询技术员的专项奖励--企业管理软件
select emp.cCode as EMP_CODE,emp.cName as EMP_NAME,SUM(dis.cTotal) as MONEY from (
select dis_main.cEmpGUID,case when dis_line.iTaxPrice<=3000 then 200*dis_line.iQTY else dis_line.iTotal*0.05 end as cTotal from SA_DispatchLine dis_line
left join BILL_GEN_RELATION_MAIN relation
on dis_line.cHeadGUID=relation.cSMainID
left join SA_Dispatch dis_main
on dis_line.cHeadGUID=dis_main.cGUID
left join AP_Payment appay
on relation.cDMainID=appay.cGUID
left join CM_Material material
on dis_line.cMatGUID=material.cGUID
left join CM_MatClass matclass
on material.cMatCGUID=matclass.cGUID
where dis_main.cBillCode like 'FH%'
and appay.cVouCode like 'SK%'
and appay.dAuditDate between '2014-11-01' and '2014-11-30'
and exists (
select '1' from (
select '174537133500134588' as cGUID
union all
select cGUID from CM_MatClass
where cParentID='174537133500134588') cmc where cmc.cGUID=matclass.cGUID)) dis
left join CM_Employee emp
on dis.cEmpGUID=emp.cGUID
group by emp.cCode,emp.cName


--(Ver2.0)根据收款日期和物品类别id来查询技术员的专项奖励--产业化招生
select emp.cCode as EMP_CODE,emp.cName as EMP_NAME,SUM(dis.cTotal) as MONEY from (
select dis_main.cEmpGUID,cMatGUID,(dis_line.iQTY*100) as cTotal from SA_DispatchLine dis_line
left join BILL_GEN_RELATION_MAIN relation
on dis_line.cHeadGUID=relation.cSMainID
left join SA_Dispatch dis_main
on dis_line.cHeadGUID=dis_main.cGUID
left join AP_Payment appay
on relation.cDMainID=appay.cGUID
left join CM_Material material
on dis_line.cMatGUID=material.cGUID
left join CM_MatClass matclass
on material.cMatCGUID=matclass.cGUID
where dis_main.cBillCode like 'FH%'
and appay.cVouCode like 'SK%'
and appay.dAuditDate between '2014-11-01' and '2014-11-30'
and exists (
select '1' from (
select '174537133500134577' as cGUID
union all
select cGUID from CM_MatClass
where cParentID='174537133500134577') cmc where cmc.cGUID=matclass.cGUID)) dis
left join CM_Employee emp
on dis.cEmpGUID=emp.cGUID
group by emp.cCode,emp.cName



--(Ver1.0)查询去除服务费外的销售
select emp.cCode as EMP_CODE,emp.cName as EMP_NAME,SUM(dis.iTotal) as MONEY from (
select dis_main.cEmpGUID,dis_line.iTotal from SA_DispatchLine dis_line
left join BILL_GEN_RELATION_MAIN relation
on dis_line.cHeadGUID=relation.cSMainID
left join SA_Dispatch dis_main
on dis_line.cHeadGUID=dis_main.cGUID
left join AP_Payment appay
on relation.cDMainID=appay.cGUID
left join CM_Material material
on dis_line.cMatGUID=material.cGUID
left join CM_MatClass matclass
on material.cMatCGUID=matclass.cGUID
where dis_main.cBillCode like 'FH%'
and appay.cVouCode like 'SK%'
and appay.dAuditDate between '2014-11-01' and '2014-11-30'
and matclass.cGUID not in (
select '174537133500134708' as cGUID
union all
select cGUID from CM_MatClass
where cParentID='174537133500134708')) dis
left join CM_Employee emp
on dis.cEmpGUID=emp.cGUID	
group by emp.cCode,emp.cName


--(Ver2.1)根据收款日期和物品类别id来查询技术员的所有销售情况
select emp.cCode as EMP_CODE,emp.cName as EMP_NAME,SUM(dis.iTotal) as MONEY from (
select dis1.cGUID,COUNT(1) from (
select dis_main.cEmpGUID,dis_line.cGUID,dis_line.iTotal from SA_DispatchLine dis_line
left join SA_Dispatch dis_main
on dis_line.cHeadGUID=dis_main.cGUID
left join BILL_GEN_RELATION_MAIN relation
on dis_main.cGUID=relation.cSMainID
left join CM_Employee emp
on emp.cGUID=dis_main.cEmpGUID
--left join AP_Payment appay
--on relation.cDMainID=appay.cGUID
where exists 
(select '1' from AP_Payment appay 
where appay.cGUID=relation.cDmainID 
and appay.dAuditDate  between '2014-11-01' and '2014-11-30' )
and dis_main.cBillCode like 'FH%'
and emp.cCode='5200169' ) dis1
group by dis1.cGUID
--and appay.cVouCode like 'SK%'
--and appay.dAuditDate between '2014-11-01' and '2014-11-30' 
) dis
left join CM_Employee emp
on dis.cEmpGUID=emp.cGUID
--测试
where emp.cCode='5200169'
group by emp.cCode,emp.cName
