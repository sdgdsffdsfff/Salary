/****************�������۲���****************/

--(Ver2.2)�����տ����ں���Ʒ���id����ѯ����Ա�������������
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



--(Ver2.2)�����տ����ں���Ʒ���id����ѯ����Ա��"IT�������"�������
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


--(Ver2.2)�����տ����ں���Ʒ���id����ѯ����Ա��"��ҵ����Ʒ"�������
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

--(Ver2.2)�����տ����ں���Ʒ���id����ѯ����Ա��"��ҵ�������"�������
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

--(Ver2.2)�����տ����ں���Ʒ���id����ѯ����Ա��"�ı����"�������
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

--(Ver2.2)�����տ����ں���Ʒ���id����ѯ����Ա��--�޳�"�����"���������
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



/****************ר�������****************/
--��ʼ��ר���:��Ʊ��ѯ���:174537133500153929
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


--��ʼ��ר���:��ҵ�������:174537133500134588
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


--��ʼ��ר���:��ҵ������:174537133500134577
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

