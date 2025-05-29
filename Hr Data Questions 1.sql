
# QUESTIONS

##1. What is the gender breakdown of employees in the company?
 select gender, count(*) AS count
 from hr
 where age>=18  and termdate is Null
 group by gender;
 
 ##2. What is the race/ethnicity breakdown of employees in the company?
 select race, count(*) as count
 from hr
 where age>=18 and termdate is null
 group by race
 order by count(*)desc;
 
 ## What is the age distribution of employees in the company?
 select
	min(age)as Youngest,
    max(age) As Oldest
    from Hr
    where age >=18  and termdate is Null;
    
    select
		Case 
			when age >=18 and age <=27 then '18-27'
            when age >=27 and age <=36 then '27-36'
            when age >=37 and age <=46 then '27-46'
            when age >=47 and age <=56 then '47-56'
            when age >=56 and age <=66 then '56-66'
            Else '67+'
            end as Age_group,
            count(*) as count 
            from hr
            where age>=18 and termdate is null
            group by age_group
            order by age_group; 
      
          select
		Case 
			when age >=18 and age <=27 then '18-27'
            when age >=27 and age <=36 then '27-36'
            when age >=37 and age <=46 then '27-46'
            when age >=47 and age <=56 then '47-56'
            when age >=56 and age <=66 then '56-66'
            Else '67+'
            end as Age_group, gender,
            count(*) as count
            from hr
            where age>=18 and termdate is null
            group by age_group, gender
            order by age_group, gender; 
            
	##4. How many employees work at headquaters versus remote locations?
	select location, count(*) as count
    From hr 
    where age>=18 and termdate is null
    group by location;
    
    ##5. what is  the average length of employment for employees who have been terminated?
    
    select 
		 round(avg(datediff(termdate, hire_date))/365,0) as avg_length_employment
        from hr
        where termdate<=curdate() and termdate is not null and age>=18;
        
##6. how does the gender distribution vary across department and job titles?
Select department, gender, count(*) as count
from hr
  where age>=18 and termdate is null
  group by department, gender
  order by department;
  
  ##7. what is the distribution of job titles across the company?
  Select jobtitle, count(*) as count
  from hr
    where age>=18 and termdate is null
    group by jobtitle
    order by jobtitle desc;
    
    ## 8. Which department has the highest turnover rate?
    select department,
		total_count,
        terminated_count,
        terminated_count/total_count as termination_rate
        from (
        select department,
        count(*) as total_count,
        sum(case when termdate is not null and termdate <= curdate() then 1 else 0 end) as terminated_count
        from hr
        where age >=18
        group by department
        ) as SubQuery
        order by Termination_rate desc;
        
##9. What is the distribution of employees across locations by city and state?
select location_state, count(*) as count
from hr
where age >=18 and termdate is null
group by Location_state
order by count desc;

##10. How has the compeny's employee count changed over time based on hire and term dates?
select
	year,
    hires,
    terminations,
    hires-terminations as net_change,
  round((hires-termination)/hires * 100,2) as net_change_percent
  from(
	select year(hire_date) as year,
    count(*) as hires,
    sum(case when termdate is not null and termdate<=curdate() then 1 else 0 end) as Terminations
    from hr
    where age>=18
    group by(hire_date)
    ) as subquery
    order by year Asc;
    
    SELECT 
  year,
  hires,
  terminations,
  hires - terminations AS net_change,
  ROUND((hires - terminations) / hires * 100, 2) AS net_change_percent
FROM (
  SELECT 
    YEAR(hire_date) AS year,
    COUNT(*) AS hires,
    SUM(CASE 
          WHEN termdate IS NOT NULL AND termdate <= CURDATE() THEN 1 
          ELSE 0 
        END) AS terminations
  FROM hr
  WHERE age >= 18
  GROUP BY YEAR(hire_date)
) AS subquery
ORDER BY year ASC;

##11. What is the tenure distribution for each department?
select department, round(avg(datediff(termdate, hire_date)/365),0) as avg_tenure
from hr
where termdate<= curdate() and termdate is not null and age>=18
group by department;
        

            