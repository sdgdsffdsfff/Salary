--��һ�����ȸ���xsck_jsp������xsck_jsp_temp�����к�id
insert into xsck_jsp_temp
--seq_sku_inout_custom���Զ�������۳���bill_id��
select seq_sku_inout_custom.nextval,sh,mc,jskmh,skkmh,xsrq,id from xsck_jsp
where not exists 
(select 1 from xsck_jsp_temp xjt where xjt.pid=xsck_jsp.id);
commit;

--�������۳�������
insert into sku_inout_store_master
(bill_id,business_type_id,org_id,store_id,
customer_id,operator_id,business_date,
detail_subtotal,time_stamp,update_operator_id,update_date)
select * from (
select jsp_temp.id as bill_id,
11 as business_type_id,
2382 as org_id,
2382 as store_id,
cus.org_customer_id as customer_id,
248834 as operator_id,
xsrq as business_date,
'F0170100029(��ֵ˰��Ʊϵͳ��˰�̣�AN6-W-3.0-SK��SKN6K08K1):1;F0100100056(��ֵ˰��Ʊϵͳ��˰��;A-BS-6-3.1��BSN6K05B):1;' 
as detail_subtotal,
3 as time_stamp,
248834 as update_operator_id,
xsrq as update_date
from xsck_jsp_temp jsp_temp
left join cus_org_customer cus
on cus.cust_tax_code=jsp_temp.sh
where cus.org_customer_id is not null) jsp_temp_main
where not exists 
(select 1 from sku_inout_store_master skm where skm.bill_id=jsp_temp_main.bill_id);
commit;

--�������۳�����ϸ��
insert into sku_inout_store_detail
(bill_id,article_id,start_no,
amount,end_no,no,d_org_id,d_business_type_id)
select * from (
select jsp_temp1.id,'F0170100029' as article_id,JSKMH as start_no,
1 as amount,JSKMH as end_no,1 as no,
2382 as d_org_id,11 as d_business_type_id
from xsck_jsp_temp jsp_temp1
union
select jsp_temp2.id,'F0100100056' as article_id,SKKMH as start_no,
1 as amount,SKKMH as end_no,2 as no,
2382 as d_org_id,11 as d_business_type_id
from xsck_jsp_temp jsp_temp2) jsp_temp_main
where not exists
(select 1 from sku_inout_store_detail skd where skd.bill_id=jsp_temp_main.id);
commit;



--�Ƚ������˰�����ݵĿͻ�id���µ���Ʒ���Ա�
update SKU_PROPERTIES sku_p
set sku_p.customer_id=
(select jsp_main1.org_customer_id from (
select cus.org_customer_id,jsp_main.code from (
select sh,jskmh as code from xsck_jsp_temp jsp_temp1
union
select sh,skkmh as code from xsck_jsp_temp jsp_temp2) jsp_main
left join cus_org_customer cus
on jsp_main.sh=cus.cust_tax_code) jsp_main1
where jsp_main1.code=sku_p.article_no)
--select * from SKU_PROPERTIES sku_p
where exists 
(select 1 from (
select cus.org_customer_id,jsp_main.code from (
select sh,jskmh as code from xsck_jsp_temp jsp_temp1
union
select sh,skkmh as code from xsck_jsp_temp jsp_temp2) jsp_main
left join cus_org_customer cus
on jsp_main.sh=cus.cust_tax_code) jsp_main1
where jsp_main1.code=sku_p.article_no)
commit;



--����Ʒ������״̬����Ϊ7(����)
update SKU_PROPERTIES sku_p
set sku_p.status_id=7
where sku_p.customer_id in
(select cus.org_customer_id from xsck_jsp_temp jsp_temp 
left join cus_org_customer cus
on jsp_temp.sh=cus.cust_tax_code);
commit;


--���֮����Ҫ���xsck_jsp��xsck_jsp_temp����������ݣ�����������Ⱦ
truncate table xsck_jsp_temp;
truncate table xsck_jsp;
