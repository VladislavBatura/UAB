create table department(
	id integer generated always as identity,
	name varchar(100) not null,
	primary key (id)
);

create table employee(
	id integer generated always as identity,
	department_id integer,
	chief_id integer,
	name varchar(100) not null,
	salary integer,
	
	primary key (id),
	constraint fk_department
		foreign key(department_id)
			references department(id),
	constraint fk_chief
		foreign key(chief_id)
			references employee(id)
);

insert into department (name) values
	('Разработка'),
	('Менеджмент'),
	('Логистика');

insert into employee (department_id, chief_id, name, salary) values
	((select d.id from department as d where d.name='Разработка'),
	 1,
	'Алексей',
	30000),
	((select d.id from department as d where d.name='Разработка'),
	 1,
	'Евгений',
	25000),
	((select d.id from department as d where d.name='Разработка'),
	 1,
	'Владислав',
	30000),
	((select d.id from department as d where d.name='Разработка'),
	 1,
	'Игорь',
	50000);

select e.name, d.name, e.salary
from (employee as e
	  join department as d on (e.department_id = d.id))
where e.salary > 
	(select em.salary 
	 from employee as em
	 	where (e.chief_id = em.id and e.department_id = em.department_id));
