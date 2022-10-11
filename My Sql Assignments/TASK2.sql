
/* Example1 */

create table phones (
name varchar(20) not null unique,
phone_number int not null unique
);

insert into phones(name,phone_number) values
('jack',1234),
('lena',3333),
('Mark',9999),
('Anna',7582);

select * from phones;

create table calls (
id int not null,
caller int not null,
callee int not null,
duration int not null,
unique(id)
);

insert into calls(id,caller,callee,duration) values
(25,1234,7582,8),
(7,9999,7582,1),
(18,9999,3333,4),
(2,7582,3333,3),
(3,3333,1234,1),
(21,3333,1234,1);

select * from calls;

select name from
(select name, sum(total_duration) as grandTotal from
(select name,caller,sum(duration) as total_duration
from phones
join calls
on phones.phone_number = calls.caller
group by name
union all
select name,callee,sum(duration) as total_duration
from phones
join calls
on phones.phone_number = calls.callee
group by name) as test
group by name) as test2
where grandTotal >=10;

-----------------------------/* Example2 */------------------------------------------------------------------

create table phones2 like phones;
insert into phones2(name,phone_number) values
('John',6356),
('Addison',4315),
('Kate',8003),
('Ginny',9831);

select * from phones2;

create table calls2 like calls;
insert into calls2(id,caller,callee,duration) values
(65,8003,9831,7),
(100,9831,8003,3),
(145,4315,9831,18);

select * from calls2;

select name from 
(select name, sum(Total_duration) as GrandTotal_duration from
(select name,phone_number,caller, sum(duration) as Total_duration
from phones2
join calls2
on phones2.phone_number = calls2.caller
group by name 

union all

select name,phone_number,callee, sum(duration) as Total_duration
from phones2
join calls2
on phones2.phone_number = calls2.callee
group by name ) as test1
group by name ) as test2
where GrandTotal_duration >=10
order by name;