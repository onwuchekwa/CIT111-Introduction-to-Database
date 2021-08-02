USE world;

Select * from country;

SELECT 
	Name, 
    Population
FROM country
WHERE Population < 5000000
ORDER BY Population DESC;

Select * from countrylanguage;

SELECT 
	DISTINCT Language
FROM countrylanguage
ORDER BY Language;

Select * from country;

SELECT 
	Continent,
    COUNT(Code) AS NumberOfCountries
FROM country
GROUP BY Continent
ORDER BY Continent;

Select * from country;
Select * from city 
WHERE CountryCode = 'NGA';

SELECT
	ct.Name AS Country,
    ct.Population AS National_Population,
    SUM(cy.Population) AS Urban_Population
FROM country ct
	JOIN city cy
		ON ct.Code = cy.CountryCode
WHERE ct.Name = 'Norway'
GROUP BY Country, National_Population
ORDER BY Country ASC, National_Population ASC;
    