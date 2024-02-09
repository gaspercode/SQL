#This is a query to count the total of each Pokemon type.
#Pokemon can be up to 2 types and there are 2 columns for this (Type1 and Type2).
#Specified that if a Type is Null, it is not counted.

SELECT type,
       Count(*) AS TotalCount
FROM   (SELECT type1 AS Type
        FROM   pokemon
        UNION ALL
        SELECT type2 AS Type
        FROM   pokemon
        WHERE  type2 IS NOT NULL) AS Types
GROUP  BY type
ORDER  BY totalcount DESC;

#Using the above, we can also do things like find the average stats of each type:
    
SELECT type,
       Avg(pokemon.total) AS AverageTotal
FROM   (SELECT type1 AS Type,
               total
        FROM   pokemon
        UNION ALL
        SELECT type2 AS Type,
               total
        FROM   pokemon
        WHERE  type2 IS NOT NULL) AS Types
       JOIN pokemon
         ON Types.type = pokemon.type1
             OR Types.type = pokemon.type2
GROUP  BY type
ORDER  BY averagetotal DESC; 
