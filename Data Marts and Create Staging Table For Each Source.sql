
CREATE TABLE `zain-458119.966.data_mart_billing` as 
select billing_id , customer_id as customer_id,sum(coalesce(amount_paid ,0))as   amount_paid, sum(coalesce(amount_due,0)) as amount_due, sum(case when
lower(trim(payment_status))='unpaid' then 1 else 0 end) as unpaid_count
from `zain-458119.966.Billing`
group by customer_id , billing_id

create table `zain-458119.966.data_mart_customer` as 
select customer_id,signup_date ,lower(trim(plan_type)) as plan_type,device_type ,region,status ,case 
when age between 15 and 25 then "15-25"
when age between 26 and 35 then "26-35"
when age between 36 and 45 then "36-45"
when age between 46 and 55 then "46-55"
else "50+"
end  as age_group
from `zain-458119.966.Customer`
group by customer_id

drop table if exists `zain-458119.966.data_mart_Network_usage` ;
create table `zain-458119.966.data_mart_Network_usage` as
select customer_id , sum(data_usage_mb) as data_usage_mb,
avg(data_usage_mb) as average_monthly_data_usage,usage_date
from `zain-458119.966.Network`
group by  usage_date , customer_id
order by customer_id

create table `zain-458119.966.data_mart_support` as 
select customer_id ,count(*) as support_tickets,issue_category , support_reason
from `zain-458119.966.Support`
group by customer_id ,3

create table `zain-458119.966.data_mart_churn` as 
select customer_id , churn_reason ,











