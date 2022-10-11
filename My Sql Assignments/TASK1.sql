
create database sqltasks;
use sqltasks;

create table shopping_history (
product varchar(30) not null,
quantity integer not null,
unit_price integer not null
);

insert into shopping_history (product,quantity,unit_price) values 
('milk',3,10),
('bread',7,3),
('bread',5,2),
('cake',5,15),
('paneer',2,25),
('butter',5,12),
('butter', 2,45),
('butter',5,21),
('milk',8,8),
('cake',1,19);

select * from shopping_history;


select product, sum(quantity * unit_price) as total_price
from shopping_history
group by 1
order by 1 desc;












