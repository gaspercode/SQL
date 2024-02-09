#Creating a table for customers and orders to exemplify how joins work.
CREATE TABLE customers
  (
     id         INT PRIMARY KEY auto_increment,
     first_name VARCHAR(50),
     last_name  VARCHAR(50),
     email      VARCHAR(50)
  );


 #Line 19 contains FOREIGN KEY REFERENCES which makes it so the customer_id in this table references the id on the customers table.
 #ON DELETE CASCADE makes it so we can delete customers on the customers table without conflicts arising on the orders table because of this.
CREATE TABLE orders
  (
     id          INT PRIMARY KEY auto_increment,
     order_date  DATE,
     amount      DECIMAL(8, 2),
     customer_id INT,
     FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
  );
 
INSERT INTO customers
            (first_name,
             last_name,
             email)
VALUES      ('Spike',
             'Spiegel',
             'swordfish2@gmail.com'),
            ('Faye',
             'Valentine',
             'redtail@gmail.com'),
            ('Ed',
             'Wong',
             'notahacker@gmail.com'),
            ('Jet',
             'Black',
             'cowboybebop@gmail.com'),
            ('Ein',
             'Dogsworth',
             'barkbark@aol.com');

INSERT INTO orders
            (order_date,
             amount,
             customer_id)
VALUES      ('2016-02-10',
             99.99,
             1),
            ('2017-11-11',
             35.50,
             1),
            ('2014-12-12',
             800.67,
             2),
            ('2015-01-03',
             12.50,
             2),
            ('1999-04-11',
             450.25,
             5);


#This is a pretty standard inner join that links the customer id for customers and orders table.      
SELECT first_name,
       last_name,
       order_date,
       amount
FROM   customers
       JOIN orders
         ON orders.customer_id = customers.id;


#This join groups by the customer and then orders it by the total amount spent.
SELECT first_name,
       last_name,
       Sum(amount) AS total
FROM   customers
       JOIN orders
         ON customers.id - orders.customer_id
GROUP  BY first_name,
          last_name
ORDER  BY total;



#In this left join, we can now take everything from the customers table and any overlap from the orders table. 
#We also add a IFNULL() statement to change any NULL values that occur to 0.
SELECT first_name,
       last_name,
       Ifnull(Sum(amount), 0) AS money_spent
FROM   customers
       LEFT JOIN orders
              ON customers.id = orders.customer_id
GROUP  BY first_name,
          last_name;


#To exemplify right joins, we need to insert a row that has null values for the customers column.
#Otherwise, this will just be the same as a normal INNER JOIN since the order id is a foreign key that references the customer table.
INSERT INTO orders
            (order_date,
             amount)
VALUES      (Curdate(),
             45.95);


#Now we can see how RIGHT JOIN works:
SELECT first_name,
       last_name,
       order_date,
       amount
FROM   customers
       RIGHT JOIN orders
               ON customers.id = orders.customer_id; 