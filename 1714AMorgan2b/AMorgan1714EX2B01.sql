-- Amanda Morgan
-- Exercise 2b: Summary queries
-- PropertyManager db
--2B.1) BUILDING, COUNT ALL BUILDINGS
SELECT        COUNT(*) AS [Count Buildings]
FROM            Building
--2B.2)	Building, Count, Buildings in Winona
SELECT        COUNT(*) AS [Count Buildings Winona]
FROM            Building
GROUP BY City
HAVING        (City = N'Winona')
-- 2B.3) Apartment, Average rent of all apartments
SELECT        AVG(Rent) AS [Avg Rent]
FROM            Apartment
-- 2B.4) Apartment, Total rent, Apartments in building 1
SELECT        SUM(Rent) AS [Total Rent BLDNG 1]
FROM            Apartment
GROUP BY BuildingID
HAVING        (BuildingID = 1)
-- 2B.5) Apartment, Cheapest rent, Building 2
SELECT        MIN(Rent) AS [Min Rent BLDNG 2]
FROM            Apartment
GROUP BY BuildingID
HAVING        (BuildingID = 2)
-- 2B.6) Apartment, Smallest size, avg size, largest size, Building 1
SELECT        MIN(SquareFeet) AS [BLDNG 1 Min Sq Ft], AVG(SquareFeet) AS [BLDNG 1 Avg Sq Ft], MAX(SquareFeet) AS [BLDNG 1 Max Sq Ft]
FROM            Apartment
GROUP BY BuildingID
HAVING        (BuildingID = 1)
-- 2B.7) LineItem, Cheapest price, Garage
SELECT        MIN(Amount) AS [Min Garage Amount]
FROM            LineItem
GROUP BY Description
HAVING        (Description = N'Garage')
-- 2B.8) LineItem, Total amount billed, Gas
SELECT        SUM(Amount) AS [Total Billed Gas]
FROM            LineItem
GROUP BY Description
HAVING        (Description = N'Gas')
-- 2B.9) LineItem, Total rent, October
SELECT        SUM(Amount) AS [Total October Rent]
FROM            LineItem
GROUP BY Description
HAVING        (Description = N'Rent, October 2018')