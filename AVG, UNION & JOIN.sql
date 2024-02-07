#This is a query to count the total of each Pokemon type.
#Pokemon can be up to 2 types and there are 2 columns for this (Type1 and Type2).
#Specified that if a Type is Null, it is not counted.

SELECT 
    Type, COUNT(*) AS TotalCount
FROM
    (SELECT 
        Type1 AS Type
    FROM
        pokemon UNION ALL SELECT 
        Type2 AS Type
    FROM
        pokemon
    WHERE
        Type2 IS NOT NULL) AS Types
GROUP BY Type
ORDER BY TotalCount DESC;


SELECT 
    Type, AVG(pokemon.Total) AS AverageTotal
FROM
    (SELECT 
        Type1 AS Type, Total
    FROM
        pokemon UNION ALL SELECT 
        Type2 AS Type, Total
    FROM
        pokemon
    WHERE
        Type2 IS NOT NULL) AS Types
        JOIN
    pokemon ON Types.Type = pokemon.Type1
        OR Types.Type = pokemon.Type2
GROUP BY Type
ORDER BY AverageTotal DESC;
