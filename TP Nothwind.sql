-- Question 1
select count(*) from employees where city = 'Seattle';

-- Question 2
select last_name, first_name, email_address from employees as e inner join employee_privileges as ep on e.id = ep.employee_id 
inner join privileges as p on ep.privilege_id = p.id  where privilege_name = 'Purchase Approvals';

-- Question 3
select product_code, product_name, quantity_per_unit from products where category = 'Condiments';

-- Question 4