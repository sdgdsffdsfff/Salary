--查询主表信息

--查询销售发货单,主表id:974099178926685585
select * from SA_Dispatch
where cGUID='974099178926685585'
--查询出入库单,主表id:974230326481699489
select * from ST_StkRecord
where cGUID='974230326481699489'
--查询收款单,主表id:128275830370316664
select * from AP_Payment 
where cGUID='128275830370316664'
--查询销售发票,主表id:103906345886758442
SELECT * FROM SA_Invoice
where cGUID='103906345886758442'
--查询单据的关联,主表id:
SELECT * FROM BILL_GEN_RELATION_MAIN
where cSMainID='974230326481699489'

/**
查询结论:(错误)
表间关联关系：

结论1:(错误)
销售出库单主表ST_StkRecord关联-->
单据关联表BILL_GEN_RELATION_MAIN关联-->
收款单主表AP_Payment

结论2:(错误)
单据关联表(cSMainID为销售出库单主表id,cDMainID为收款单主表id)
**/


/**
查询结论:
表间关联关系：

结论1:
销售发票主表SA_Invoice关联-->
单据关联表BILL_GEN_RELATION_MAIN关联-->
收款单主表AP_Payment

结论2:
单据关联表(cSMainID为销售发票主表id,cDMainID为收款单主表id)
**/

