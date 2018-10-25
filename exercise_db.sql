-- Data Exercise 1
select * from patient where gender = ‘M’;
select (select count (id)  from patient where gender = ‘F’) as ‘Female Count’ , (select count (id) from patient where gender = ‘M’) as ‘Male Count’ ;

-- Data Exercise 2
select count (distinct patient_id) as ‘DERMATITIS patient count’ from encounter where id in (select encounter_id from encounter_diagnosis where diagnosis_id = (select id from diagnosis where name = ‘DERMATITIS’));


-- Data Exercise 3
select * from patient where id in (select distinct patient_id from encounter where id in (select encounter_id from lab_result where cd4 < 500)) order by mrn; 

-- Data Exercise 4
select count (id) as ‘Female patient  count (age above 30)’ from patient where (gender = ‘F’ and birthdate < (select date(‘now’, ‘-30 years’)));


-- Bonus Data Exercise
/*
In the database, user email and password are stored directly inside the database as varcher(30) 
*/