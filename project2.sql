CREATE TABLE customer(
cust_id int NOT NULL PRIMARY KEY,
first_name varchar(255),
last_name varchar(255),
phone int,
SSN int,
credit_card_no int
);

CREATE TABLE home(
street varchar(255) NOT NULL,
city varchar(255) NOT NULL,
state varchar(2) NOT NULL,
zip_code int NOT NULL,
policy_number int,
area int,
DOP date,
cust_id int,
PRIMARY KEY (street, city, state, zip_code),
FOREIGN KEY (cust_id) references customer(cust_id)
);

CREATE TABLE payment(
policy_no int NOT NULL,
due_date date NOT NULL,
pay_amt decimal(38,2) NOT NULL,
payment_date date,
PRIMARY KEY (policy_no, due_date, pay_amt)
);

CREATE TABLE insurance_policy(
    policy_no INT NOT NULL PRIMARY KEY,
    cost_insured decimal(38,2) NOT NULL,
    cust_id INT NOT NULL,
    street varchar(255),
    city  varchar(255),
    state varchar(2),
    zip_code INT,
FOREIGN KEY (cust_id) references customer(cust_id) ON DELETE CASCADE,
FOREIGN KEY (street, city, state, zip_code) references home(street, city, state, zip_code) ON DELETE CASCADE
);

CREATE TABLE incidents(
incident_id int NOT NULL PRIMARY KEY,
incident_date date NOT NULL,
incident_description text,
premium decimal(38,2) NOT NULL,
damages_amt decimal(38,2) NOT NULL,
incident_type varchar(255)
);

CREATE TABLE recorded (
incident_id int NOT NULL PRIMARY KEY, 
street int, 
city varchar(255), 
state varchar(2), 
zip_code int
);

INSERT INTO customer(cust_id, first_name, last_name, phone, SSN, credit_card_no) VALUES
    (1234,  'Lincoln', 'Bain', 4081112222, 111111111, 1111111111111111),
    (2345,  'Marco', 'Polo', 6691234567, 222222222, 2222222222222222),
(3456,  'Billy', 'Bob', 4084084088, 333333333, 3333333333333333),
(4567,  'Nathan', 'Lux', 4083726374, 444444444, 4444444444444444),
(5678,  'Karen', 'Smith', 2738691029, 555555555, 5555555555555555);

INSERT INTO home(street, city, state, zip_code, policy_number, area, DOP, cust_id) VALUES
    ('90 Hello Ave', 'San Jose', 'CA', '96801', 0000, 3400, '2000-01-01', 1234),
    ('99 Thankyou Way', 'Union City', 'CA', '96368', 9999, 478, '2011-02-01', 1234),
('43  Montrose Ct', 'Sacramento ', 'CA', '97254', 5555, 754, '2017-11-05', 1234),
('68 Covid Street', 'Santa Clara', 'CA', '96821', 1111, 912, '1998-05-03', 2345),
('56 Helen Bell Way', 'San Jose', 'CA', '96804', 6666, 3218, '2000-06-08', 2345),
    ('51 GoodNight Blvd', 'Los Angeles', 'CA', '92081', 2222, 4000, '2001-06-17', 3456),
    ('11 South 1st Street', 'San Francisco', 'CA', '90408', 3000, 7411, '2021-03-21', 3456),
('9 Story Ave', 'Tracy', 'CA', '90001', 3333, 2400, '2016-12-25', 4567),
('666 Conspiracy Street', 'Oakland', 'CA', '91467', 8888, 2000, '1996-04-23', 4567),
('71 Alameda Blvd', 'Palo Alto', 'CA', '96222', 4444, 3200, '1990-07-02', 5678);

INSERT INTO payment(policy_no, due_date, pay_amt, payment_date) VALUES
(0000, '2021-02-21', 1987, '2021-01-01'),
(1111, '2021-03-12', 9875, '2021-02-03'),
(2222, '2021-03-11', 1200, '2021-11-04'),
(3333, '2021-03-17', 6500, '2021-04-07'),
(4444, '2021-02-18', 5800, '2021-05-05'),
(5555, '2021-03-21', 4500, '2021-02-17'),
(6666, '2021-04-07', 3400, '2021-03-21'),
(7777, '2021-05-12', 6000, '2021-04-07'),
(8888, '2021-04-13', 4000, '2021-02-07'),
(9999, '2021-03-22', 2000, '2021-02-19');

