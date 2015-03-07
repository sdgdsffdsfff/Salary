--查询产业化招生奖励:物品类别id:174537133500134577

--第五步:将得到的数据关联到员工表
select emp.cCode as EMP_CODE,emp.cName,dis.MONEY from (
select dis_main.cEmpGUID,sum(dis_line.cTotal) as MONEY from (
select dispatchline.* from(
select cguid,cHeadGUID,cMatGUID,(iQTY*100) as cTotal from SA_DispatchLine where cHeadGUID in(
select cSMainID from BILL_GEN_RELATION_MAIN where cDMainID in (
select cGUID from AP_Payment 
where cVouCode like 'SK%'
--时间查询条件
and dAuditDate between '2014-12-01' and '2015-1-1'))) dispatchline
left join 
(select cGUID,cMatName from CM_Material
where cMatCGUID in
(select cm_class.cGUID from (
--物品类别查询条件
select '174537133500134577' as cGUID
union
select cGUID from CM_MatClass
--物品类别查询条件
where cParentID='174537133500134577') cm_class)) material
on dispatchline.cMatGUID=material.cGUID
where material.cGUID is not null) dis_line
left join SA_Dispatch dis_main
on dis_line.cHeadGUID=dis_main.cGUID
where dis_main.cEmpGUID is not null
group by dis_main.cEmpGUID) dis
left join CM_Employee emp
on dis.cEmpGUID=emp.cGUID