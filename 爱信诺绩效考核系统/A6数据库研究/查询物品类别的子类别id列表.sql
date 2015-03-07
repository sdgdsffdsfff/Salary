--查询cguid下的子类别id列表(包含原cguid)
select cm_class.cGUID from (
select '174537133500153932' as cGUID
union
select cGUID from CM_MatClass
where cParentID='174537133500153932') cm_class


--查询cguid下的所有产品id
select cGUID,cName from CM_Material
where cMatCGUID in
(select cm_class.cGUID from (
select '174537133500153932' as cGUID
union
select cGUID from CM_MatClass
where cParentID='174537133500153932') cm_class)


