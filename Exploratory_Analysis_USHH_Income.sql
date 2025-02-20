## Exploratory analysisi
SELECT State_Name, County, City, ALand, AWater FROM us_project.ushouseholdincome;

##Aggregating data
SELECT State_Name, SUM(ALand), SUM(AWater) FROM us_project.ushouseholdincome
GROUP BY State_Name
ORDER BY 2 DESC;

SELECT State_Name, SUM(ALand), SUM(AWater) FROM us_project.ushouseholdincome
GROUP BY State_Name
ORDER BY 3 DESC;

## Getting top ten states with the most land
SELECT State_Name, SUM(ALand), SUM(AWater) FROM us_project.ushouseholdincome
GROUP BY State_Name
ORDER BY 2 DESC
LIMIT 10;

SELECT State_Name, SUM(ALand), SUM(AWater) FROM us_project.ushouseholdincome
GROUP BY State_Name
ORDER BY 3 DESC
LIMIT 10;

SELECT *
FROM ushouseholdincome income
INNER JOIN ushouseholdincome_statistics statistics 
	on income.id = statistics.id; 
    
SELECT *
FROM ushouseholdincome income
RIGHT JOIN ushouseholdincome_statistics statistics 
	on income.id = statistics.id
WHERE income.id is NULL
order by statistics.State_Name; 

SELECT income.State_Name, county, `Primary`, 
Type, Mean, Median
FROM ushouseholdincome income
INNER JOIN ushouseholdincome_statistics statistics 
	on income.id = statistics.id
WHERE Mean <> 0; 

SELECT income.State_Name,  
ROUND(AVG(Mean),1), 
ROUND(AVG(Median), 1)
FROM ushouseholdincome income
INNER JOIN ushouseholdincome_statistics statistics 
	on income.id = statistics.id
WHERE Mean <> 0
GROUP BY income.State_Name
ORDER BY 2; 

SELECT income.State_Name,  
ROUND(AVG(Mean),1), 
ROUND(AVG(Median), 1)
FROM ushouseholdincome income
INNER JOIN ushouseholdincome_statistics statistics 
	on income.id = statistics.id
WHERE Mean <> 0
GROUP BY income.State_Name
ORDER BY 2 DESC 
LIMIT 5; 

SELECT income.State_Name,  
ROUND(AVG(Mean),1), 
ROUND(AVG(Median), 1)
FROM ushouseholdincome income
INNER JOIN ushouseholdincome_statistics statistics 
	on income.id = statistics.id
WHERE Mean <> 0
GROUP BY income.State_Name
ORDER BY 2 DESC 
LIMIT 10; 

SELECT income.State_Name,  
ROUND(AVG(Mean),1), 
ROUND(AVG(Median), 1)
FROM ushouseholdincome income
INNER JOIN ushouseholdincome_statistics statistics 
	on income.id = statistics.id
WHERE Mean <> 0
GROUP BY income.State_Name
ORDER BY 3 DESC 
LIMIT 10; 

SELECT income.State_Name,  
ROUND(AVG(Mean),1), 
ROUND(AVG(Median), 1)
FROM ushouseholdincome income
INNER JOIN ushouseholdincome_statistics statistics 
	on income.id = statistics.id
WHERE Mean <> 0
GROUP BY income.State_Name
ORDER BY 3 ASC 
LIMIT 10; 


SELECT Type,  
ROUND(AVG(Mean),1), 
ROUND(AVG(Median), 1)
FROM ushouseholdincome income
INNER JOIN ushouseholdincome_statistics statistics 
	on income.id = statistics.id
WHERE Mean <> 0
GROUP BY Type
ORDER BY 2 DESC
LIMIT 10; 

SELECT Type, count(Type),  
ROUND(AVG(Mean),1), 
ROUND(AVG(Median), 1)
FROM ushouseholdincome income
INNER JOIN ushouseholdincome_statistics statistics 
	on income.id = statistics.id
WHERE Mean <> 0
GROUP BY Type
ORDER BY 3 DESC
LIMIT 20; 

SELECT Type, count(Type),  
ROUND(AVG(Mean),1), 
ROUND(AVG(Median), 1)
FROM ushouseholdincome income
INNER JOIN ushouseholdincome_statistics statistics 
	on income.id = statistics.id
WHERE Mean <> 0
GROUP BY Type
ORDER BY 4 DESC
LIMIT 20;

SELECT * 
FROM ushouseholdincome income 
where Type = 'Community';

SELECT Type, count(Type),  
ROUND(AVG(Mean),1), 
ROUND(AVG(Median), 1)
FROM ushouseholdincome income

INNER JOIN ushouseholdincome_statistics statistics 
	on income.id = statistics.id
WHERE Mean <> 0
GROUP BY Type
HAVING count(Type) >100
ORDER BY 4 DESC
LIMIT 20;

SELECT income.State_Name, City,  
ROUND(AVG(Mean),1)
FROM ushouseholdincome income
INNER JOIN ushouseholdincome_statistics statistics 
	on income.id = statistics.id
##WHERE Mean <> 0
GROUP BY income.State_Name, City
ORDER BY ROUND(AVG(Mean),1) DESC;

