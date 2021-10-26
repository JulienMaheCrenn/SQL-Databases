--SCHEMA

PRAGMA foreign_keys = ON;

CREATE TABLE Restaurants (
  restaurant_id INTEGER NOT NULL PRIMARY KEY, 
  restaurant_name TEXT, 
  imagelink TEXT
);

CREATE TABLE Menus (
  menu_id INTEGER NOT NULL PRIMARY KEY,
  menu_title TEXT,
  restaurant_id INTEGER NOT NULL,
  FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

CREATE TABLE MenuItems (
  menu_item_id INTEGER NOT NULL PRIMARY KEY,
  menu_item_name TEXT,
  menu_item_price INTEGER,
  menu_id INTEGER NOT NULL,
  FOREIGN KEY (menu_id) REFERENCES Menus(menu_id)
);

-- QUERY

INSERT INTO Restaurants(restaurant_id, restaurant_name, imagelink) VALUES
(1, "Julien's Pizzeria", "www.julien.com/image"),
(2, "Tasty Food", "www.tastyfood.com/image"),
(3, "Daddy Johnathan", "www.daddyjohnathan.com/image");

INSERT INTO Menus(menu_id, menu_title, restaurant_id) VALUES
(1, "Breakfast Pizzeria", 1),
(2, "Lunch Pizzeria", 1),
(3, "Cocktails", 1),
(4, "Burgers", 2),
(5, "Desserts", 2),
(6, "Daddy's Menu", 3);

INSERT INTO MenuItems(menu_item_id, menu_item_name, menu_item_price, menu_id) VALUES
(1, "Chocolate Pizza", 5.49, 1),
(2, "Bread & Jam", 2.99, 1),
(3, "Cappucino", 2.00, 1),
(4, "Margherita Pizza", 7.49, 2),
(5, "Pepperoni Pizza", 8.49, 2),
(6, "Vegetarian Pizza", 8.49, 2),
(7, "Purple Rain", 5.49, 3),
(8, "Blue Lagoon", 5.49, 3),
(9, "Sex on the Beach", 5.49, 3),
(10, "Cheese Burger", 6.49, 4),
(11, "Bacon & Cheese Burger", 8.69, 4),
(12, "Chicken Burger", 7.89, 4),
(13, "Chocolate Fudge Cake", 4.00, 5),
(14, "Sticky Toffee Pudding", 4.00, 5),
(15, "Apple Pie", 4.00, 5),
(16, "Big Meatball Bonanza", 9.69, 6),
(17, "Juicy T-Bone Steak", 11.99, 6),
(18, "Death by Chocolate", 7.89, 6);

-- Inner Join.
SELECT Menus.menu_title, MenuItems.menu_item_name
FROM Menus
JOIN MenuItems ON Menus.menu_id = MenuItems.menu_id
WHERE Menus.menu_id = 3;

-- Selecting all restaurants and grouping the number of menus they have.
SELECT COUNT(menu_id), restaurant_id
FROM Menus
GROUP BY restaurant_id;

--Selecting the total price of a menu and sorting all menus into most expensive first.
SELECT SUM(menu_item_price), menu_id
FROM MenuItems
GROUP BY menu_id
ORDER BY SUM(menu_item_price) DESC;
