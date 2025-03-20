-- 1

SELECT * FROM dishes
WHERE price < 20

-- 2 

SELECT * FROM restaurants
WHERE cuisine_type IN('fran', 'italienne')

-- 3 

SELECT * FROM dishes d
JOIN ingredients i ON i.dish_id = d.id
WHERE  d.id = 1

-- 4 

SELECT c.`name`, r.name FROM chefs c 
JOIN restaurants r ON c.restaurant_id = r.id

-- 5

SELECT c.name, COUNT(d.id) 
FROM chefs c
JOIN dishes d ON c.id = d.chef_id
GROUP BY c.id;


-- 6 

SELECT c.name, COUNT(d.id) 
FROM chefs c
JOIN dishes d ON c.id = d.chef_id
GROUP BY c.id
HAVING COUNT(d.id) > 1

-- 7 

SELECT COUNT(*) as que_un_plat
FROM (
    SELECT chef_id
    from dishes
    GROUP by chef_id
    HAVING count(*) = 1
) as pas_productif

-- 8 

SELECT r.cuisine_type, COUNT(d.id) AS dish_count
FROM chefs c
JOIN restaurants r ON c.restaurant_id = r.id
JOIN dishes d ON d.chef_id = c.id
GROUP BY r.cuisine_type;

-- 9 

SELECT r.cuisine_type, AVG(d.price) AS moy_price
FROM chefs c
JOIN restaurants r ON c.restaurant_id = r.id
JOIN dishes d ON d.chef_id = c.id
GROUP BY r.cuisine_type;


-- 10 

SELECT c.id, c.name, AVG(d.price) AS moy_price
FROM chefs c
JOIN dishes d ON c.id = d.chef_id
GROUP BY c.id, c.name, c.restaurant_id
HAVING COUNT(d.id) > 2;



