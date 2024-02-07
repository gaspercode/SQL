#Working with a dataset of Pokemon.

#This query finds the Pokemon with the lowest Attack stat.

SELECT name, MIN(Attack) AS Weakest
FROM pokemon
GROUP BY Name
ORDER BY Weakest LIMIT 10;


#This query finds the Pokemon with the highest Speed stat, while filtering out special Pokemon forms.

SELECT name, MAX(Speed) AS Fastest
FROM pokemon
WHERE Form IS NULL
GROUP BY Name
ORDER BY Fastest DESC LIMIT 10;