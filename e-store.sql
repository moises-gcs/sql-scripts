--SQL statements for eStore

create table suppliers(

 supplier_id int primary key,
 company_name varchar(100) not null,
 contact_fname varchar(100),
 contact_lname varchar(100),
 contact_title varchar(10),
 address1 varchar(300),
 address2 varchar(300),
 city integer,
 state integer,
 postal_code varchar(10),
 country integer,
 phone bigint,
 fax bigint,
 email varchar(255),
 url varchar(300),
 payment_type smallint, 
 discount_type smallint,
 type_goods smallint,
 note varchar(1000),
 discount_available decimal(14,2),
 customerid integer
);


create table states(
  state_id integer primary key,
  name varchar(100)
);

create table cities(
  city_id integer primary key,
  name varchar(100)
);



create table discounts(
 discount_id integer primary key,
 description varchar(100),
 value decimal(4,2) not null
);


create table type_goods(
 type_goods_id integer primary key,
 description varchar(100)
);

create table products(

 product_id integer primary key,
 sku varchar(20) not null,
 vendor_product_id integer not null,
 product_name varchar(100) not null,
 product_description varchar(200),
 supplier_id integer not null,
 category_id integer not null,
 quantity integer not null,
 unit_price decimal(14,2) not null,
 msrp decimal(14,2),
 available_size varchar(100),
 available_color varchar(100),
 discount float,
 unit_weight decimal(14,2),
 unit_stock integer not null,
 reorder_point integer not null,
 ranking integer,
 note varchar(1000)
);

create table category(
 category_id integer primary key,
 name varchar(100) not null,
 description varchar(100) not null,
 active boolean not null
);

create table shippers(
 shipper_id integer primary key,
 name varchar(100),
 phone bigint
);


create table orders(
 order_id integer primary key,
 customer_id integer not null,
 order_number integer not null,
 payment_type integer not null,
 order_date date not null,
 shipper integer not null,
 ship_date date not null,
 sale_total decimal(14,2) not null,
 sales_tax decimal(14,2) not null,
 transaction_status integer,
 order_status integer,
 payment_date date,
 freigth decimal numeric(14,2) default 0.0
);

create table order_status(
 order_status_id integer primary key,
 description varchar(100)
);

create table transaction_status(
 transaction_id integer primary key,
 description varchar(100)
);

create table payment(
 payment_id integer primary key,
 description varchar(100),
 activate boolean not null
);

create table customers(

 customer_id integer primary key,
 name varchar(100) not null,
 last_name varchar(100) not null,
 address varchar(100) not null,
 country integer not null,
 phone bigint not null,
 email varchar(100),
 credit_card bigint,
 gender integer not null,
 creation_date date,
 birthday date not null

);

create table countries(
 country_id integer primary key,
 name varchar(100) not null
);

create table genders(
  genders_id smallint primary key,
  gender varchar(100)
);


--Applying the table relationships
alter table orders add constraint customer_fkey foreign key(customer_id) references customers(customer_id);
alter table orders add constraint shipper_fkey foreign key(shipper) references shippers(shipper_id);
alter table states add column country integer not null
alter table states add constraint country_fkey foreign key(country_fkey) references countries(country_id)

--Inserting data in the tables


insert into countries values
(1,'United States'),
(2,'Canada'),
(3,'Spain');

insert into cities values
(1,'New York'),
(2,'Toronto'),
(3,'Madrid')

insert into payment values
(1,'Cash',true),
(2,'Credit Card',true),
(3,'Debit card',true),
(4,'Mobile payments',false) 

insert into discounts values
(1,'Normal Discount',2.20),
(2,'Premium Discount',10.50),
(3,'Supreme Discount',20.00)

insert into shippers values
(1,'Gigant Shipper LTD',8091231234),
(2,'Merkana Transport',8092111234),
(3,'International Shippers Corp.',8241234123)


insert into type_goods values
(1,'Chemical'),
(2,'Industrial'),
(3,'Health Care'),
(4,'IT(Information Tecnology)')



insert into categories values
(1,'Domestical','Domestical category',true),
(2,'Industrial','Industrial category',true)

insert into genders values
(1,'Female'),
(2,'Male')

insert state



insert into suppliers values
(1,'Saltomen','Karin','Perez Montez','Mr.','Some address...',null,1,1,'1234567890',1,8097884561,8294561234,
'saltomen@salt.com','www.saltomen.com',2,1,1,null,0.0,1),
(2,'Kormena Corp','Gorge','Carmack Wozniak','Mr.','Mountain View 1600 Amphitheatre Parkway Mountain View,
CA 94043 ',null,3,3,'1234167890',1,8087884561,8494561234,'kormena@kormena.com','www.kormena.corp',2,2,2,null,0.0,2),
(3,'MegaSoft','Teresa','Meyer Trover','Mrs.','Mountain View 1200 Amphitheatre Parkway Mountain View,
CA 94043 ',null,2,2,'1234167890',1,8287884561,8494565234,'megasoft@verizon.org','www.megasoft.com',1,1,1,null,0.0,3)


insert into products values
(1,'SZD121',1,'Montec Cleaner','Liquid cleaner for shoes',1,1,12,45.99,43.50,'Little,Big Bottles'
,'Brown,Blue,Read,Black',4.50,8.50,45,10,4,null),
(2,'SZXF21',1,'SD 4GB ','Memory SD for mobile devices',3,1,10,5.99,3.50,'4x2.0 Ports and 8x2.0 Ports '
,'Blue,Red,Black',0,8.50,45,10,4,null)

insert into transaction_status values
(1,'Charged'),
(2,'Hold'),
(3,'Reversed'),
(4,'Cancelled')

insert into order_status values
(1,'Delivered'),
(2,'Preparing'),
(3,'Cancelling')


insert into customers values
(1,'John','Vactack Golie','Carkat 1650 Steel Mountain Street',1,8297891234,
'jv@gmail.com',741235789123,2,'2010-01-01','1987-10-05'),
(2,'Ana','Martin Grock','Montain View 1650 Innovation Street',1,8291291234,
'ana_martin@gmail.com',700235789123,1,'2011-11-01','1980-02-15'),
(3,'Mario','Martinez Goriza','Montain View 150 Innovation Street',2,8001991234,
'mmartinezg@gmail.com',700235089103,2,'2011-05-01','1980-01-31'),
(4,'Britanni','Star Vought','Los Gatos 16 Caron Street',1,8297297234,
'britanni_star@gmail.com',000235789123,1,'2011-11-01','1986-12-15'),
(5,'Marina','Holmes Gates','Seattle 10 George W. avenue ',1,8006291834,
'marina_holmes@outlook.com',1002957989123,1,'2009-01-01','1980-02-15')

insert into shippers values
(1,'International Seas Corp.',80)

insert into orders values 
(1,1,100,2,'2015-09-09',1,'2015-09-15',125.99,12.99,1,1,'2015-09-09'),
(2,1,101,2,'2015-09-10',1,'2015-09-16',105.99,9.99,2,1,'2015-09-09'),
(3,1,102,2,'2015-09-11',2,'2015-09-15',85.99,2.99,1,2,'2015-09-01'),
(4,2,103,2,'2015-08-19',3,'2015-08-30',15.99,1.99,1,1,'2015-08-19'),
(5,2,104,2,'2015-06-19',3,'2015-05-30',5.99,0.99,1,1,'2015-06-19')

select * from orders;
