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
1. Security issue with user information
In the database, user email and password are stored directly inside the database as varchar(30), this brings in a potential security issue. Especially, if later on, we want to share this database with the larger team or push to open source, the user information may get exposed. I would recommend having the framework to handle user authentication and only store token inside the database. 
2. Change field type to restrict input
Some columns can be set to a different data type to restrict data input. In table hiv_details, column 'stage_adult' for example; if the input cases would only be "WHO STAGE # ADULT"(# stands for an integer here) or null, we could store just the integer in this column. Saving "WHO STAGE 4 ADULT" as varchar(30) is queryable; however the column itself does not have any restriction to valid the data input. By storing it as an integer, it supports the basic functions, but also eliminate some potential errors. This change may also help with database storage efficiency.
3. Normalize data entries by mapping to standard ID
In the database vaccine, diagnosis, drug have synonyms; it is crucial to track all the synonyms especially when referencing other resources. To enhance the normalization of those entities, we can try to find a standard ID (accepted by the community) and include that into the database. For example, drugs have National Drug Code (NDC) used in US or Drug Identification Number (DIN) used in Canada to uniquely identify medications. We can include 'NDC' column in the drug table to store this information. This change will reduce the ambiguous when referencing to a specific drug. 
*/
