SELECT 
    deliverer_id AS dostavljac_id,
    first_name AS ime,
    last_name AS prezime,
    phone_number AS broj_telefona
FROM
    deliverer;

SELECT 
    restaurant.name AS restorani
FROM
    restaurant
        JOIN
    menu ON menu.restaurant_id = restaurant.restaurant_id
        JOIN
    menu_type ON menu_type.menu_type_id = menu.menu_type_id
WHERE
    menu_type.name LIKE '%rostilj%';
    
SELECT 
    meal.name AS ime,
    meal.description AS opis,
    meal.price AS cijena,
    menu.name AS jelovnik
FROM
    meal
        JOIN
    menu ON menu.menu_id = meal.menu_id
WHERE
    menu.restaurant_id = 2
ORDER BY menu.menu_type_id , meal.price;

SELECT 
    meal.name AS jelo,
    order_meal.quantity,
    quantity * meal.price AS cijena
FROM
    order_meal
        JOIN
    orders ON orders.order_id = order_meal.order_id
        JOIN
    meal ON meal.meal_id = order_meal.meal_id
WHERE
    orders.order_id = 1;
    
SELECT restaurant.name AS restoran, restaurant.location AS adresa
FROM restaurant
	JOIN menu 
		ON menu.restaurant_id = restaurant.restaurant_id
	JOIN meal 
		ON meal.menu_id = menu.menu_id
	JOIN order_meal 
		ON order_meal.meal_id = meal.meal_id
	JOIN orders 
		ON orders.order_id = order_meal.order_id
WHERE orders.order_id = 1
GROUP BY restaurant.restaurant_id;

select delivery_id as dostava_id, deliverer_id as dostavljac_id, order_id as narudzba_id, cteated_at as kreirano_u, 
	delivery_location as lokacija, status, expected_due as ocekuje_se_u, delivered_at as dostavljeno_u
from delivery where 1=2;

UPDATE delivery 
SET 
    status = 'active'
WHERE
    delivery_id = (SELECT 
            delivery_id
        FROM
            delivery
        WHERE
            status = 'requested delivery'
        ORDER BY cteated_at DESC
        LIMIT 1);

UPDATE delivery 
SET 
    status = 'delivered',
    expected_due = NULL,
    delivered_at = CURRENT_TIMESTAMP()
WHERE
    delivery_id = 4;

UPDATE order_meal 
SET 
    quantity = quantity + 1
WHERE
    order_id = 1 AND meal_id = 1;
















