alter table L_BOOKING
   drop constraint FK_L_BOOKIN_REFERENCE_H_BOOKIN;

alter table L_BOOKING
   drop constraint FK_L_BOOKIN_REFERENCE_H_RENTAL;

alter table L_BOOKING
   drop constraint FK_L_BOOKIN_REFERENCE_H_RENTAL;

alter table L_BOOKING
   drop constraint FK_L_BOOKIN_REFERENCE_H_VEHICL;

alter table L_BOOKING
   drop constraint FK_L_BOOKIN_REFERENCE_H_CUSTOM;

alter table S_BOOKING_FLK
   drop constraint FK_S_BOOKIN_REFERENCE_H_BOOKIN;

alter table S_BOOKING_FLK
   drop constraint FK_S_BOOKIN_REFERENCE_R_CATEGO;

alter table S_CUSTOMER_CRM
   drop constraint FK_S_CUSTOM_REFERENCE_H_CUSTOM;

alter table S_RENTAL_ZONE_FLK
   drop constraint FK_S_RENTAL_REFERENCE_H_RENTAL;

alter table S_VEHICLE_FLK
   drop constraint FK_S_VEHICL_REFERENCE_H_VEHICL;

drop index H_BOOKING_BID_UIX;

drop table H_BOOKING cascade constraints;

drop index H_CUSTOMER_CID_UIX;

drop table H_CUSTOMER cascade constraints;

drop index H_RENTAL_ZONE_RZ_UIX;

drop table H_RENTAL_ZONE cascade constraints;

drop index H_VEHICLE_FIN_UIX;

drop table H_VEHICLE cascade constraints;

drop table L_BOOKING cascade constraints;

drop index H_VEHICLE_FIN_UIX5;

drop table R_CATEGORY cascade constraints;

drop table S_BOOKING_FLK cascade constraints;

drop table S_CUSTOMER_CRM cascade constraints;

drop table S_RENTAL_ZONE_FLK cascade constraints;

drop table S_VEHICLE_FLK cascade constraints;
