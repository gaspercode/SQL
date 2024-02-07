#This file is a sample of a basic table creation.

#This line is used to create a new database.
CREATE DATABASE chinese_restaurant;

#Here we create a table in the database that contains an auto-incrementing primary key and specifies that certain identifiers cannot be null.
CREATE TABLE  food (
	item_id INT AUTO_INCREMENT PRIMARY KEY,
	food_name VARCHAR(50) NOT NULL,
	food_course VARCHAR(15) NOT NULL,
	contains_meat BOOLEAN,
	price DECIMAL(5,2) NOT NULL,
	stock VARCHAR(50) NOT NULL DEFAULT 'in stock'
        );

#Here we insert values into our menu.
INSERT INTO food (food_name, food_type, contains_meat, price) 
    VALUES
	('Pork Bun', 'Appetizer', 1, 4.50),
	('Spring Roll', 'Appetizer', 1, 3.00),
	('Egg Roll', 'Appetizer', 1, 3.50),
	('Xiao Long Bao', 'Appetizer', 1, 5.00),
	('Siu Mai', 'Appetizer', 1, 4.00),
	('Crab Rangoons', 'Appetizer', 1, 5.00),
	('Kung Pao Chicken', 'Main', 1, 10.00),
	('Szechuan Beef', 'Main', 1, 12.00),
	('Mapo Tofu', 'Main', 0, 9.00),
	('Barbecue Pork', 'Main', 1, 11.00),
	('Chow Fun', 'Main', 1, 9.00),
	('Shrimp Fried Rice', 'Main', 1, 9.00),
	('Sesame Balls', 'Dessert', 0, 7.00),
	('Chinese Donuts', 'Dessert', 0, 7.00),
	('Fortune Cookie', 'Dessert', 0, 0.00);
    
    
#If we were to delete this table, this is how:
DROP TABLE food;
