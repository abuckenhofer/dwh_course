-- clear tables in Core Warehouse Layer

truncate table S_BOOKING_FLK;
truncate table S_CUSTOMER_CRM;
truncate table S_RENTAL_ZONE_FLK;
truncate table S_VEHICLE_FLK;

truncate table L_BOOKING;

delete from H_BOOKING;
delete from H_CUSTOMER;
delete from H_RENTAL_ZONE;
delete from H_VEHICLE;

delete from R_CATEGORY;

