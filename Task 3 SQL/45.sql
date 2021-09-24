SELECT ship as name 
FROM Outcomes 
WHERE LEN(ship) - LEN(REPLACE(ship, ' ', ''))+1 >= 3
UNION 
SELECT name 
FROM Ships
WHERE LEN(name) - LEN(REPLACE(name, ' ', ''))+1 >= 3

/* 
 * OR USE WHERE name LIKE '% % %'
 */