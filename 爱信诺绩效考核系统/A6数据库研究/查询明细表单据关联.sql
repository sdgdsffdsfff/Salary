--��ѯ���۷�������ϸ��,����id:974230326481699489
select * from ST_StkRecordLine
where cHeadGUID='974230326481699489';
--��ѯ�ո����ϸ��,����id:128275830370316664
select * from AP_PaymentDetail
where cPaymentGUID='128275830370316664';


/**
������Ŀ����ѯ˼·:
1.�տ������������Ϊ���ڲ�ѯ����������  ���ݹ������cDMain
2.���ݹ������cSMain�������۷�Ʊ��ϸ���cHeadGUID
3.���۷�Ʊ��ϸ�������Ʒ��,��Ʒ�������Ʒ����
4.��Ʒ����������Ŀ¼��Ϊ������Ŀ��ѯ�������ó���Ӧ������Ŀ���ܽ��
**/

--��һ��:�տ������������Ϊ���ڲ�ѯ����������  ���ݹ������cDMain
select cSMainID from BILL_GEN_RELATION_MAIN where cDMainID in (
select cGUID from AP_Payment 
where cVouCode like 'SK%'
and dAuditDate between '2000-06-01' and '2015-6-10')


--�ڶ���:���ݹ������cSMain�������۷�Ʊ��ϸ���cHeadGUID
select * from(
select * from SA_InvoiceLine where cHeadGUID in(
select cSMainID from BILL_GEN_RELATION_MAIN where cDMainID in (
select cGUID from AP_Payment 
where cVouCode like 'SK%'
and dAuditDate between '2000-06-01' and '2015-6-10'))) invoiceline


--����һ�£��Ǵ����۳��ⵥ������
select * from SA_DispatchLine where cHeadGUID in(
select cSMainID from BILL_GEN_RELATION_MAIN where cDMainID in (
select cGUID from AP_Payment 
where cVouCode like 'SK%'
and dAuditDate between '2000-06-01' and '2015-6-10'))

--������:�������ϸ�������Ʒ��,��Ʒ�������Ʒ����
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




--���Ĳ�:�������ϸ��������������,�ó�ÿ��Ա�������ۻ���
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


--���岽:���õ������ݹ�����Ա����
select emp.cCode as EMP_CODE,emp.cName,dis.MONEY from (
select dis_main.cEmpGUID,sum(dis_line.iTotal) as MONEY from (
select dispatchline.* from(
select cguid,cHeadGUID,cMatGUID,iTotal from SA_DispatchLine where cHeadGUID in(
select cSMainID from BILL_GEN_RELATION_MAIN where cDMainID in (
select cGUID from AP_Payment 
where cVouCode like 'SK%'
--ʱ���ѯ����
and dAuditDate between '2000-06-01' and '2015-6-10'))) dispatchline
left join 
(select cGUID,cMatName from CM_Material
where cMatCGUID in
(select cm_class.cGUID from (
--��Ʒ����ѯ����
select '174537133500153932' as cGUID
union
select cGUID from CM_MatClass
--��Ʒ����ѯ����
where cParentID='174537133500153932') cm_class)) material
on dispatchline.cMatGUID=material.cGUID
where material.cGUID is not null) dis_line
left join SA_Dispatch dis_main
on dis_line.cHeadGUID=dis_main.cGUID
where dis_main.cEmpGUID is not null
group by dis_main.cEmpGUID) dis
left join CM_Employee emp
on dis.cEmpGUID=emp.cGUID