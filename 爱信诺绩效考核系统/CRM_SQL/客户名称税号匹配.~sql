--truncate table tmp_cus;
select * from tmp_cus;

select tmp_cus.*,cus.cust_tax_code from tmp_cus
left join cus_org_customer cus
on tmp_cus.name=cus.cust_name;
