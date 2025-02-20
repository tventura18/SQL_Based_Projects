#Date cleaning for World Life Expectancy

SET SQL_SAFE_UPDATES = 0;
select * 
from world_life_expectancy;

SELECT count(*)
from world_life_expectancy;

SELECT *
FROM(
	SELECT 
	Row_ID,
	CONCAT(Country, Year),
	ROW_NUMBER() OVER (PARTITION BY CONCAT(Country, Year) ORDER BY CONCAT(Country, Year)) AS ROW_NUM
	FROM world_life_expectancy
) AS ROW_TABLE
WHERE ROW_NUM > 1;

DELETE FROM world_life_expectancy
WHERE 
Row_ID IN 
(
	SELECT Row_ID
	FROM(
		SELECT 
		Row_ID,
		CONCAT(Country, Year),
		ROW_NUMBER() OVER (PARTITION BY CONCAT(Country, Year) ORDER BY CONCAT(Country, Year)) AS ROW_NUM
	FROM world_life_expectancy
	) AS ROW_TABLE
	WHERE ROW_NUM > 1
);

select * 
from world_life_expectancy
where Status = '';

SELECT distinct Status
FROM world_life_expectancy
where Status <> '';

SELECT distinct Country
FROM world_life_expectancy
where Status = 'Developing';

UPDATE world_life_expectancy
SET Status = 'Developing'
WHERE Country in (
		SELECT distinct (Country)
		FROM world_life_expectancy
		where Status = 'Developing'
);
SELECT 
wfe_1.Country, 
wfe_1.Status,
wfe_2.Country,
wfe_2.Status
FROM world_life_expectancy as wfe_1
inner join world_life_expectancy wfe_2
    on wfe_1.Country = wfe_2.Country
where wfe_1.Status = ''
and wfe_2.Status <> ''; 

UPDATE
world_life_expectancy wfe_1
join world_life_expectancy wfe_2
	on wfe_1.Country = wfe_2.Country
SET wfe_1.Status = 'Developing'
where wfe_1.Status = ''
AND wfe_2.Status <> ''
AND wfe_2.Status = 'Developing';

UPDATE
world_life_expectancy wfe_1
join world_life_expectancy wfe_2
	on wfe_1.Country = wfe_2.Country
SET wfe_1.Status = 'Developed'
where wfe_1.Status = ''
AND wfe_2.Status <> ''
AND wfe_2.Status = 'Developed';

SELECT
	*
FROM world_life_expectancy
WHERE Status = '' 
or Status IS NULL;

SELECT
	*
FROM world_life_expectancy
WHERE `Life expectancy` = '';
## returns 2 values- going to take the average of the previous year and subsequent year for blank or null values

SELECT
	Country,
    Year,
    `Life expectancy`
FROM world_life_expectancy
##WHERE `Life expectancy` = ''
;

SELECT
	t1.Country,
    t1.Year,
    t1.`Life expectancy`,
    ROUND((t2.`Life expectancy` + t3.`Life expectancy`)/2, 1),
    t2.Country,
    t2.Year,
    t2.`Life expectancy`,
    t3.Country,
    t3.Year,
    t3.`Life expectancy`
FROM world_life_expectancy t1
INNER JOIN world_life_expectancy t2
	on t1.Country = t2.Country 
	and t1.Year = t2.Year -1
INNER JOIN world_life_expectancy t3
	on t1.Country = t3.Country
	AND t1.Year = t3.Year + 1
WHERE t1.`Life expectancy` = ''
;

UPDATE world_life_expectancy t1
INNER JOIN world_life_expectancy t2
	on t1.Country = t2.Country 
	and t1.Year = t2.Year -1
INNER JOIN world_life_expectancy t3
	on t1.Country = t3.Country
	AND t1.Year = t3.Year + 1
SET t1.`Life expectancy` =  ROUND((t2.`Life expectancy` + t3.`Life expectancy`)/2, 1)
WHERE t1.`Life expectancy` = ''
;

SELECT
	Country,
    Year,
    `Life expectancy`
FROM world_life_expectancy
#WHERE `Life expectancy` = ''
;

