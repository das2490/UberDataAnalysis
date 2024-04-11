-- Average Fare Amount based on Each Vendor

Select VendorID,  round(avg(fare_amount),2) as Avg_Fare_Amount
from fact_table
group by VendorID;


-- Avgerage Trip Distance based on rate

select c.rate_code_name , avg(a.trip_distance) as Avg_Trip_On_Rate from trip_distance_dim as a
join fact_table as b on a.trip_distance_id=b.trip_distance_id
join rate_code_dim as c on c.rate_code_id = b.rate_code_id
group by c.rate_code_name;


-- Total Fare Amount based on Payment Type

select c.payment_type_name , round(sum(b.fare_amount),2) as Total_fare_on_Payment from trip_distance_dim as a
join fact_table as b on a.trip_distance_id=b.trip_distance_id
join payment_type_dim as c on c.payment_type_id = b.payment_type_id
group by c.payment_type_name;


-- Total tip amount based on payment type

select b.payment_type_name , round(sum(a.tip_amount),2) as Tip_amount
from fact_table as a
join payment_type_dim as b
on a.payment_type_id = b.payment_type_id
group by b.payment_type_name;


-- total extra based on vandorID

select a.VendorID , round(sum(a.extra) as extra from fact_table as a
group by VendorID;