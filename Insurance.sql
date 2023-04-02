
--1.What is the average number of claims and claim amount made by policyholders?

SELECT 
	 AVG(claim_freq) as average_claims
	,AVG(claim_amt) as average_claim_amount
FROM 
	Car_insurance 


--2.How does the number of claims made by policyholders differ by coverage zone and car model use?

SELECT
	 coverage_zone
	,car_model
	,SUM(claim_freq) AS total_claims
FROM
	Car_insurance
GROUP BY
	 coverage_zone
	,car_model
ORDER BY
	total_claims DESC;

--3.What is the distribution of policyholders by age group, gender, and marital status?


SELECT 
    CASE 
        WHEN DATEDIFF(YEAR, birthdate, GETDATE()) BETWEEN 18 AND 29 THEN '18-29'
        WHEN DATEDIFF(YEAR, birthdate, GETDATE()) BETWEEN 30 AND 39 THEN '30-39'
        WHEN DATEDIFF(YEAR, birthdate, GETDATE()) BETWEEN 40 AND 49 THEN '40-49'
        WHEN DATEDIFF(YEAR, birthdate, GETDATE()) BETWEEN 50 AND 59 THEN '50-59'
        WHEN DATEDIFF(YEAR, birthdate, GETDATE()) >= 60 THEN '60+'
        ELSE 'Under 18'
    END AS age_group,
    gender,
    marital_status,
    COUNT(*) AS policyholder_count
FROM 
    Car_insurance
GROUP BY 
    CASE 
        WHEN DATEDIFF(YEAR, birthdate, GETDATE()) BETWEEN 18 AND 29 THEN '18-29'
        WHEN DATEDIFF(YEAR, birthdate, GETDATE()) BETWEEN 30 AND 39 THEN '30-39'
        WHEN DATEDIFF(YEAR, birthdate, GETDATE()) BETWEEN 40 AND 49 THEN '40-49'
        WHEN DATEDIFF(YEAR, birthdate, GETDATE()) BETWEEN 50 AND 59 THEN '50-59'
        WHEN DATEDIFF(YEAR, birthdate, GETDATE()) >= 60 THEN '60+'
        ELSE 'Under 18'
    END,
    gender,
    marital_status
ORDER BY 
    age_group, 
    gender, 
    marital_status


--4.What is the average household income for policyholders in each coverage zone?

SELECT
	coverage_zone
   ,AVG(household_income) as Average_income
FROM 
	Car_insurance
GROUP BY
	coverage_zone;


--5.How does the average claim amount made by policyholders differ by car make and model?

SELECT
	 car_make
    ,car_model
	,CAST(AVG(claim_amt)AS INT) AS Average_claim_amount
FROM
	Car_insurance
GROUP BY
	car_make
    ,car_model;


--6.What is the most common car make, model, and color among policyholders?

SELECT 
    car_make, 
    car_model, 
    car_color,
    COUNT(*) AS count
FROM 
    Car_insurance
GROUP BY 
    car_make, 
    car_model, 
    car_color
ORDER BY 
    COUNT(*) DESC

--7.Are there any correlations between the number of kids driving and the number of claims made by policyholders?

SELECT 
	kids_driving
   ,SUM(claim_freq) AS claims
FROM
	Car_insurance
GROUP BY
	kids_driving
ORDER BY
	claims DESC;

--8.Which coverage zone has the higest calims frequency?

SELECT
	coverage_zone
   ,SUM(claim_freq) AS claims
FROM
	Car_insurance
GROUP BY
	coverage_zone
ORDER BY
	claims DESC;

--9.What is the Average Household Income by Marital Status?

SELECT
	 Marital_Status
	,AVG(household_income) Income
FROM 
	Car_insurance
GROUP BY
	 Marital_Status;


--10.Which Car Make and Model has the higest Claim Amount?

SELECT
	car_make
   ,car_model
   ,claim_amt
FROM
	Car_insurance

ORDER BY
	claim_amt DESC;


--11.What is the average income and average claim amount of policy holder based on ther Education Level ?

SELECT
	education
   ,CAST(AVG(household_income) AS INT) AS Income
   ,CAST(AVG(claim_amt) AS INT) AS Claim_Amount
FROM
	Car_insurance
GROUP BY
	Education;




