alter table F_BOOKING
   drop constraint FK_F_BOOKIN_FROM_D_DATE;

alter table F_BOOKING
   drop constraint FK_F_BOOKIN_FROM_D_RENTAL;

alter table F_BOOKING
   drop constraint FK_F_BOOKIN_FROM_D_TIME;

alter table F_BOOKING
   drop constraint FK_F_BOOKIN_REFERENCE_D_EXTRA_;

alter table F_BOOKING
   drop constraint FK_F_BOOKIN_REFERENCE_D_TRAVER;

alter table F_BOOKING
   drop constraint FK_F_BOOKIN_REFERENCE_D_CATEGO;

alter table F_BOOKING
   drop constraint FK_F_BOOKIN_REFERENCE_D_CUSTOM;

alter table F_BOOKING
   drop constraint FK_F_BOOKIN_REFERENCE_D_VEHICL;

alter table F_BOOKING
   drop constraint FK_F_BOOKIN_REFERENCE_D_DATE;

alter table F_BOOKING
   drop constraint FK_F_BOOKIN_TO_D_RENTAL;

alter table F_BOOKING
   drop constraint FK_F_BOOKIN_UNTIL_D_DATE;

alter table F_BOOKING
   drop constraint FK_F_BOOKIN_UNTIL_D_TIME;

drop index D_CATEGORY_UIX5;

drop table D_CATEGORY cascade constraints;

drop table D_CUSTOMER cascade constraints;

drop table D_DATE cascade constraints;

drop table D_EXTRA_BOOKING_FEE cascade constraints;

drop table D_RENTAL_ZONE cascade constraints;

drop table D_TIME cascade constraints;

drop table D_TRAVERSE_USE cascade constraints;

drop table D_VEHICLE cascade constraints;

drop table F_BOOKING cascade constraints;
