-- Write a query that generates all combinations of all staff roles and staff member

/*
Every JOIN begins with a cartesian product
In a cartesian product, each row from one set is paired with each row from the other set
the resultset consists of both columns from both sources

INNER and OUTER JOINS are called qualified joins, the qualification predicate are specified using a predicate
INNER JOIN selects only the rows that meet the predicate
OUTER JOIN designate one or both source sets as reserved. When the matching completes, the reserved set gets added to the qualified 
results their counterparts set to null 

*/
SELECT * 
	FROM Staff
		CROSS JOIN
		Staff_Roles;

SELECT * 
	FROM Staff
		INNER JOIN
		Staff_Roles
		ON 1=1; -- This evaluated to true for all rows

-- NOTE: Every join begins with cartesian product
-- prepare adoption report
SELECT * 
	FROM Animals AS A
	CROSS JOIN Adoptions AS AD;

SELECT AD.*, A.Implant_Chip_ID, A.Breed -- Selects all columns from Adoption, and specific columns from Animals
	FROM Animals AS A
	INNER JOIN Adoptions AS AD -- Selects all animals that were adopted only
	ON AD.Name = A.Name 
	AND AD.Species = A.Species;

SELECT AD.*, A.Implant_Chip_ID, A.Breed -- Selects all columns from Adoption, and specific columns from Animals
	FROM Animals AS A
	LEFT OUTER JOIN Adoptions AS AD -- Selects All Animals that were adopted, and the ones that were not will be added to the adoption table
	ON AD.Name = A.Name 
	AND AD.Species = A.Species;
