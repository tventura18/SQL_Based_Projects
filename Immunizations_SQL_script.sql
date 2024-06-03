
/* Common table expressions*/
WITH active_patients AS 
(
	SELECT distinct patient
	FROM encounters AS e
	JOIN patients AS pat
	ON e.patient = pat.id
	WHERE start between '2020-01-01 00:00' AND '2022-12-31 23:59'
	AND pat.deathdate is null
	AND extract(month from age('2022-12-31', pat.birthdate)) >= 6
),

flu_shot_2022 AS
(
	SELECT patient, min(date) as earliest_flu_shot
	FROM immunizations
	WHERE code = '5302'
	AND date BETWEEN '2022-01-01 00:00' AND '2022-12-31 23:59'
	GROUP BY patient
)

SELECT 
	pat.birthdate, 
	pat.race, 
	pat.county,
	pat.id,
	pat.first,
	pat.last, 
	flu.earliest_flu_shot,
	flu.patient,
	CASE WHEN flu.patient IS NOT NULL THEN 1
	ELSE 0
	END AS flu_shot_2022
FROM patients as pat
LEFT JOIN flu_shot_2022 as flu
on pat.id = flu.patient
WHERE 1=1
AND pat.id in (select patient from active_patients)

