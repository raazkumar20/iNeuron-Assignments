/*Example1*/

create table transactions (
amount int not null,
date date not null
);

insert into transactions (amount,date) values
(1000,'2020-01-06'),
(-10,'2020-01-14'),
(-75, '2020-01-20'),
(-5, '2020-01-25'),
(-4, '2020-01-29'),
(2000,'2020-03-10'),
(-75, '2020-03-12'),
(-20, '2020-03-15'),
(40, '2020-03-15'),
(-50, '2020-03-17'),
(200, '2020-10-10'),
(-200,'2020-10-10');

select * from transactions;


select (sum(amount)) -
((select ((12*5)-finalresult*5) charge_for_credit_card from
(select sum(result) as finalresult from 
(select if(Total <=-100,1,0) and if(Count_of_MName >=3,1,0) as result from
(select MName,txttype,date,sum(amount) as Total , count(MName) as Count_of_MName
from
(select amount, date, if(amount > 0, 'Incoming Transfer','Credit Card Payment') as txttype,monthname(date) as MName
from transactions) as test1
where txttype = 'Credit Card Payment'
group by MN) as test2) as test3)as test4)) as Balance from transactions ;


/*Example2*/

create table transactions2 like transactions;

insert into transactions2 (amount,date) values 
(1,'2020-06-29'),
(35,'2020-02-20'),
(-50, '2020-02-03'),
(-1, '2020-02-26'),
(-200, '2020-08-01'),
(-44, '2020-02-07'),
(-5, '2020-02-25'),
(1,'2020-06-29'),
(1,'2020-06-29'),
(-100,'2020-12-29'),
(-100, '2020-12-30'),
(-100, '2020-12-31');

select * from transactions2;

select sum(amount) -
(select (12*5) - sum(finalresult)*5 as charge_for_credit_card from
(select sum(result) as finalResult from
(select Mname,txttype,total,count_of_month_name ,if(total <=-100, 1,0) and if(count_of_month_name >= 3, 1,0) as result from
(select Mname,txttype,sum(amount) as total,count(Mname) as count_of_month_name from
(select amount ,date, if(amount > 0 , 'Incoming Transafer', 'Credit Card payment') as txttype, monthname(date) as Mname
from transactions2) as test1
where txttype = 'credit card payment'
group by Mname)as test2) as test3) as test4) as Balance 
from transactions2;

/*Example3*/

create table transactions3 like transactions2;
insert into transactions3 (amount,date) values
(6000,'2020-04-03'),
(5000,'2020-04-02'),
(4000,'2020-04-01'),
(3000, '2020-03-01'),
(2000, '2020-02-01'),
(1000, '2020-01-01');

select * from transactions3;

select sum(amount)-
(select (12*5) - sum(result)*5 as charge_for_credit_card from
(select sum(count_of_month_name) as result from
(select txttype,Mname,sum(amount) as total, count(Mname) count_of_month_name from
(select amount,date, monthname(date) as Mname,if(amount > 0, 'Incoming Transfer','Credit Card Payment')as txttype
from transactions3) as test
where txttype = 'Credit Card Payment') as test2) as test3) as Balance from transactions3;






