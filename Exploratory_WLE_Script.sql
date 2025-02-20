#Exploratory World Life Expectancy 
SELECT Country,
MAX(`Life expectancy`),
MIN(`Life expectancy`),
ROUND(MAX(`Life expectancy`)-MIN(`Life expectancy`), 1) as Life_Increase_15_Years
FROM world_life_expectancy
GROUP BY Country
HAVING MAX(`Life expectancy`)<> 0
AND MIN(`Life expectancy`) <> 0
ORDER BY Life_Increase_15_Years DESC
;

SELECT Year, 
ROUND(AVG(`Life expectancy`),1)
FROM world_life_expectancy
WHERE `Life expectancy` <> 0
GROUP BY Year
ORDER BY Year
;

SELECT
	Country,
    ROUND(AVG(`Life expectancy`), 1) AS Average_Life_Expectancy,
    ROUND(AVG(GDP), 1) AS Average_GDP
FROM world_life_expectancy
GROUP BY Country
HAVING Average_Life_Expectancy > 0
AND Average_GDP > 0
#ORDER BY Average_Life_Expectancy ASC
##ORDER BY Average_GDP ASC
ORDER BY Average_GDP DESC
;
 # Checking for correlation between GDP and Life Expectancy
SELECT
	SUM(CASE WHEN GDP >= 1500 THEN 1 ELSE 0 END) AS Higher_GDP,
    AVG(CASE WHEN GDP >= 1500 THEN `Life expectancy` ELSE NULL END) AS High_Life_expectancy,
    SUM(CASE WHEN GDP <= 1500 THEN 1 ELSE 0 END) AS Lower_GDP,
    AVG(CASE WHEN GDP <= 1500 THEN `Life expectancy` ELSE NULL END) AS Low_Life_expectancy
FROM world_life_expectancy
;


SELECT *
FROM world_life_expectancy;

SELECT 
	Status,
    ROUND(AVG(`Life expectancy`), 1) as avg_life_expectancy
FROM world_life_expectancy
GROUP BY Status;

SELECT 
	Status,
    COUNT(DISTINCT Country) AS Total_countries,
    ROUND(AVG(`Life expectancy`), 1) as avg_life_expectancy
FROM world_life_expectancy
GROUP BY Status;

SELECT
	Country,
    ROUND(AVG(`Life expectancy`), 1) AS Average_Life_Expectancy,
    ROUND(AVG(BMI), 1) AS Average_BMI
FROM world_life_expectancy
GROUP BY Country
HAVING Average_Life_Expectancy > 0
AND Average_BMI > 0
#ORDER BY Average_Life_Expectancy ASC
##ORDER BY Average_GDP ASC
#ORDER BY Average_BMI DESC
ORDER BY Average_BMI ASC
;

SELECT
	Country,
    `Life expectancy`,
    `Adult Mortality`,
    SUM(`Adult Mortality`) OVER(PARTITION BY Country ORDER BY Year) AS ROLLING_TOTAL
FROM world_life_expectancy
;

SELECT *
FROM world_life_expectancy;
#2938 rows returned

SELECT MIN(`infant deaths`),
MAX(`infant deaths`),
Country, Year
FROM world_life_expectancy
GROUP BY Country, Year
;

SELECT Country, 
Year,
`infant deaths`
FROM world_life_expectancy
Where Country = 'Albania';

SELECT Country, 
Year,
`infant deaths`
FROM world_life_expectancy
Where `infant deaths` = 0
;

SELECT Country, 
Year
FROM world_life_expectancy
WHERE `infant deaths` = 0
;

SELECT DISTINCT Year
FROM world_life_expectancy;
#Years 2007-2022

SELECT Country,
Year, 
`infant deaths`,
`under-five deaths`
FROM world_life_expectancy
WHERE `infant deaths` = 0
;
#NOTHING WAS RETURNED

SELECT * 
FROM world_life_expectancy
;

SELECT Country, 
Year, 
`Life expectancy`,
`percentage expenditure` 
FROM world_life_expectancy
WHERE `percentage expenditure` IS NULL 
;
## NOTHING WAS RETURNED

SELECT COUNT(*)
FROM world_life_expectancy
;
##2938 total records from 2008-2022

SELECT COUNT(*)
FROM world_life_expectancy
WHERE `infant deaths` = 0
;
#848 records

SELECT COUNT(DISTINCT Year)
FROM world_life_expectancy
WHERE `infant deaths` = 0
; 
# 16 years

SELECT COUNT(DISTINCT Country)
FROM world_life_expectancy;
## 193 Countries

SELECT COUNT(distinct Country)
FROM world_life_expectancy
WHERE `infant deaths` = 0
; 
#69 countries

SELECT Country, 
#COUNT(Country)
COUNT(`infant deaths`)
FROM world_life_expectancy
WHERE `infant deaths` = 0
group by Country
; 
#73 countries

SELECT Country,
COUNT(`infant deaths`)
FROM world_life_expectancy
WHERE `infant deaths` = 0
GROUP BY COUNTRY
HAVING COUNT(Country) = 16
;
#Returns 72


