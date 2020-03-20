-- Question 1
select (select count(*) from employees where city = 'Seattle') +
 (select count(*) from customers where city = 'Seattle') as compte 
, last_name, first_name FROM (SELECT * FROM employees WHERE city = "Seattle" UNION SELECT * FROM customers WHERE city = "Seattle") as employees;

-- Question 2
select last_name, first_name, email_address from employees as e inner join employee_privileges as ep on e.id = ep.employee_id 
inner join privileges as p on ep.privilege_id = p.id  where privilege_name = 'Purchase Approvals';

-- Question 3
select product_code, product_name, quantity_per_unit from products where category = 'Condiments';

-- Question 4
select * from products order by standard_cost union select * from products order by standard_cost

-- Question 5
select round(avg(standard_cost), 2) as prix_moyen, category from products where category in ('Candy', 'Dried Fruit & Nuts', 'Condiments') group by category

-- Question 6
