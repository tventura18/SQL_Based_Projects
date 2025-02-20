SELECT *
FROM ushouseholdincome;

ALTER TABLE us_project.ushouseholdincome_statistics 
RENAME COLUMN `ï»¿id` TO `id`;

SELECT * 
FROM ushouseholdincome_statistics;

SELECT COUNT(id)
FROM ushouseholdincome;

##cleaning
SELECT COUNT(id)
FROM ushouseholdincome_statistics;

## Looking for duplicate records
SELECT id, COUNT(id)
FROM ushouseholdincome
GROUP BY id
HAVING COUNT(*)> 1;

SELECT *
FROM (
	SELECT row_id, 
	id,
	ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) row_num
	FROM ushouseholdincome) duplicates
WHERE row_num > 1;

## removing duplicates
DELETE FROM ushouseholdincome
WHERE row_id in (
	SELECT row_id
	FROM (
		SELECT row_id, 
		id,
		ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) row_num
	FROM ushouseholdincome) duplicates
WHERE row_num > 1);

##checking for duplicates
SELECT id, COUNT(id)
FROM ushouseholdincome_statistics
GROUP BY id
HAVING COUNT(*)> 1;

#Fixing Typos
SELECT distinct State_Name, COUNT(State_Name)
FROM ushouseholdincome_statistics
GROUP BY State_Name;

UPDATE us_project.ushouseholdincome_statistics
SET State_Name = 'Alabama'
WHERE State_Name = 'alabama';

SELECT distinct State_Name, COUNT(State_Name)
FROM ushouseholdincome
GROUP BY State_Name;

UPDATE us_project.ushouseholdincome
SET State_Name = 'Georgia'
WHERE State_Name = 'georia';

UPDATE us_project.ushouseholdincome
SET State_Name = 'Alabama'
WHERE State_Name = 'alabama';

SELECT DISTINCT State_ab
FROM ushouseholdincome;

SELECT *
FROM ushouseholdincome;

SELECT * 
FROM ushouseholdincome
where Place = '';

SELECT * 
FROM ushouseholdincome
where County = 'Autauga County'
AND City = 'Vinemont';

UPDATE ushouseholdincome
SET Place = 'Autaugaville'
WHERE County = 'Autauga County'
AND City = 'Vinemont'; 

SELECT * 
FROM ushouseholdincome
where City = 'Deatsville';

SELECT Type,
count(type)
FROM ushouseholdincome
group by Type
ORDER BY 1;


UPDATE ushouseholdincome
SET Type = 'Borough'
WHERE Type = 'Boroughs'
; 

SELECT DISTINCT Awater
FROM ushouseholdincome
WHERE Awater in (0, null, '')
;

SELECT Awater, ALand
FROM ushouseholdincome
WHERE Awater in (0, null, '')
;

SELECT ALand, Awater
FROM ushouseholdincome
WHERE Aland in (0, null, '')
;

