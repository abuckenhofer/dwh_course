-- How many rows do you have?

select 'D_CATEGORY', count(*) from D_CATEGORY union
select 'D_CUSTOMER', count(*) from D_CUSTOMER union
select 'D_DATE', count(*) from D_DATE union
select 'D_EXTRA_BOOKING_FEE', count(*) from D_EXTRA_BOOKING_FEE union
select 'D_RENTAL_ZONE', count(*) from D_RENTAL_ZONE union
select 'D_TIME', count(*) from D_TIME union
select 'D_TRAVERSE_USE', count(*) from D_TRAVERSE_USE union
select 'D_VEHICLE', count(*) from D_VEHICLE union
select 'F_BOOKING', count(*) from F_BOOKING union
select 'H_BOOKING', count(*) from H_BOOKING union
select 'H_CUSTOMER', count(*) from H_CUSTOMER union
select 'H_RENTAL_ZONE', count(*) from H_RENTAL_ZONE union
select 'H_VEHICLE', count(*) from H_VEHICLE union
select 'L_BOOKING', count(*) from L_BOOKING union
select 'R_CATEGORY', count(*) from R_CATEGORY union
select 'STG_BOOKING_CARSHARING', count(*) from STG_BOOKING_CARSHARING union
select 'STG_CATEGORY_CARSHARING', count(*) from STG_CATEGORY_CARSHARING union
select 'STG_CUSTOMER', count(*) from STG_CUSTOMER union
select 'STG_RENTAL_ZONE_CARSHARING', count(*) from STG_RENTAL_ZONE_CARSHARING union
select 'STG_VEHICLE_CARSHARING', count(*) from STG_VEHICLE_CARSHARING union
select 'S_BOOKING_FLK', count(*) from S_BOOKING_FLK union
select 'S_CUSTOMER_CRM', count(*) from S_CUSTOMER_CRM union
select 'S_RENTAL_ZONE_FLK', count(*) from S_RENTAL_ZONE_FLK union
select 'S_VEHICLE_FLK', count(*) from S_VEHICLE_FLK
ORDER BY 1;
