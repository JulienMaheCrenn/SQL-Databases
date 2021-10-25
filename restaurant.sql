--SCHEMA

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

SELECT Restaurants.restaurant_name, Menus.menu_title
FROM Restaurants
JOIN Menus ON Restaurants.restaurant_id = Menus.restaurant_id
WHERE Restaurants.restaurant_id = 1;
