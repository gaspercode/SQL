#Working with a dataset of Pokemon.

#This query finds the Pokemon with the lowest Attack stat.
  
SELECT name,
       Min(attack) AS Weakest
FROM   pokemon
GROUP  BY name
ORDER  BY weakest
LIMIT  10; 


#This query finds the Pokemon with the highest Speed stat, while filtering out special Pokemon forms.

SELECT name,
       Max(speed) AS Fastest
FROM   pokemon
WHERE  form IS NULL
GROUP  BY name
ORDER  BY fastest DESC
LIMIT  10; 
