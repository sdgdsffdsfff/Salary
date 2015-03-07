--查询销售发货单明细表,主表id:974230326481699489
select * from ST_StkRecordLine
where cHeadGUID='974230326481699489';
--查询收付款单明细表,主表id:128275830370316664
select * from AP_PaymentDetail
where cPaymentGUID='128275830370316664';


/**
销售项目金额查询思路:
1.收款单的主表日期作为日期查询条件，关联  单据关联表的cDMain
2.单据关联表的cSMain关联销售发票明细表的cHeadGUID
3.销售发票明细表关联物品表,物品表关联物品类别表
4.物品类别表的类别主目录作为销售项目查询条件，得出对应销售项目的总金额
**/

--第一步:收款单的主表日期作为日期查询条件，关联  单据关联表的cDMain
select cSMainID from BILL_GEN_RELATION_MAIN where cDMainID in (
select cGUID from AP_Payment 
where cVouCode like 'SK%'
and dAuditDate between '2000-06-01' and '2015-6-10')


--第二步:单据关联表的cSMain关联销售发票明细表的cHeadGUID
select * from(
select * from SA_InvoiceLine where cHeadGUID in(
select cSMainID from BILL_GEN_RELATION_MAIN where cDMainID in (
select cGUID from AP_Payment 
where cVouCode like 'SK%'
and dAuditDate between '2000-06-01' and '2015-6-10'))) invoiceline


--假设一下，是从销售出库单关联的
select * from SA_DispatchLine where cHeadGUID in(
select cSMainID from BILL_GEN_RELATION_MAIN where cDMainID in (
select cGUID from AP_Payment 
where cVouCode like 'SK%'
and dAuditDate between '2000-06-01' and '2015-6-10'))

--第三步:出入库明细表关联物品表,物品表关联物品类别表
select dispatchline.* from(
select * from SA_DispatchLine where cHeadGUID in(
select cSMainID from BILL_GEN_RELATION_MAIN where cDMainID in (
select cGUID from AP_Payment 
where cVouCode like 'SK%'
and dAuditDate between '2000-06-01' and '2015-6-10'))) dispatchline
left join 
(select cGUID,cMatName from CM_Material
where cMatCGUID in
(select cm_class.cGUID from (
select '174537133500153932' as cGUID
union
select cGUID from CM_MatClass
where cParentID='174537133500153932') cm_class)) material
on dispatchline.cMatGUID=material.cGUID
where material.cGUID is not null




--第四步:出入库明细表关联出入库主表,得出每个员工的销售汇总
select dis_main.cEmpGUID,sum(dis_line.iTotal) as MONEY from (
select dispatchline.* from(
select cguid,cHeadGUID,cMatGUID,iTotal from SA_DispatchLine where cHeadGUID in(
select cSMainID from BILL_GEN_RELATION_MAIN where cDMainID in (
select cGUID from AP_Payment 
where cVouCode like 'SK%'
and dAuditDate between '2000-06-01' and '2015-6-10'))) dispatchline
left join 
(select cGUID,cMatName from CM_Material
where cMatCGUID in
(select cm_class.cGUID from (
select '174537133500153932' as cGUID
union
select cGUID from CM_MatClass
where cParentID='174537133500153932') cm_class)) material
on dispatchline.cMatGUID=material.cGUID
where material.cGUID is not null) dis_line
left join SA_Dispatch dis_main
on dis_line.cHeadGUID=dis_main.cGUID
where dis_main.cEmpGUID is not null
group by dis_main.cEmpGUID


--第五步:将得到的数据关联到员工表
select emp.cCode as EMP_CODE,emp.cName,dis.MONEY from (
select dis_main.cEmpGUID,sum(dis_line.iTotal) as MONEY from (
select dispatchline.* from(
select cguid,cHeadGUID,cMatGUID,iTotal from SA_DispatchLine where cHeadGUID in(
select cSMainID from BILL_GEN_RELATION_MAIN where cDMainID in (
select cGUID from AP_Payment 
where cVouCode like 'SK%'
--时间查询条件
and dAuditDate between '2000-06-01' and '2015-6-10'))) dispatchline
left join 
(select cGUID,cMatName from CM_Material
where cMatCGUID in
(select cm_class.cGUID from (
--物品类别查询条件
select '174537133500153932' as cGUID
union
select cGUID from CM_MatClass
--物品类别查询条件
where cParentID='174537133500153932') cm_class)) material
on dispatchline.cMatGUID=material.cGUID
where material.cGUID is not null) dis_line
left join SA_Dispatch dis_main
on dis_line.cHeadGUID=dis_main.cGUID
where dis_main.cEmpGUID is not null
group by dis_main.cEmpGUID) dis
left join CM_Employee emp
on dis.cEmpGUID=emp.cGUID