INSERT INTO insurance_policy (policy_no, cost_insured, cust_id, street, city, state, zip_code) VALUES
(0000, 100.00, 1234, '90 Hello Ave', 'San Jose', 'CA', 96801),
(9999, 550.00, 1234, '99 Thankyou Way', 'Union City', 'CA', 96368),
(5555, 350.00, 1234, '43  Montrose Ct', 'Sacramento ', 'CA', 97254),
(1111, 150.00, 2345, '68 Covid Street', 'Santa Clara', 'CA', 96821),
(6666, 400.00, 2345, '56 Helen Bell Way', 'San Jose', 'CA', 96804),
(2222, 200.00, 3456, '51 GoodNight Blvd', 'Los Angeles', 'CA', 92081),
(7777, 450.00, 3456, '11 South 1st Street', 'San Francisco', 'CA', 90408),
(3333, 250.00, 4567, '9 Story Ave', 'Tracy', 'CA', 90001),
(8888, 500.00, 4567, '666 Conspiracy Street', 'Oakland', 'CA', 91467),
(4444, 300.00, 5678, '71 Alameda Blvd', 'Palo Alto', 'CA', 96222);

INSERT INTO incidents(incident_id, incident_date, incident_description, premium, damages_amt, incident_type) VALUES
    (0001, '2001-09-11', 'House Fire', 1500, 2000, 'Structure Damage'),
(0002, '2004-07-26', 'Flooding', 1500, 2000, 'Structure Damage'),
    (0003, '2004-10-21', 'Flooding', 1500, 2000, 'Structure Damage'),
(0004, '2005-03-13', 'Armed robbery', 1700, 2000, 'Robbery'),
    (0005, '2006-04-14', 'Unarmed robbery', 1400, 1600, 'Robbery'),
(0006, '2008-09-16', 'Blackmailing', 1000, 3000, 'Robbery'),
    (0007, '2008-09-23', 'Tornado', 2300, 4500, 'Natural Disaster'),
(0008, '2008-11-04', 'Malfunctioning of electric appliances', 250, 300, 'Internal Damage'),
    (0009, '2009-12-05', 'Hurricane', 2500, 4000, 'Natural Disaster'),
(0010, '2013-08-07', 'Volcanic Eruption', 10000, 1000000, 'Natural Disaster');

INSERT INTO recorded(incident_id, street, city, state, zip_code) VALUES
    (0001, '90 Hello Ave', 'San Jose', 'CA', '96801'),
(0002, '51 GoodNight Blvd', 'Los Angeles', 'CA', '92081'),
(0003, '56 Helen Bell Way', 'San Jose', 'CA', '96804'),
    (0004, '43 Montrose Ct', 'Sacramento', 'CA', 97254),
(0005, '68 Covid Street', 'Santa Clara', 'CA', 96821),
(0006, '9 Story Ave', 'Tracy', 'CA', 90001),
    (0007, '9 Story Ave', 'Tracy', 'CA', 90001),
(0008, '9 Story Ave', 'Tracy', 'CA', 90001),
(0009, '666 Conspiracy Street', 'Oakland', 'CA', 91467),
(0010, '71 Alameda Blvd', 'Palo Alto', 'CA', 96222);

select city, avg(pay_amt) from payment natural join home group by city having city = 'San Jose';
select street, city, state, zip_code, sum(damages_amt) as tot_damages from incidents natural join recorded group by street, city, zip_code order by tot_damages desc;
select first_name, last_name, phone, count(cust_id) as num_homes from customer natural join home group by cust_id having num_homes > 1 order by num_homes;
select street, city, state, zip_code, incident_date from incidents natural join recorded where incident_type = 'Structure Damage';
select policy_no, cost_insured from (Select policy_no, cost_insured, count
(distinct cust_id) as owner_num from insurance_policy where cost_insured 
> 300) group by owner_num;
select street, city, state, zip_code from recorded natural join incidents;