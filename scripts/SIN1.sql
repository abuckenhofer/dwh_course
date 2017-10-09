-- author      =     Andreas Buckenhofer 
-- description =     Creates table loads data for tests with max and analytic functions
--                   The table contains full history by using a valid from date but no valid to date

begin
    for c1 in (select table_name from user_tables where table_name = 'S_CUSTOMER') 
    loop
        execute immediate 'drop table ' || c1.table_name;
    end loop;
end;
/

create table s_customer (
     customer_key integer        NOT NULL
   , cust_name    varchar2(100)  NOT NULL
   , status       varchar2(10)
   , valid_from   date           NOT NULL
   , CONSTRAINT s_customer_pk PRIMARY KEY (customer_key, valid_from)
);

insert into s_customer (customer_key, cust_name, status, valid_from) values (1, 'Brown',  'Single',  to_date('01.05.2014', 'DD.MM.YYYY'));
insert into s_customer (customer_key, cust_name, status, valid_from) values (2, 'Bush',   'Married', to_date('05.01.2015', 'DD.MM.YYYY'));
insert into s_customer (customer_key, cust_name, status, valid_from) values (1, 'Miller', 'Married', to_date('15.12.2015', 'DD.MM.YYYY'));
insert into s_customer (customer_key, cust_name, status, valid_from) values (3, 'Stein',  NULL,      to_date('15.12.2015', 'DD.MM.YYYY'));
insert into s_customer (customer_key, cust_name, status, valid_from) values (3, 'Stein',  'Single',  to_date('18.12.2015', 'DD.MM.YYYY'));
commit;
