create database Projects;

use	Projects;

select *
from hr;

alter table hr
change column ï»¿id emp_id varchar(20)Null;

select *
from hr;

describe Hr;

select birthdate from hr;

set sql_safe_updates=0;

Update hr
set birthdate = Case
	when birthdate like '%/%' then date_format(str_to_date(birthdate, '%m/%d/%y'), '%Y-%m-%d')
    when birthdate like '%-%' then date_format(str_to_date(birthdate, '%m-%d-%y'), '%Y-%m-%d')
    else null
    end;
    
    UPDATE Hr
    SET birthdate =CASE
		when birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
        when birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
        ELSE null
        END;
        
    Select birthdate
    from Hr;
    alter table hr
    modify column birthdate date;
    Select birthdate from hr;
    
    UPDATE Hr
    SET hire_date =CASE
		when hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
        when hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
        ELSE null
        END;
        
	ALTER TABLE hr
    MODIFY COLUMN hire_date DATE;
        
        select hire_date from hr;
        
        Update hr
        set termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
        where termdate is not Null and termdate != '';
        
        alter table hr
        modify column termdate date;
        ALTER TABLE Hr
        MODIFY COLUMN termdate DATE;
        
        
        select termdate from hr;
        
			UPDATE hr
        SET termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
        WHERE termdate IS NOT NULL AND  termdate != '';
    
    SELECT termdate from hr;
    
    ALTER TABLE hr
    MODIFY COLUMN termdate DATE;
    
    UPDATE HR
    set termdate= '0000-00-00'
    where termdate ='';
    
		UPDATE hr
        SET termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
        WHERE termdate IS NOT NULL AND  termdate != '';
        
select termdate from hr;

alter table hr
modify column termdate date;

	UPDATE hr
        SET termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
        WHERE termdate IS NOT NULL AND  termdate = '';
        
select termdate from hr;

alter table hr
modify column termdate date;    

update hr
set termdate= date(str_to_date(termdate, '0000-00-00'))  
where termdate = '0000-00-00';  

UPDATE hr
set termdate=NULL 
WHERE termdate='0000-00-00' or termdate ='';

alter table hr
modify column termdate date;

describe hr;

Select * from hr;

ALTER table hr add column age int;
select * from hr;

update hr
set age = timestampdiff(year, birthdate, curdate());

Select 
 Min(age) as youngest,
 max(age) as Oldest
 from hr;
 
 select count(*) from hr where age<18;


