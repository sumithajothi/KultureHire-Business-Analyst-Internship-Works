SHOW TABLES;
SELECT * FROM careers;

# 1. What is the gender distribution of respondents from India?
select gender, count(*) as distribution
from careers
where country = 'India'
group by gender
order by distribution desc;

# 2.What percentage of respondents from India are interested in education abroad and sponsorship?
select 
(count(case when Higher_Education_Aspirations = 'Yes' then 1 end) * 100.0 / COUNT(*)) as percentage_interested
from careers
where country = 'India';

# 3.What are the 6 top influences on career aspirations for respondents in India?
select Career_Aspiration_Influence_Factors ,count(*) AS total
FROM Careers
WHERE Country = 'India'
GROUP BY Career_Aspiration_Influence_Factors
ORDER BY total DESC;

# 4.How do career aspiration influences vary by gender in India?
select  Career_Aspiration_Influence_Factors , gender,
COUNT(*) AS total
FROM careers
WHERE Country = 'India'
GROUP BY Career_Aspiration_Influence_Factors, gender;

# 5.What percentage of respondents are willing to work for a company for at least 3 years?
select
round(count(case when `3 Years of_Work_Tenturity` = 'Yes' then 1 end) * 100.0 / count(*),0) as percentage_willing_to_work
from careers
where country = 'India';

# 6.How many respondents prefer to work for socially impactful companies?
select count(*) as total
from careers
where country = 'All' and Work_For_Undefined_Mission_Company = 'Yes';

#7.How does the preference for socially impactful companies vary by gender?
select count(*) as total
from Careers
where country = 'All' and work_for_no_social_impact_company = 'No'

# 8.What is the distribution of minimum expected salary in the first three years among respondents?
select Min_3 Years_Expected_Salary,count(*) as count_of_values
from careers
where country = 'All'
group by Min_3 Years_Expected_Salary
order by Min_3 Years_Expected_Salary ;

#9.What is the expected minimum monthly salary in hand?
SELECT MIN(Min_Starting_Salary) AS Min_Starting_Salary,
 MAX(Min_Starting_Salary) AS Maximum_Monthly_Salary
FROM careers;

#10.What percentage of respondents prefer remote working?
select 
(count(case when Preferred_Work_Setup = 'Remote' then 1 end) * 100 / count(*)) as preferring_remote_percentage
from Careers
where country = 'India';

#11.What is the preferred number of daily work hours?
SELECT Daily_Working_Hours,COUNT(*) as count
from careers
group by Daily_Working_Hours;

#12.What are the common work frustrations among respondents?
select Work_Frustations,COUNT(*) as count
from careers 
group by Work_Frustations
order by count DESC;

#13.How does the need for work-life balance interventions vary by gender?
select gender,COUNT(*) as count
from careers 
where Work_For_Undefined_Mission_Company= 'Yes'
group by gender; 

#14.How many respondents are willing to work under an abusive manager?
select count(*) as count
from careers
where Work_For_AbusiveManager='Yes';

#15.What is the distribution of minimum expected salary after five years?
select Min_Salary_First_5_Years, count(*) as distribution
from careers
group by Min_Salary_First_5_Years;

#16.What are the remote working preferences by gender?
SELECT Gender, COUNT(*) AS total_respondents
FROM careers
WHERE Preferred_Work_Setup = 'Remote'
GROUP BY Gender
order by total_respondents;

#17.What are the top work frustrations for each gender?
select gender, Work_Frustations, COUNT(*) AS count
from careers
group by gender, Work_Frustations
order by gender, count desc;

#18.What factors boost work happiness and productivity for respondents?
select work_happiness, count(*) as total
from careers
group by work_happiness
order by total desc;

#19.What percentage of respondents need sponsorship for education abroad?
select 
    (count(case when Higher_Education_Aspirations = 'Yes' then 1 end) * 100.0 / count(*)) as percentage_needing_sponsorship
from careers
where country = 'India';