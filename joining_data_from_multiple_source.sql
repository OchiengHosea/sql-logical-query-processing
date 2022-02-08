-- Joining multiple data sources
SELECT *
	FROM Animals AS A
	INNER JOIN Adoptions AS AD
	On AD.Name = A.Name AND AD.Species = A.Species
	INNER JOIN Persons AS P
	ON P.Email = AD.Adopter_Email;


SELECT *
	FROM Animals AS A
	LEFT OUTER JOIN Adoptions AS AD -- designate Animals as a reserv table to return animals that were never adopted
	On AD.Name = A.Name AND AD.Species = A.Species
	INNER JOIN Persons AS P
	ON P.Email = AD.Adopter_Email;

-- This still returns 70 rows instead of 100.. ??
-- The first result of left outer join did indeed return 100 rows but the the last inner join has a
-- qulification that relies on adoption which uts out animals that were not adopted
-- To overcome this, most people do another LEFT OUTER JOIN

SELECT *
	FROM Animals AS A
	LEFT OUTER JOIN Adoptions AS AD -- designate Animals as a reserv table to return animals that were never adopted
	On AD.Name = A.Name AND AD.Species = A.Species
	LEFT OUTER JOIN Persons AS P
	ON P.Email = AD.Adopter_Email;

-- But a better solution would be to rearrange the JOIN order to be logically correct
SELECT *
	FROM Animals AS A
	LEFT OUTER JOIN 
	Adoptions AS AD
	INNER JOIN Persons AS P
	ON P.Email = AD.Adopter_Email
	ON AD.Name = A.Name AND AD.Species = A.Species